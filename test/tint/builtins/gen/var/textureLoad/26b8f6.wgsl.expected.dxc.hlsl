SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

@group(1) @binding(0) var arg_0 : texture_storage_3d<rgba8uint, read_write>;

fn textureLoad_26b8f6() {
  var arg_1 = vec3<u32>(1u);
  var res : vec4<u32> = textureLoad(arg_0, arg_1);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec4<u32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_26b8f6();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_26b8f6();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_26b8f6();
}

Failed to generate: builtins/gen/var/textureLoad/26b8f6.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

