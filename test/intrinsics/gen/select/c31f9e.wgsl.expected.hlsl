struct tint_symbol {
  float4 value : SV_Position;
};

void select_c31f9e() {
  bool res = (false ? false : false);
}

tint_symbol vertex_main() {
  select_c31f9e();
  const tint_symbol tint_symbol_1 = {float4(0.0f, 0.0f, 0.0f, 0.0f)};
  return tint_symbol_1;
}

void fragment_main() {
  select_c31f9e();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  select_c31f9e();
  return;
}

