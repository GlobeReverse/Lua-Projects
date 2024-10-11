--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Workspace = game:GetService("Workspace");

--// Variables
local doors = {};

local converstion = {
    ["EnterVehicle"] = ("q" .. "" .. ("m1dpq1mw"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("cv0z8hd4"):sub(5, 6):reverse():reverse():reverse() .. "" .. "fy"),
    ["ArrestPlayer"] = ("s" .. "" .. ("hfenz"):sub(4, 4):reverse() .. "" .. "" .. ("lp3idhr5"):sub(2, 4):reverse() .. "" .. "" .. ("frpwfhd"):sub(3, 3):reverse() .. "" .. "" .. ("h3k"):sub(2, 2):reverse() .. "" .. "b"),
    ["FallDamage"] = ("g" .. ("ptakw9b4"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("t5hkoox"):sub(4, 6):reverse() .. "" .. "p"),
    ["OpenDoor1"] = ("t" .. ("cwesvdm"):sub(3, 4):reverse():reverse():reverse():reverse():reverse() .. "" .. "" .. ("iwqikhzhj"):sub(5, 7):reverse():reverse():reverse():reverse():reverse() .. "" .. "" .. ("ldrdyvui"):sub(4, 4):reverse():reverse():reverse():reverse():reverse() .. "" .. "e"),
    ["OpenDoor2"] = ("l" .. ("h0eiufvnz"):sub(5, 5):reverse():reverse():reverse() .. "" .. "" .. ("ajjjppo"):sub(5, 5):reverse():reverse():reverse() .. "" .. "" .. ("hubfdo"):sub(3, 5):reverse():reverse():reverse():reverse():reverse() .. "" .. "1a")
}

local gunModule = require(ReplicatedStorage.Game.Item.Gun);

--// Handling
local newHook; newHook = hookfunction(gunModule.new, function(v64, v65, v66)
    local self = newHook(v64, v65, v66);
    
    --# Instant Reload
    rawset(self.Config, "ReloadTime", -1);

    --# Force Automatic
    rawset(self.Config, "FireAuto", true);

    --# Crazy FireRate
    rawset(self.Config, "FireFreq", 9e9);
    
    --# Remove Camera Shake (Recoil)
    rawset(self.Config, "CamShakeMagnitude", 0);

    return self;
end)
