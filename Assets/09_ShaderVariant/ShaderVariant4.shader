Shader "Unlit/ShaderVariant4"
{
    Properties
    {
        [Toggle(_COLOR_RED)]
        _Red   ("Toggle Red",   Float) = 0
        [Toggle(_COLOR_GREEN)]
        _Green ("Toggle Green", Float) = 0
        [Toggle(_COLOR_BLUE)]
        _Blue  ("Toggle Blue",  Float) = 0
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM

            // multi_compile は定義なし"_"が必要な点に注意。

            #pragma vertex   vert
            #pragma fragment frag
            #pragma multi_compile _ _COLOR_RED
            #pragma multi_compile _ _COLOR_BLUE
            #pragma multi_compile _ _COLOR_GREEN

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

                #ifdef _COLOR_RED
                color.r += 1;
                #endif

                #ifdef  _COLOR_GREEN
                color.g += 1;
                #endif

                #ifdef  _COLOR_BLUE
                color.b += 1;
                #endif

                return color;
            }

            ENDCG
        }
    }
}