Shader "VFACE"
{
    Properties
    {
        [NoScaleOffset] _MainTex ("Texture", 2D) = "white" {}
        [NoScaleOffset] _SubTex  ("Texture", 2D) = "black" {}
    }
    SubShader
    {
        Cull Off

        Pass
        {
            CGPROGRAM

            #pragma target   3.0
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
            sampler2D _SubTex;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = v.uv;
                return o;
            }

            fixed4 frag (v2f i, float vface : VFACE) : SV_Target
            {
                return vface > 0 ? tex2D(_MainTex, i.uv)
                                 : tex2D(_SubTex,  i.uv);

                //return tex2D(vface > 0 ? _MainTex : _SubTex, i.uv);
            }

            ENDCG
        }
    }
}