--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");

--// Variables
local InventoryItemSystem = require(ReplicatedStorage.Inventory.InventoryItemSystem);

--// Hook
local original; original = hookfunction(InventoryItemSystem.playerHasItem, function(player, item)
    if (item == "Key") then 
        return true;
    end

    return original(player, item);
end)
