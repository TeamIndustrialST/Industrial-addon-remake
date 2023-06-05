import("res/industrial/scripts/util.nut")

sector.glitch <- function(...) {
	foreach(v in vargv) {
		sector.new_thread(function(tilemap) {
			while(true) {
				if(rand() % 2 == 0) tilemap.set_alpha(0); else tilemap.set_alpha(1)
				wait(sector.random(10, 50) / 10)
			}
		}, false).call(v)
	}
}
