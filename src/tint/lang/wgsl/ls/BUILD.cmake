# Copyright 2024 The Dawn & Tint Authors
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

if(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_ls
# Kind:      lib
# Condition: TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_ls lib
  lang/wgsl/ls/diagnostics.cc
  lang/wgsl/ls/document.cc
  lang/wgsl/ls/file.cc
  lang/wgsl/ls/file.h
  lang/wgsl/ls/serve.cc
  lang/wgsl/ls/serve.h
  lang/wgsl/ls/server.cc
  lang/wgsl/ls/server.h
  lang/wgsl/ls/utils.h
)

tint_target_add_dependencies(tint_lang_wgsl_ls lib
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_common
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_ls lib
  "thread"
)

if(TINT_BUILD_TINTD)
  tint_target_add_external_dependencies(tint_lang_wgsl_ls lib
    "langsvr"
  )
endif(TINT_BUILD_TINTD)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_ls lib
    tint_lang_wgsl_reader
  )
endif(TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)
if(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_ls_test
# Kind:      test
# Condition: TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_ls_test test
  lang/wgsl/ls/diagnostics_test.cc
  lang/wgsl/ls/helpers_test.h
)

tint_target_add_dependencies(tint_lang_wgsl_ls_test test
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_ls_test test
  "gtest"
)

if(TINT_BUILD_TINTD)
  tint_target_add_external_dependencies(tint_lang_wgsl_ls_test test
    "langsvr"
  )
endif(TINT_BUILD_TINTD)

if(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_ls_test test
    tint_lang_wgsl_ls
  )
endif(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_TINTD AND TINT_BUILD_WGSL_READER)