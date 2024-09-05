#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

struct S {
  f16vec3 v;
};

layout(binding = 0, std140)
uniform tint_symbol_1_1_ubo {
  S tint_symbol;
} v_1;
void f() {
  f16vec3 v = v_1.tint_symbol.v;
  float16_t x = v_1.tint_symbol.v.x;
  float16_t y = v_1.tint_symbol.v.y;
  float16_t z = v_1.tint_symbol.v.z;
  f16vec2 xx = v_1.tint_symbol.v.xx;
  f16vec2 xy = v_1.tint_symbol.v.xy;
  f16vec2 xz = v_1.tint_symbol.v.xz;
  f16vec2 yx = v_1.tint_symbol.v.yx;
  f16vec2 yy = v_1.tint_symbol.v.yy;
  f16vec2 yz = v_1.tint_symbol.v.yz;
  f16vec2 zx = v_1.tint_symbol.v.zx;
  f16vec2 zy = v_1.tint_symbol.v.zy;
  f16vec2 zz = v_1.tint_symbol.v.zz;
  f16vec3 xxx = v_1.tint_symbol.v.xxx;
  f16vec3 xxy = v_1.tint_symbol.v.xxy;
  f16vec3 xxz = v_1.tint_symbol.v.xxz;
  f16vec3 xyx = v_1.tint_symbol.v.xyx;
  f16vec3 xyy = v_1.tint_symbol.v.xyy;
  f16vec3 xyz = v_1.tint_symbol.v.xyz;
  f16vec3 xzx = v_1.tint_symbol.v.xzx;
  f16vec3 xzy = v_1.tint_symbol.v.xzy;
  f16vec3 xzz = v_1.tint_symbol.v.xzz;
  f16vec3 yxx = v_1.tint_symbol.v.yxx;
  f16vec3 yxy = v_1.tint_symbol.v.yxy;
  f16vec3 yxz = v_1.tint_symbol.v.yxz;
  f16vec3 yyx = v_1.tint_symbol.v.yyx;
  f16vec3 yyy = v_1.tint_symbol.v.yyy;
  f16vec3 yyz = v_1.tint_symbol.v.yyz;
  f16vec3 yzx = v_1.tint_symbol.v.yzx;
  f16vec3 yzy = v_1.tint_symbol.v.yzy;
  f16vec3 yzz = v_1.tint_symbol.v.yzz;
  f16vec3 zxx = v_1.tint_symbol.v.zxx;
  f16vec3 zxy = v_1.tint_symbol.v.zxy;
  f16vec3 zxz = v_1.tint_symbol.v.zxz;
  f16vec3 zyx = v_1.tint_symbol.v.zyx;
  f16vec3 zyy = v_1.tint_symbol.v.zyy;
  f16vec3 zyz = v_1.tint_symbol.v.zyz;
  f16vec3 zzx = v_1.tint_symbol.v.zzx;
  f16vec3 zzy = v_1.tint_symbol.v.zzy;
  f16vec3 zzz = v_1.tint_symbol.v.zzz;
  f16vec4 xxxx = v_1.tint_symbol.v.xxxx;
  f16vec4 xxxy = v_1.tint_symbol.v.xxxy;
  f16vec4 xxxz = v_1.tint_symbol.v.xxxz;
  f16vec4 xxyx = v_1.tint_symbol.v.xxyx;
  f16vec4 xxyy = v_1.tint_symbol.v.xxyy;
  f16vec4 xxyz = v_1.tint_symbol.v.xxyz;
  f16vec4 xxzx = v_1.tint_symbol.v.xxzx;
  f16vec4 xxzy = v_1.tint_symbol.v.xxzy;
  f16vec4 xxzz = v_1.tint_symbol.v.xxzz;
  f16vec4 xyxx = v_1.tint_symbol.v.xyxx;
  f16vec4 xyxy = v_1.tint_symbol.v.xyxy;
  f16vec4 xyxz = v_1.tint_symbol.v.xyxz;
  f16vec4 xyyx = v_1.tint_symbol.v.xyyx;
  f16vec4 xyyy = v_1.tint_symbol.v.xyyy;
  f16vec4 xyyz = v_1.tint_symbol.v.xyyz;
  f16vec4 xyzx = v_1.tint_symbol.v.xyzx;
  f16vec4 xyzy = v_1.tint_symbol.v.xyzy;
  f16vec4 xyzz = v_1.tint_symbol.v.xyzz;
  f16vec4 xzxx = v_1.tint_symbol.v.xzxx;
  f16vec4 xzxy = v_1.tint_symbol.v.xzxy;
  f16vec4 xzxz = v_1.tint_symbol.v.xzxz;
  f16vec4 xzyx = v_1.tint_symbol.v.xzyx;
  f16vec4 xzyy = v_1.tint_symbol.v.xzyy;
  f16vec4 xzyz = v_1.tint_symbol.v.xzyz;
  f16vec4 xzzx = v_1.tint_symbol.v.xzzx;
  f16vec4 xzzy = v_1.tint_symbol.v.xzzy;
  f16vec4 xzzz = v_1.tint_symbol.v.xzzz;
  f16vec4 yxxx = v_1.tint_symbol.v.yxxx;
  f16vec4 yxxy = v_1.tint_symbol.v.yxxy;
  f16vec4 yxxz = v_1.tint_symbol.v.yxxz;
  f16vec4 yxyx = v_1.tint_symbol.v.yxyx;
  f16vec4 yxyy = v_1.tint_symbol.v.yxyy;
  f16vec4 yxyz = v_1.tint_symbol.v.yxyz;
  f16vec4 yxzx = v_1.tint_symbol.v.yxzx;
  f16vec4 yxzy = v_1.tint_symbol.v.yxzy;
  f16vec4 yxzz = v_1.tint_symbol.v.yxzz;
  f16vec4 yyxx = v_1.tint_symbol.v.yyxx;
  f16vec4 yyxy = v_1.tint_symbol.v.yyxy;
  f16vec4 yyxz = v_1.tint_symbol.v.yyxz;
  f16vec4 yyyx = v_1.tint_symbol.v.yyyx;
  f16vec4 yyyy = v_1.tint_symbol.v.yyyy;
  f16vec4 yyyz = v_1.tint_symbol.v.yyyz;
  f16vec4 yyzx = v_1.tint_symbol.v.yyzx;
  f16vec4 yyzy = v_1.tint_symbol.v.yyzy;
  f16vec4 yyzz = v_1.tint_symbol.v.yyzz;
  f16vec4 yzxx = v_1.tint_symbol.v.yzxx;
  f16vec4 yzxy = v_1.tint_symbol.v.yzxy;
  f16vec4 yzxz = v_1.tint_symbol.v.yzxz;
  f16vec4 yzyx = v_1.tint_symbol.v.yzyx;
  f16vec4 yzyy = v_1.tint_symbol.v.yzyy;
  f16vec4 yzyz = v_1.tint_symbol.v.yzyz;
  f16vec4 yzzx = v_1.tint_symbol.v.yzzx;
  f16vec4 yzzy = v_1.tint_symbol.v.yzzy;
  f16vec4 yzzz = v_1.tint_symbol.v.yzzz;
  f16vec4 zxxx = v_1.tint_symbol.v.zxxx;
  f16vec4 zxxy = v_1.tint_symbol.v.zxxy;
  f16vec4 zxxz = v_1.tint_symbol.v.zxxz;
  f16vec4 zxyx = v_1.tint_symbol.v.zxyx;
  f16vec4 zxyy = v_1.tint_symbol.v.zxyy;
  f16vec4 zxyz = v_1.tint_symbol.v.zxyz;
  f16vec4 zxzx = v_1.tint_symbol.v.zxzx;
  f16vec4 zxzy = v_1.tint_symbol.v.zxzy;
  f16vec4 zxzz = v_1.tint_symbol.v.zxzz;
  f16vec4 zyxx = v_1.tint_symbol.v.zyxx;
  f16vec4 zyxy = v_1.tint_symbol.v.zyxy;
  f16vec4 zyxz = v_1.tint_symbol.v.zyxz;
  f16vec4 zyyx = v_1.tint_symbol.v.zyyx;
  f16vec4 zyyy = v_1.tint_symbol.v.zyyy;
  f16vec4 zyyz = v_1.tint_symbol.v.zyyz;
  f16vec4 zyzx = v_1.tint_symbol.v.zyzx;
  f16vec4 zyzy = v_1.tint_symbol.v.zyzy;
  f16vec4 zyzz = v_1.tint_symbol.v.zyzz;
  f16vec4 zzxx = v_1.tint_symbol.v.zzxx;
  f16vec4 zzxy = v_1.tint_symbol.v.zzxy;
  f16vec4 zzxz = v_1.tint_symbol.v.zzxz;
  f16vec4 zzyx = v_1.tint_symbol.v.zzyx;
  f16vec4 zzyy = v_1.tint_symbol.v.zzyy;
  f16vec4 zzyz = v_1.tint_symbol.v.zzyz;
  f16vec4 zzzx = v_1.tint_symbol.v.zzzx;
  f16vec4 zzzy = v_1.tint_symbol.v.zzzy;
  f16vec4 zzzz = v_1.tint_symbol.v.zzzz;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
