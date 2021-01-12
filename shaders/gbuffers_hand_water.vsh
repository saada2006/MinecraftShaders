#version 120

#define GBUFFERS_HAND_WATER

#include "lib/Utility/Attributes.glsl"
#include "lib/Utility/Uniforms.glsl"
#include "lib/Transform/Transform.glsl"
#include "lib/Shading/Light.glsl"
#include "lib/Misc/Masks.glsl"
#include "lib/Utility/Packing.glsl"

varying vec3 Normal;
flat varying vec3 CurrentSunColor;
flat varying float fMasks; // TODO: stop being lazy and actually send the direct values for the masks instead of compressing and decompressing it

void main() {
    gl_Position = TransformVertex();
    gl_FrontColor = gl_Color;
    gl_TexCoord[0].st = gl_MultiTexCoord0.st;
    gl_TexCoord[1].st = mat2(gl_TextureMatrix[1]) * gl_MultiTexCoord1.st;
    fMasks = CompressMaskStruct(ConstructMaskStruct(mc_Entity.x));
    Normal = gl_NormalMatrix * gl_Normal;
    CurrentSunColor = GetLightColor();
}