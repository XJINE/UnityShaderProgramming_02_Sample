Shader "Sample/BlendState"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)]        _CullMode("Cull",      Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)]       _BlendSrc("Blend Src", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)]       _BlendDst("Blend Dst", Float) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest   ("ZTest",     Float) = 0
        [Toggle]                                      _ZWrite  ("ZWrite",    Float) = 0

        [Enum(2D, 0, 3D, 1)] _OffsetFact("Offset Factor", Float)            = 0
                             _OffsetUnit("Offset Units",  Range(-100, 100)) = 0
    }
    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }

        Cull   [_Cull]
        Blend  [_BlendSrc][_BlendDst]
        ZTest  [_ZTest]
        ZWrite [_ZWrite]
        Offset [_OffsetFact], [_OffsetUnit]

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv     : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv     : TEXCOORD0;
            };

            sampler2D _MainTex;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 color = tex2D(_MainTex, i.uv);
                return color;
            }

            ENDCG
        }
    }
}