local cloned = getrenv()._G.S_Get;
local original = debug.getupvalue(cloned, 1);

hookfunction(original, function()
    return 100, 100;
end)
