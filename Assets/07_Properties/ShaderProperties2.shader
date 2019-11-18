Shader "Unlit/ShaderProperties2"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)]  _CullMode("Cull Mode", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc("Blend Src", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _BlendDst("Blend Dst", Float) = 1
    }
    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }

        Cull  [_CullMode]
        Blend [_BlendSrc][_BlendDst]

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