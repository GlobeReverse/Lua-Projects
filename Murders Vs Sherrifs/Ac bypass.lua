local bacHook; bacHook = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(self, ...)
    local args = {...};
    local caller = getcallingscript();

    if (tostring(caller) == "BAC_") then 
        return;
    end

    return bacHook(self, table.unpack(args));
end))

hookfunction(game:GetService("AdService").Advertisement.FireServer, newcclosure(function(self, call)
    return;
end))
