function love.load()

  --load required files
  require "setup"
  --run sys_check
  sys_check()
  --load assets
  load_assets()
  --setup input
  input_init()

end

function love.update(dt)

  mouse_location(mos)
  mouse_input(mos)
  selector:update(dt)

end

function love.draw()
  grid:draw()
  --testing trees
  treegrid:draw()
  selector:draw()
  grid:info()
  selector:info()
  selector:preview_tile()
  info:draw()
  
end

function love.keypressed(key)
  
  input_keypressed(key)
  
end
