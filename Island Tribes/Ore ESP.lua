--//Jans UI Library\\--

local TweenService, RunService, UserInputService,gui,dragging,dragInput,dragStart,startPos,cpt,cpf,cppicking,cppickingVal,cppickingAlpha,cphue,cpsat,cpval,focused,highest,focusedBox = game:GetService("TweenService"),game:GetService("RunService"), game:GetService("UserInputService")
local cpalpha = 0

--custom functions used for all the options

--drag function
local function updateDrag(input)
    local delta = input.Position - dragStart
    gui.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
end

--color picker
local function updateHueSat(input, obj, hue, sat)
	hue = (obj.AbsoluteSize.X-(input.Position.X-obj.AbsolutePosition.X))/obj.AbsoluteSize.X
	sat = (obj.AbsoluteSize.Y-(input.Position.Y-obj.AbsolutePosition.Y))/obj.AbsoluteSize.Y
	return (input.Position.X-obj.AbsolutePosition.X)/obj.AbsoluteSize.X, (input.Position.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y, hue, sat
end

local function updateValue(input, obj, val)
	val = (obj.AbsoluteSize.Y-(input.Position.Y-obj.AbsolutePosition.Y))/obj.AbsoluteSize.Y
	return (input.Position.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y, val
end

local function updateAlpha(input, obj, alpha)
	alpha = (obj.AbsoluteSize.X-(input.Position.X-obj.AbsolutePosition.X))/obj.AbsoluteSize.X
	return (input.Position.X-obj.AbsolutePosition.X)/obj.AbsoluteSize.X, alpha
end

local function rgbToHsv(r, g, b)
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max
	
	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end
	
	if max == min then
		h = 0 -- achromatic
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

--drag function and color picker
UserInputService.InputChanged:connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		if cppicking then
			x, y, cphue, cpsat = updateHueSat(input, cpt.HueSat, cphue, cpsat)
			if x <= 0 then
				x = 0
				cphue = 1
			end
			if x >= 1 then
				x = 1
				cphue = 0
			end
			if y <= 0 then
				y = 0
				cpsat = 1
			end
			if y >= 1 then
				y = 1
				cpsat = 0
			end
			cpt.pointer.Position = UDim2.new(x,0,y,0)
			cpt.color = Color3.fromHSV(cphue,cpsat,cpval)
			cpt.visualize.BackgroundColor3 = cpt.color
			cpt.Alpha.ImageColor3 = cpt.color
			return cpf(cpt.color, cpt.alpha)
		end
		if cppickingVal then
			y, cpval = updateValue(input, cpt.Value, cpval)
			if y <= 0 then
				y = 0
				cpval = 1
			end
			if y >= 1 then
				y = 1
				cpval = 0
			end
			cpt.pointer2.Position = UDim2.new(1,-10,y,0)
			cpt.color = Color3.fromHSV(cphue,cpsat,cpval)
			cpt.visualize.BackgroundColor3 = cpt.color
			cpt.Alpha.ImageColor3 = cpt.color
			return cpf(cpt.color, cpt.alpha)
		end
		if cppickingAlpha then
			x, cpalpha = updateAlpha(input, cpt.Alpha, cpalpha)
			if x <= 0 then
				x = 0
				cpalpha = 1
			end
			if x >= 1 then
				x = 1
				cpalpha = 0
			end
			cpt.pointer3.Position = UDim2.new(x,0,1,-10)
			cpt.alpha = 1-cpalpha
			cpt.visualize.BackgroundTransparency = cpt.alpha
			return cpf(cpt.color, cpt.alpha)
		end
	end
end)

--slider
local function round(num, bracket)
	bracket = bracket or 1
	return math.floor(num/bracket + math.sign(num) * 0.5) * bracket
end

--keybind
local blacklistedKeys = { --add or remove keys if you find the need to
	Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.One,Enum.KeyCode.Two,Enum.KeyCode.Three,Enum.KeyCode.Four,Enum.KeyCode.Five,Enum.KeyCode.Six,Enum.KeyCode.Seven,Enum.KeyCode.Eight,Enum.KeyCode.Nine,Enum.KeyCode.Zero,Enum.KeyCode.Escape,Enum.KeyCode.F1,Enum.KeyCode.F2,Enum.KeyCode.F3,Enum.KeyCode.F4,Enum.KeyCode.F5,Enum.KeyCode.F6,Enum.KeyCode.F7,Enum.KeyCode.F8,Enum.KeyCode.F9,Enum.KeyCode.F10,Enum.KeyCode.F11,Enum.KeyCode.F12
}

local whitelistedMouse = { --add or remove mouse inputs if you find the need to
	Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3
}

local function keyCheck(x,x1) -- used for keybinding
	for _,v in next, x1 do
		if v == x then 
			return true
		end 
	end
end

--zindex stuff
local function focusOnOption(obj)
	if highest then
		highest.ZIndex = highest.ZIndex - 5
		for _,v in next, highest:GetDescendants() do
			pcall(function()
				v.ZIndex = v.ZIndex +- 5
			end)
		end
	end
	highest = obj
	highest.ZIndex = highest.ZIndex + 5
	for _,v in next, highest:GetDescendants() do
		pcall(function()
			v.ZIndex = v.ZIndex + 5
		end)
	end
end

local function focusOnWindow(obj)
	if focused then
		focused.ZIndex = focused.ZIndex - 10
		for _,v in next, focused:GetDescendants() do
			pcall(function()
				v.ZIndex = v.ZIndex - 10
			end)
		end
	end
	focused = obj
	focused.ZIndex = focused.ZIndex + 10
	for _,v in next, focused:GetDescendants() do
		pcall(function()
			v.ZIndex = v.ZIndex + 10
		end)
	end
end

local ddcheck
local extframes = {}
for i=1,4 do
	local frame = Instance.new("Frame")
	frame.ZIndex = 50
	frame.BackgroundTransparency = 1
	frame.Visible = false
	if i == 1 then
		frame.Size = UDim2.new(0,1000,0,-1000)
	elseif i == 2 then
		frame.Size = UDim2.new(0,1000,0,1000)
		frame.Position = UDim2.new(1,0,0,0)
	elseif i == 3 then
		frame.Size = UDim2.new(0,-1000,0,1000)
		frame.Position = UDim2.new(1,0,1,0)
	elseif i == 4 then
		frame.Size = UDim2.new(0,-1000,0,-1000)
		frame.Position = UDim2.new(0,0,1,0)
	end
	table.insert(extframes, frame)
	frame.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			frame.Parent.Visible = false
			if ddcheck then
				ddcheck.arrow.Text = ">"
				ddcheck.closed = not ddcheck.closed
			end
			for _,v in next, extframes do
				v.Visible = false
			end
		end
	end)
end

local function closeWindow(obj)
	for _,v in next, extframes do
		v.Visible = true
		v.Parent = obj
	end
end

--start of library
local library = {windows = {}}

library.settings = {
	title = "Title text",
	footer = "Footer text",
	modal = true,
	toggle = Enum.KeyCode.F8,
	font = Enum.Font.Code,
	textsize = 14,
	textstroke = true
}

library.colors = {
	theme = Color3.fromRGB(218,137,6),
	text = Color3.fromRGB(255,255,255),
	main = Color3.fromRGB(30,30,30),
	fade = Color3.fromRGB(50,50,50),
	outline = Color3.fromRGB(10,10,10),
	tabholder = Color3.fromRGB(60,60,60),
	tabbutton = Color3.fromRGB(40,40,40),
	tabselected = Color3.fromRGB(50,50,50)
}

function library:create(class, properties)
	local inst = Instance.new(class)
	for property, value in pairs(properties) do
		inst[property] = value
	end
	return inst
end

function library:CreateWindow(ctitle, csize, cpos)
	if ctitle then
		if typeof(ctitle) == "Vector2" then
			cpos = csize
			csize = ctitle
			ctitle = library.settings.title
		end
	end
	cpos = cpos or Vector2.new(40,40)
	csize = csize or Vector2.new(460,500)
	local window = {xpos = 0, close = true, draggable = true}
	table.insert(self.windows, window)
	
	self.base = self.base or self:create("ScreenGui", {
		Parent = game.CoreGui
	})
	
	self.pointer = self.pointer or self:create("Frame", {
		ZIndex = 100,
		Size = UDim2.new(0,4,0,4),
		BackgroundColor3 = Color3.fromRGB(255,255,255),
		Parent = self.base
	})
	
	self.pointer1 = self.pointer1 or self:create("Frame", {
		ZIndex = 100,
		Size = UDim2.new(0,1,0,1),
		BackgroundColor3 = Color3.fromRGB(255,0,0),
		BorderColor3 = Color3.fromRGB(255,0,0),
		Parent = self.pointer
	})
	
	window.main = self:create("TextButton", {
		Position = UDim2.new(0,cpos.X,0,cpos.Y),
		Size = UDim2.new(0,csize.X,0,csize.Y),
		BackgroundColor3 = self.colors.main,
		BorderColor3 = self.colors.outline,
		Text = "",
		AutoButtonColor = false,
		Parent = self.base
	})
	
	window.shade = self:create("ImageLabel", {
		Size = UDim2.new(1,0,0,18),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2916745254",
		ImageColor3 = self.colors.fade,
		ImageTransparency = 0.2,
		Parent = window.main
	})
	
	window.title = self:create("TextLabel", {
		Size = UDim2.new(1,0,0,18),
		BackgroundTransparency = 1,
		Text = ctitle or self.settings.title,
		TextColor3 = self.colors.text,
		TextStrokeTransparency = self.settings.textstroke and 0 or 1,
		Font = self.settings.font,
		TextSize = self.settings.textsize,
		Parent = window.main
	})
	
	window.title.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and window.draggable then
			gui = window.main
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	window.title.InputChanged:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	window.main.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			focusOnWindow(window.main)
		end
	end)
	
	function window:CreateTab(name)
		local tab = {}
		local bounds = game:GetService('TextService'):GetTextSize(name, library.settings.textsize, library.settings.font, Vector2.new(math.huge, math.huge))
		tab.rows = {}
		
		local function createNewRow()
			tab.row = library:create("Frame", {
				Position = UDim2.new(0,csize.X/2 * #tab.rows - (#tab.rows * 10),0,0),
				Size = UDim2.new(0,csize.X/2 - 10,1,0),
				BackgroundTransparency = 1,
				Parent = tab.main
			})
			tab.layout = library:create("UIListLayout", {
				Padding = UDim.new(0,8),
				Parent = tab.row
			})
			
			tab.padding = library:create("UIPadding", {
				PaddingLeft = UDim.new(0,4),
				PaddingRight = UDim.new(0,4),
				PaddingTop = UDim.new(0,12),
				Parent = tab.row
			})
			table.insert(tab.rows, tab)
			if #tab.rows > 2 then
				self.main.Size = self.main.Size + UDim2.new(0,csize.X/2 - 10,0,0)
			end
		end
		local function checkRow()
			if tab.row then
				for _,row in pairs(tab.rows) do
					if row.layout.AbsoluteContentSize.Y > row.row.AbsoluteSize.Y - 20 then
						createNewRow()
					else
						tab = row
					end
				end
			else
				createNewRow()
			end
		end
		
		self.tabholder = self.tabholder or library:create("Frame", {
			Position = UDim2.new(0,10,0,25),
			Size = UDim2.new(1,-20,1,-55),
			BackgroundColor3 = library.colors.tabholder,
			BorderColor3 = library.colors.outline,
			Parent = self.main
		})
		
		self.footer = self.footer or library:create("TextLabel", {
			Position = UDim2.new(0,0,1,0),
			Size = UDim2.new(1,0,0,-18),
			BackgroundColor3 = library.colors.tabbutton,
			BorderColor3 = library.colors.outline,
			Text = " "..library.settings.footer,
			TextColor3 = library.colors.text,
			TextStrokeTransparency = library.settings.textstroke and 0 or 1,
			Font = library.settings.font,
			TextSize = library.settings.textsize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = self.main
		})
	
		tab.main = library:create("Frame", {
			Position = UDim2.new(0,0,0,20),
			Size = UDim2.new(1,0,1,-20),
			BackgroundColor3 = library.colors.tabselected,
			BorderColor3 = library.colors.outline,
			Visible = false,
			Parent = self.tabholder
		})
		
		tab.button = library:create("Frame", {
			
			Position = UDim2.new(0,self.xpos,0,0),
			Size = UDim2.new(0,bounds.X+8,0,19),
			BorderColor3 = library.colors.outline,
			Parent = self.tabholder
		})
		
		tab.buttontop = library:create("Frame", {
			Size = UDim2.new(1,0,1,0),
			BackgroundColor3 = library.colors.tabbutton,
			BorderSizePixel = 0,
			BorderColor3 = library.colors.outline,
			Parent = tab.button
		})
		
		tab.label = library:create("TextLabel", {
			
			Size = UDim2.new(1,0,1,0),
			BackgroundTransparency = 1,
			Text = name,
			TextColor3 = library.colors.text,
			TextStrokeTransparency = library.settings.textstroke and 0 or 1,
			Font = library.settings.font,
			TextSize = library.settings.textsize,
			Parent = tab.button
		})
		
		if self.xpos == 0 then
			self.focused = tab
			self.focused.main.Visible = true
			self.focused.buttontop.Size = self.focused.buttontop.Size + UDim2.new(0,0,0,1)
			tab.buttontop.BackgroundColor3 = library.colors.tabselected
		end
		self.xpos = self.xpos + bounds.X + 8
		
		tab.label.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				self.focused.main.Visible = false
				self.focused.buttontop.Size = self.focused.buttontop.Size - UDim2.new(0,0,0,1)
				self.focused.buttontop.BackgroundColor3 = library.colors.tabbutton
				self.focused = tab
				self.focused.main.Visible = true
				self.focused.buttontop.Size = self.focused.buttontop.Size + UDim2.new(0,0,0,1)
				self.focused.buttontop.BackgroundColor3 = library.colors.tabselected
			end
		end)
		
		function tab:AddLocalTab(title)
			local LocalTab = {order = 0}
			local bounds = game:GetService('TextService'):GetTextSize(title, library.settings.textsize, library.settings.font, Vector2.new(math.huge, math.huge))
			checkRow()
			
			LocalTab.main = library:create("Frame", {
				Size = UDim2.new(1,0,0,0),
				BackgroundColor3 = library.colors.tabselected,
				BorderColor3 = library.colors.outline,
				Parent = self.row
			})
			
			LocalTab.title = library:create("TextLabel", {
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,12,0,0),
				Size = UDim2.new(0,bounds.X + 8,0,2),
				BackgroundColor3 = library.colors.tabselected,
				BorderSizePixel = 0,
				Text = title,
				TextColor3 = library.colors.text,
				TextStrokeTransparency = library.settings.textstroke and 0 or 1,
				Font = library.settings.font,
				TextSize = library.settings.textsize,
				Parent = LocalTab.main
			})
			
			LocalTab.content = library:create("Frame", {
				
				Size = UDim2.new(1,0,1,0),
				BackgroundTransparency = 1,
				Parent = LocalTab.main
			})
			
			LocalTab.layout = library:create("UIListLayout", {
				Padding = UDim.new(0,4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = LocalTab.content
			})
			
			LocalTab.padding = library:create("UIPadding", {
				PaddingLeft = UDim.new(0,6),
				PaddingRight = UDim.new(0,6),
				PaddingTop = UDim.new(0,12),
				Parent = LocalTab.content
			})
			
			function LocalTab:AddLabel(text)
				local label = {}
				label.text = text
				checkRow()
				LocalTab.main.Parent = tab.row
				
				label.label = library:create("TextLabel", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = LocalTab.content
				})
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
				self.order = self.order + 1
				
				return label
			end
			
			function LocalTab:AddButton(text, _function)
				local button = {}
				_function = _function or function() end
				checkRow()
				LocalTab.main.Parent = tab.row
				
				button.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = self.content,
				})
				
				self.order = self.order + 1
				
				button.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						_function()
					end
				end)
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
				return button
			end
			
			function LocalTab:AddToggle(text, _function)
				local toggle = {state = false}
				_function = _function or function() end
				checkRow()
				LocalTab.main.Parent = tab.row
				
				toggle.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = self.content,
				})
				
				toggle.holder = library:create("Frame", {
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(1,-1,0.5,0),
					Size = UDim2.new(0,-library.settings.textsize+4,0,library.settings.textsize-4),
					BackgroundColor3 = library.colors.tabholder,
					BorderSizePixel = 2,
					BorderColor3 = library.colors.main,
					Parent = toggle.button,
				})
				
				toggle.visualize = library:create("Frame", {
					Position = UDim2.new(0,0,0,0),
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1,
					BackgroundColor3 = library.colors.theme,
					BorderSizePixel = 0,
					Parent = toggle.holder,
				})
				
				self.order = self.order + 1
				
				function toggle:SetToggle(state)
					toggle.state = state
					if toggle.state then
						toggle.visualize.BackgroundTransparency = 0
					else
						toggle.visualize.BackgroundTransparency = 1	
					end
					return _function(toggle.state)
				end
				
				toggle.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						toggle.state = not toggle.state
						toggle:SetToggle(toggle.state)
					end
				end)
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
				return toggle
			end
			
			function LocalTab:AddBox(text, txtval, _function, keep)
				local box = {value = ""}
				if txtval then
					if typeof(txtval) == "function" then
						_function = txtval
						txtval = ""
					elseif typeof(txtval) == "string" then
						box.value = txtval
					end
				end
				if keep then
					if typeof(keep) == "string" then
						keep = false
					end
				end
				_function = _function or function() end
				checkRow()
				LocalTab.main.Parent = tab.row
				
				box.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				box.box = library:create("TextBox", {
					Position = UDim2.new(0,0,0,19),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.colors.tabholder,
					BorderColor3 = library.colors.main,
					Text = txtval,
					TextColor3 = library.colors.text,
					PlaceholderText = "",
					PlaceholderColor3 = library.colors.tabbutton,
					Font = library.settings.font,
					TextSize = library.settings.textsize-2,
					TextWrapped = true,
					Parent = box.button,
				})
				
				self.order = self.order + 1
				
				box.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						box.box:CaptureFocus()
					end
				end)
				
				box.box.FocusLost:connect(function(enter)
					if keep then
						if box.box.Text == "" then
							box.box.Text = box.value
							return
						else
							box.value = box.box.Text
						end
					end
					return _function(box.box.Text, enter)
				end)
				
				UserInputService.InputBegan:connect(function(input)
					if input.KeyCode == Enum.KeyCode.Escape and box.box:IsFocused() then
						box.box:ReleaseFocus()
					end
				end)
				
				function box:SetValue(value)
					box.value = value
					box.box.Text = box.value
					return _function(box)
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)
				
				return box
			end
			
			function LocalTab:AddDropdown(text, options, _function, push)
				_function = _function or function() end
				local dropdown = {order = 0, closed = true, value = options[1]}
				dropdown.content = {}
				checkRow()
				LocalTab.main.Parent = tab.row
				
				dropdown.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				dropdown.label = library:create("TextLabel", {
					Position = UDim2.new(0,0,0,19),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.colors.tabholder,
					BorderColor3 = library.colors.main,
					Text = dropdown.value,
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = dropdown.button,
				})
				
				dropdown.arrow = library:create("TextLabel", {
					Position = UDim2.new(1,0,0,2),
					Size = UDim2.new(0,-16,0,16),
					Rotation = 90,
					BackgroundTransparency = 1,
					Text = ">",
					TextColor3 = library.colors.tabbutton,
					Font = Enum.Font.Arcade,
					TextSize = 18,
					Parent = dropdown.label,
				})
				
				dropdown.container = library:create("Frame", {
					ZIndex = 2,
					Position = UDim2.new(0,0,1,3),
					BackgroundTransparency = 1,
					Visible = false,
					Parent = dropdown.label,
				})
				
				dropdown.contentholder = library:create("ScrollingFrame", {
					ZIndex = 2,
					ClipsDescendants = true,
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 0,
					BorderSizePixel = 1,
					BackgroundColor3 = library.colors.tabholder,
					BorderColor3 = library.colors.outline,
					CanvasSize = UDim2.new(0,0,0,0),
					ScrollBarThickness = 0,
					Visible = true,
					Parent = dropdown.container,
				})
				
				dropdown.layout = library:create("UIListLayout", {
					Padding = UDim.new(0,0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = dropdown.contentholder
				})
				
				self.order = self.order + 1
				
				dropdown.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						focusOnOption(dropdown.container)
						closeWindow(dropdown.container)
						ddcheck = dropdown
						dropdown.closed = not dropdown.closed
						if dropdown.closed then
							dropdown.arrow.Text = ">"
							dropdown.container.Visible = false
						else
							dropdown.arrow.Text = "<"
							dropdown.container.Visible = true
						end
					end
				end)
				
				local function addOptions(options)
					for _,value in pairs(options) do
						dropdown.order = dropdown.order+1
						
						local option = library:create("TextButton", {
							ZIndex = dropdown.contentholder.ZIndex,
							LayoutOrder = dropdown.order,
							Size = UDim2.new(1,0,0,18),
							BackgroundTransparency = 0,
							BackgroundColor3 = library.colors.tabholder,
							BorderColor3 = library.colors.tabbutton,
							Text = value,
							TextColor3 = library.colors.text,
							Font = library.settings.font,
							TextSize = library.settings.textsize,
							AutoButtonColor = false,
							Parent = dropdown.contentholder,
						})
						
						option.MouseButton1Click:connect(function()
							dropdown.value = value
							if push then
								for _,v in pairs(dropdown.content) do
									if v.LayoutOrder < option.LayoutOrder then
										v.LayoutOrder = v.LayoutOrder + 1
									end
								end
								option.LayoutOrder = 1
							end
							dropdown.label.Text = dropdown.value
							dropdown.closed = true
							dropdown.arrow.Text = ">"
							dropdown.container.Visible = false
							return _function(dropdown.value)
						end)
						
						if dropdown.order > 5 then
							dropdown.contentholder.CanvasSize = UDim2.new(0,0,0,dropdown.layout.AbsoluteContentSize.Y)
						else
							dropdown.container.Size = UDim2.new(1,0,0,dropdown.layout.AbsoluteContentSize.Y)
						end
						
						table.insert(dropdown.content, dropdown.order, option)
					end
				end
				
				addOptions(options)
				
				function dropdown:Refresh(options, keep)
					if not keep then
						for _,v in pairs(dropdown.contentholder:GetChildren()) do
							if v:IsA"TextButton" then
								v:Destroy()
								dropdown.order = dropdown.order - 1
								dropdown.contentholder.CanvasSize = UDim2.new(0,0,0,dropdown.layout.AbsoluteContentSize.Y)
							end
						end
					end
					addOptions(options)
				end
				
				function dropdown:SetValue(value)
					dropdown.value = value
					dropdown.label.Text = dropdown.value
					return _function(dropdown.value)
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)
				
				return dropdown
			end
			
			function LocalTab:AddSlider(text, maxVal, setVal, _function, float, incrementalMode)
				if setVal then
					if typeof(setVal) == "function" then
						if _function then
							if typeof(_function) == "number" then
								incrementalMode = float
								float = _function
							elseif typeof(_function) == "boolean" then
								incrementalMode = _function
								float = nil
							end
						end
						_function = setVal
						setVal = 0
					else
						if float then
							if typeof(float) == "boolean" then
								incrementalMode = float
								float = nil
							end
						end
					end
				end
				if setVal > maxVal then
					setVal = maxVal
				end
				if setVal < 0 then
					setVal = 0
				end
				_function = _function or function() end
				local slider = {value = setVal}
				checkRow()
				LocalTab.main.Parent = tab.row
				
				slider.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				slider.holder = library:create("Frame", {
					Position = UDim2.new(0,0,0,18),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 1,
					Parent = slider.button,
				})
				
				slider.visualize = library:create("TextBox", {
					Position = UDim2.new(0,0,0.5,0),
					Size = UDim2.new(1,0,0.5,0),
					BackgroundTransparency = 1,
					Text = tostring(slider.value),
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize-2,
					TextWrapped = true,
					Parent = slider.holder,
				})
				
				slider.sliderbar = library:create("Frame", {
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(0.5,0,0.2,0),
					Size = UDim2.new(1,-6,0,4),
					BackgroundColor3 = library.colors.tabholder,
					BorderColor3 = library.colors.main,
					Parent = slider.holder,
				})
				
				slider.sliderfill = library:create("Frame", {
					Size = UDim2.new(slider.value/maxVal,0,1,0),
					BackgroundColor3 = library.colors.theme,
					BorderSizePixel = 0,
					Parent = slider.sliderbar,
				})
				
				slider.sliderbox = library:create("Frame", {
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(slider.value/maxVal,0,0.5,0),
					Size = UDim2.new(0,4,0,12),
					BackgroundColor3 = library.colors.main,
					BorderSizePixel = 0,
					Parent = slider.sliderbar,
				})
				
				self.order = self.order + 1
				
				local function updateValue()
					slider.value = round(slider.value*maxVal, float)
					if slider.value > maxVal then
						slider.value = maxVal
					end
					if slider.value < 0 then
						slider.value = 0
					end
					if incrementalMode then
						slider.sliderbox.Position = UDim2.new(slider.value/maxVal,0,0.5,0)
						slider.sliderfill.Size = UDim2.new(slider.value/maxVal,0,1,0)
					else
						slider.sliderbox:TweenPosition(UDim2.new(slider.value/maxVal,0,0.5,0), "Out", "Quad", 0.1, true)
						slider.sliderfill:TweenSize(UDim2.new(slider.value/maxVal,0,1,0), "Out", "Quad", 0.1, true)
					end
					slider.visualize.Text = slider.value
					_function(slider.value)
				end
				
				local function updateSlider(input)
					local relativePos = input.Position.X- slider.sliderbar.AbsolutePosition.X
					if input.Position.X < slider.sliderbar.AbsolutePosition.X then
						relativePos = 0
					end
					if relativePos > slider.sliderbar.AbsoluteSize.X then
						relativePos = slider.sliderbar.AbsoluteSize.X
					end
					slider.value = relativePos/slider.sliderbar.AbsoluteSize.X
					updateValue()
				end
				
				local sliding
				local modifying
				slider.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
							modifying = true
							slider.visualize:CaptureFocus()
						else
							sliding = true
							updateSlider(input)
						end
					end
				end)
				
				slider.visualize.Focused:connect(function()
					if not modifying then
						slider.visualize:ReleaseFocus()
					end
				end)
				
				slider.visualize.FocusLost:connect(function()
					if modifying then
						slider.value = (tonumber(slider.visualize.Text) or 0)/maxVal
						updateValue()
					end
					modifying = false
				end)
				
				slider.button.InputEnded:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						sliding = false
					end
				end)
				
				UserInputService.InputChanged:connect(function(input)
					if modifying then
						if input == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Space then
							slider.visualize:ReleaseFocus()
						end
					end
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						if sliding then
							updateSlider(input)
						end
					end
				end)
				
				function slider:SetValue(num)
					slider.value = num/maxVal
					updateValue()
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)
				
				return slider
			end
				
			function LocalTab:AddKeybind(text, key, _function, hold)
				if key and typeof(key) == "function" then
					hold = _function
					_function = key
					key = Enum.KeyCode.F
				end
				if typeof(key) == "string" then
					if not keyCheck(Enum.KeyCode[key:upper()], blacklistedKeys) then
						key = Enum.KeyCode[key:upper()]
					end
					if keyCheck(key, whitelistedMouse) then
						key = Enum.UserInputType[key:upper()]
					end
				end
				_function = _function or function() end
				local bind = {binding = false, holding = false, key = key, hold = hold}
				local bounds = game:GetService('TextService'):GetTextSize(bind.key.Name, library.settings.textsize, library.settings.font, Vector2.new(math.huge, math.huge))
				checkRow()
				LocalTab.main.Parent = tab.row
				
				bind.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 4),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.content,
				})
				
				bind.label = library:create("TextLabel", {
					Position = UDim2.new(1,0,0,2),
					Size = UDim2.new(0,-bounds.X-8,1,-4),
					BackgroundColor3 = library.colors.tabholder,
					BorderColor3 = library.colors.main,
					Text = bind.key.Name,
					TextColor3 = library.colors.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = bind.button,
				})
				
				self.order = self.order + 1
				
				bind.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						bind.label.Text = "..."
						bind.label.Size = UDim2.new(0,-bind.label.TextBounds.X-8,1,-4)
					end
				end)
				
				bind.button.InputEnded:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						bind.binding = true
					end
				end)
				local function setKey(key)
					bind.key = key
					bind.label.Text = bind.key.Name
					bind.label.Size = UDim2.new(0,-bind.label.TextBounds.X-8,1,-4)
				end
				
				local a = tick()
				local function holdKey()
					RunService:BindToRenderStep(a .. bind.key.Name, 1, function()
						if bind.holding == false or not bind.hold then
							RunService:UnbindFromRenderStep(a .. bind.key.Name)
						end
						_function()
					end)
					return _function(true)
				end
				
				UserInputService.InputBegan:connect(function(input)
					if bind.binding then
						if input.KeyCode == Enum.KeyCode.Backspace then
							setKey(bind.key)
							bind.binding = false
						else
							if not keyCheck(input.KeyCode, blacklistedKeys) then
								setKey(input.KeyCode)
								bind.binding = false
							end
							if keyCheck(input.UserInputType, whitelistedMouse) then
								setKey(input.UserInputType)
								bind.binding = false
							end
						end
					else
						if library.settings.modal and window.main.Visible then
							return
						end
						if input.KeyCode.Name == bind.key.Name or input.UserInputType.Name == bind.key.Name then
							bind.holding = true
							if bind.hold then
								holdKey()
							else
								_function()
							end
						end
					end
				end)
				
				UserInputService.InputEnded:connect(function(input)
					if input.KeyCode.Name == bind.key.Name then
						bind.holding = false
					end
					if input.UserInputType.Name == bind.key.Name then
						bind.holding = false
					end
				end)
				
				function bind:SetKeybind(key)
					if typeof(key) == "string" then
						if not keyCheck(Enum.KeyCode[key:upper()], blacklistedKeys) then
							key = Enum.KeyCode[key:upper()]
						end
						if keyCheck(key, whitelistedMouse) then
							key = Enum.UserInputType[key:upper()]
						end
					end
					if key ~= bind.key then
						RunService:UnbindFromRenderStep(a .. bind.key.Name)
					end
					setKey(key)
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
				return bind
			end
				
			function LocalTab:AddCP(text, color3, _function, alpha)
				if color3 then
					if typeof(color3) == "function" then
						_function = color3
						color3 = Color3.fromRGB()
					end
				end
				_function = _function or function() end
				local red, green, blue = color3.r*255, color3.g*255, color3.b*255
				_function = _function or function() end
				local color = {color = color3, alpha = alpha}
				cphue, cpsat, cpval = rgbToHsv(red,green,blue)
				checkRow()
				LocalTab.main.Parent = tab.row
				
				color.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 4),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.colors.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.content,
				})
				
				color.visualizebg = library:create("ImageLabel", {
					Position = UDim2.new(1,-1,0,3),
					Size = UDim2.new(0,-24,0,12),
					BorderSizePixel = 2,
					BorderColor3 = library.colors.main,
					Image = "rbxassetid://3887014957",
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0,8,0,8),
					Parent = color.button
				})
				
				color.visualize = library:create("Frame", {
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = color.alpha,
					BackgroundColor3 = color.color,
					BorderSizePixel = 0,
					Parent = color.visualizebg,
				})
				
				color.container = library:create("TextButton", {
					ZIndex = 2,
					Position = UDim2.new(0,-3,0,0),
					Size = UDim2.new(0,-150,0,150),
					BackgroundColor3 = library.colors.tabholder,
					BorderColor3 = library.colors.outline,
					AutoButtonColor = false,
					Visible = false,
					Parent = color.visualize
				})
				
				color.HueSat = library:create("ImageLabel", {
					ZIndex = 2,
					Position = UDim2.new(0,5,0,5),
					Size = UDim2.new(1,-25,1,-25),
					BorderColor3 = library.colors.outline,
					Image = "rbxassetid://698052001",
					Parent = color.container
				})
				
				color.pointer = library:create("Frame", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(1-cphue,0,1-cpsat,0),
					Size = UDim2.new(0,4,0,4),
					Rotation = 45,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BorderColor3 = Color3.fromRGB(0,0,0),
					Parent = color.HueSat
				})
				
				color.Value = library:create("ImageLabel", {
					ZIndex = 2,
					Position = UDim2.new(1,-15,0,5),
					Size = UDim2.new(0,10,1,-25),
					BorderColor3 = library.colors.outline,
					Image = "rbxassetid://3641079629",
					Parent = color.container
				})
				
				color.pointer2 = library:create("TextLabel", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(1,-10,1-cpval,0),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					Text = "◄",
					TextColor3 = Color3.fromRGB(0,0,0),
					TextStrokeTransparency = 0,
					TextStrokeColor3 = Color3.fromRGB(130,130,130),
					TextSize = 6,
					Parent = color.Value
				})
				
				color.alphabg = library:create("ImageLabel", {
					ZIndex = 2,
					Position = UDim2.new(0,5,1,-15),
					Size = UDim2.new(1,-25,0,10),
					BorderColor3 = library.colors.outline,
					Image = "rbxassetid://3887014957",
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0,10,0,10),
					Parent = color.container
				})
				
				color.Alpha = library:create("ImageLabel", {
					ZIndex = 2,
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1,
					Image = "rbxassetid://3887017050",
					ImageColor3 = color3,
					Parent = color.alphabg
				})
				
				color.pointer3 = library:create("TextLabel", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5,0),
					Position = UDim2.new(color.alpha,0,1,-10),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					Text = "▲",
					TextColor3 = Color3.fromRGB(0,0,0),
					TextStrokeTransparency = 0,
					TextStrokeColor3 = Color3.fromRGB(130,130,130),
					TextSize = 6,
					Parent = color.Alpha
				})
				
				self.order = self.order + 1
				
				color.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						focusOnOption(color.container)
						closeWindow(color.container)
						color.container.Visible = not color.container.Visible
						if color.container.Visible then
							cphue, cpsat, cpval = rgbToHsv(red,green,blue)
						end
					end
				end)
				
				color.container.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						focusOnOption(color.container)
					end
				end)
				
				color.HueSat.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						cppicking = true
						input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								cppicking = false
							end
						end)
						x, y, cphue, cpsat = updateHueSat(input, color.HueSat, cphue, cpsat)
						color.pointer.Position = UDim2.new(x,0,y,0)
						color.color = Color3.fromHSV(cphue,cpsat,cpval)
						color.visualize.BackgroundColor3 = color.color
						color.Alpha.ImageColor3 = color.color
						cpt = color
						cpf = _function
						return _function(color.color)
					end
				end)
				
				color.Value.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						cppickingVal = true
						input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								cppickingVal = false
							end
						end)
						local y, cpval = updateValue(input, color.Value, cpval)
						color.pointer2.Position = UDim2.new(1,-10,y,0)
						color.color = Color3.fromHSV(cphue,cpsat,cpval)
						color.visualize.BackgroundColor3 = color.color
						color.Alpha.ImageColor3 = color.color
						cpt = color
						cpf = _function
						return _function(color.color)
					end
				end)
				
				color.Alpha.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						cppickingAlpha = true
						input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								cppickingAlpha = false
							end
						end)
						local x, cpalpha = updateAlpha(input, color.Alpha, cpalpha)
						color.pointer3.Position = UDim2.new(x,0,1,-10)
						color.alpha = 1-cpalpha
						cpt = color
						cpf = _function
						return _function(color.color, color.alpha)
					end
				end)
				
				function color:SetColor(newColor)
					color.color = newColor
					local red, green, blue = newColor.r*255, newColor.g*255, newColor.b*255
					local hue, sat, val = rgbToHsv(red,green,blue)
					color.pointer.Position = UDim2.new(1-hue,0,1-sat,0)
					color.pointer2.Position = UDim2.new(1,-10,1-val,0)
					color.visualize.BackgroundColor3 = color.color
					color.Alpha.ImageColor3 = color.color
					_function(color.color)
				end
				
				function color:SetAlpha(newAlpha)
					color.alpha = newAlpha
					color.pointer3.Position = UDim2.new(color.alpha,0,1,-10)
					color.visualize.BackgroundTransparency = color.alpha
					_function(color.color, color.alpha)
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
				return color
			end
				
			return LocalTab
		end
		
		return tab
	end
	
	return window
end

UserInputService.InputBegan:connect(function(input)
	if input.KeyCode == library.settings.toggle then
		library.pointer.Visible = not library.pointer.Visible
		for _, window in next, library.windows do
			if window.close == true then
				window.main.Visible = not window.main.Visible
			else
				if not window.main.Visible then
					window.main.Visible = true
				end
			end
		end
		if library.windows[1].main.Visible and library.settings.modal then
			library.windows[1].main.Modal = library.windows[1].main.Visible
		end
	end
end)

UserInputService.InputChanged:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and library.pointer then
		library.pointer.Position = UDim2.new(0,UserInputService:GetMouseLocation().X,0,UserInputService:GetMouseLocation().Y-36)
	end
end)

--//tHe LitEraL sTaRt\\--
if game:GetService('CoreGui'):FindFirstChild('ScreenGui') then 
    game:GetService('CoreGui').ScreenGui:Destroy()
end

local Services = setmetatable({},{__index = function(self,req) return game:GetService(req) end});

local Clients = Services.Players;
local Client = Services.Players.LocalPlayer;

local Mouse = Client:GetMouse();
local UIS = Services.UserInputService;

local VersionX = '0.002 Beta';
local Tick = tick();

local V = 0;
local FogVal = 999999999

local cam = workspace.CurrentCamera;
local Mouse = Client:GetMouse();

function zigzag(X) 
    return math.acos(math.cos(X*math.pi))/math.pi;
end

local counter1 = 1;

local VectorVal = Vector3.new(math.random(-10,10),0,math.random(-10,10))

local mt = getrawmetatable(game)
setreadonly(mt, false)

local oldnewindex = mt.__newindex
local oldindex = mt.__index

setreadonly(mt, false);

mt.__index = newcclosure(function(t, k)
    if tostring(k) == "WalkSpeed" then
        return 16
    end
    if tostring(k) == "JumpPower" then
        return 50
    end
    if tostring(k) == "Gravity" then
        return 196.19999694824
    end

    return oldindex(t, k)
end)

local window = library:CreateWindow'i dont even fucking know 0.001 beta'
library.settings.footer = 'Programmed by ThisW0ntGetBanned'

local ScreenGui = game:GetService'CoreGui'.ScreenGui
local TxT = ScreenGui.TextButton.TextLabel

local tab = window:CreateTab("Rendering Cheats")

window.footer.BorderColor3 = Color3.fromRGB(70,70,70)
window.main.BorderColor3 = Color3.fromRGB(70,70,70)

library.colors.outline = Color3.fromRGB(70,70,70)
library.colors.tabselected = Color3.fromRGB(24, 24, 24)

tab.main.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
tab.main.BorderSizePixel = 1
tab.main.BorderColor3 = Color3.fromRGB(70,70,70)

window.tabholder.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
window.tabholder.BorderColor3 = Color3.fromRGB(70,70,70)

tab.button.BorderColor3 = Color3.fromRGB(70,70,70)

--//Tab Selection\\--
local PlayerRenderCheats = tab:AddLocalTab("Player Rendering")

PlayerRenderCheats:AddToggle("Player Esp", function(state) if state then
	local function AddEsp(Players, ...)
		local CharacterEsp = Instance.new('BillboardGui', Players.Character.Head)
		CharacterEsp.Adornee = Players.Character.Head;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false
		CharDistance.TextSize = 8

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Players.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Players.Character.Head.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

	for k, x in next, Services.Players:GetChildren() do
		if x.Name ~= Client.Name then
			AddEsp(x)
		end
	end
else
	for k, x in next, workspace:GetChildren() do
		for i, v in next, x:GetChildren() do
			for a, b in next, v:GetChildren() do
				if b.ClassName == 'BillboardGui' then
					b:Destroy()
				end
			end
		end
	end
end
end)

local RenderCheats = tab:AddLocalTab("Ore Rendering")

local GameRocks = Instance.new('Folder', game.CoreGui)
GameRocks.Name = 'GameRocks'

RenderCheats:AddToggle("Stone Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.GameRocks)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.Extents.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Rock' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.GameRocks:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local SilveRocks = Instance.new('Folder', game.CoreGui)
SilveRocks.Name = 'SilveRocks'

RenderCheats:AddToggle("Silver Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.SilveRocks)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(0, 85, 255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items['Meshes/Ore Rock 2_Gems'].Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Silver Rock' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.SilveRocks:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local GoldRocks = Instance.new('Folder', game.CoreGui)
GoldRocks.Name = 'GoldRocks'

RenderCheats:AddToggle("Gold Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.GoldRocks)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255, 255, 0)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items['Meshes/Ore Rock 2_Gems'].Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Gold Rock' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.GoldRocks:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local RubyRocks = Instance.new('Folder', game.CoreGui)
RubyRocks.Name = 'RubyRocks'

RenderCheats:AddToggle("Ruby Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.RubyRocks)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255, 0, 0)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items['Meshes/Ore Rock 2_Gems'].Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Ruby Rock' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.RubyRocks:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local DiamondRocks = Instance.new('Folder', game.CoreGui)
DiamondRocks.Name = 'DiamondRocks'

RenderCheats:AddToggle("Diamond Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.DiamondRocks)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(170, 255, 255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items['Meshes/Ore Rock 2_Gems'].Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Diamond Rock' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.DiamondRocks:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local ObjectCheats = tab:AddLocalTab("Object Rendering")

local CowFolder = Instance.new('Folder', game.CoreGui)
CowFolder.Name = 'CowFolder'

ObjectCheats:AddToggle("Cow Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.CowFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.HumanoidRootPart.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Cow' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.CowFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local ReindeerFolder = Instance.new('Folder', game.CoreGui)
ReindeerFolder.Name = 'ReindeerFolder'

ObjectCheats:AddToggle("Reindeer Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.ReindeerFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.HumanoidRootPart.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Reindeer' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.ReindeerFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local ChickenFolder = Instance.new('Folder', game.CoreGui)
ChickenFolder.Name = 'ChickenFolder'

ObjectCheats:AddToggle("Chicken Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.ChickenFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.HumanoidRootPart.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Chicken' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.ChickenFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local TreeFolder = Instance.new('Folder', game.CoreGui)
TreeFolder.Name = 'TreeFolder'

ObjectCheats:AddToggle("Tree Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.TreeFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items["Meshes/Conifer 2_Trunk"].Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Conifer' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.TreeFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local PalmTreeFolder = Instance.new('Folder', game.CoreGui)
PalmTreeFolder.Name = 'PalmTreeFolder'

ObjectCheats:AddToggle("Palm Tree Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.PalmTreeFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items["Meshes/Palm Tree_Coconuts "].Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Palm Tree' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.PalmTreeFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local SilverChests = Instance.new('Folder', game.CoreGui)
SilverChests.Name = 'SilverChests'

RenderCheats:AddToggle("Silver Chest Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.SilverChests)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.Extents.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Silver Storage Chest' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.SilverChests:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local WoodenChests = Instance.new('Folder', game.CoreGui)
WoodenChests.Name = 'WoodenChests'

RenderCheats:AddToggle("Wooden Chest Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.WoodenChests)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.Extents.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Wood Storage Chest' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.WoodenChests:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local FoodCheats = tab:AddLocalTab("Object Rendering")

local WatermelonFolder = Instance.new('Folder', game.CoreGui)
WatermelonFolder.Name = 'WatermelonFolder'

FoodCheats:AddToggle("Watermelon Patch Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.WatermelonFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.Part.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Watermelon Patch' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.WatermelonFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local RedBerryFolder = Instance.new('Folder', game.CoreGui)
RedBerryFolder.Name = 'RedBerryFolder'

FoodCheats:AddToggle("Red Berry Bush Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.RedBerryFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.Berries.Berry.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Redberry Bush' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.RedBerryFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local CabbageFolder = Instance.new('Folder', game.CoreGui)
CabbageFolder.Name = 'CabbageFolder'

FoodCheats:AddToggle("Cabbage Esp", function(state) if state then
	local function AddItemEsp(Items, ...)
		local CharacterEsp = Instance.new('BillboardGui', game.CoreGui.CabbageFolder)
		CharacterEsp.Adornee = Items;
		CharacterEsp.AlwaysOnTop = true
		CharacterEsp.Enabled = true
		CharacterEsp.Active = false
		CharacterEsp.Size = UDim2.new(0, 25, 0, 12.5)

		local CharDistance = Instance.new('TextLabel', CharacterEsp)
		CharDistance.Size = UDim2.new(0, 25, 0, 12.5)
		CharDistance.BackgroundColor3 = Color3.new(0, 255, 0)
		CharDistance.TextColor3 = Color3.new(255,255,255)
		CharDistance.BackgroundTransparency = 1
		CharDistance.TextScaled = false

		spawn(function()
			while true do
				for i = 1, 30 do
					wait(0.1)
					CharDistance.Text = ' '..Items.Name.."  \n "..'['..math.floor((Client.Character.Head.Position - Items.Part.Position).magnitude)..']'
				end;
				wait(0.1)
			end
		end)
	end

    for k, x in next, workspace:GetChildren() do
        if x.Name == 'Cabbage Patch' then
            AddItemEsp(x)
        end
    end
else
	for k, x in next, game.CoreGui.CabbageFolder:GetChildren() do
		if x:IsA('BillboardGui') then
			x:Destroy()
		end
	end
end
end)

local CharCheats = tab:AddLocalTab("Character Cheats")

CharCheats:AddButton("40 Speed[Walk Speed]", function() 
    mt.__newindex = newcclosure(function(t, k, v)
		if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
			if t == game:GetService("Players").LocalPlayer.Character.Humanoid and tostring(k) == "WalkSpeed" then -- More WalkSpeed
				return oldnewindex(t, k, 40)
			end
		end
		return oldnewindex(t, k, v)
	end)
end)

CharCheats:AddToggle("No Clip", function(state) if state then
	Stepped = game:GetService("RunService").Stepped:Connect(function()
		for a, b in next, workspace:GetChildren() do
			if b.Name == Client.Name then
				for k, x in next, workspace[Client.Name]:GetChildren() do
					if x:IsA'BasePart' then
						x.CanCollide = false
					end
				end
			end
		end
	end)
else
	Stepped:Disconnect()
end
end)

game:GetService("UserInputService").InputBegan:Connect(function(key,ischat)
    if ischat then return end
    if key.KeyCode == Enum.KeyCode.P then
		ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

while wait() do
	TxT.TextColor3 = Color3.fromHSV(zigzag(counter1),1,1)
	counter1 = counter1 + 0.01
end