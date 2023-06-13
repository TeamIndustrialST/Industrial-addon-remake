import("res/industrial/scripts/util.nut")

off.set_alpha(0)

sector.switch_block_active <- true

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

/*
sector.switch_block <- function(tilemap = switchmap) {
	for(local x = 0; x < sector.tilemap_get_width(tilemap); x++){
		for(local y = 0; y < sector.tilemap_get_height(tilemap); y++){
			/*
			switch(tilemap.get_tile_id(x, y)) {
				case 1560:
					tilemap.change(x, y, 5162);
					continue;
				case 1561:
					tilemap.change(x, y, 5163);
					continue;
				case 1562:
					tilemap.change(x, y, 5160);
					continue;
				case 1563:
					tilemap.change(x, y, 5161);
					continue;
			}
			* /
			if(tilemap.get_tile_id(x, y) == 5160) {tilemap.change(x, y, 5162)} else if(tilemap.get_tile_id(x, y) == 5162) tilemap.change(x, y, 5160)
			if(tilemap.get_tile_id(x, y) == 5161) {tilemap.change(x, y, 5163)} else if(tilemap.get_tile_id(x, y) == 5163) tilemap.change(x, y, 5161)
		}
		//wait(0.01)
	}		
}

sector.set_block <- function(ison) {
	//not implemented yet
}

for(local x = 0; x < sector.tilemap_get_width(switchmap); x++) for(local y = 0; y < sector.tilemap_get_height(switchmap); y++){
		if(switchmap.get_tile_id(x, y) == 5161) switchmap.change(x, y, 5163)
}
*/