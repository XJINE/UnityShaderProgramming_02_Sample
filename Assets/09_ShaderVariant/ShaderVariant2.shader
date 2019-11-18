Shader "Unlit/ShaderVariant2"
{
    Properties
    {
        [KeywordEnum(Red, Green, Blue)]
        _Color("Color Keyword", Float) = 0
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag
            // #pragma multi_compile _COLOR_RED _COLOR_GREEN _COLOR_BLUE
            #pragma shader_feature _COLOR_RED _COLOR_GREEN _COLOR_BLUE

            #include "UnityCG.cginc"

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

            fixed4 frag (v2f i) : SV_Target
            {
                #ifdef _COLOR_RED
                return fixed4(1, 0, 0, 1);
                #elif  _COLOR_GREEN
                return fixed4(0, 1, 0, 1);
                #elif  _COLOR_BLUE
                return fixed4(0, 0, 1, 0);
                #endif
                return fixed4(0, 0, 0, 1);
            }

            ENDCG
        }
    }
}