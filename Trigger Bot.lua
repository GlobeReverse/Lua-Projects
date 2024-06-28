--// Services
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local Workspace = game:GetService("Workspace");

--// Variables
local client = Players.LocalPlayer;
local camera = Workspace.CurrentCamera;
local mouse = client:GetMouse();

local max_distance = 1000; -- Configure to your liking
local cooldown = tick(); 
local cooldown_wait = 0.1; -- Amount of time before each click

--// Functions
local function isValid(player)
    if (not player) then return false end; 
    if (not player.Character) then return false end;

    if (player.Character:FindFirstChild("Humanoid") == nil) then return false end;
    if (player.Character.Humanoid.Health <= 1) then return false end;

    return true;
end

local function onScreen(position)
    local position, onscreen = camera:WorldToScreenPoint(position);

    return onscreen;
end

local function screenPosition(position)
    local position, onscreen = camera:WorldToScreenPoint(position);

    return position;
end

local function closestPlayerDistance(maxDistance)
    local target = nil;
    local distance = maxDistance or 9e9;

    for _, player in pairs(Players:GetPlayers()) do 
        if (player == client) then continue end;
        if (isValid(player) ~= true) then continue end; 

        local distanceFromClient = (client.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude --client:GetDistanceFromCharacter(player.Character.HumanoidRootPart.Position);

        if (distanceFromClient < distance) then
            if onScreen(player.Character.HumanoidRootPart.Position) then 
                target = player; 
                distance = distanceFromClient;
            end
        end
    end

    return target; 
end

local function onCursor() 
    return mouse.Target and mouse.Target:IsDescendantOf(Workspace.Characters) or false;
end

--// Handling
RunService.RenderStepped:Connect(function()
    if isValid(client) then 
        local closestTarget = closestPlayerDistance(max_distance)

        if closestTarget then 
            if onCursor(closestTarget) then 
                if ((tick() - cooldown) > cooldown_wait) then 
                    cooldown = tick();

                    mouse1click();

                    task.wait();

                    local mousePosition = screenPosition(mouse.Hit.p);

                    mousemoverel(mousePosition.X, mousePosition.Y);
                end
            end
        end
    end
end)
