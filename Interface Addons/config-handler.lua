--# Variables
local arguments = {...};
local self = arguments[1] and arguments[1].self;

--# Helper Functions
local function getTab(tabName)
	for _, tab in pairs(self.tabs) do
		if (tab.name == tabName) then
			return tab;
		end
	end

	return self:AddTab(tabName);
end

local function setFolders()
    if (isfolder(self.scriptName) ~= true) then 
        makefolder(self.scriptName);
    end

    if (isfolder(string.format("%s/%s", self.scriptName, self.gameName)) ~= true) then 
        makefolder(string.format("%s/%s", self.scriptName, self.gameName));
    end

    if (isfolder(string.format("%s/%s/Configs", self.scriptName, self.gameName)) ~= true) then 
        makefolder(string.format("%s/%s/Configs", self.scriptName, self.gameName));
    end
end

local function getConfigs()
    local configs = {};

    setFolders();

    local configDirectory = string.format("%s/%s/Configs", self.scriptName, self.gameName);

    for i, v in pairs(listfiles(configDirectory)) do
        if (not string.find(v, ".json")) then continue end;

        configs[i] = string.sub(v, (string.len(configDirectory) + 2));
    end    

    return configs;
end

local function saveConfig(name)
    setFolders();

    name = tostring(name);

    if (name and (name:len() >= 1)) then 
        local data = {};

        for index, value in pairs(getgenv().Toggles) do 
            table.insert(data, { 
                Index = value.Idx,
                Value = value.Value,
                Type = value.Type
            })
        end

        for index, value in pairs(getgenv().Options) do 
            if (value.Type == "ColorPicker") then 
                table.insert(data, { 
                    Index = value.Idx,
                    Value = value.Hex,
                    Type = value.Type
                });
            else 
                table.insert(data, { 
                    Index = value.Idx,
                    Value = value.Value,
                    Type = value.Type
                });
            end
        end

        data = HttpService:JSONEncode(data);

        writefile(string.format("%s/%s/Configs/%s.json", self.scriptName, self.gameName, string.gsub(name, ".json", "")), data);
    end
end

local function loadConfigF(name) 
    setFolders();

    name = tostring(name);

    if (name and (name:len() >= 1)) then 
        local configName = string.format("%s/%s/Configs/%s.json", self.scriptName, self.gameName, name:gsub(".json", ""));

        if (isfile(configName) ~= true) then 
            return self:notify("Config dosen't exist", 4);
        end

        local data = readfile(configName);

        data = HttpService:JSONDecode(data);

        for _, value in pairs(data) do 
            local success, error = pcall(function()
                if (value.Type == "Toggle") then 
                    if getgenv().Toggles[value.Index] then 
                        getgenv().Toggles[value.Index].functions.setValue(value.Value);
                    end
                else 
                    local option = getgenv().Options[value.Index];

                    if (not option) then return end;
                    if (not value.Value) then return end;

                    if (option.Type == "ColorPicker") then 
                        option.functions.setValue(Color3.fromHex(value.Value));
                    elseif (option.Type == "Slider") then 
                        option.functions.setValue(tonumber(value.Value));
                    else 
                        option.functions.setValue(value.Value);
                    end
                end
            end)

            if (not success) then 
                warn(string.format("Error Loading Config: %s (%s)", tostring(error), value.Index));
            end
        end
    end
end

local function setAutoLoad(name)
    setFolders();

    if (not name) then 
        self:notify("Please select a config to autoload", 4);

        return;
    end

    name = tostring(name);

    writefile(string.format("%s/%s/Configs/autoload.txt", self.scriptName, self.gameName), name);

    self:notify(string.format("Set autoload to %s", name), 4);
end

local function deleteConfig(value)
    setFolders();

    if (typeof(value) == "string") then 
        if (isfile(string.format("%s/%s/Configs/%s", self.scriptName, self.gameName, value)) ~= true) then
            self:notify(string.format("Config dosen't exist (%s)", value), 4);

            return warn("File Dosen't Exist")
        end

        delfile(string.format("%s/%s/Configs/%s", self.scriptName, self.gameName, value));

        self:notify(string.format("Deleted config %s", value), 4);
    end
end

--# Section
setFolders();

local settings = getTab("Settings") do
    local configSection = settings:AddSection("Configs") do 
        local createConfig = configSection:AddLeftGroupbox() do 
            local configName = createConfig:AddInput({ Title = "Config Name", Flag = "Config_Name" });
            createConfig:AddButton({ Title = "Create Config", Callback = function() saveConfig(configName.getValue()) end });
        end

        local loadConfig = configSection:AddRightGroupbox() do 
            local selectConfig = loadConfig:AddDropdown({ Title = "Select Config", Values = getConfigs() });
            loadConfig:AddButton({ Title = "Load Config", Callback = function() loadConfigF(selectConfig.getValue()) end });
            loadConfig:AddButton({ Title = "Auto Load Config", Callback = function() setAutoLoad(selectConfig.getValue()) end });
            loadConfig:AddButton({ Title = "Overwrite Config", Callback = function() saveConfig(selectConfig.getValue()) end });
            loadConfig:AddButton({ Title = "Delete Config", Callback = function() deleteConfig(selectConfig.getValue()) end });
            loadConfig:AddButton({ Title = "Refresh List", Callback = function() selectConfig.setOptions(getConfigs()) end });
        end
    end
end
