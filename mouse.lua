mouseC = {}
mouseC.offset_x = 0
mouseC.offset_y = 0

function mouseMap()
  mouseC.grid_x = math.ceil(((mouseX-0.5*tilew)/(0.5*tilew) + mouseY/(0.5*tileh))/2 - 9)
  mouseC.grid_y = math.ceil(((mouseY-0.5*tileh)/(0.5*tileh) - mouseX/(0.5*tilew))/2 - 1)
  
  --update: this fix right below causes issues with changing screen resolution
  --mouseX and mouseY change their origin upon res change and this fix must incorporate it somehow
  --todo.
  --experimental way to fix mouse issue (update, works perfectly)
  mouseC.grid_x = mouseC.grid_x + selector.grid_x - 1
  mouseC.grid_y = mouseC.grid_y + selector.grid_y - 1
  
  --check mouse is in bounds
    if (mouseC.grid_x < 1) then
      mouseC.grid_x = 1
    elseif (mouseC.grid_y < 1) then
      mouseC.grid_y = 1
    elseif (mouseC.grid_x > gridSize) then
      mouseC.grid_x = gridSize
    elseif (mouseC.grid_y > gridSize) then
      mouseC.grid_y = gridSize
    end
  
  
  --mouseMapX, mouseMapY = mouseC.grid_x, mouseC.grid_y
  mouseC.dest_x = ((mouseC.grid_x + mouseC.offset_x) - (mouseC.grid_y + mouseC.offset_y)) * tilew/2 -300
  mouseC.dest_y = ((mouseC.grid_x + mouseC.offset_x) + (mouseC.grid_y + mouseC.offset_y)) * tileh/2 -200
  
  mouseC.mouseMapX, mouseC.mouseMapY = offset(mouseC.dest_x, mouseC.dest_y)
  
  
end
