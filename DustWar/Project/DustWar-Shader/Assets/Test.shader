Shader "Custom/Test" {
	Properties {
		_Color ("Color", Color) = (1,1,1,0.5)
		_Ambient ("Ambient", Color) = (0.3,0.3,0.3,0.3)
		_Specular("Specular	",Color)=(1,1,1,1)
		_Shininess("Shininess",Range(0,8))=4
		_Emission("Emission",Color)=(0.5,0.5,0.5,0.5)
	}
	SubShader {
		Pass{
			material{
				diffuse[_Color]
				ambient[_Ambient]
				specular[_Specular]
				shininess[_Shininess]
				emission[_Emission]
			}
			lighting on
			separatespecular on
		}
	}
	FallBack "Diffuse"
}
