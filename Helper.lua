if (not LPH_OBFUSCATED) then 
    LPH_OBFUSCATED = false;

    function LPH_ENCNUM(toEncrypt, ...)
        assert(type(toEncrypt) == "number" and #{...} == 0, "LPH_ENCNUM only accepts a single constant double or integer as an argument.");

        return toEncrypt;
    end

    function LPH_ENCSTR(toEncrypt, ...)
        assert(type(toEncrypt) == "string" and #{...} == 0, "LPH_ENCSTR only accepts a single constant string as an argument.");

        return toEncrypt;
    end

    function LPH_ENCFUNC(toEncrypt, encKey, decKey, ...)
        assert(type(toEncrypt) == "function" and type(encKey) == "string" and #{...} == 0, "LPH_ENCFUNC accepts a constant function, constant string, and string variable as arguments.");

        return toEncrypt;
    end

    function LPH_JIT(f, ...)
        assert(type(f) == "function" and #{...} == 0, "LPH_JIT only accepts a single constant function as an argument.");

        return f;
    end

    function LPH_NO_VIRTUALIZE(f, ...)
        assert(type(f) == "function" and #{...} == 0, "LPH_NO_VIRTUALIZE only accepts a single constant function as an argument.");

        return f;
    end

    function LPH_NO_UPVALUES(f, ...)
        assert(type(setfenv) == "function", "LPH_NO_UPVALUES can only be used on Lua versions with getfenv & setfenv");
        assert(type(f) == "function" and #{...} == 0, "LPH_NO_UPVALUES only accepts a single constant function as an argument.");

        return f;
    end

    function LPH_CRASH(...)
        assert(#{...} == 0, "LPH_CRASH does not accept any arguments.");

        while true do end;
    end

    LPH_JIT_MAX = LPH_JIT
end
