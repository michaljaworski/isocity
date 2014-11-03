--progress bar
progressbar = {}

function progressbar:draw(grx, percent, message)
  grx.clear()
  grx.setColor(255, 255, 255)
  load1 = grx.rectangle("line", 0, xheight-100, xwidth, 20)
  load2 = grx.rectangle("fill", 0, xheight-100, math.ceil(xwidth*percent/100), 20)
  grx.setColor(50,150,80)
  load3 = grx.print(message, (xwidth/2), xheight - 100)
  
  --this updates the screen drawings, must be used for this
  
  grx.present()
  --add a short delay
  --love.timer.sleep(1)
end
