--# Variables
local arguments = {...};
local self = arguments[1] and arguments[1].self;
local callback = arguments[1] and arguments[1].data;

local date = os.date("*t", os.time());

local formattedDay = tostring(date.day):len() == 1 and "0" .. date.day or date.day;
local formattedMonth = tostring(date.month):len() == 1 and "0" .. date.month or date.month;
local formattedYear = tostring(date.year):sub(3, 4);

--# Helper Functions
local function getTab(tabName)
	for _, tab in pairs(self.tabs) do
		if (tab.name == tabName) then
			return tab;
		end
	end

	return self:AddTab(tabName);
end

--# Section
local settings = getTab("Settings") do 
    local configuration = settings:AddSection("Interface") do 
        local menuSettings = configuration:AddLeftGroupbox() do 
            menuSettings:AddSlider({ Title = "Toggle Duration", Suffix = "ms", Min = 1, Max = 2000, Default = 500, Callback = function(value) self.toggleTweenDuration = (value / 1000) end });
            menuSettings:AddBind({ Title = "Toggle Menu", Flag = "ToggleMenu", Default = Enum.KeyCode.Insert, Callback = function() self:toggleInterface() end});

            menuSettings:AddDivider();

            menuSettings:AddToggle({ Title = "Watermark", Flag = "WatermarkEnabled", Callback = function(value) self:setWatermarkProperty("Visible", value) end });
            menuSettings:AddMultidropdown({ Title = "Watermark Contents", Flag = "WatermarkContents", Values = { "Script Version", "Game Name", "Fps", "Ping", "Discord Id" }, Default = { "Script Version", "Game Name", "Fps", "Ping" } });

            menuSettings:AddDivider();

            menuSettings:AddBind({ Title = "Unload", Flag = "UnloadMenu", Default = Enum.KeyCode.Unknown, Callback = function() self:Unload(callback) end});

            task.spawn(function()
                while task.wait(1) do 
                    if LibraryToggleValue("WatermarkEnabled") then
                        local selectedContents = {};

                        if LibraryOptionValue("WatermarkContents")["Script Version"] then
                            table.insert(selectedContents, "V6.0 Public"); 
                        end

                        if LibraryOptionValue("WatermarkContents")["Game Name"] then
                            table.insert(selectedContents, self.gameName); 
                        end

                        if LibraryOptionValue("WatermarkContents")["Fps"] then
                            table.insert(selectedContents, string.format("%s fps", tostring(math.round(1 / RunService.Heartbeat:wait())))); 
                        end

                        if LibraryOptionValue("WatermarkContents")["Ping"] then
                            table.insert(selectedContents, string.format("%sms", tostring(math.round(Players.LocalPlayer:GetNetworkPing() * 1000))));
                        end

                        if LibraryOptionValue("WatermarkContents")["Discord Id"] then
                            table.insert(selectedContents, ML_DiscordID);
                        end

                        self:setWatermarkProperty("Text", string.format("%s | %s", self.scriptName, table.concat(selectedContents, " | ")));
                    end
                end
            end);
        end

        local MoonlightSettings = configuration:AddRightGroupbox() do 
            local availableHandText = { "Current Date", "Game Name" };

            if ML_TotalExecutions then 
                table.insert(availableHandText, "Execution Count");
            end

            --MoonlightSettings:AddToggle({ Title = "Welcome Sound", Flag = "Welcome_Sound", Default = true });
            MoonlightSettings:AddToggle({ Title = "Welcome Notification", Flag = "Welcome_Notification", Default = true });

            MoonlightSettings:AddDropdown({ Title = "Right Hand Text", Flag = "Right_Hand_Text", Values = availableHandText, Default = "Current Date", Callback = function(value)
                if (value == "Execution Count") then 
					self:setRightHandText(string.format("%s executions", ML_TotalExecutions));
                elseif (value == "Game Name") then 
                    self:setRightHandText(self.gameName);
                else 
                    self:setRightHandText(string.format("[%s/%s/%s]", formattedDay, formattedMonth, formattedYear));
                end
            end})
        end
    end
end
