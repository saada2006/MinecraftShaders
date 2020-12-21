#version 120

varying vec2 texcoords;
varying vec3 ViewSpaceViewDir;
flat varying vec3 LightDirection;

#include "util/uniforms.glsl"

void main(){
    gl_Position = ftransform();
    texcoords = gl_MultiTexCoord0.st;
    LightDirection = normalize(gbufferModelViewInverse * vec4(sunPosition,1.0)).xyz;
    vec4 _temp_ViewSpaceViewDir = (gbufferProjectionInverse * gl_Position);
    ViewSpaceViewDir = _temp_ViewSpaceViewDir.xyz / _temp_ViewSpaceViewDir.w;
    gl_TexCoord[0].st = texcoords;
}