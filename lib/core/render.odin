package core

import sdl "vendor:sdl2"

render :: proc(using state: ^State) {
	sdl.SetRenderDrawColor(renderer, 0, 0, 0, 255)
	sdl.RenderClear(renderer)

	sdl.SetRenderDrawColor(renderer, 255, 255, 255, 255)
	player_rect := sdl.Rect{i32(player_position.x), i32(player_position.y), 30, 30}
	sdl.RenderFillRect(renderer, &player_rect)

	sdl.SetRenderDrawColor(renderer, 255, 0, 0, 255)
	red_rect := sdl.Rect{20, 20, 10, 10}
	sdl.RenderFillRect(renderer, &red_rect)

	sdl.SetRenderDrawColor(renderer, 0, 255, 0, 255)
	green_rect := sdl.Rect{-30, -20, 10, 10}
	sdl.RenderFillRect(renderer, &green_rect)

	sdl.RenderPresent(renderer)
}
