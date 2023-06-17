sector.change_screen_ratio <- function(x, y) {
	sector.iternum <- 0
	sector.outeredges <- []
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