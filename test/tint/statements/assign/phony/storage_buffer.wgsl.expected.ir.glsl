#version 310 es

struct S {
  int i;
};

S s = S(0);
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
