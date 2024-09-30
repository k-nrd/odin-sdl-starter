package core

import la "core:math/linalg"
import sdl "vendor:sdl2"

update :: proc(using state: ^State) {
	dt := f32(sdl.GetTicks() - last_time) / 1000.0
	last_time = sdl.GetTicks()

	input: Vec2f
	kb := sdl.GetKeyboardState(nil)
	if kb[sdl.SCANCODE_UP] != 0 || kb[sdl.SCANCODE_W] != 0 {
		input.y -= 1
	}
	if kb[sdl.SCANCODE_DOWN] != 0 || kb[sdl.SCANCODE_S] != 0 {
		input.y += 1
	}
	if kb[sdl.SCANCODE_LEFT] != 0 || kb[sdl.SCANCODE_A] != 0 {
		input.x -= 1
	}
	if kb[sdl.SCANCODE_RIGHT] != 0 || kb[sdl.SCANCODE_D] != 0 {
		input.x += 1
	}
	input = la.normalize0(input)

	player_position += input * dt * 100
	step_count += 1
}
