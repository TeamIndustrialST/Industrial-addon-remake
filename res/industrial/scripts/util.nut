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