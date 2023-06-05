sector.new_thread <- function(funnction, call = true) {
	sector[funnction.tostring()] <- newthread(funnction)
	if(call) sector[funnction.tostring()].call()
	return sector[funnction.tostring()]
}

sector.random <- function(min = null, max = null) {
	if(max == null) return rand() % min
	return (rand() % (max - min)) + min
}