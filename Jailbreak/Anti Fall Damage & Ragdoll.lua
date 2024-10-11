--// Services
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage");

--// Variables
local fallModule: any = require(ReplicatedStorage.Game.Falling);

local converstion: { [string]: string } = {
    ["EnterVehicle"] = ("q" .. "" .. ("m1dpq1mw"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("cv0z8hd4"):sub(5, 6):reverse():reverse():reverse() .. "" .. "fy"),
    ["ArrestPlayer"] = ("s" .. "" .. ("hfenz"):sub(4, 4):reverse() .. "" .. "" .. ("lp3idhr5"):sub(2, 4):reverse() .. "" .. "" .. ("frpwfhd"):sub(3, 3):reverse() .. "" .. "" .. ("h3k"):sub(2, 2):reverse() .. "" .. "b"),
    ["FallDamage"] = ("g" .. ("ptakw9b4"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("t5hkoox"):sub(4, 6):reverse() .. "" .. "p")
}

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
