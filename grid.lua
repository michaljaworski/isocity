grid = {}

--set tile size
tilew = 100
tileh = 50

function grid:Load()
  
  print("--setup the grid")

  --grid = {}
  for x = 1,gridSize do
    grid[x] = {}
    for y = 1,gridSize do
      grid[x][y] = 1
    end
  end
  
  --set width and height of table
  grid.w = #grid[1]
  grid.h = #grid

  print("--grid initiated")
    
  --require "selector"
end

function grid:Resize(newSize)
  print("--Resizing grid")
  gridSize = newSize
  for x = 1,gridSize do
    grid[x] = {}
    for y = 1,gridSize do
      grid[x][y] = 1
    end
  end
  print("--Grid resized")
end

function grid:Generate()
  print("--Generating grid")
  for x = 1,gridSize do
    for y = 1,gridSize do
      grid[x][y] = math.random(0,89)
    end
  end
  print("--Grid generated")
end

function grid:Pregrid()
  print("--Generating pregrid")
  for x = 1,gridSize do
    for y = 1,gridSize do
      grid[x][y] = x+y-2
    end
  end
    
end

function grid:draw()
  --for each y
  for ky, _ in ipairs(self) do
    --for each x
    for kx, v in ipairs(self[ky]) do
      --set isometric origin
      local ox = (kx - ky) * tilew/2
      local oy = (kx + ky) * tileh/2
      
      --selector offset
      ox, oy = offset(ox, oy)
      
      --set world coordinates
      local x1, x2, x3, x4 = ox + tilew/2, ox + tilew, ox + tilew/2, ox
      local y1, y2, y3, y4 = oy, oy + tileh/2, oy + tileh, oy + tileh/2
      
      local color
      
      --draw terrains
      if v == 0 then
        
      end
      if v == 1 then
        grx.draw(beach, ox, oy)
      end
      if v == 2 then
        grx.draw(beachCornerES, ox, oy+7)
      end
      if v == 3 then
        grx.draw(beachCornerNE, ox, oy)
      end
      if v == 4 then
        grx.draw(beachCornerNW, ox, oy+7)
      end
      if v == 5 then
        grx.draw(beachCornerSW, ox, oy+7)
      end
      if v == 6 then
        grx.draw(beachE, ox, oy)
      end
      if v == 7 then
        grx.draw(beachES, ox, oy)
      end
      if v == 8 then
        grx.draw(beachN, ox, oy)
      end
      if v == 9 then
        grx.draw(beachNE, ox, oy+7)
      end
      if v == 10 then
        grx.draw(beachNW, ox, oy)
      end
      if v == 11 then
        grx.draw(beachS, ox, oy+7)
      end
      if v == 12 then
        grx.draw(beachSW, ox, oy)
      end
      if v == 13 then
        grx.draw(beachW, ox, oy+7)
      end
      if v == 14 then
        grx.draw(bridgeEW, ox, oy+3)
      end
      if v == 15 then
        grx.draw(bridgeNS, ox, oy+3)
      end
      if v == 16 then
        grx.draw(crossroad, ox, oy)
      end
      if v == 17 then
        grx.draw(crossroadESW, ox, oy)
      end
      if v == 18 then
        grx.draw(crossroadNES, ox, oy)
      end
      if v == 19 then
        grx.draw(crossroadNEW, ox, oy)
      end
      if v == 20 then
        grx.draw(crossroadNSW, ox, oy)
      end
      
      if v == 21 then
        grx.draw(dirt, ox, oy+7)
      end
      if v == 22 then
        grx.draw(dirtDouble, ox, oy)
      end
      if v == 23 then
        grx.draw(endE, ox, oy)
      end
      if v == 24 then
        grx.draw(endN, ox, oy)
      end
      if v == 25 then
        grx.draw(endS, ox, oy)
      end
      if v == 26 then
        grx.draw(endW, ox, oy)
      end
      if v == 27 then
        grx.draw(exitE, ox, oy)
      end
      if v == 28 then
        grx.draw(exitN, ox, oy)
      end
      if v == 29 then
        grx.draw(exitS, ox, oy)
      end
      if v == 30 then
        grx.draw(exitW, ox, oy)
      end
      if v == 31 then
        grx.draw(grass, ox, oy)
      end
      if v == 32 then
        grx.draw(grassWhole, ox, oy)
      end
      if v == 33 then
        grx.draw(hillE, ox, oy)
      end
      if v == 34 then
        grx.draw(hillES, ox, oy)
      end
      if v == 35 then
        grx.draw(hillN, ox, oy)
      end
      if v == 36 then
        grx.draw(hillNE, ox, oy)
      end
      if v == 37 then
        grx.draw(hillNW, ox, oy)
      end
      if v == 38 then
        grx.draw(hillS, ox, oy-15)
      end
      if v == 39 then
        grx.draw(hillSW, ox, oy-15)
      end
      if v == 40 then
        grx.draw(hillW, ox, oy-15)
      end
      
      if v == 41 then
        grx.draw(lotE, ox, oy)
      end
      if v == 42 then
        grx.draw(lotES, ox, oy)
      end
      if v == 43 then
        grx.draw(lotN, ox, oy)
      end
      if v == 44 then
        grx.draw(lotNE, ox, oy)
      end
      if v == 45 then
        grx.draw(lotNW, ox, oy)
      end
      if v == 46 then
        grx.draw(lotS, ox, oy)
      end
      if v == 47 then
        grx.draw(lotSW, ox, oy)
      end
      if v == 48 then
        grx.draw(lotW, ox, oy)
      end
      if v == 49 then
        grx.draw(riverBankedES, ox, oy)
      end
      if v == 50 then
        grx.draw(riverBankedEW, ox, oy)
      end
      if v == 51 then
        grx.draw(riverBankedNE, ox, oy)
      end
      if v == 52 then
        grx.draw(riverBankedNS, ox, oy)
      end
      if v == 53 then
        grx.draw(riverBankedNW, ox, oy)
      end
      if v == 54 then
        grx.draw(riverBankedSW, ox, oy)
      end
      if v == 55 then
        grx.draw(riverES, ox, oy)
      end
      if v == 56 then
        grx.draw(riverEW, ox, oy)
      end
      if v == 57 then
        grx.draw(riverNE, ox, oy)
      end
      if v == 58 then
        grx.draw(riverNS, ox, oy)
      end
      if v == 59 then
        grx.draw(riverNW, ox, oy)
      end
      if v == 60 then
        grx.draw(riverSW, ox, oy)
      end
      
      if v == 61 then
        grx.draw(road, ox, oy)
      end
      if v == 62 then
        grx.draw(roadES, ox, oy)
      end
      if v == 63 then
        grx.draw(roadEW, ox, oy)
      end
      if v == 64 then
        grx.draw(roadHill2E, ox, oy)
      end
      if v == 65 then
        grx.draw(roadHill2N, ox, oy)
      end
      if v == 66 then
        grx.draw(roadHill2S, ox, oy-12)
      end
      if v == 67 then
        grx.draw(roadHill2W, ox, oy-12)
      end
      if v == 68 then
        grx.draw(roadHillE, ox, oy)
      end
      if v == 69 then
        grx.draw(roadHillN, ox, oy)
      end
      if v == 70 then
        grx.draw(roadHillS, ox, oy-15)
      end
      if v == 71 then
        grx.draw(roadHillW, ox, oy-15)
      end
      if v == 72 then
        grx.draw(roadNE, ox, oy)
      end
      if v == 73 then
        grx.draw(roadNS, ox, oy)
      end
      if v == 74 then
        grx.draw(roadNW, ox, oy)
      end
      if v == 75 then
        grx.draw(roadSW, ox, oy)
      end
      if v == 76 then
        grx.draw(undergroundDirt, ox, oy)
      end
      if v == 77 then
        grx.draw(water, ox, oy+7)
      end
      if v == 78 then
        grx.draw(waterCornerES, ox, oy+7)
      end
      if v == 79 then
        grx.draw(waterCornerNE, ox, oy)
      end
      if v == 80 then
        grx.draw(waterCornerNW, ox, oy+7)
      end
      
      if v == 81 then
        grx.draw(waterCornerSW, ox, oy+7)
      end
      if v == 82 then
        grx.draw(waterE, ox, oy)
      end
      if v == 83 then
        grx.draw(waterES, ox, oy)
      end
      if v == 84 then
        grx.draw(waterN, ox, oy)
      end
      if v == 85 then
        grx.draw(waterNE, ox, oy)
      end
      if v == 86 then
        grx.draw(waterNW, ox, oy)
      end
      if v == 87 then
        grx.draw(waterS, ox, oy+7)
      end
      if v == 88 then
        grx.draw(waterSW, ox, oy+7)
      end
      if v == 89 then
        grx.draw(waterW, ox, oy+7)
      end
    end
  end  
end

function grid:info()
  if love.keyboard.isDown("tab") then
  --for each y
  for ky, _ in ipairs(self) do
    --for each x
    for kx, v in ipairs(self[ky]) do
      
      --isometric origin
      local ox = (kx - ky) * tilew/2
      local oy = (kx + ky) * tileh/2
      
      --selector offset
      ox, oy = offset(ox, oy)
      
      --set world coordinates
      local x1, x2, x3, x4 = ox + tilew/2, ox + tilew, ox + tilew/2, ox
      local y1, y2, y3, y4 = oy, oy + tileh/2, oy + tileh, oy + tileh/2
      
      grx.setLineWidth(1)
      grx.setColor(0xff,0xff,0xff)
      
      --frame tiles
      grx.quad("line",x1,y1,x2,y2,x3,y3,x4,y4)
      
      --display terrain type and number
      grx.print(v .. "\n" .. kx .. "," .. ky, ox+tilew/3, oy+tileh/3)
    end
  end
  end
end


--camera offset
function offset(ox, oy)
  return
    ox + xwidth/2 - selector.draw_x - tilew/2,
    oy + xheight/2 - selector.draw_y - tileh/2  
end

