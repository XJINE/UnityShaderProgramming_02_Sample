Shader "Unlit/VPOS"
{
    Properties
    {
        [NoScaleOffset] _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
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
                //float4 vertex : POSITION;
                float2 uv     : TEXCOORD0;
            };

            sampler2D _MainTex;

            v2f vert (appdata v, out float4 vertex : SV_POSITION)
            {
                v2f o;
                vertex = UnityObjectToClipPos(v.vertex);
                //o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = v.uv;
                return o;
            }

            fixed4 frag (v2f i, in UNITY_VPOS_TYPE vpos : VPOS) : SV_Target
            {
                //if (vpos.x < 640) return fixed4(1, 0, 0, 1);
                //if (vpos.x > 640) return fixed4(0, 1, 0, 1);

                vpos.xy /= _ScreenParams.xy;
                vpos.x  *= _ScreenParams.x / _ScreenParams.y;
                //_TexelSize が ScreenParams にはない

                return tex2D(_MainTex, vpos);
            }

            ENDCG
        }
    }
}