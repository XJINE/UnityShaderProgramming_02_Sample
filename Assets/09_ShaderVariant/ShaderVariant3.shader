Shader "Unlit/ShaderVariant3"
{
    Properties
    {
        [Toggle(_TOGGLE_ON)]
        _Toggle("Sample Toggle", Float) = 0
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag
            //#pragma multi_compile _ _TOGGLE_ON
            #pragma shader_feature _TOGGLE_ON

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
                #ifdef _TOGGLE_ON
                return fixed4(1, 1, 1, 1);
                #endif

                return fixed4(0, 0, 0, 1);
            }

            ENDCG
        }
    }
}