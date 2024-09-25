#include "slang-tint.h"
#include "tint/tint.h"

#if defined(_MSC_VER)
#define SLANG_SHARED_LIB_EXPORT __declspec(dllexport)
#else
#define SLANG_SHARED_LIB_EXPORT __attribute__((__visibility__("default")))
#endif

static bool
compile(
    std::string const& wgslCode,
    std::vector<uint32_t>& output,
    std::string& error
)
{
    using namespace tint;

    wgsl::reader::Options wgslReadOptions {};
    wgslReadOptions.allowed_features = wgsl::AllowedFeatures::Everything();
    Source::File wgslFile("" /* path */, wgslCode);
    tint::Result<core::ir::Module> irModuleResult {
        wgsl::reader::WgslToIR(&wgslFile, wgslReadOptions)
    };
    if(irModuleResult != Success)
    {
        error = irModuleResult.Failure().reason.Str();
        return false;
    }
    core::ir::Module& irModule {irModuleResult.Get()};

    spirv::writer::Options spirvWriteOptions {};
    Result<spirv::writer::Output> spirvOutputResult {
        spirv::writer::Generate(irModule, spirvWriteOptions)
    };
    if(spirvOutputResult != Success)
    {
        error = spirvOutputResult.Failure().reason.Str();
        return false;
    }
    spirv::writer::Output & spirvOutput {spirvOutputResult.Get()};

    output = std::move(spirvOutput.spirv);
    return true;
}

extern "C"
SLANG_SHARED_LIB_EXPORT
int tint_compile(tint_CompileRequest* request, tint_CompileResult* result)
{
    ::memset(result, 0, sizeof(tint_CompileResult));

    if(request == nullptr)
        return 1;
    if(result == nullptr)
        return 1;

    std::string const
        wgslCode(request->wgslCode, request->wgslCode + request->wgslCodeLength);
    std::vector<uint32_t> spirvCode;
    std::string error;
    if(!compile(wgslCode, spirvCode, error))
    {
        char *const errorBuffer = (char*)::malloc(error.size() + size_t{1});
        ::memcpy((void*)errorBuffer, error.c_str(), error.size());
        errorBuffer[error.size()] = '\0';
        result->error = errorBuffer;
        return 1;
    }

    size_t const resultBufferSize {sizeof(uint32_t)*spirvCode.size()};
    uint8_t *const resultBuffer {static_cast<uint8_t*>(::malloc(resultBufferSize))};
    if(resultBuffer == nullptr)
        return 1;
    ::memcpy(resultBuffer, spirvCode.data(), resultBufferSize);

    result->buffer = resultBuffer;
    result->bufferSize = resultBufferSize;
    return 0;
}

extern "C"
SLANG_SHARED_LIB_EXPORT
void tint_free_result(tint_CompileResult* result)
{
    ::free((void*)result->buffer);
    ::free((void*)result->error);
}
