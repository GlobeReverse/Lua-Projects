--[[
   Love FPS 😉😉😉😎😎
   ( Looks alot less buggy on everyone elses device )
]]

--// Variables
local doors: { [Instance]: any } = {};

local converstion = loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Lua-Projects/refs/heads/main/Jailbreak/Converstions.lua"))();

--// Garbage Collector
for _, value: any in pairs(getgc(true)) do 
    if (typeof(value) == "table") then 
        local fireServer: any = rawget(value, "FireServer");

        if fireServer then 
            fireTable = value;
        end

        for _, val: any in pairs(value) do 
            if (typeof(val) == "table") then 
                local Model: any = rawget(val, "Model");
                local doorMaid: any = rawget(val, "doorMaid");

                if Model and doorMaid then 
                    doors[Model] = val;
                end
            end
        end
    end
end

--// Handling
for instance: Instance, data: any in pairs(doors) do 
    task.spawn(function()
        while task.wait(0.1) do 
            fireTable:FireServer(converstion.OpenDoor1, "Door", {
                Source = instance:FindFirstChild("Closed"),
                Volume = 0.2
            });
        
            fireTable:FireServer(converstion.OpenDoor2, data);
        end
    end)
end
