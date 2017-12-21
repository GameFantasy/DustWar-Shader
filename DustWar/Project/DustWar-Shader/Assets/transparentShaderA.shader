Shader "Custom/transparentShaderA" {
Properties {
        _Color("Color", Color) = (1, 1, 1, 1)
        _Alpha("Alpha", Range(0, 1)) = 0.1
    }
    SubShader {
        Tags { "Queue" = "Transparent"  "RenderType"="Transparent" }
        CGPROGRAM
        #pragma surface surf BlinnPhong alpha
        fixed4 _Color;
        float _Alpha;
        struct Input {
            float3 viewDir;
        };
        void surf (Input IN, inout SurfaceOutput obj) {
            obj.Albedo = _Color.rgb;
            obj.Alpha = _Alpha;
        }
        ENDCG
    } 
    FallBack "Diffuse"
}
