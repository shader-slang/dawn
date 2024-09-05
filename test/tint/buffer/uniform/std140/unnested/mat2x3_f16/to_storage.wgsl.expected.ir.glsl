#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  f16vec3 tint_symbol_col0;
  f16vec3 tint_symbol_col1;
} v;
layout(binding = 1, std430)
buffer tint_symbol_3_1_ssbo {
  f16mat2x3 tint_symbol_2;
} v_1;
void tint_store_and_preserve_padding(inout f16mat2x3 target, f16mat2x3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_store_and_preserve_padding(v_1.tint_symbol_2, f16mat2x3(v.tint_symbol_col0, v.tint_symbol_col1));
  v_1.tint_symbol_2[1] = f16mat2x3(v.tint_symbol_col0, v.tint_symbol_col1)[0];
  v_1.tint_symbol_2[1] = f16mat2x3(v.tint_symbol_col0, v.tint_symbol_col1)[0].zxy;
  v_1.tint_symbol_2[0][1] = f16mat2x3(v.tint_symbol_col0, v.tint_symbol_col1)[1][0];
}
