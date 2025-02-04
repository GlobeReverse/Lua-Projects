--# Shitty method not sure if its stable to use however it will stay like this since I don't want to leak a good method for aftermath.
local connection = require(game:GetService("ReplicatedFirst").EmberClientLibrary.EmberClient.Network.Connection);

local connectionHook; connectionHook = hookfunction(connection.Request, function(tab)
    local traceback = debug.traceback();

    if (not string.find(traceback, "Interact")) then 
        return;
    end

    return connectionHook(tab);
end)
