SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupShuffleXor_7435fe() -> vec3<i32> {
  var res : vec3<i32> = subgroupShuffleXor(vec3<i32>(1i), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffleXor_7435fe();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffleXor_7435fe();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffleXor/7435fe.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupShuffleXor_7435fe() -> vec3<i32> {
  var res : vec3<i32> = subgroupShuffleXor(vec3<i32>(1i), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffleXor_7435fe();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffleXor_7435fe();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffleXor/7435fe.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

