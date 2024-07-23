--// Services
local TextChatService = game:GetService("TextChatService");
local TeleportService = game:GetService("TeleportService");
local Players = game:GetService("Players");

--// Variables
local client = Players.LocalPlayer;
local textChannel = TextChatService.TextChannels.RBXGeneral;
local vanity = "testing";

local messages = {
    `.gg/{vanity} --> join for the lowest priced jailbreak items`,
    `tired of being poor on jailbreak? join --> .gg/{vanity}`,
    `join the cool kid club and get cheap rare items --> .gg/{vanity}`,
    `don't want to spend hours for a car? join for cheap vehicles! --> .gg/{vanity}`,
    `don't hate it until you try it, cheapest exclusive items --> .gg/{vanity}`,
    `just got a volt bike for the cheapest price avaiable! --> .gg/{vanity}`,
    `the highest rep jailbreak seller on the market --> .gg/{vanity}`
};

--// Handling
for x = 1, 3 do 
    task.wait(1);
    textChannel:SendAsync(messages[math.random(1, #messages)]);
end

queue_on_teleport([[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Lua-Projects/main/Jailbreak%20Auto%20Advertise.lua"))();
]]);

TeleportService:Teleport(game.PlaceId, client);
