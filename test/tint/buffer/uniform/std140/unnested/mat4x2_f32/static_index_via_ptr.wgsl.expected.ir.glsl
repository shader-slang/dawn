#version 310 es

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  vec2 tint_symbol_col0;
  vec2 tint_symbol_col1;
  vec2 tint_symbol_col2;
  vec2 tint_symbol_col3;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat4x2 v_1 = mat4x2(v.tint_symbol_col0, v.tint_symbol_col1, v.tint_symbol_col2, v.tint_symbol_col3);
  mat4x2 l_m = v_1;
  vec2 l_m_1 = v_1[1];
}
