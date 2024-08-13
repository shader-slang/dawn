SKIP: Wave ops not supported before SM 6.0

RWByteAddressBuffer prevent_dce : register(u0);

float16_t subgroupShuffleXor_d224ab() {
  float16_t arg_0 = float16_t(1.0h);
  uint arg_1 = 1u;
  float16_t res = WaveReadLaneAt(arg_0, (WaveGetLaneIndex() ^ arg_1));
  return res;
}

void fragment_main() {
  prevent_dce.Store<float16_t>(0u, subgroupShuffleXor_d224ab());
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<float16_t>(0u, subgroupShuffleXor_d224ab());
  return;
}
