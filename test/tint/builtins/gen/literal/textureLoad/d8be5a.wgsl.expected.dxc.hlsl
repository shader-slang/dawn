SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

@group(1) @binding(0) var arg_0 : texture_storage_1d<rgba16sint, read_write>;

fn textureLoad_d8be5a() {
  var res : vec4<i32> = textureLoad(arg_0, 1i);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec4<i32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_d8be5a();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_d8be5a();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_d8be5a();
}

Failed to generate: builtins/gen/literal/textureLoad/d8be5a.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

