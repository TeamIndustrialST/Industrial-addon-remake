import("res/industrial/scripts/util.nut")

sector.glitch <- function(glitchmap, writemap) {
	sector.new_thread(function(glitchmap, writemap) {
		while(true) {
			//if(tilemap.get_alpha() == 1) tilemap.set_alpha(0); else tilemap.set_alpha(1)
			sector.glitch_tilemap(glitchmap, -1, writemap)
			wait(sector.random(10, 50) / 10)
		}
	}, false).call(glitchmap, writemap)
}

sector.glitch_tilemap <- function(tilemap, id = 1, writemap = null, maxtiles = 5167) { //assumes its position is (0, 0)
	for(local x = 0; x < sector.tilemap_get_width(tilemap); x++)
			for(local y = 0; y < sector.tilemap_get_height(tilemap); y++)
				if((tilemap.get_tile_id(x, y) == id || id == -1) && tilemap.get_tile_id(x, y) != 0) //if()
					if(rand() % 2 == 0) {
						if(writemap == null) {tilemap.change(x, y, (sector.random(maxtiles - 1) + 1))} else writemap.change(x, y, (sector.random(maxtiles - 1) + 1))
					} else {
						if(rand() % 2 == 0) {
							if(writemap == null) {tilemap.change(x, y, 5164)} else writemap.change(x, y, 5164)
						} else if(writemap == null) {tilemap.change(x, y, 0)} else writemap.change(x, y, 0) 
					}
}

sector.glitch_cutscene <- function(sector, ...) {
	start_cutscene()
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
	end_cutscene()
	Level.spawn(sector, "main")
}

sector.glitch_flip <- function(time = 2.4, waitfull = false) {
	Camera.scale(0, (time / 2) - 0.2)
	wait(time / 2)
	Level.flip_vertically()
	Camera.scale(1, (time / 2) - 0.2)
	if(waitfull) wait(time / 2)
}
