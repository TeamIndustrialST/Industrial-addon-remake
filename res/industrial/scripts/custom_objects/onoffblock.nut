local message = "lol you fogor to `import(\"res/industrial/scripts/switch_blocks.nut\")` in the sector init script"

try {
   if(sector.switch_block_active) {
      switch_block()
   } else {
      throw(message)
   }
} catch(e) {
   throw(message)
}