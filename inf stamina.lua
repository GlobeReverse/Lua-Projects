for i,v in pairs(getgc()) do 
    if typeof(v) == "function" then 
        local debuginfo = debug.getinfo(v)

        if debuginfo.name == "S_Get" then 
            hookfunction(v, function(...)
                return 100, 100
            end)
        end
    end
end
