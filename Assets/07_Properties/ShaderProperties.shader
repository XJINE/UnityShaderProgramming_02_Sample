Shader "Unlit/ShaderProperties"
{
    Properties
    {
        [Header(Texture)]

        _MainTex   ("MainTex",   2D) = "white" {}
        [NoScaleOffset]
        _SubTex    ("SubTex",    2D) = "white" {}
        [Normal][NoScaleOffset]
        _NormalTex ("NormalTex", 2D) = "white" {}
        [HDR]
        _HDRTex    ("HDRTex",    2D) = "white" {}
        [PerRendererData]
        _PerRender ("PerRender", 2D) = "white" {}

        _RectTex   ("RectTex", Rect)    = "white" {}
        _CubeTex   ("CubeTex", Cube)    = "white" {}
        _3DTex     ("3DTex",   3D)      = ""      {}
        _2DArray   ("2DArray", 2DArray) = ""      {}

        [Header(Value)]

        _Float0 ("Float0",    Float)       = 1.0
        _Float1 ("Float1",    Range(0, 1)) = 0.5
        [PowerSlider(2)]
        _Float2 ("PowSlider", Range(0, 1)) = 0.25

        [Space]

        _Int0 ("Int0", Int)              = 1
        [IntRange]
        _Int1 ("IntRange", Range(0, 10)) = 1

        [Space(10)]

        _Color0  ("Color0",  Color)  = (1, 0, 0, 1)
        _Vector0 ("Vector0", Vector) = (1, 1, 1, 1)

        [Space]


        [Gamma]
        _GammaFloat0  ("GammaFloat0",  Float)  = 0
        [Gamma]
        _GammaVector0 ("GammaVector0", Vector) = (1, 1, 1, 1)

        [Header(Toggle)]

        [MaterialToggle]
        _Toggle0 ("Toggle0", Float) = 0
        [Toggle]
        _Toggle1 ("Toggle1", Int)   = 0

        [Space(10)]

        [Toggle(KEYWORD_TOGGLE)]
        _KeywordToggle0 ("KeywordToggle0", Float) = 0

        [Header(Enum)]

        [Enum(ShaderPropertiesEnum)]
        _Enum0 ("Enum0", Float) = 0
        [Enum(USER_ENUM0, 0, USER_ENUM1, 5)]
        _Enum1 ("Enum1", Int)   = 0

        [Space(10)]

        [KeywordEnum(Red, Green, Blue)]
        _KeywordEnum0 ("KeywordEnum0", Float) = 0

        [Header(Others)]

        [HideInInspector]
        _Hide ("Hide", Float) = 0
    }
    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

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
            float4 _MainTex_ST;

            sampler2D _NormalTex;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                #ifdef KEYWORD_TOGGLE
                return fixed4(1, 0, 0, 1);
                #endif

                fixed4 color = tex2D(_MainTex, i.uv);
                return color;
            }

            ENDCG
        }
    }
}