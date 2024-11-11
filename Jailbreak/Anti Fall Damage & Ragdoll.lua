--// Services
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage");

--// Variables
local fallModule: any = require(ReplicatedStorage.Game.Falling);

local converstion = loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Lua-Projects/refs/heads/main/Jailbreak/Converstions.lua"))();

--// Garbage Collector
for _, value: any in pairs(getgc(true)) do 
    if (typeof(value) == "table") then 
        local fireServer: any = rawget(value, "FireServer");

        if fireServer then 
            fireTable = value;
        end
    end
end

--// Handling
hookfunction(fallModule.StartRagdolling, function(): any 
    return;
end)

local FireServer = fireTable.FireServer;

function fireTable.FireServer(self: any, key, ...): ...any
    if (key == converstion.FallDamage) then 
        return;
    end

    return FireServer(self, key, ...);
end
