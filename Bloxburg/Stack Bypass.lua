--# Multiple different methods however fuck you make it yourself
for _ , value in pairs(getgc()) do 
    if (typeof(value) == "function") then 
        local information = debug.getinfo(value);

        if (information.name == "i") then 
            hookfunction(value, function() end);
        end
    end
end
