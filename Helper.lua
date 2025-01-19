local httpget = setmetatable({}, {
    __call = function(self, url)
        return loadstring(request(setmetatable({}, {
            __index = function(self, idx)
                if (idx == "Url") then 
                    return string.format("https://hideout.one/api/cdn/%s", url)
                end
            end
        })).Body)
    end
})

getgenv().LibraryToggleValue = function(idx) return Toggles[idx] and Toggles[idx].Value or false end;
getgenv().LibraryOptionValue = function(idx) return Options[idx] and Options[idx].Value or false end;
getgenv().LibraryDropdownValue = function(dropdown, idx) return Options[dropdown].Value[idx] end;

getgenv().disconnectSignal = function(signal)
    local connections = getconnections(signal);

    for _, connection in pairs(connections) do 
        connection:Disconnect();
    end
end

getgenv().fov = httpget("fieldofview")();
getgenv().highlight = httpget("highlight")();
