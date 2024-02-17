writefile('sound.mp3', game:HttpGet('https://raw.githubusercontent.com/GlobeReverse/Lua-Projects/main/welcome-mp3.ogg'))

local audio = Instance.new("Sound", workspace)
audio.SoundId = getcustomasset('sound.mp3')
audio:play()

delfile('sound.mp3')
