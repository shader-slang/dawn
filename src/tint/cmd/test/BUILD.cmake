# Copyright 2023 The Dawn & Tint Authors
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

################################################################################
# Target:    tint_cmd_test_test_cmd
# Kind:      test_cmd
################################################################################
tint_add_target(tint_cmd_test_test_cmd test_cmd
  cmd/test/main_test.cc
)

tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
  tint_api
  tint_api_common_test
  tint_api_options_test
  tint_lang_core_constant_test
  tint_lang_core_intrinsic_test
  tint_lang_core_ir_transform_common_test
  tint_lang_core_ir_transform_test
  tint_lang_core_ir_test
  tint_lang_core_type_test
  tint_lang_core_test
  tint_lang_hlsl_writer_common_test
  tint_lang_msl_ir_test
  tint_lang_spirv_ir_test
  tint_lang_spirv_reader_lower_test
  tint_lang_spirv_type_test
  tint_lang_wgsl_ast_test
  tint_lang_wgsl_common_test
  tint_lang_wgsl_helpers_test
  tint_lang_wgsl_intrinsic_test
  tint_lang_wgsl_program_test
  tint_lang_wgsl_reader_lower_test
  tint_lang_wgsl_resolver_test
  tint_lang_wgsl_sem_test
  tint_lang_wgsl_writer_ir_to_program_test
  tint_lang_wgsl_writer_raise_test
  tint_lang_wgsl_test
  tint_utils_bytes_test
  tint_utils_cli_test
  tint_utils_command_test
  tint_utils_containers_test
  tint_utils_diagnostic_test
  tint_utils_file_test
  tint_utils_ice_test
  tint_utils_macros_test
  tint_utils_math_test
  tint_utils_memory_test
  tint_utils_reflection_test
  tint_utils_result_test
  tint_utils_rtti_test
  tint_utils_strconv_test
  tint_utils_symbol_test
  tint_utils_text_test
  tint_utils_traits_test
)

tint_target_add_external_dependencies(tint_cmd_test_test_cmd test_cmd
  "gtest"
)

if(TINT_BUILD_GLSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_glsl_writer_ast_printer_test
    tint_lang_glsl_writer_common_test
    tint_lang_glsl_writer_printer_test
  )
endif(TINT_BUILD_GLSL_WRITER)

if(TINT_BUILD_GLSL_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_glsl_writer_ast_raise_test
  )
endif(TINT_BUILD_GLSL_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_hlsl_writer_ast_printer_test
  )
endif(TINT_BUILD_HLSL_WRITER)

if(TINT_BUILD_HLSL_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_hlsl_writer_ast_raise_test
  )
endif(TINT_BUILD_HLSL_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_IR_BINARY)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_core_ir_binary_test
  )
endif(TINT_BUILD_IR_BINARY)

if(TINT_BUILD_MSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_msl_writer_ast_printer_test
    tint_lang_msl_writer_common_test
    tint_lang_msl_writer_raise_test
    tint_lang_msl_writer_test
  )
endif(TINT_BUILD_MSL_WRITER)

if(TINT_BUILD_MSL_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_msl_writer_ast_raise_test
  )
endif(TINT_BUILD_MSL_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_SPV_READER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_spirv_reader_common_test
    tint_lang_spirv_reader_parser_test
    tint_lang_spirv_reader_test
  )
endif(TINT_BUILD_SPV_READER)

if(TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_spirv_reader_ast_lower_test
  )
endif(TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_spirv_reader_ast_parser_test
  )
endif(TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_SPV_READER OR TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_spirv_validate_test
  )
endif(TINT_BUILD_SPV_READER OR TINT_BUILD_SPV_WRITER)

if(TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_spirv_writer_ast_printer_test
    tint_lang_spirv_writer_common_test
    tint_lang_spirv_writer_raise_test
    tint_lang_spirv_writer_test
  )
endif(TINT_BUILD_SPV_WRITER)

if(TINT_BUILD_SPV_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_spirv_writer_ast_raise_test
  )
endif(TINT_BUILD_SPV_WRITER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_wgsl_ls_test
  )
endif(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_wgsl_inspector_test
    tint_lang_wgsl_reader_parser_test
    tint_lang_wgsl_reader_program_to_ir_test
    tint_lang_wgsl_reader_test
  )
endif(TINT_BUILD_WGSL_READER)

if(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_wgsl_ast_transform_test
  )
endif(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_cmd_test_test_cmd test_cmd
    tint_lang_wgsl_writer_ast_printer_test
    tint_lang_wgsl_writer_test
  )
endif(TINT_BUILD_WGSL_WRITER)

tint_target_set_output_name(tint_cmd_test_test_cmd test_cmd "tint_unittests")
