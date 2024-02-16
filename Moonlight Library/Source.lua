local function GetLibrary() 
	--# KNOWN ISSUES (Will Be Fixed ASAP) (This Was All Made In 6 Hours Leave Me Alone, I Still Have To Work On It Alot)
	--[[
	     1) - Keybind text might expand out of frame 
	     2) - Alot Of Features Coming As Only In Beta (Colorpickers, Dropdowns, Built In Settings Window, Anything Else I Can Think Of)
	     3) - Cannot Set Slider Minimum Value
	]]
	
	--# Services
	local service = setmetatable({}, {
		__call = function(self, index)
			return game.GetService(game, index)
		end
	})

	local Players = service "Players"
	local UserInputService = service "UserInputService"
	local RunService = service "RunService"
	local CoreGui = service "CoreGui"
	local TweenService = service "TweenService"
	
	--# Variables
	local library = { Options = {}, Toggles = {} } 
	library.__index = library
	
	local librarydesign = {
		BackgroundColor = Color3.fromRGB(14, 12, 15),
		OutlineColor = Color3.fromRGB(29, 24, 31),
		TitleColor = Color3.fromRGB(147, 140, 150),
		DescriptionColor = Color3.fromRGB(62, 61, 63),

		Font = Enum.Font.Montserrat
	}
	
	local client = Players.LocalPlayer
	local mouse = client:GetMouse()
	
	local Signals = {}
	local CurrentWindow = nil
	
	--# Handler
	local function ChangeWindow(window)
		if CurrentWindow == window then return end 

		if CurrentWindow then 
			if library.Library.Frame.Components.Windows:FindFirstChild(CurrentWindow) then
				library.Library.Frame.Components.Windows[CurrentWindow].ScrollingWindow.Visible = false
				library.Library.Frame.Components.Windows[CurrentWindow].ScrollingWindow.ZIndex = 1
			end

			if library.Library.Frame.Components.Sidebar.Tabs:FindFirstChild(CurrentWindow) then
				library.Library.Frame.Components.Sidebar.Tabs[CurrentWindow]:FindFirstChild("Text").TextColor3 = Color3.fromRGB(62, 61, 63)
			end 
		end 

		if library.Library.Frame.Components.Windows:FindFirstChild(window) then
			library.Library.Frame.Components.Windows[window].ScrollingWindow.Visible = true
			library.Library.Frame.Components.Windows[window].ScrollingWindow.ZIndex = 2
		end

		if library.Library.Frame.Components.Sidebar.Tabs:FindFirstChild(window) then
			library.Library.Frame.Components.Sidebar.Tabs[window]:FindFirstChild("Text").TextColor3 = Color3.fromRGB(147, 140, 150)
		end

		CurrentWindow = window
	end
	
	
	function library.Create(configuration) 
		--# Variables
		local Title = configuration and configuration.Title or "Moonlight Hub"
		local handler = setmetatable({}, library)
		
		--# Handlers
		do --# Create Ui Main Objects
			--# Create Instances
			local Library = Instance.new("ScreenGui")
			handler.Library = Library
			library.Library = Library

			local Frame = Instance.new("Frame")
			local Scale = Instance.new("UIScale")
			local Constraint = Instance.new("UISizeConstraint")
			local Components = Instance.new("Folder")
			local Sidebar = Instance.new("Frame")
			local Constraint_2 = Instance.new("UISizeConstraint")
			local Tabs = Instance.new("Frame")
			local Layout = Instance.new("UIListLayout")
			local Padding = Instance.new("UIPadding")
			local Outline = Instance.new("Frame")
			local Logo = Instance.new("Folder")
			local Outline_2 = Instance.new("Frame")
			local Header = Instance.new("TextLabel")
			local Hitbox = Instance.new("Frame")
			local Windows = Instance.new("Folder")

			--# Configure Instances
			Library.Name = "Library"
			Library.Parent = RunService:IsStudio() and client:WaitForChild("PlayerGui") or CoreGui
			Library.Enabled = true
			Library.IgnoreGuiInset = false 
			Library.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			Frame.Parent = Library
			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.BackgroundColor3 = librarydesign.BackgroundColor
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.596798241, -130, 0.472668797, 16)
			Frame.Size = UDim2.new(1, 0, 1, 0)

			Scale.Name = "Scale"
			Scale.Parent = Frame

			Constraint.Name = "Constraint"
			Constraint.Parent = Frame
			Constraint.MaxSize = Vector2.new(660, 420)

			Components.Name = "Components"
			Components.Parent =  Frame

			Sidebar.Name = "Sidebar"
			Sidebar.Parent = Components
			Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sidebar.BackgroundTransparency = 1.000
			Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Sidebar.BorderSizePixel = 0
			Sidebar.Position = UDim2.new(0, 0, -7.26609031e-08, 0)
			Sidebar.Size = UDim2.new(0, 317, 0, 420)

			Constraint_2.Name = "Constraint"
			Constraint_2.Parent = Sidebar
			Constraint_2.MaxSize = Vector2.new(150, 8.99999949e+09)

			Tabs.Name = "Tabs"
			Tabs.Parent = Sidebar
			Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Tabs.BackgroundTransparency = 1.000
			Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Tabs.BorderSizePixel = 0
			Tabs.Position = UDim2.new(0, 0, 0.138095245, 0)
			Tabs.Size = UDim2.new(0, 150, 0, 362)

			Layout.Name = "Layout"
			Layout.Parent = Tabs
			Layout.SortOrder = Enum.SortOrder.LayoutOrder
			Layout.Padding = UDim.new(0, 6)

			Padding.Name = "Padding"
			Padding.Parent = Tabs
			Padding.PaddingTop = UDim.new(0, 10)

			Outline.Name = "Outline"
			Outline.Parent = Sidebar
			Outline.BackgroundColor3 = Color3.fromRGB(29, 24, 31)
			Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Outline.BorderSizePixel = 0
			Outline.Position = UDim2.new(0.999999821, 0, 0, 0)
			Outline.Size = UDim2.new(0, 1, 0, 420)

			Logo.Name = "Logo"
			Logo.Parent = Sidebar

			Outline_2.Name = "Outline"
			Outline_2.Parent = Logo
			Outline_2.BackgroundColor3 = Color3.fromRGB(29, 24, 31)
			Outline_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Outline_2.BorderSizePixel = 0
			Outline_2.Position = UDim2.new(0.00333353668, 0, 0.135714293, 0)
			Outline_2.Size = UDim2.new(0, 150, 0, 1)

			Header.Name = "Header"
			Header.Parent = Logo
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Header.BackgroundTransparency = 1.000
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Header.BorderSizePixel = 0
			Header.Position = UDim2.new(0, 0, 0, 25)
			Header.Size = UDim2.new(1.33999956, -50, 0, 14)
			Header.Font = Enum.Font.Montserrat
			Header.Text = Title
			Header.TextColor3 = Color3.fromRGB(217, 213, 219)
			Header.TextSize = 16

			Hitbox.Name = "Hitbox"
			Hitbox.Parent = Logo
			Hitbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hitbox.BackgroundTransparency = 1.000
			Hitbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Hitbox.BorderSizePixel = 0
			Hitbox.Position = UDim2.new(-6.10351549e-07, 0, 0, 0)
			Hitbox.Size = UDim2.new(0, 150, 0, 58)

			Windows.Name = "Windows"
			Windows.Parent = Components

			--# Dragging
			local offset = nil 

			Hitbox.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					offset = Frame.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
				end
			end)
			
			Hitbox.InputEnded:Connect(function()
				offset = nil 
			end)
			
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then 
					if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and offset then
						local mousePos = input.Position 
						Frame.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y) + offset
					end
				end
			end)
		end

		return handler
	end

	function library:Window(name, icon) 
		local functions = {} 

		local WindowDirectory = self.Library
		local WindowName = name or "Window"
		local WindowIcon = icon or "rbxassetid://10734909375"

		--# Checks
		if WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows"):FindFirstChild(WindowName) then 
			return "Window With Name Already Created"
		end

		do --# Create Window Instances
			--# Create Instances
			local Window = Instance.new("Folder")
			local ScrollingWindow = Instance.new("ScrollingFrame")
			local HandlerWindow = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")

			--# Configure Instances
			Window.Name = WindowName
			Window.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")

			ScrollingWindow.Name = "ScrollingWindow"
			ScrollingWindow.Parent = Window
			ScrollingWindow.Active = true
			ScrollingWindow.Visible = false
			ScrollingWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingWindow.BackgroundTransparency = 1.000
			ScrollingWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingWindow.BorderSizePixel = 0
			ScrollingWindow.Position = UDim2.new(0.229, 0, 0.017, 0)
			ScrollingWindow.Size = UDim2.new(0, 509, 0, 411)
			ScrollingWindow.CanvasSize = UDim2.new(0, 0, 0, 0)--UDim2.new(0, 0, 1.1, 0)
			ScrollingWindow.ScrollBarThickness = 0
			ScrollingWindow.AutomaticCanvasSize = Enum.AutomaticSize.Y

			HandlerWindow.Name = "HandlerWindow"
			HandlerWindow.Parent = ScrollingWindow
			HandlerWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HandlerWindow.BackgroundTransparency = 1.000
			HandlerWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
			HandlerWindow.BorderSizePixel = 0
			HandlerWindow.Position = UDim2.new(0.0451866388, 0, 0.0596658699, 0)
			HandlerWindow.Size = UDim2.new(1.29999995, -200, 1.05999994, -50)

			UIListLayout.Parent = HandlerWindow
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0.0299999993, 0)
			
			--# There Is Deffinetly A Better Method To This But IDGAF
			HandlerWindow.ChildAdded:Connect(function()
				if ScrollingWindow.AbsoluteCanvasSize.Y > 411 then 
					ScrollingWindow.CanvasSize = UDim2.new(0, 0, 1.1, 0)
				end
			end)
		end

		do --# Create Sidebar Instances
			--# Create Instances
			local Tab = Instance.new("TextButton")
			local Text = Instance.new("TextLabel")
			local Icon = Instance.new("ImageLabel")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UIPadding = Instance.new("UIPadding")

			--# Configure Instances
			Tab.Name = WindowName
			Tab.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Sidebar"):WaitForChild("Tabs")
			Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Tab.BackgroundTransparency = 1.000
			Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Tab.BorderSizePixel = 0
			Tab.Size = UDim2.new(0, 150, 0, 25)
			Tab.Font = Enum.Font.SourceSans
			Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
			Tab.TextTransparency = 1
			Tab.TextSize = 14.000

			Text.Name = "Text"
			Text.Parent = Tab
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Text.BackgroundTransparency = 1.000
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Text.BorderSizePixel = 0
			Text.LayoutOrder = 1
			Text.Position = UDim2.new(0.450000316, 0, 0.259259254, 0)
			Text.Size = UDim2.new(1.23000002, -18, 0, 12)
			Text.Font = Enum.Font.Montserrat
			Text.Text = WindowName
			Text.TextColor3 = Color3.fromRGB(62, 61, 63)
			Text.TextScaled = true
			Text.TextSize = 14.000
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left

			Icon.Name = "Icon"
			Icon.Parent = Tab
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0.275167793, 0, 0.259259254, 0)
			Icon.Size = UDim2.new(0, 12, 0, 12)
			Icon.Image = WindowIcon
			Icon.ImageColor3 = Color3.fromRGB(147, 140, 150)

			UIAspectRatioConstraint.Parent = Icon

			UIPadding.Parent = Tab
			UIPadding.PaddingRight = UDim.new(0, 50)

			--# Handlers
			if not CurrentWindow then 
				ChangeWindow(name)
			end

			table.insert(Signals, Tab.MouseEnter:Connect(function()
				if CurrentWindow ~= name then 
					Text.TextColor3 = Color3.fromRGB(82, 81, 83)
				end
			end))

			table.insert(Signals, Tab.MouseLeave:Connect(function()
				if CurrentWindow ~= name then 
					Text.TextColor3 = Color3.fromRGB(62, 61, 63)
				end
			end))

			table.insert(Signals, Tab.MouseButton1Click:Connect(function()
				ChangeWindow(name)
			end))
		end

		--# Handlers 		
		function functions:Button(configuration, callback) 
			--# Variables
			local Title = configuration and configuration.Title or "Title"
			local Description = configuration and configuration.Description or "Description"
			local Callback = callback or function(...) return (...) end 

			local funcs = {} 

			--# Create Instances
			local Button = Instance.new("TextButton")
			local Border = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description2 = Instance.new("TextLabel")

			--# Configure Instances
			Button.Name = "Button"
			Button.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 460, 0, 57)
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000

			Border.Name = "Border"
			Border.Parent = Button
			Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border.Color = Color3.fromRGB(29, 24, 31)
			Border.LineJoinMode = Enum.LineJoinMode.Round
			Border.Thickness = 1

			Heading.Name = "Heading"
			Heading.Parent = Button
			Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Heading.BackgroundTransparency = 1.000
			Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Heading.BorderSizePixel = 0
			Heading.Position = UDim2.new(0, 14, 0, 14)
			Heading.Size = UDim2.new(1, -14, 0, 12)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = Title
			Heading.TextColor3 = Color3.fromRGB(147, 140, 150)
			Heading.TextSize = 12.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left

			Description2.Name = "Description"
			Description2.Parent = Button
			Description2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description2.BackgroundTransparency = 1.000
			Description2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description2.BorderSizePixel = 0
			Description2.Position = UDim2.new(0, 14, 0, 30)
			Description2.Size = UDim2.new(1, -14, 0, 12)
			Description2.Font = Enum.Font.Montserrat
			Description2.Text = Description
			Description2.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description2.TextSize = 12.000
			Description2.TextXAlignment = Enum.TextXAlignment.Left

			--# Handlers

			table.insert(Signals, Button.MouseEnter:Connect(function()
				Border.Color = Color3.fromRGB(62, 62, 62)
			end))

			table.insert(Signals, Button.MouseLeave:Connect(function()
				Border.Color = Color3.fromRGB(29, 24, 31)
			end))

			table.insert(Signals, Button.MouseButton1Click:Connect(Callback))

			--# Functions
			function funcs:SetTitle(title)
				if title and typeof(title) == 'string' then 
					Heading.Text = title
				end
			end

			function funcs:SetDescription(description)
				if description and typeof(description) == 'string' then 
					Description2.Text = description
				end
			end

			function funcs:SetCallback(callback) 
				if callback and typeof(callback) == 'function' then 
					Callback = callback
				end
			end

			--# Returning
			return funcs
		end

		function functions:Toggle(configuration, callback) 
			--# Variables
			local Title = configuration and configuration.Title or "Title"
			local Description = configuration and configuration.Description or "Description"
			local Value = configuration and configuration.Default or false
			local Callback = callback or function(...) return (...) end 

			local funcs = {} 

			--# Create Instances
			local Toggle = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description2 = Instance.new("TextLabel")
			local Toggle_2 = Instance.new("Frame")
			local Border_2 = Instance.new("UIStroke")
			local Vector = Instance.new("ImageButton")

			--# Configure Instances
			Toggle.Name = "Toggle"
			Toggle.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 460, 0, 57)

			Border.Name = "Border"
			Border.Parent = Toggle
			Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border.Color = Color3.fromRGB(29, 24, 31)
			Border.LineJoinMode = Enum.LineJoinMode.Round
			Border.Thickness = 1

			Heading.Name = "Heading"
			Heading.Parent = Toggle
			Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Heading.BackgroundTransparency = 1.000
			Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Heading.BorderSizePixel = 0
			Heading.Position = UDim2.new(0, 14, 0, 14)
			Heading.Size = UDim2.new(1, -14, 0, 12)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = Title
			Heading.TextColor3 = Color3.fromRGB(147, 140, 150)
			Heading.TextSize = 12.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left

			Description2.Name = "Description2"
			Description2.Parent = Toggle
			Description2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description2.BackgroundTransparency = 1.000
			Description2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description2.BorderSizePixel = 0
			Description2.Position = UDim2.new(0, 14, 0, 30)
			Description2.Size = UDim2.new(1, -14, 0, 12)
			Description2.Font = Enum.Font.Montserrat
			Description2.Text = Description
			Description2.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description2.TextSize = 12.000
			Description2.TextXAlignment = Enum.TextXAlignment.Left

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Toggle
			Toggle_2.BackgroundColor3 = Color3.fromRGB(156, 158, 158)
			Toggle_2.BackgroundTransparency = 1.000
			Toggle_2.BorderSizePixel = 0
			Toggle_2.Position = UDim2.new(0, 417, 0, 20)
			Toggle_2.Size = UDim2.new(0, 15, 0, 15)

			Border_2.Name = "Border"
			Border_2.Parent = Toggle_2
			Border_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border_2.Color = Color3.fromRGB(29, 24, 31)
			Border_2.LineJoinMode = Enum.LineJoinMode.Round
			Border_2.Thickness = 1

			Vector.Name = "Vector"
			Vector.Parent = Toggle_2
			Vector.BackgroundTransparency = 1.000
			Vector.Size = UDim2.new(0, 15, 0, 15)
			Vector.ZIndex = 2
			Vector.Image = "rbxassetid://3926305904"
			Vector.ImageColor3 = Color3.fromRGB(98, 94, 91)
			Vector.ImageRectOffset = Vector2.new(312, 4)
			Vector.ImageRectSize = Vector2.new(24, 24)
			Vector.ImageTransparency = 1.000

			--# Handlers
			local function SetValue(bool, ignorecallback)
                print("Set Toggle")
				library.Toggles[Title] = bool 

				Value = bool 
				Vector.ImageTransparency = Value and 0 or 1

				if not ignorecallback then 
					Callback(Value)
				end
			end

			table.insert(Signals, Vector.MouseButton1Click:Connect(function()
				SetValue(not Value)
			end))

			table.insert(Signals, Vector.MouseEnter:Connect(function()
				Border_2.Color = Color3.fromRGB(62, 62, 62)
			end))

			table.insert(Signals, Vector.MouseLeave:Connect(function()
				Border_2.Color = Color3.fromRGB(29, 24, 31)
			end))

			SetValue(Value, true)

			--# Functions
			function funcs:SetTitle(title)
				if title and typeof(title) == 'string' then 
					Heading.Text = title
				end
			end

			function funcs:SetDescription(description)
				if description and typeof(description) == 'string' then 
					Description2.Text = description
				end
			end

			function funcs:SetCallback(callback) 
				if callback and typeof(callback) == 'function' then 
					Callback = callback
				end
			end

			function funcs:GetValue()
				return Value
			end

			function funcs:SetValue(value)
				if value ~= nil and typeof(value) == "boolean" then 
					SetValue(value)
				end
			end

			--# Returning
			return funcs
		end

		function functions:Input(configuration, callback)
			--# Variables
			local Title = configuration and configuration.Title or "Title"
			local Description = configuration and configuration.Description or "Description"
			local Value = configuration and configuration.Default or "Enter Text"
			local Callback = callback or function(...) return (...) end 

			local funcs = {} 

			--# Create Instances
			local TextInput = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Content = Instance.new("Frame")
			local Border_2 = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description2 = Instance.new("TextLabel")
			local Textbox = Instance.new("Frame")
			local Text = Instance.new("TextBox")

			--# Configure Instances
			TextInput.Name = "Text Input"
			TextInput.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			TextInput.BackgroundColor3 = librarydesign.BackgroundColor
			TextInput.BorderSizePixel = 0
			TextInput.BackgroundTransparency = 1
			TextInput.Size = UDim2.new(0, 460, 0, 99)

			Border.Name = "Border"
			Border.Parent = TextInput
			Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border.Color = Color3.fromRGB(29, 24, 31)
			Border.LineJoinMode = Enum.LineJoinMode.Round
			Border.Thickness = 1

			Content.Name = "Content"
			Content.Parent = TextInput
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BackgroundTransparency = 1.000
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 14, 0, 14)
			Content.Size = UDim2.new(0, 432, 0, 29)

			Heading.Name = "Heading"
			Heading.Parent = Content
			Heading.BackgroundTransparency = 1.000
			Heading.BorderSizePixel = 0
			Heading.Size = UDim2.new(0, 264, 0, 13)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = Title
			Heading.TextColor3 = Color3.fromRGB(147, 140, 149)
			Heading.TextSize = 11.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left
			Heading.TextYAlignment = Enum.TextYAlignment.Top

			Description2.Name = "Description2"
			Description2.Parent = Content
			Description2.BackgroundTransparency = 1.000
			Description2.BorderSizePixel = 0
			Description2.Position = UDim2.new(0, 0, 0, 17)
			Description2.Size = UDim2.new(0, 432, 0, 12)
			Description2.Font = Enum.Font.Montserrat
			Description2.Text = Description
			Description2.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description2.TextSize = 10.000
			Description2.TextXAlignment = Enum.TextXAlignment.Left
			Description2.TextYAlignment = Enum.TextYAlignment.Top

			Textbox.Name = "Textbox"
			Textbox.Parent = TextInput
			Textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Textbox.BackgroundTransparency = 1.000
			Textbox.BorderSizePixel = 0
			Textbox.Position = UDim2.new(0, 14, 0, 53)
			Textbox.Size = UDim2.new(0, 432, 0, 32)

			Border_2.Name = "Border"
			Border_2.Parent = Textbox
			Border_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border_2.Color = Color3.fromRGB(29, 24, 31)
			Border_2.LineJoinMode = Enum.LineJoinMode.Round
			Border_2.Thickness = 1

			Text.Name = "Text"
			Text.Parent = Textbox
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Text.BackgroundTransparency = 1.000
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0.0162037034, 0, 0, 0)
			Text.Size = UDim2.new(0, 414, 0, 30)
			Text.ClearTextOnFocus = false
			Text.Font = Enum.Font.SourceSans
			Text.PlaceholderColor3 = Color3.fromRGB(127, 127, 127)
			Text.PlaceholderText = Value
			Text.Text = Value
			Text.TextColor3 = Color3.fromRGB(127, 127, 127)
			Text.TextSize = 14.000
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left

			--# Handlers
			local function SetValue(value, ignorecallback)
				library.Options[Title] = value 

				Value = value

				if not ignorecallback then 
					Callback(Value)
				end
			end

			table.insert(Signals, Text.MouseEnter:Connect(function()
				Border_2.Color = Color3.fromRGB(62, 62, 62)
			end))

			table.insert(Signals, Text.MouseLeave:Connect(function()
				Border_2.Color = Color3.fromRGB(29, 24, 31)
			end))

			table.insert(Signals, Text:GetPropertyChangedSignal("Text"):Connect(function()
				SetValue(Text.Text)
			end))

			SetValue(Value, true)

			--# Functions
			function funcs:SetTitle(title)
				if title and typeof(title) == 'string' then 
					Heading.Text = title
				end
			end

			function funcs:SetDescription(description)
				if description and typeof(description) == 'string' then 
					Description2.Text = description
				end
			end

			function funcs:SetCallback(callback) 
				if callback and typeof(callback) == 'function' then 
					Callback = callback
				end
			end

			function funcs:GetValue()
				return Value
			end

			function funcs:SetValue(value)
				if value and typeof(value) == "string" then 
					SetValue(value)
				end
			end

			--# Returning
			return funcs
		end

		function functions:Slider(configuration, callback)
			--# Variables
			local Title = configuration and configuration.Title or "Title"
			local Description = configuration and configuration.Description or "Description"
			local Value = configuration and configuration.Default or 10
			local Min = --[[configuration and configuration.Min or ]]1
			local Max = configuration and configuration.Max or 100 
			local Callback = callback or function(...) return (...) end 

			local funcs = {} 
			
			if Min > Max then 
				Min = Max 
			end

			if Max < Min then 
				Min = Max
			end

			if Value < Min or Value > Min then 
				Value = Min
			end

			--# Create Instances
			local Slider = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Content = Instance.new("Frame")
			local Title_2 = Instance.new("Frame")
			local Current = Instance.new("TextBox")-- Instance.new("TextLabel")
			local Maximum = Instance.new("TextLabel")
			local Heading = Instance.new("TextLabel")
			local Description_2 = Instance.new("TextLabel")
			local Frame1 = Instance.new("Frame")
			local Border_2 = Instance.new("UIStroke")
			local Frame2 = Instance.new("Frame")

			--# Configure Instances
			Slider.Name = "Slider"
			Slider.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			Slider.BackgroundColor3 = librarydesign.BackgroundColor
			Slider.BorderSizePixel = 0
			Slider.BackgroundTransparency = 1
			Slider.Size = UDim2.new(0, 460, 0, 67)

			Border.Name = "Border"
			Border.Parent = Slider
			Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border.Color = Color3.fromRGB(29, 24, 31)
			Border.LineJoinMode = Enum.LineJoinMode.Round
			Border.Thickness = 1

			Content.Name = "Content"
			Content.Parent = Slider
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BackgroundTransparency = 1.000
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 14, 0, 14)
			Content.Size = UDim2.new(0, 432, 0, 29)

			Title_2.Name = "Title"
			Title_2.Parent = Content
			Title_2.BackgroundTransparency = 1.000
			Title_2.BorderSizePixel = 0
			Title_2.Size = UDim2.new(0, 432, 0, 29)

			Current.Name = "Current"
			Current.Parent = Title_2
			Current.BackgroundTransparency = 1.000
			Current.BorderSizePixel = 0
			Current.Position = UDim2.new(0, 414, 0, 0)
			Current.Size = UDim2.new(0, 14, 0, 13)
			Current.ClearTextOnFocus = false
			Current.Font = Enum.Font.Montserrat
			Current.Text = Value
			Current.TextColor3 = Color3.fromRGB(147, 140, 149)
			Current.TextSize = 10.000
			Current.TextXAlignment = Enum.TextXAlignment.Left
			Current.TextYAlignment = Enum.TextYAlignment.Top

			Maximum.Name = "Maximum"
			Maximum.Parent = Title_2
			Maximum.BackgroundTransparency = 1.000
			Maximum.BorderSizePixel = 0
			Maximum.Position = UDim2.new(0, 414, 0, 17)
			Maximum.Size = UDim2.new(0, 18, 0, 12)
			Maximum.Font = Enum.Font.Montserrat
			Maximum.Text = Max
			Maximum.TextColor3 = Color3.fromRGB(62, 61, 63)
			Maximum.TextSize = 10.000
			Maximum.TextXAlignment = Enum.TextXAlignment.Left
			Maximum.TextYAlignment = Enum.TextYAlignment.Top

			Heading.Name = "Heading"
			Heading.Parent = Title_2
			Heading.BackgroundTransparency = 1.000
			Heading.BorderSizePixel = 0
			Heading.Size = UDim2.new(0, 264, 0, 13)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = Title
			Heading.TextColor3 = Color3.fromRGB(147, 140, 149)
			Heading.TextSize = 11.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left
			Heading.TextYAlignment = Enum.TextYAlignment.Top

			Description_2.Name = "Description_2"
			Description_2.Parent = Title_2
			Description_2.BackgroundTransparency = 1.000
			Description_2.BorderSizePixel = 0
			Description_2.Position = UDim2.new(0, 0, 0, 17)
			Description_2.Size = UDim2.new(0, 432, 0, 12)
			Description_2.Font = Enum.Font.Montserrat
			Description_2.Text = Description
			Description_2.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description_2.TextSize = 11.000
			Description_2.TextXAlignment = Enum.TextXAlignment.Left
			Description_2.TextYAlignment = Enum.TextYAlignment.Top

			Frame1.Name = "Frame 1"
			Frame1.Parent = Slider
			Frame1.BackgroundColor3 = Color3.fromRGB(19, 15, 20)
			Frame1.BorderSizePixel = 0
			Frame1.Position = UDim2.new(0, 14, 0, 49)
			Frame1.Size = UDim2.new(0, 432, 0, 8)

			Border_2.Name = "Border"
			Border_2.Parent = Frame1
			Border_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border_2.Color = Color3.fromRGB(29, 24, 31)
			Border_2.LineJoinMode = Enum.LineJoinMode.Round
			Border_2.Thickness = 1

			Frame2.Name = "Frame 2"
			Frame2.Parent = Frame1
			Frame2.BackgroundColor3 = Color3.fromRGB(120, 82, 255)
			Frame2.BorderSizePixel = 0
			Frame2.Size = UDim2.new(0.00999999978, 0, 0, 8)

			--# Handlers
			local function valueToPercent(value)
				return (value / Max) * 100
			end

			local function SetValue(value, ignorecallback)
				library.Options[Title] = math.round((value / 100) * Max) 

				Current.Text = tostring(math.round((value / 100) * Max))
				Frame2.Size = UDim2.new((value / 100), 0, 0, 8)

				Value = value

				if not ignorecallback then 
					Callback(math.round((value / 100) * Max))
				end
			end

			table.insert(Signals, Frame1.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					while task.wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local sliderPos = Frame2.AbsolutePosition.X

						local leftBoundary = Frame1.AbsolutePosition.X - (Frame1.AbsoluteSize.X)
						local rightBoundary = Frame1.AbsolutePosition.X + (Frame1.AbsoluteSize.X)

						local maxPos = math.clamp((mouse.X - sliderPos) / (rightBoundary - sliderPos), 0, Min)

						local val = (((Max - Min) * maxPos) / ((Max - Min) / (100))) + (Min / 2)

						Value = val 
						SetValue(val)
					end
				end
			end))

			table.insert(Signals, Current:GetPropertyChangedSignal("Text"):Connect(function()
				if tonumber(Current.Text) then
					local Amount = tonumber(Current.Text)

					if Amount > Max then 
						Amount = Max
					end

					if Amount < Min then 
						Amount = Min
					end

					SetValue(valueToPercent(Amount))
				end
			end))
			
			SetValue(valueToPercent(Value), true)
			
			--# Functions
			function funcs:SetTitle(title)
				if title and typeof(title) == 'string' then 
					Heading.Text = title
				end
			end

			function funcs:SetDescription(description)
				if description and typeof(description) == 'string' then 
					Description_2.Text = description
				end
			end

			function funcs:SetCallback(callback) 
				if callback and typeof(callback) == 'function' then 
					Callback = callback
				end
			end

			function funcs:GetValue()
				return Value
			end

			function funcs:SetValue(value)
				if value and typeof(value) == "number" then 
					SetValue(valueToPercent(value))
				end
			end

			--# Returning
			return funcs
		end

		function functions:Keybind(configuration, callback)
			--# Variables
			local Title = configuration and configuration.Title or "Title"
			local Description = configuration and configuration.Description or "Description"
			local Value = configuration and configuration.Default or 'NIL'
			local Callback = callback or function(...) return (...) end 

			local funcs = {} 
			local editing = false 
			--# Create Instances
			local Keybind = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description_2 = Instance.new("TextLabel")
			local Toggle = Instance.new("Frame")
			local Border_2 = Instance.new("UIStroke")
			local Status = Instance.new("TextLabel")
			local Mode = Instance.new("ScreenGui")
			local Main = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local Toggle_2 = Instance.new("TextButton")
			local Vector = Instance.new("ImageButton")
			local Always = Instance.new("TextButton")
			local Vector_2 = Instance.new("ImageButton")
			local Hold = Instance.new("TextButton")
			local Vector_3 = Instance.new("ImageButton")
			
			--# Configure Instances
			Keybind.Name = "Keybind"
			Keybind.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Keybind.BackgroundTransparency = 1.000
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.BorderSizePixel = 0
			Keybind.Size = UDim2.new(0, 460, 0, 57)
			
			Mode.Name = "Mode"
			Mode.Parent = Keybind
			Mode.Enabled = false
			Mode.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			Main.Name = "Main"
			Main.Parent = Mode
			Main.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Main.BorderSizePixel = 0
			Main.Position = UDim2.new(0.774923623, 0, 0.307299644, 0)
			Main.Size = UDim2.new(0, 125, 0, 56)

			UIListLayout.Parent = Main
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Main
			Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle_2.BackgroundTransparency = 1.000
			Toggle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle_2.BorderSizePixel = 0
			Toggle_2.Size = UDim2.new(0, 125, 0, 18)
			Toggle_2.Font = Enum.Font.SourceSans
			Toggle_2.Text = "Toggle"
			Toggle_2.TextColor3 = Color3.fromRGB(147, 140, 150)
			Toggle_2.TextSize = 14.000

			Vector.Name = "Vector"
			Vector.Parent = Toggle_2
			Vector.BackgroundTransparency = 1.000
			Vector.Position = UDim2.new(0, 82, 0, 2)
			Vector.Size = UDim2.new(0, 15, 0, 15)
			Vector.ZIndex = 2
			Vector.Image = "rbxassetid://3926305904"
			Vector.ImageColor3 = Color3.fromRGB(98, 94, 91)
			Vector.ImageRectOffset = Vector2.new(312, 4)
			Vector.ImageRectSize = Vector2.new(24, 24)

			Always.Name = "Always"
			Always.Parent = Main
			Always.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Always.BackgroundTransparency = 1.000
			Always.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Always.BorderSizePixel = 0
			Always.Size = UDim2.new(0, 125, 0, 18)
			Always.Font = Enum.Font.SourceSans
			Always.Text = "Always"
			Always.TextColor3 = Color3.fromRGB(147, 140, 150)
			Always.TextSize = 14.000

			Vector_2.Name = "Vector"
			Vector_2.Parent = Always
			Vector_2.BackgroundTransparency = 1.000
			Vector_2.Position = UDim2.new(0, 82, 0, 2)
			Vector_2.Size = UDim2.new(0, 15, 0, 15)
			Vector_2.Visible = false
			Vector_2.ZIndex = 2
			Vector_2.Image = "rbxassetid://3926305904"
			Vector_2.ImageColor3 = Color3.fromRGB(98, 94, 91)
			Vector_2.ImageRectOffset = Vector2.new(312, 4)
			Vector_2.ImageRectSize = Vector2.new(24, 24)

			Hold.Name = "Hold"
			Hold.Parent = Main
			Hold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hold.BackgroundTransparency = 1.000
			Hold.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Hold.BorderSizePixel = 0
			Hold.Size = UDim2.new(0, 125, 0, 18)
			Hold.Font = Enum.Font.SourceSans
			Hold.Text = "Hold"
			Hold.TextColor3 = Color3.fromRGB(147, 140, 150)
			Hold.TextSize = 14.000

			Vector_3.Name = "Vector"
			Vector_3.Parent = Hold
			Vector_3.BackgroundTransparency = 1.000
			Vector_3.Position = UDim2.new(0, 82, 0, 2)
			Vector_3.Size = UDim2.new(0, 15, 0, 15)
			Vector_3.Visible = false
			Vector_3.ZIndex = 2
			Vector_3.Image = "rbxassetid://3926305904"
			Vector_3.ImageColor3 = Color3.fromRGB(98, 94, 91)
			Vector_3.ImageRectOffset = Vector2.new(312, 4)
			Vector_3.ImageRectSize = Vector2.new(24, 24)
			
			Border.Name = "Border"
			Border.Parent = Keybind
			Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border.Color = Color3.fromRGB(29, 24, 31)
			Border.LineJoinMode = Enum.LineJoinMode.Round
			Border.Thickness = 1

			Heading.Name = "Heading"
			Heading.Parent = Keybind
			Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Heading.BackgroundTransparency = 1.000
			Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Heading.BorderSizePixel = 0
			Heading.Position = UDim2.new(0, 14, 0, 14)
			Heading.Size = UDim2.new(1, -14, 0, 12)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = Title
			Heading.TextColor3 = Color3.fromRGB(147, 140, 150)
			Heading.TextSize = 12.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left

			Description_2.Name = "Description_2"
			Description_2.Parent = Keybind
			Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description_2.BackgroundTransparency = 1.000
			Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description_2.BorderSizePixel = 0
			Description_2.Position = UDim2.new(0, 14, 0, 30)
			Description_2.Size = UDim2.new(1, -14, 0, 12)
			Description_2.Font = Enum.Font.Montserrat
			Description_2.Text = Description
			Description_2.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description_2.TextSize = 12.000
			Description_2.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = Keybind
			Toggle.BackgroundColor3 = Color3.fromRGB(156, 158, 158)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0, 417, 0, 20)
			Toggle.Size = UDim2.new(0, 15, 0, 15)

			Border_2.Name = "Border"
			Border_2.Parent = Toggle
			Border_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border_2.Color = Color3.fromRGB(29, 24, 31)
			Border_2.LineJoinMode = Enum.LineJoinMode.Round
			Border_2.Thickness = 1

			Status.Name = "Status"
			Status.Parent = Keybind
			Status.BackgroundColor3 = Color3.fromRGB(156, 158, 158)
			Status.BackgroundTransparency = 1.000
			Status.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Status.BorderSizePixel = 0
			Status.Position = UDim2.new(0, 417, 0, 20)
			Status.Size = UDim2.new(0, 15, 0, 15)
			Status.Font = Enum.Font.SourceSans
			Status.RichText = true
			Status.Text = "..."
			Status.TextColor3 = Color3.fromRGB(127, 127, 127)
			Status.TextSize = 12.000

			--# Handlers
			local function SetValue(value, ignorecallback)
				library.Options[Title] = value

				if typeof(value) == "EnumItem" then
					Status.Text = '<b>' .. value.Name .. '</b>'
				else 
					Status.Text = '<b>' .. tostring(value) .. '</b>'
				end

				Value = value

				Status.Size = UDim2.new(0, math.clamp(Status.TextBounds.X + 8, 0, 40), 0, 15) 
				Toggle.Size = UDim2.new(0, math.clamp(Status.TextBounds.X + 8, 0, 40), 0, 15) 

				if not ignorecallback then 
					Callback()
				end
			end

			table.insert(Signals, Toggle.MouseEnter:Connect(function()
				Border_2.Color = Color3.fromRGB(62, 62, 62)
			end))

			table.insert(Signals, Toggle.MouseLeave:Connect(function()
				Border_2.Color = Color3.fromRGB(29, 24, 31)
			end))


			table.insert(Signals, Toggle.InputBegan:Connect(function(input)  
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					editing = true 
					Value = nil 

					Status.Text = '<b>...</b>'
					Status.Size = UDim2.new(0, Status.TextBounds.X + 8, 0, 15) 
					Toggle.Size = UDim2.new(0, Status.TextBounds.X + 8, 0, 15) 
				end
			end))

			table.insert(Signals, UserInputService.InputBegan:Connect(function(input, event)  
				if not event then 
					if input.UserInputType == Enum.UserInputType.Keyboard then
						if input.KeyCode.Name == Value or input.KeyCode == Value then 
							Callback()
						end

						if editing then
							SetValue(input.KeyCode.Name, true)
							editing = false
						end
					end
				end
			end))
			
			table.insert(Signals, Toggle.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton2 then
					Mode.Enabled = true
				end
			end))
			
			SetValue(Value, true)
		end

		function functions:Label(text)
			--# Variables
			local funcs = {}
			
			--# Create Instances
			local TextLabel = Instance.new("Frame")
			local TextLabel_2 = Instance.new("TextLabel")

			--# Configure Instances
			TextLabel.Name = "Text Label"
			TextLabel.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			TextLabel.BackgroundColor3 = Color3.fromRGB(28, 24, 31)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(-0.00217391294, 0, 0.170270264, 0)
			TextLabel.Size = UDim2.new(0, 460, 0, 29)

			TextLabel_2.Parent = TextLabel
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0.0218477994, 0, 0.206896558, 0)
			TextLabel_2.Size = UDim2.new(0, 446, 0, 15)
			TextLabel_2.Font = Enum.Font.Montserrat
			TextLabel_2.Text = text or "Label"
			TextLabel_2.TextColor3 = Color3.fromRGB(162, 162, 162)
			TextLabel_2.TextSize = 12.000
			TextLabel_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			
			--# Functions
			function funcs:SetText(text)
				if text and typeof(text) == 'string' then 
					TextLabel_2.Text = text
				end
			end
			
			--# Returning
			return funcs
		end

		function functions:Divider()
			--# Create Instances
			local Divider = Instance.new("Frame")
			local Looks = Instance.new("Frame")

			--# Configure Instances
			Divider.Name = "Divider"
			Divider.Parent = WindowDirectory:WaitForChild("Frame"):WaitForChild("Components"):WaitForChild("Windows")[WindowName]:WaitForChild("ScrollingWindow"):WaitForChild("HandlerWindow")
			Divider.BackgroundColor3 = Color3.fromRGB(28, 24, 31)
			Divider.BackgroundTransparency = 1.000
			Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Divider.BorderSizePixel = 0
			Divider.Position = UDim2.new(-0.00217391294, 0, 0.170270264, 0)
			Divider.Size = UDim2.new(0, 460, 0, 15)

			Looks.Name = "Looks"
			Looks.Parent = Divider
			Looks.BackgroundColor3 = Color3.fromRGB(28, 24, 31)
			Looks.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Looks.BorderSizePixel = 0
			Looks.Position = UDim2.new(0, 0, 0.413793117, 0)
			Looks.Size = UDim2.new(0, 460, 0, 3)
		end

		--# Returning
		return functions
	end
	
	local function tween(object, goal) -- For Toggling The Menu
		TweenService:Create(object, TweenInfo.new(0.5), goal):play()
	end
	
	function library:Toggle()
		if self.Library.Frame.ClipsDescendants == false then 
			self.Library.Frame.ClipsDescendants = true 
			self.Library.Enabled = false
			for index, object in pairs(self.Library.Frame:GetDescendants()) do 
				if object:IsA("TextLabel") or object:IsA("TextBox") then 
					if object.TextTransparency < 1 then
						tween(object, { TextTransparency = 0.99 })
					end
				end

				if object:IsA("ImageLabel") or object:IsA("ImageButton") then 
					if object.ImageTransparency < 1 then
						tween(object, { ImageTransparency = 0.99 })
					end
				end

				if object:IsA("GuiObject") or object:IsA('UIStroke') or object:IsA("TextButton") then 
					if object.Transparency < 1 then
						tween(object, { Transparency = 0.99 })
					end
				end
			end
		else 
			self.Library.Frame.ClipsDescendants = false
			self.Library.Enabled = true
			for index, object in pairs(self.Library.Frame:GetDescendants()) do 
				if object:IsA("TextLabel") or object:IsA("TextBox") then 
					if object.TextTransparency < 1 then
						tween(object, { TextTransparency = 0 })
					end
				end

				if object:IsA("ImageLabel") or object:IsA("ImageButton") then 
					if object.ImageTransparency < 1 then
						tween(object, { ImageTransparency = 0 })
					end
				end

				if object:IsA("GuiObject") or object:IsA('UIStroke') or object:IsA("TextButton") then 
					if object.Transparency < 1 then
						tween(object, { Transparency = 0 })
					end
				end
			end
		end
	end
	
	function library:Unload()
		for index, signal in pairs(Signals) do 
			signal:Disconnect()
		end
		
		self.Library:Remove()
		self.Library = nil 
		self.Options = nil 
		self.Toggles = nil
		self = nil 
		
		Signals = nil 
	end
	
	--# Returning
	return library
end

return GetLibrary()
