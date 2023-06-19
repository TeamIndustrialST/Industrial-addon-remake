//import("res/industrial/scripts/util.nut")

sector.level_card <- function(speed = 15) {
	if(!("new_ratio" in sector)) sector.new_ratio <- [Camera.get_screen_width(), Camera.get_screen_height()]

	start_cutscene()

	sector.title_card <- FloatingImage("res/industrial/gfx-misc/title_card.png")
	sector.title_card.set_layer(999)
	sector.title_card.set_anchor_point(ANCHOR_RIGHT)
	sector.title_card.set_pos(Camera.get_screen_width() * -1, 0)
	sector.title_card.set_visible(true)

	sector.darkness_thread <- newthread(sector.cover_in_darkness)
	sector.darkness_thread.call(1.5)

	while(true) {
		sector.title_card.set_pos(sector.title_card.get_pos_x() + speed, 0)
		if(sector.title_card.get_pos_x() >= (sector.new_ratio[0] / 2) * -1) break
		wait(0.01)
	}
	//display("funny part 1")
	wait(2)
	while(true) {
		sector.title_card.set_pos(sector.title_card.get_pos_x() - speed, 0)
		if(sector.title_card.get_pos_x() <= Camera.get_screen_width() * -1) break
		wait(0.01)
	}
	//display("funny part 2")
	end_cutscene()
}

sector.change_screen_ratio <- function(x, y) {
	if(!("iternum" in sector)) sector.iternum <- 0
	sector.outeredges <- []
	sector.new_ratio <- [x, y]
	if(x < Camera.get_screen_width() && x != null) {
		for(local i = 0; i < (Camera.get_screen_width() / 800).tointeger() + 1; i++) {
			local a = "edge" + (sector.iternum).tostring()
			sector[a] <- FloatingImage("images/background/misc/black_800px.png")
			sector[a].set_layer(1000)
			sector[a].set_anchor_point(ANCHOR_TOP_LEFT)
			sector[a].set_pos(x * -1, i * 600)
			sector[a].set_visible(true)
			sector.iternum += 1
			sector.outeredges.push(a)
		}
		for(local i = 0; i < (Camera.get_screen_width() / 800).tointeger() + 1; i++) {
			local a = "edge" + (sector.iternum).tostring()
			sector[a] <- FloatingImage("images/background/misc/black_800px.png")
			sector[a].set_layer(1000)
			sector[a].set_anchor_point(ANCHOR_TOP_RIGHT)
			sector[a].set_pos(x, i * 600)
			sector[a].set_visible(true)
			sector.iternum += 1
			sector.outeredges.push(a)
		}
	}
	if(y < Camera.get_screen_height() && y != null) {
		for(local i = 0; i < (Camera.get_screen_height() / 600).tointeger() + 1; i++) {
			local a = "edge" + (sector.iternum).tostring()
			sector[a] <- FloatingImage("images/background/misc/black_800px.png")
			sector[a].set_layer(1000)
			sector[a].set_anchor_point(ANCHOR_TOP_LEFT)
			sector[a].set_pos(i * 800, y * -1)
			sector[a].set_visible(true)
			sector.iternum += 1
			sector.outeredges.push(a)
		}
		for(local i = 0; i < (Camera.get_screen_height() / 600).tointeger() + 1; i++) {
			local a = "edge" + (sector.iternum).tostring()
			sector[a] <- FloatingImage("images/background/misc/black_800px.png")
			sector[a].set_layer(1000)
			sector[a].set_anchor_point(ANCHOR_BOTTOM_LEFT)
			sector[a].set_pos(i * 800, y)
			sector[a].set_visible(true)
			sector.iternum += 1
			sector.outeredges.push(a)
		}
	}
}

sector.cover_in_darkness <- function(waittime = 1, fadetime = 1) {
	if(!("iternum" in sector)) sector.iternum <- 0
	sector.inner_area <- []
	for(local x = 0; x < (Camera.get_screen_width() / 800).tointeger() + 1; x++) {
		for(local y = 0; y < (Camera.get_screen_height() / 600).tointeger() + 1; y++) {
			local a = "inner" + (sector.iternum).tostring()
			sector[a] <- FloatingImage("images/background/misc/black_800px.png")
			sector[a].set_layer(998)
			sector[a].set_anchor_point(ANCHOR_TOP_LEFT)
			sector[a].set_pos(x * 800, y * 600)
			sector[a].set_visible(true)
			sector.iternum += 1
			sector.inner_area.push(a)
		}
	}
	wait(waittime)
	foreach(v in sector.inner_area) sector[v].fade_out(fadetime)
}
