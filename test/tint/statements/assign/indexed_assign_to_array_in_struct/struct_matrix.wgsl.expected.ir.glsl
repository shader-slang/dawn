#version 310 es

struct Uniforms {
  uint i;
};

struct OuterS {
  mat2x4 m1;
};

layout(binding = 4, std140)
uniform tint_symbol_2_1_ubo {
  Uniforms tint_symbol_1;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  OuterS s1 = OuterS(mat2x4(vec4(0.0f), vec4(0.0f)));
  s1.m1[v.tint_symbol_1.i] = vec4(1.0f);
  s1.m1[v.tint_symbol_1.i][v.tint_symbol_1.i] = 1.0f;
}
