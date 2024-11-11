--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");

--// Variables
local client = Players.LocalPlayer;

local dataService = require(ReplicatedStorage.Modules.DataService);

local getRemote = debug.getupvalue(dataService.FireServer, 5);

local ignore = {};

--// Functions
local function fireServer(type, args)
  getRemote(type):FireServer(args);
end

local function closestHairdresserStation()
    local station;
    local maxDistance = 9e9; 

    for _, instance in pairs(Workspace.Environment.Locations.StylezHairStudio.HairdresserWorkstations:GetChildren()) do 
        local primaryPart = instance.PrimaryPart;

        if (primaryPart) then 
            local distance = client:DistanceFromCharacter(primaryPart.Position);

            if (distance < maxDistance) then 
                station = instance;
                maxDistance = distance;
            end
        end
    end

    return station;
end

local function closetCharacter(name)
    local character;
    local maxDistance = 9e9; 

    for _, instance in pairs(Workspace._game.SpawnedCharacters:GetChildren()) do 
        local primaryPart = instance.PrimaryPart;

        if primaryPart and(instance.Name == name) then 
            local distance = client:DistanceFromCharacter(primaryPart.Position);

            if (distance < maxDistance) then 
                character = instance;
                maxDistance = distance;
            end
        end
    end

    return character;
end

--// Handling
while task.wait() do 
    local currentJob = ReplicatedStorage.Stats[client.Name].Job.Value;

    if (currentJob == "StylezHairdresser") then 
        local station = closestHairdresserStation();

        if station then 
            local customer = closetCharacter("StylezHairStudioCustomer");

            if customer then 
                if customer and customer:FindFirstChild("Order") and (not ignore[customer]) then 
                    if (customer.Humanoid.FloorMaterial == Enum.Material.Air) then 
                        ignore[customer] = true;

                        task.wait(0.25)

                        fireServer("JobCompleted", { Type = "JobCompleted", Workstation = station, Order = { customer.Order.Style.Value, customer.Order.Color.Value } });
                    end
                end
            end
        end
    end
end
