here
local plr = game.Players.LocalPlayer
repeat wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
local hrp = plr.Character.HumanoidRootPart

local heightY = 14400
local delayTime = 3
local farming = false

-- GUI Setup
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AutoCoinGUI"

local function createBox(name, posY, placeholder, defaultText, callback)
	local box = Instance.new("TextBox", gui)
	box.Name = name
	box.Size = UDim2.new(0, 200, 0, 30)
	box.Position = UDim2.new(0, 20, 0, posY)
	box.PlaceholderText = placeholder
	box.Text = defaultText
	box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	box.TextColor3 = Color3.new(1,1,1)
	box.Font = Enum.Font.SourceSans
	box.TextSize = 14
	box.FocusLost:Connect(callback)
	return box
end

local function createButton(posY, text, callback)
	local btn = Instance.new("TextButton", gui)
	btn.Size = UDim2.new(0, 200, 0, 30)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 16
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- Input Height
createBox("HeightInput", 60, "Tinggi Y (1 - 14400)", tostring(heightY), function(box)
	local value = tonumber(box.Text)
	if value then
		value = math.clamp(value, 1, 14400)
		heightY = value
		box.Text = tostring(value)
	else
		box.Text = tostring(heightY)
	end
end)

-- Input Delay
createBox("DelayInput", 100, "Delay detik (1 - 20)", tostring(delayTime), function(box)
	local value = tonumber(box.Text)
	if value and value >= 1 and value <= 20 then
		delayTime = value
		box.Text = tostring(value)
	else
		box.Text = tostring(delayTime)
	end
end)

-- Toggle Button
local toggleBtn = createButton(140, "Auto Coin: OFF", function(self)
	farming = not farming
	self.Text = farming and "Auto Coin: ON" or "Auto Coin: OFF"
	self.BackgroundColor3 = farming and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
end)

-- Farming logic
task.spawn(function()
	while true do
		if
