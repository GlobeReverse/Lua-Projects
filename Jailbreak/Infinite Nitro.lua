for _, value: any in pairs(getgc(true)) do 
    if (typeof(value) == "table") then 
        local xf1lrqfq: any = rawget(value, "xf1lrqfq");

        if xf1lrqfq then 
            local original; original = hookfunction(xf1lrqfq, function(Nitro, NitroLastMax)
                return original(5400, 5400);
            end)
        end
    end
end
