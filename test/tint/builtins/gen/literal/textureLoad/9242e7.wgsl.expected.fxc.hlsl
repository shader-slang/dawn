SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

@group(1) @binding(0) var arg_0 : texture_storage_2d<rgba16uint, read_write>;

fn textureLoad_9242e7() {
  var res : vec4<u32> = textureLoad(arg_0, vec2<u32>(1u));
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec4<u32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_9242e7();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_9242e7();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_9242e7();
}

Failed to generate: builtins/gen/literal/textureLoad/9242e7.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

