local connection = require(game:GetService("ReplicatedFirst").EmberClientLibrary.EmberClient.Network.Connection);

local connectionHook; connectionHook = hookfunction(connection.Request, function(tab)
    local traceback = debug.traceback();

    if (not string.find(traceback, "Interact")) then 
        return;
    end

    return connectionHook(tab);
end)

local backupHook; backupHook = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(self, ...)
    local args = {...};
    local funcEnviroment = getfenv(2);

    if (funcEnviroment.script.Name == "ClientGame") then 
        local traceback = debug.traceback();

        if (not string.find(traceback, "NotifyServer")) and string.find(traceback, "ReplicatedFirst.Core.ClientGame.Utilities") and (not string.find(traceback, "Utilities.Interaction")) then 
            return;
        end
    end

    return backupHook(self, table.unpack(args));
end))
