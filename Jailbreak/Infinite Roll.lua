for _, value: any in pairs(getgc(true)) do 
    if (typeof(value) == "table") then 
        local useEvery: number = rawget(value, "useEvery");

        if useEvery and (useEvery == 5) then 
            rawset(value, "useEvery", false);
        end
    end
end
