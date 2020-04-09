Shader "Sample/Library"
{
    Properties { }
    SubShader
    {
        Tags
        {
            "Queue"      = "Transparent"
            "RenderType" = "Transparent"
        }

        Pass
        {
            ZWrite    On
            ColorMask 0

            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag

            #include "Library.cginc"
            #include "UnityCG.cginc"

            fixed4 frag(v2f i) : SV_Target
            {
                return 0;
            }

            ENDCG
        }

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag

            #include "Library.cginc"
            #include "UnityCG.cginc"

            fixed4 frag(v2f i) : SV_Target
            {
                return fixed4(1, 0, 0, 0.5);
            }

            ENDCG
        }
    }
}