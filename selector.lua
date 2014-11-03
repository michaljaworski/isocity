--init selector unit
selector = {}

--set selector start location on grid
selector.grid_x = 1
selector.grid_y = 1

selector.dest_x = (selector.grid_x - selector.grid_y) * tilew/2
selector.dest_y = (selector.grid_x + selector.grid_y) * tileh/2

selector.draw_x = selector.dest_x
selector.draw_y = selector.dest_y
selector.draw_s = 0x10

--temp
nextGrid = 0

--current tile
currentTile = 1

function selector:update(dt)
  --display terrain type at updated location
  self.draw_x = self.draw_x - ((self.draw_x - self.dest_x) * self.draw_s * dt)
  self.draw_y = self.draw_y - ((self.draw_y - self.dest_y) * self.draw_s * dt)
end

function selector:move(dx,dy)
  --update position on draw

    ---[[allow movement
    self.grid_x = self.grid_x + dx
    self.grid_y = self.grid_y + dy
    
    --check if still inside drawn area
    if (self.grid_x < 1) then
      self.grid_x = 1
    elseif (self.grid_y < 1) then
      self.grid_y = 1
    elseif (self.grid_x > gridSize) then
      self.grid_x = gridSize
    elseif (self.grid_y > gridSize) then
      self.grid_y = gridSize
    end
    
    --check tile number
    nextGrid = grid[self.grid_y][self.grid_x]
    
    self.dest_x = (self.grid_x - self.grid_y)*tilew/2
    self.dest_y = (self.grid_x + self.grid_y)*tileh/2
    --]]
  --end
end

function selector:draw(dx,dy)
  --draw selector
  ox = self.draw_x
  oy = self.draw_y
  
  --camera offset
  ox, oy = offset(ox,oy)
  
  --isometric map details
  local x1, x2, x3, x4 = ox + tilew/2, ox + tilew, ox + tilew/2, ox
	local y1, y2, y3, y4 = oy, oy + tileh/2, oy + tileh, oy + tileh/2
  
  --draw diamond
  grx.setColor(0xff,0xff,0xff,0x20)
  grx.quad("fill",x1, y1 + tileh/6, x2 - tilew/6, y2, x3, y3 - tileh/6, x4 + tilew/6, y4)
  
end

function selector:info()
	---[[ DEBUG
	grx.setColor(0xFF, 0xFF, 0xFF)

	if key.isDown("tab") then
	
		grx.print(
			
			--display coordinates
			"self_dest_x : "   .. self.dest_x ..
			"\nself_dest_y : " .. self.dest_y ..
			--display grid crossing
			"\nself_grid_x : " .. self.grid_x ..
			"\nself_grid_y : " .. self.grid_y ..
      --display selector grid values
      "\ntilew : " .. tilew ..
      "\ntileh : " .. tileh ..
      --show self draw
      "\nself_draw_x : " .. self.draw_x ..
      "\nself_draw_y : " .. self.draw_y ..
      "\nselector_dest_x : " .. selector.dest_x ..
      "\nselector_dest_y : " .. selector.dest_y,
			0, 0
		)

	else

		--display command debug and FPS
		grx.print("tab -> debug\nFPS = " .. love.timer.getFPS() ..
        "\nTile number : " .. nextGrid ..
        "\nTotal tiles : " .. gridSize*gridSize ..
        "\nDrop tile : " .. tostring(tilename[currentTile]) ..
        " : " .. currentTile ..
        "\nMouse x,y : " .. mouseC.grid_x .. ":" .. mouseC.grid_y ..
        " mouseMap x,y : " .. mouseC.mouseMapX .. ":" .. mouseC.mouseMapY ..
        "\nReal mouse x,y : " .. mouseX .. ":" .. mouseY,
    0, 0)
	end
	--]]
end

function selector:preview_tile()
  --preview the currently selected tile in corner of screen
  if (currentTile > 1) then
    grx.draw(tilename[currentTile-1], (xwidth-1.5*tilew), 0, 0, 0.5, 0.5)
    grx.draw(tilename[currentTile], (xwidth-tilew), 0, 0, 1, 1)
  else
    grx.draw(tilename[currentTile], (xwidth-tilew), 0, 0, 1, 1)
  end
  
  --draw current tile right next to mouse
  grx.draw(tilename[currentTile], mouseX, mouseY, 0, 0.5, 0.5)
end

function selector:chooser(value, mx, my, m)
  if (m == true) then
    grid[my][mx] = value
  else
    grid[self.grid_y][self.grid_x] = value
  end
end
