shader_type spatial; 
render_mode skip_vertex_transform, cull_disabled, ambient_light_disabled;

//Albedo texture 
uniform sampler2D albedoTex : hint_albedo;
uniform bool paletteswap = false;
//Geometric resolution for vert snap
uniform float snapRes = 50.0; 

//vec4 for UV recalculation 
varying vec4 vertCoord;



void vertex() {
	VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	VERTEX.xyz = floor(VERTEX.xyz * snapRes) / snapRes;
	vertCoord = vec4(UV * VERTEX.z, VERTEX.z, 0); 
} 
 
void fragment() {
	
	ALBEDO = texture(albedoTex, vertCoord.xy / vertCoord.z).rgb;
}

