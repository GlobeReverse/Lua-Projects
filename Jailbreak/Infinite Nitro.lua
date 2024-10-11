for _, value: any in pairs(getgc(true)) do 
    if (typeof(value) == "table") then 
        local yi4308my: any = rawget(value, "yi4308my");

        if yi4308my then 
            while task.wait() do 
                yi4308my(5400, 5400);
            end
        end
    end
end
