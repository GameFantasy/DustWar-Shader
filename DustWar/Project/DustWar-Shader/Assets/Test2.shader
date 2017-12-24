Shader "Custom/Test2" {
		Properties {
		_IlluminCol  ("Self-Illumination color (RGB)", Color) = (1,1,1,0.5)
		_MainTex ("Base (RGB) Self-Illumination (A)", 2D) = "white" {}
		_Ambient ("Ambient", Color) = (0.3,0.3,0.3,0.3)
		_Specular("Specular	",Color)=(1,1,1,1)
		_Shininess("Shininess",Range(0,8))=4
		_Emission("Emission",Color)=(0.5,0.5,0.5,0.5) 
	}
	SubShader {
		 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" }
		 Pass {
		  Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" }
		  Material {
		   Ambient (1,1,1,1)
		   Diffuse (1,1,1,1)

				specular[_Specular]
				shininess[_Shininess]
				emission[_Emission]
		  }
		  lighting on
			separatespecular on
		  SetTexture [_MainTex] { ConstantColor [_IlluminCol] combine constant * texture }
		  SetTexture [_MainTex] { combine previous + texture }
		  SetTexture [_MainTex] { ConstantColor [_IlluminCol] combine previous * constant }
		  }
		 
	}
	FallBack "Diffuse"
}
