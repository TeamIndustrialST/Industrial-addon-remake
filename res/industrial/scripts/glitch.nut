import("res/industrial/scripts/util.nut")

sector.glitch <- function(...) {
	foreach(v in vargv) {
		sector.new_thread(function(tilemap) {
			while(tilemap != null) {
				if(rand() % 2 == 0) tilemap.set_alpha(0); else tilemap.set_alpha(1)
				wait(sector.random(10, 50) / 10)
			}
		}, false).call(v)
	}
}

sector.glitch_cutscene <- function(sector, ...) {
	Tux.use_scripting_controller(true)
	Tux.do_scripting_controller("left", true)
	wait(0.7)
	Tux.do_scripting_controller("left", false)
	Tux.do_scripting_controller("right", true)
	wait(0.7)
	Tux.do_scripting_controller("right", false)
	stop_music(2)
	wait(3)
	try {Bill.ignite()} catch(e) {}
	Tux.do_scripting_controller("left", true)
	Tux.do_scripting_controller("jump", true)
	wait(0.01)
	Tux.do_scripting_controller("left", false)
	Tux.do_scripting_controller("jump", false)
	wait(0.39)
	try {Bob.ignite()} catch(e) {}
	wait(0.6)
	foreach(v in vargv) {
		v.set_alpha(0)
		wait(1)
	}
	Tux.set_ghost_mode(true)
	Tux.do_scripting_controller("down", true)
	Effect.fade_out(0.7)
	wait(2)
	Level.spawn(sector, "main")
}

sector.glitch_flip <- function(time = 2.4, waitfull = false) {
	Camera.scale(0, (time / 2) - 0.2)
	wait(time / 2)
	Level.flip_vertically()
	Camera.scale(1, (time / 2) - 0.2)
	if(waitfull) wait(time / 2)
}