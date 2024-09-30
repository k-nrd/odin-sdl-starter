package core

import "core:log"
import sdl "vendor:sdl2"

State :: struct {
	renderer:        ^sdl.Renderer,
	player_position: Vec2f,
	step_count:      int,
	last_time:       u32,
}

state: ^State

state_init :: proc() {
	state = new(State)
	state^ = State{}
	state.renderer = sdl.CreateRenderer(window.handle, -1, {.ACCELERATED, .PRESENTVSYNC})
}

state_destroy :: proc() {
	sdl.DestroyRenderer(state.renderer)
	free(state)
	log.debug("State destroyed")
}

state_get :: proc() -> ^State {
	return state
}

state_size :: proc() -> int {
	return size_of(State)
}

state_load :: proc(new_state: rawptr) {
	state = (^State)(new_state)
	log.debugf("Loaded new state: %v", state_get()^)
}

state_set_player_position :: proc()
