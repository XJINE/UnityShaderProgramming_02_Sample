Shader "Sample/ShaderFeature"
{
    Properties
    {
        [Toggle(_R)] _R ("R", Float) = 0
        [Toggle(_G)] _G ("G", Float) = 0
        [Toggle(_B)] _B ("B", Float) = 0
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag
            #pragma multi_compile _ _R
            #pragma multi_compile _ _G
            #pragma multi_compile _ _B
            // #pragma shader_feature _R
            // #pragma shader_feature _G
            // #pragma shader_feature _B

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
                fixed4 color = fixed4(0, 0, 0, 1);

                #ifdef _R
                color.r += 1;
                #endif

                #ifdef _G
                color.g += 1;
                #endif

                #ifdef _B
                color.b += 1;
                #endif

                return color;
            }

            ENDCG
        }
    }
}