--// Services
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage");

--// Variables
local gunModule: any = require(ReplicatedStorage.Game.Item.Gun);

--// Handling
local newHook: (any, any, any) -> any; newHook = hookfunction(gunModule.new, function(v64, v65, v66): any
    local self: any = newHook(v64, v65, v66);
    
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
