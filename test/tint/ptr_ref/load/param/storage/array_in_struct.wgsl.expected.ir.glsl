#version 310 es

struct str {
  int arr[4];
};

layout(binding = 0, std430)
buffer tint_symbol_2_1_ssbo {
  str tint_symbol_1;
} v;
int[4] func() {
  return v.tint_symbol_1.arr;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  int r[4] = func();
}
