--[[
  [-] - First time really checking out jailbreak, looking to make more misc things like this soon maybe a auto farm
]]

--// Services
local Players: Players = game:GetService("Players");

--// Variables
local client: Player = Players.LocalPlayer;

local converstion: { [string]: string } = {
    ["EnterVehicle"] = ("q" .. "" .. ("m1dpq1mw"):sub(2, 4):reverse():reverse():reverse() .. "" .. "" .. ("cv0z8hd4"):sub(5, 6):reverse():reverse():reverse() .. "" .. "fy"),
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

--// Functions
local function enterVehicle(car: Instance, seat: Instance): ()
    fireTable:FireServer(converstion.EnterVehicle, car, seat);
end

local function closestCar(max: number): any
    local vehicle;
    local maxDistance = max; 

    for _, instance in pairs(workspace.Vehicles:GetChildren()) do 
        local distance = client:DistanceFromCharacter(instance.PrimaryPart.Position);

        if (distance < maxDistance) then 
            vehicle = instance;
            maxDistance = distance;
        end
    end

    return vehicle;
end

--// Handling
local car = closestCar(20);

if (not fireTable) then return warn("Error Finding Function") end;
if (not car) then return warn("No Car Nearby") end;

enterVehicle(car, car:FindFirstChild("Seat"));
