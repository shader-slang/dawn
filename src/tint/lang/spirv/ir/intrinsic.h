// Copyright 2023 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/spirv/ir/intrinsic.h.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#ifndef SRC_TINT_LANG_SPIRV_IR_INTRINSIC_H_
#define SRC_TINT_LANG_SPIRV_IR_INTRINSIC_H_

#include <cstdint>
#include <string>

#include "src/tint/utils/traits/traits.h"

namespace tint::spirv::ir {

/// Intrinsic
enum class Intrinsic : uint8_t {
    kUndefined,
    kImageDrefGather,
    kImageGather,
    kImageQuerySize,
    kImageQuerySizeLod,
    kImageSampleDrefExplicitLod,
    kImageSampleDrefImplicitLod,
    kImageSampleExplicitLod,
    kImageSampleImplicitLod,
    kImageWrite,
};

/// @param value the enum value
/// @returns the string for the given enum value
std::string_view ToString(Intrinsic value);

/// @param out the stream to write to
/// @param value the Intrinsic
/// @returns @p out so calls can be chained
template <typename STREAM, typename = traits::EnableIfIsOStream<STREAM>>
auto& operator<<(STREAM& out, Intrinsic value) {
    return out << ToString(value);
}

/// ParseIntrinsic parses a Intrinsic from a string.
/// @param str the string to parse
/// @returns the parsed enum, or Intrinsic::kUndefined if the string could not be parsed.
Intrinsic ParseIntrinsic(std::string_view str);

constexpr const char* kIntrinsicStrings[] = {
    "image_dref_gather",
    "image_gather",
    "image_query_size",
    "image_query_size_lod",
    "image_sample_dref_explicit_lod",
    "image_sample_dref_implicit_lod",
    "image_sample_explicit_lod",
    "image_sample_implicit_lod",
    "image_write",
};

}  // namespace tint::spirv::ir

#endif  // SRC_TINT_LANG_SPIRV_IR_INTRINSIC_H_
