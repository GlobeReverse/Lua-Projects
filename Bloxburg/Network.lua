--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");

--// Variables
local dataService = require(ReplicatedStorage.Modules.DataService);

local getRemote = debug.getupvalue(dataService.FireServer, 5);

--// Functions
local function fireServer(type, args)
  getRemote(type):FireServer(args);
end

local function invokeServer(type, args)
  getRemote(type, true):InvokeServer(args);
end

--// Example
invokeServer("ToWork", { Type = "ToWork", Name = "StylezHairdresser" });

fireServer("EndShift", {});
