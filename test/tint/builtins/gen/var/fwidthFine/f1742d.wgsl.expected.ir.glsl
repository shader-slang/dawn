#version 310 es
precision highp float;
precision highp int;


layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  float tint_symbol;
} v;
float fwidthFine_f1742d() {
  float arg_0 = 1.0f;
  float res = fwidth(arg_0);
  return res;
}
void main() {
  v.tint_symbol = fwidthFine_f1742d();
}
