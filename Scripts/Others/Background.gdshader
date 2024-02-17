shader_type canvas_item;

void fragment() {
	float speed = float(0.1);
	COLOR = texture(TEXTURE, UV + vec2(0.4, 0) * TIME * speed);
}