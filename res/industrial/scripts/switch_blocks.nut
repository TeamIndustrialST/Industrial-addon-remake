import("res/industrial/scripts/util.nut")

sector.switch_block <- function() {
	for(local x = 0; x < sector.tilemap_get_width(sector["switch"]); x++){
		for(local y = 0; y < sector.tilemap_get_height(sector["switch"]); y++){
			if(sector["switch"].get_tile_id(x, y) == 5160) {sector["switch"].change(x, y, 5162)} else if(sector["switch"].get_tile_id(x, y) == 5162) sector["switch"].change(x, y, 5160)
			if(sector["switch"].get_tile_id(x, y) == 5161) {sector["switch"].change(x, y, 5163)} else if(sector["switch"].get_tile_id(x, y) == 5163) sector["switch"].change(x, y, 5161)
		}
		//wait(0.01)
	}		
}

sector.set_block <- function(ison) {
	//not implemented yet
}

/*
off.set_alpha(0)

sector.switch_block <- function() {
	if(on.get_alpha() == 0 && off.get_alpha() == 1) {
		on.set_alpha(1)
		off.set_alpha(0)
	} else {
		on.set_alpha(0)
		off.set_alpha(1)
	}
}

sector.set_block <- function(ison) {
	if(ison) {
		on.set_alpha(1)
		off.set_alpha(0)
	} else {
		on.set_alpha(0)
		off.set_alpha(1)
	}
}
*/

for(local x = 0; x < sector.tilemap_get_width(sector["switch"]); x++) for(local y = 0; y < sector.tilemap_get_height(sector["switch"]); y++){
		if(sector["switch"].get_tile_id(x, y) == 5161) sector["switch"].change(x, y, 5163)
}