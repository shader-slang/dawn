struct S {
  a : f32,
}

var<private> bool_var : bool;

var<private> i32_var : i32;

var<private> u32_var : u32;

var<private> f32_var : f32;

var<private> v2i32_var : vec2<i32>;

var<private> v3u32_var : vec3<u32>;

var<private> v4f32_var : vec4<f32>;

var<private> m2x3_var : mat2x3<f32>;

var<private> arr_var : array<f32, 4>;

var<private> struct_var : S;

var<workgroup> wg_var : f32;

@compute @workgroup_size(1)
fn main() {
  bool_var = bool();
  i32_var = i32();
  u32_var = u32();
  f32_var = f32();
  v2i32_var = vec2<i32>();
  v3u32_var = vec3<u32>();
  v4f32_var = vec4<f32>();
  m2x3_var = mat2x3<f32>();
  arr_var = array<f32, 4>();
  struct_var = S();
  wg_var = 42;
}
