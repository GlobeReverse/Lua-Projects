--// Services
local TextChatService: TextChatService = game:GetService("TextChatService");
local TeleportService: TeleportService = game:GetService("TeleportService");
local HttpService: HttpService = game:GetService("HttpService");
local Players: Players = game:GetService("Players");

--// Variables
local client: Player = Players.LocalPlayer;
local textChannel = TextChatService.TextChannels.RBXGeneral;
local vanity: string = "jailbreakitems";

local messages: { string } = {
    `.gg/{vanity} --> join for the lowest priced jailbreak items`,
    `tired of being poor on jailbreak? join --> .gg/{vanity}`,
    `join the cool kid club and get cheap rare items --> .gg/{vanity}`,
    `don't want to spend hours for a car? join for cheap vehicles! --> .gg/{vanity}`,
    `don't hate it until you try it, cheapest exclusive items --> .gg/{vanity}`,
    `just got a volt bike for the cheapest price avaiable! --> .gg/{vanity}`,
    `the highest rep jailbreak seller on the market --> .gg/{vanity}`
};

--// Handling
queue_on_teleport([[
    task.wait(3);
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Lua-Projects/main/Jailbreak%20Auto%20Advertising.lua"))();
]]);

for x = 1, 3 do 
    task.wait(1.25);
    textChannel:SendAsync(messages[math.random(1, #messages)]);
end

task.wait(1);

local serverList: any = game:HttpGet(string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", game.PlaceId))

serverList = HttpService:JSONDecode(serverList).data

TeleportService:TeleportToPlaceInstance(game.PlaceId, serverList[math.random(1, #serverList)].id, client)
