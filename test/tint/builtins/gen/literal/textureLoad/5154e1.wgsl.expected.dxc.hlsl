SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

@group(1) @binding(0) var arg_0 : texture_storage_2d<rgba32float, read_write>;

fn textureLoad_5154e1() {
  var res : vec4<f32> = textureLoad(arg_0, vec2<i32>(1i));
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_5154e1();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_5154e1();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_5154e1();
}

Failed to generate: builtins/gen/literal/textureLoad/5154e1.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

