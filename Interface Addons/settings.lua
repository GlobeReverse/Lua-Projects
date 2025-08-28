--# Variables
local arguments = {...};
local self = arguments[1] and arguments[1].self;
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
local settings = getTab(self, "Settings") do 
    local configuration = settings:AddSection("Interface") do 
        local menuSettings = configuration:AddLeftGroupbox() do 
            menuSettings:AddSlider({ Title = "Toggle Duration", prefix = "ms", Min = 1, Max = 2000, Default = 500, Callback = function(value) self.toggleTweenDuration = (value / 1000) end });
            menuSettings:AddBind({ Title = "Toggle Menu", Flag = "ToggleMenu", Default = Enum.KeyCode.Insert, Callback = function() self:toggleInterface() end});
            menuSettings:AddToggle({ Title = "Watermark", Flag = "WatermarkEnabled", Callback = function(value) self:setWatermarkProperty("Visible", value) end });
            menuSettings:AddBind({ Title = "Unload", Flag = "UnloadMenu", Default = Enum.KeyCode.Unknown, Callback = function() self:Unload() end});
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
                    Date.Text = string.format("%s executions", ML_TotalExecutions);
                elseif (value == "Game Name") then 
                    Date.Text = gameName
                else 
                    Date.Text = string.format("[%s/%s/%s]", formattedDay, formattedMonth, formattedYear);
                end
            end})
        end
    end
end
