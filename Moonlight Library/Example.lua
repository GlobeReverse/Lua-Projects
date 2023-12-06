local Loading = loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Lua/main/Moonlight%20Library/Source.lua"))()
local Library = Loading.Create({ Title = "Moonlight Hub" })

local Window = Library:Window("Window 1") do 
    local Button = Window:Button({ Title = "Button Example", Description = "Wsp This Is A Button" }, function()
        warn("Button Has Been Clicked")
    end)

    task.spawn(function()
        for index = 1, 30 do 
            task.wait(1) 
            Button:SetTitle("Title Set " .. index)
            Button:SetDescription(index * 69)
        end
    end)

    Window:Toggle({ Title = "Toggle Title", Description = "Description To A Toggle", Default = true }, function(state)
        warn("The Toggle Has Been Set To " .. tostring(state))
    end)

    Window:Label("This Is A Label")

    Window:Input({ Title = "Input Gainer", Description = "Put Yo Text Here Boy", Default = "This Is The Default" }, function(value)
        warn("The Value Of The Input Is " .. value)
    end)

    Window:Divider() 
    
    local Slider = Window:Slider({ Title = "Sliderrrrr", Description = "Brrrrrr", Default = 69, Max = 200 }, function(value)
        warn(value .. " Is The Value Of This Slider!")
    end)
end
