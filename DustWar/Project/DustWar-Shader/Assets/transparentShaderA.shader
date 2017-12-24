Shader "Custom/transparentShaderA" {
Properties {
        _MainTex("Texture (RGB)", 2D) = "black" {}
	
        _Color("Color", Color) = (0, 0, 0, 1)
	
        _AtmoColor("Atmosphere Color", Color) = (0.5, 0.5, 1.0, 1)
	
        _Size("Size", Float) = 0.1
	
        _Falloff("Falloff", Float) = 5
	
        _FalloffPlanet("Falloff Planet", Float) = 5
	
        _Transparency("Transparency", Float) = 15
	
        _TransparencyPlanet("Transparency Planet", Float) = 1

		_IlluminCol  ("Self-Illumination color (RGB)", Color) = (1,1,1,0.5)
		_Specular("Specular	",Color)=(1,1,1,1)
		_Shininess("Shininess",Range(0,8))=4
		_Emission("Emission",Color)=(0.5,0.5,0.5,0.5) 

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
