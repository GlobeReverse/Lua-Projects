--[[
   Love FPS 😉😉😉😎😎
]]

--// Variables
local doors: { [Instance]: any } = {};

local converstion: { [string]: string } = {
    ["EnterVehicle"] = ("q" .. "" .. ("m1dpq1mw"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("cv0z8hd4"):sub(5, 6):reverse():reverse():reverse() .. "" .. "fy"),
    ["ArrestPlayer"] = ("s" .. "" .. ("hfenz"):sub(4, 4):reverse() .. "" .. "" .. ("lp3idhr5"):sub(2, 4):reverse() .. "" .. "" .. ("frpwfhd"):sub(3, 3):reverse() .. "" .. "" .. ("h3k"):sub(2, 2):reverse() .. "" .. "b"),
    ["FallDamage"] = ("g" .. ("ptakw9b4"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("t5hkoox"):sub(4, 6):reverse() .. "" .. "p"),
    ["OpenDoor1"] = ("t" .. ("cwesvdm"):sub(3, 4):reverse():reverse():reverse():reverse():reverse() .. "" .. "" .. ("iwqikhzhj"):sub(5, 7):reverse():reverse():reverse():reverse():reverse() .. "" .. "" .. ("ldrdyvui"):sub(4, 4):reverse():reverse():reverse():reverse():reverse() .. "" .. "e"),
    ["OpenDoor2"] = ("l" .. ("h0eiufvnz"):sub(5, 5):reverse():reverse():reverse() .. "" .. "" .. ("ajjjppo"):sub(5, 5):reverse():reverse():reverse() .. "" .. "" .. ("hubfdo"):sub(3, 5):reverse():reverse():reverse():reverse():reverse() .. "" .. "1a")
}

--// Garbage Collector
for _, value in pairs(getgc(true)) do 
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
for instance, data: any in pairs(doors) do 
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
