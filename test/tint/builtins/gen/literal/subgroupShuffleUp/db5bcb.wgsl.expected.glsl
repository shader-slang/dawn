SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<i32>;

fn subgroupShuffleUp_db5bcb() -> vec2<i32> {
  var res : vec2<i32> = subgroupShuffleUp(vec2<i32>(1i), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffleUp_db5bcb();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffleUp_db5bcb();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffleUp/db5bcb.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<i32>;

fn subgroupShuffleUp_db5bcb() -> vec2<i32> {
  var res : vec2<i32> = subgroupShuffleUp(vec2<i32>(1i), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffleUp_db5bcb();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffleUp_db5bcb();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffleUp/db5bcb.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

