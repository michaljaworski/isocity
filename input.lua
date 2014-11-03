--set mouse and keyboard options
function input_init()
  
  --make mouse visible
  mos.setVisible(true)
  --increases lag between inputs so it's not always firing, same as delay
  key.setKeyRepeat(0.1, 0.1)
  
end

function input_keypressed(k)
  
  if k == "q" or k == "escape" then
    print("--Quit")
    love.event.quit()
  
  elseif k == "m" then
    print("--Mouse position")
    print(mouseX)
    print(mouseY)
    
  elseif k == "p" then
    gamestate = 2
    print("--eXistenZ is paused")
  
  elseif k == "f4" then
    gamestate = 0
    print("--Gamestate = menu")
  
  elseif k == "f5" then
    gamestate = 1
    print("--Gamestate = running")
  
  elseif k == "f6" then
    print("--Generating random grid")
    grid:Generate()
    --testing trees
    treegrid:Generate()
    
  elseif k =="f10" then
    print("--Toggle fullscreen")
    fullscreen()
  
  elseif k == "tab" then
    print("--debug")
    grid:info()
    
  elseif k == "right" then
    selector:move(1,0)
    print("--moving right")
    
  elseif k == "left" then
    selector:move(-1,0)
    print("--moving left")
    
  elseif k == "up" then
    selector:move(0,-1)
    print("--moving up")
    
  elseif k == "down" then
    selector:move(0,1)
    print("--moving down")
    
  elseif k == "home" then
    selector:move(-1,-1)
    print("--moving up")
  
  elseif k == "end" then
    selector:move(1,1)
    print("--moving up")
    
  elseif k == "pageup" then
    selector:move(-1,1)
    print("--moving up")
    
  elseif k == "pagedown" then
    selector:move(1,-1)
    print("--moving up")
      
  elseif k == "b" then
    gridSize = gridSize + 1
    grid:Resize(gridSize)
    --testing trees
    treegrid:Resize(gridSize)
      
  elseif k == "g" then
    grid:Pregrid()
    
  elseif k == "1" then
    currentTile = currentTile + 1
    if (currentTile > 89) then
      currentTile = 89
    end
    
  elseif k == "2" then
    currentTile = currentTile - 1
    if (currentTile < 1) then
      currentTile = 1
    end
    
  elseif k == " " then
    print("--dropping new tile")
    selector:chooser(currentTile, mouseC.grid_x, mouseC.grid_y, false)
    
  elseif k == "f1" then
    print("--saving to file")
    table.save(grid, "saves/save.txt")
  elseif k == "f2" then
    print("--loading from file")
    local tempgrid = table.load("saves/save.txt")
    
    --[[Debug table on slower computers
    for x = 1,gridSize do
      for y = 1,gridSize do
        print(tempgrid[x][y] .. " ")
      end
      print("\n")
    end

    --]]
    grid = tempgrid
  
  end
  
end

function mouse_location(mos)
  --get mouse locations and convert to map coordinates
  mouseX = mos.getX()
  mouseY = mos.getY()
  
  mouseMap()
end


function mouse_input(mos)
  if mos.isDown("l") then
    selector:chooser(currentTile, mouseC.grid_x, mouseC.grid_y, true)
    print("--Mouse1 clicked")
  elseif mos.isDown("r") then
    selector:chooser(1, mouseC.grid_x, mouseC.grid_y, true)
    print("--Mouse2 clicked")
  end
end

function love.mousepressed(x, y, mb)  
  --listen for mouse wheel, currently scrolls through tiles
  if mb == "wu" then    
    currentTile = currentTile + 1
    if (currentTile > 89) then
      currentTile = 89
    end
    print("--Mouse selecting next tile")
      
  elseif mb == "wd" then
    currentTile = currentTile - 1
    if (currentTile < 1) then
      currentTile = 1
    end
    print("--Mouse selecting prev tile")
  end
end

