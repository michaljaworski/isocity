--information layer, used to display controls and such
info = {}
function info:draw()
  
  grx.print("Controls: " .. 
    "\nq or esc to exit, " .. 
    "tab to see debug, " .. 
    "f6 to generate random map, " .. 
    "f1 to save map, f2 to load, " .. 
    "\nscroll to select tile, " .. 
    "mouse1 to place, mouse2 to remove, " .. 
    "b to increase map size", 0, xheight-60)
  
end
