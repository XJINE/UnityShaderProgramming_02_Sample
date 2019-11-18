// https://qiita.com/Es_Program/items/79edf9f8fca786b365aa
// https://docs.unity3d.com/ja/current/Manual/SL-MultipleProgramVariants.html

Shader "Unlit/ShaderVariant1"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag
            #pragma multi_compile _ RED GREEN BLUE

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
                #ifdef RED
                return fixed4(1, 0, 0, 1);
                #elif  GREEN
                return fixed4(0, 1, 0, 1);
                #elif  BLUE
                return fixed4(0, 0, 1, 0);
                #endif
                return fixed4(0, 0, 0, 1);
            }

            ENDCG
        }
    }
}