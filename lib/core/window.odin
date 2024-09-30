package core

import "core:log"
import sdl "vendor:sdl2"

Window :: struct {
	handle: ^sdl.Window,
}

window: Window

window_init :: proc() {
	sdl.Init(sdl.INIT_VIDEO)
	window.handle = sdl.CreateWindow(
		"SDL2 hot-reload",
		sdl.WINDOWPOS_UNDEFINED,
		sdl.WINDOWPOS_UNDEFINED,
		1280,
		720,
		sdl.WINDOW_SHOWN,
	)
	log.debug("Window initialized")
}

window_destroy :: proc() {
	sdl.DestroyWindow(window.handle)
	sdl.Quit()
	log.debug("Window destroyed")
}

window_step :: proc() -> bool {
	s := state_get()
	update(s)
	render(s)
	return !window_should_close()
}

window_should_close :: proc() -> bool {
	event: sdl.Event
	for sdl.PollEvent(&event) {
		if event.type == .QUIT do return true
	}
	return false
}

window_force_reload :: proc() -> bool {
	kb := sdl.GetKeyboardState(nil)
	return kb[sdl.SCANCODE_F5] != 0
}

window_force_reset :: proc() -> bool {
	kb := sdl.GetKeyboardState(nil)
	return kb[sdl.SCANCODE_F6] != 0
}
