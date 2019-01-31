shader_type canvas_item;

void fragment(){
	vec4 sum = vec4(0.0);
	for (float i = -2.0; i <= 2.0; i++){
		for (float j = -2.0; j <= 2.0; j++){
			sum += textureLod(TEXTURE,UV+vec2(TEXTURE_PIXEL_SIZE.x*i,TEXTURE_PIXEL_SIZE.y*j),0.0);
		}
	}
	sum /= 25.0;
	vec4 c = sum;
	c.rgb = vec3(0.8+sin(TIME*10.0 - UV.x*10.0)*0.2);
	c += textureLod(TEXTURE,UV,0.0);
//	c.gb = vec2(0.0);
	COLOR = c;
}