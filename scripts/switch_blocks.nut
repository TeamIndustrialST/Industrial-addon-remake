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