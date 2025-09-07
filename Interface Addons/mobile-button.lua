--// Services
local service = setmetatable({ cloneref, game.GetService }, { __call = function(self, service) return self[1] and self[1](self[2](self[2], service)) or self[2](self[2], service) end });

local UserInputService = service("UserInputService");
local RunService = service("RunService");
local CoreGui = service("CoreGui");

--// Variables
local arguments = {...};
local addSignal = arguments[1] and arguments[1].addSignal;
local self = arguments[1] and arguments[1].self; 

local dragging, dragInput, dragStart, startPos = false;

--// Functions
local function update(input)
    local delta = (input.Position - dragStart);
    
    ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y);
end

--// Checks
assert(typeof(addSignal) == "function", "argument #2 addSignal function expected");
assert(typeof(self) == "table", "argument #3 self table expected");

--// Creating Instances
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint");
local UISizeConstraint = Instance.new("UISizeConstraint");
local ToggleButton = Instance.new("ImageButton");
local UiStroke = Instance.new("UIStroke");
local UICorner = Instance.new("UICorner");

--// Properties
do 
    ToggleButton.Name = "ToggleButton";
    ToggleButton.Parent = CoreGui:FindFirstChild(self.scriptName);
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0);
    ToggleButton.BorderSizePixel = 0;
    ToggleButton.Position = UDim2.new(0.180389687, 0, 0.235489219, 0);
    ToggleButton.Size = UDim2.new(1, 0, 1, 0);
    ToggleButton.Image = "rbxassetid://97322411157149";

    UIAspectRatioConstraint.Parent = ToggleButton;
    UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize;

    UISizeConstraint.Parent = ToggleButton;
    UISizeConstraint.MaxSize = Vector2.new(60, 60);
    UISizeConstraint.MinSize = Vector2.new(50, 50);

    UiStroke.Parent = ToggleButton;
    UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
    UiStroke.Color = Color3.fromRGB(95, 75, 113);
    UiStroke.Thickness = 2;

    UICorner.CornerRadius = UDim.new(0, 2);
    UICorner.Parent = ToggleButton;
end

--// Signals
do 
    addSignal(ToggleButton.MouseButton1Click, function()
        self:toggleInterface();
    end);

   --

    addSignal(ToggleButton.InputBegan, function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true;
            dragStart = input.Position;
            startPos = ToggleButton.Position;

            addSignal(input.Changed, function()
                if (input.UserInputState == Enum.UserInputState.End) then
                    dragging = false;
                end
            end)
        end
    end);

    addSignal(ToggleButton.InputChanged, function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input;
        end
    end);

    addSignal(UserInputService.InputChanged, function(input)
        if (input == dragInput) and dragging then
            update(input);
        end
    end);
end
