require "input"
require "mouse"
require "tiles"
require "grid"
require "selector"
require "tablesave"
require "info"
require "progress"
require "zlayer"
require "sound"
require "console"
--testing trees
require "treegrid"


grx = love.graphics
key = love.keyboard
mos = love.mouse
tim = love.timer
fil = love.filesystem
snd = love.audio

--get window sizes
xheight = grx.getHeight()
xwidth = grx.getWidth()

--set background color
grx.setBackgroundColor(0x80,0x80,0x80)

--states: 0 = menu, 1 = running, 2 = paused
gamestate = 0

--world properties
gridSize = 5
gridZ = 5

function fullscreen()
  
  grx.setMode(xwidth, xheight)
  grx.toggleFullscreen()
  
end

function sys_check()
  
  assert(grx.isSupported("canvas"), "Your graphics card does not support canvases, sorry")
  
end

function load_assets()
  
  landtiles_Load(grx)
  progressbar:draw(grx, 20, "loading assets")
  nametoarray()
  progressbar:draw(grx, 60, "processing tiles")
  grid:Load()
  --testing trees
  progressbar:draw(grx, 70, "planting trees")
  treegrid:Load()
  
  progressbar:draw(grx, 80, "loading grid")
  music:Load()
  progressbar:draw(grx, 100, "loading music")
  
  --load canvas... currently not being used
  canvas = grx.newCanvas(xwidth, xheight)
  
  --start playing music, put this into gamestate function later
  --and check for pause/running mode, or set up some way
  --to start playing music
  music:play(true)
  
  --activate console
  Console:Init()
end
