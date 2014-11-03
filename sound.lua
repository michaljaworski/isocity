--load sound
music = {}
autoplay = false

function music:Load(loop)
  print("--loading music")
  
  music1 = snd.newSource("music/1.mp3")

  music1:setVolume(0.9)
  music1:setPitch(1)
  music1:setLooping(loop)
end

function music:play()
  if autoplay then
    music1:play()
  end
end
