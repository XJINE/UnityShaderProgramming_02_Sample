Shader "Sample/Keyword"
{
    Properties { }

    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex   vert
            #pragma fragment frag

            #define KEYWORD_RED

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                #ifdef KEYWORD_RED

                return fixed4(1, 0, 0, 1);

                #endif

                return fixed4(1, 1, 1, 1);
            }

            ENDCG
        }
    }
}