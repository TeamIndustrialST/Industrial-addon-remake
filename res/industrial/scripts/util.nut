sector.new_thread <- function(funnction, call = true) {
	sector[funnction.tostring()] <- newthread(funnction)
	if(call) sector[funnction.tostring()].call()
	return sector[funnction.tostring()]
}

sector.random <- function(min = null, max = null) {
	if(max == null) return rand() % min
	return (rand() % (max - min)) + min
}

sector.fade_in_start <- function(time = 0.4) {
	Effect.set_black(true)
	Effect.fade_in(time)
}

sector.get_size <- function(table) {
	if(type(table) == "table") return table.keys().length()
	return table.length()
}

sector.tilemap_get_width <- function(tilemap) {
	local inc = 0
	while(true) {
		local oldid = tilemap.get_tile_id(inc, 0)
		tilemap.change(inc, 0, 1)
		if(tilemap.get_tile_id(inc, 0) == 1) {
			tilemap.change(inc, 0, oldid)
			inc++
		} else break
		//wait(0.01)
	}
	tilemap.change(0, 0, 0)
	return inc
}

sector.tilemap_get_height <- function(tilemap) {
	local inc = 0
	while(true) {
		local oldid = tilemap.get_tile_id(0, inc)
		tilemap.change(0, inc, 1)
		if(tilemap.get_tile_id(0, inc) == 1) {
			tilemap.change(0, inc, oldid)
			inc ++
		} else break
		//wait(0.01)
	}
	return inc
}

/*
sector.random <- function(min = null, max = null) {
	if(max == null) return rand() % min
	return (rand() % (max - min)) + min
}

sector.get_random_in_array <- function(aray) {
	if(type(aray) == "array") {
		
	} else if(type(aray) == "table") {

	}
}
*/