--tree generator
treegrid = {}
treeson = false

function treegrid:Load()
  
  print("--setup the tree grid")

  
  for x = 1,gridSize do
    treegrid[x] = {}
    for y = 1,gridSize do
      treegrid[x][y] = 1
    end
  end
  
  --set width and height of table
  treegrid.w = #treegrid[1]
  treegrid.h = #treegrid

  print("--treegrid initiated")
end

function treegrid:Resize(newSize)
  print("--Resizing treegrid")
  gridSize = newSize
  for x = 1,gridSize do
    treegrid[x] = {}
    for y = 1,gridSize do
      treegrid[x][y] = 1
    end
  end
  print("--Treegrid resized")
end

function treegrid:Generate()
  print("--Generating treegrid")
  for x = 1,gridSize do
    for y = 1,gridSize do
      treegrid[x][y] = math.random(0,8)
    end
  end
  print("--Treegrid generated")
end

function treegrid:draw()
  --for each y
  for ky, _ in ipairs(self) do
    --for each x
    for kx, c in ipairs(self[ky]) do
      --set isometric origin
      local ox = (kx - ky) * tilew/2
      local oy = (kx + ky) * tileh/2
      
      --selector offset
      ox, oy = offset(ox+30, oy+5)
      
      --set world coordinates
      local x1, x2, x3, x4 = ox + tilew/2, ox + tilew, ox + tilew/2, ox
      local y1, y2, y3, y4 = oy, oy + tileh/2, oy + tileh, oy + tileh/2
      
      local color
      
      --rl = randomlocation
      --local rl = math.random(0,8)
      
      --draw trees if grid has allowable terrain
      if (treeson and ((grid[ky][kx] == 1) or (grid[ky][kx] == 21) or (grid[ky][kx] == 22) or (grid[ky][kx] == 31) or (grid[ky][kx] == 32) or (grid[ky][kx] == 33) or (grid[ky][kx] == 34) or (grid[ky][kx] == 35) or (grid[ky][kx] == 36) or (grid[ky][kx] == 37) or (grid[ky][kx] == 38) or (grid[ky][kx] == 39) or (grid[ky][kx] == 40))) then
        if c == 0 then
          --don't draw any trees
        end
        if c == 1 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 2 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 3 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 4 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 5 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 6 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 7 then
          grx.draw(trees[c], ox, oy)
        end
        if c == 8 then
          grx.draw(trees[c], ox, oy)
        end
      end
    end
  end  
end