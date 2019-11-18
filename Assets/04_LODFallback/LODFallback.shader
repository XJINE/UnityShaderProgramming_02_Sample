//https://docs.unity3d.com/ja/current/Manual/SL-ShaderLOD.html
//https://docs.unity3d.com/ja/current/ScriptReference/Shader-maximumLOD.html
//https://docs.unity3d.com/ja/current/ScriptReference/Shader-globalMaximumLOD.html
//http://marupeke296.com/UNI_S_No2_ShaderLab.html
//https://qiita.com/ShirakawaMaru/items/5d6d8bad041c835f858a

Shader "Unlit/LODFallback"
{
    Properties
    {
    }

    SubShader
    {
        LOD 600

        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert
            #pragma fragment frag

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
                return fixed4(1, 0, 0, 1);
            }

            ENDCG
        }
    }

    SubShader
    {
        LOD 400

        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                return fixed4(0, 1, 0, 1);
            }

            ENDCG
        }
    }

    SubShader
    {
        LOD 300

        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                return fixed4(0, 0, 1, 1);
            }

            ENDCG
        }
    }

    FallBack "LODFallback/FallbackSample"
    // FallBack "Diffuse"
    // FallBack "VertexLit"
}