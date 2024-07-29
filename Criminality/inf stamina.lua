-- easiest method
for index, value in pairs(getgc()) do 
    if typeof(value) == "function" then 
        local debuginfo = debug.getinfo(value)

        if (debuginfo.name == "S_Get") then 
            hookfunction(value, function(...)
                return 100, 100
            end)
        end
    end
end
