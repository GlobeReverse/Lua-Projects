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

--// Garbage Collector
for _, value in pairs(getgc(true)) do 
    if (typeof(value) == "table") then 
        local fireServer = rawget(value, "FireServer");

        if fireServer then 
            fireTable = value;
        end

        for _, val in pairs(value) do 
            if (typeof(val) == "table") then 
                local OpenFun = rawget(val, "OpenFun");
                local Model = rawget(val, "Model");
                local AwaitingDoorOpen = rawget(val, "AwaitingDoorOpen");

                if OpenFun and Model and AwaitingDoorOpen then 
                    pluh = value;
                end
            end
        end
    end
end

--// Functions
local function getFromDoor(door)
    for _, value in pairs(pluh) do 
        if (typeof(value) == "table") then 
            local model = rawget(value, "Model");

            if (model == door) then 
                return value;
            end
        end
    end

    return;
end

--// Handling
for _, instance in pairs(Workspace:GetDescendants()) do 
    if (instance.ClassName == "Model") and string.find(instance.Name, "Door") then 
        local data = getFromDoor(instance);

        if data then 
            doors[instance] = data;
        end
    end
end

for instance, data in pairs(doors) do 
    fireTable:FireServer(converstion.OpenDoor1, "Door", {
        Source = instance:FindFirstChild("Closed"),
        Volume = 5
    })

    fireTable:FireServer(converstion.OpenDoor2, data);
end
