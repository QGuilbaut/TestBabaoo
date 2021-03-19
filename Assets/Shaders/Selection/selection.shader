// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "selection"
{
	Properties
	{
		_albedo("albedo", 2D) = "white" {}
		_nombrespritetotal("nombre sprite total", Vector) = (3,3,0,0)
		_x("x", Float) = 0
		_y("y", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _albedo;
		uniform sampler2D _Sampler016;
		uniform float4 _albedo_TexelSize;
		uniform float _x;
		uniform float _y;
		uniform float2 _nombrespritetotal;


		inline float2 MyCustomExpression15( float2 A , float2 B )
		{
			return frac(A/B)*B;
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 appendResult17 = (float2(_albedo_TexelSize.x , _albedo_TexelSize.y));
			float2 appendResult47 = (float2(_x , _y));
			float2 minuv42 = ( appendResult47 - float2( 1,1 ) );
			float2 appendResult32 = (float2(_albedo_TexelSize.z , _albedo_TexelSize.w));
			float2 spritesize38 = ( appendResult32 / _nombrespritetotal );
			float2 temp_output_19_0 = ( appendResult17 * ( minuv42 * spritesize38 ) );
			float2 A15 = i.uv_texcoord;
			float2 _nombrespritevoulu = float2(1,1);
			float2 B15 = _nombrespritevoulu;
			float2 localMyCustomExpression15 = MyCustomExpression15( A15 , B15 );
			float2 temp_output_23_0 = ( temp_output_19_0 + ( ( localMyCustomExpression15 * ( ( ( appendResult47 * spritesize38 ) * appendResult17 ) - temp_output_19_0 ) ) * _nombrespritevoulu ) );
			o.Albedo = tex2D( _albedo, temp_output_23_0 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16200
104;452;972;795;2465.274;388.7759;1.815886;True;False
Node;AmplifyShaderEditor.TexelSizeNode;16;-2380.943,403.218;Float;False;5;1;0;SAMPLER2D;_Sampler016;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;45;-2047.705,106.1641;Float;False;Property;_x;x;2;0;Create;True;0;0;False;0;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-2051.122,198.4354;Float;False;Property;_y;y;3;0;Create;True;0;0;False;0;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;30;-2189.83,735.9283;Float;False;Property;_nombrespritetotal;nombre sprite total;1;0;Create;True;0;0;False;0;3,3;3,3;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;32;-2133.042,552.1483;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;4;-1845.755,562.1124;Float;False;Constant;_vector;vector;2;0;Create;True;0;0;False;0;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleDivideOpNode;31;-1955.421,690.4382;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;47;-1851.2,148.8823;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;41;-1621.269,573.1401;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;38;-1802.594,817.8739;Float;False;spritesize;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;-1480.027,291.6161;Float;False;38;spritesize;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-1434.068,567.9397;Float;False;minuv;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-1422.764,722.6293;Float;False;38;spritesize;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-1182.322,575.5803;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;17;-1404.013,443.9388;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-1159.935,231.1819;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-986.5731,512.0184;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-989.9972,371.6568;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;20;-609.687,288.0182;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-1312.708,-394.3138;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;43;-493.3213,235.8025;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;12;-1657.097,-86.94569;Float;False;Constant;_nombrespritevoulu;nombre sprite voulu;3;0;Create;True;0;0;False;0;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.CustomExpressionNode;15;-1033.065,-190.4768;Float;False;frac(A/B)*B;2;False;2;True;A;FLOAT2;0,0;In;;Float;True;B;FLOAT2;0,0;In;;Float;My Custom Expression;True;False;0;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;44;-846.3213,33.80252;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-766.3038,-75.73613;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;24;-438.044,461.7668;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-583.5281,66.63228;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;23;-378.5744,-20.81266;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;53;-190.3176,593.1515;Float;False;Property;_Color;Color;5;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;81.36987,524.8022;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;5;-108.3935,-127.5068;Float;True;Property;_albedo;albedo;0;0;Create;True;0;0;False;0;None;7598098d427c38f44a0cb6a1736f97aa;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;48;-164.038,231.0024;Float;True;Property;_emmision;emmision;4;0;Create;True;0;0;False;0;None;189e7584ac5e0234b8e178f61284c8e5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;245.5693,-2.407542;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;selection;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;32;0;16;3
WireConnection;32;1;16;4
WireConnection;31;0;32;0
WireConnection;31;1;30;0
WireConnection;47;0;45;0
WireConnection;47;1;46;0
WireConnection;41;0;47;0
WireConnection;41;1;4;0
WireConnection;38;0;31;0
WireConnection;42;0;41;0
WireConnection;36;0;42;0
WireConnection;36;1;40;0
WireConnection;17;0;16;1
WireConnection;17;1;16;2
WireConnection;33;0;47;0
WireConnection;33;1;39;0
WireConnection;19;0;17;0
WireConnection;19;1;36;0
WireConnection;18;0;33;0
WireConnection;18;1;17;0
WireConnection;20;0;18;0
WireConnection;20;1;19;0
WireConnection;43;0;20;0
WireConnection;15;0;1;0
WireConnection;15;1;12;0
WireConnection;44;0;43;0
WireConnection;21;0;15;0
WireConnection;21;1;44;0
WireConnection;24;0;19;0
WireConnection;22;0;21;0
WireConnection;22;1;12;0
WireConnection;23;0;24;0
WireConnection;23;1;22;0
WireConnection;54;0;48;0
WireConnection;54;1;53;0
WireConnection;5;1;23;0
WireConnection;48;1;23;0
WireConnection;0;0;5;0
ASEEND*/
//CHKSM=034643A616FD79A4F183DC5C8D43019752913268