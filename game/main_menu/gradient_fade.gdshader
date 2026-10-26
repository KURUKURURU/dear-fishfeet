shader_type canvas_item;

uniform sampler2D gradient_texture;
uniform float shift_progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    // Shifting the X coordinate of the UV over time
    vec2 shifted_uv = vec2(UV.x + shift_progress, UV.y);
    COLOR = texture(gradient_texture, shifted_uv);
}