-- Auto Coin GUI, versi "diam di atas tower"
local plr = game.Players.LocalPlayer
repeat wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
local hrp = plr.Character.HumanoidRootPart

local heightY = 14400
local farming = false
local delayTime = 3

-- GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AutoCoinStatic"

local function makeBox(name, posY, placeholder, callback)
	local box = Instance.new("TextBox", gui)
	box.Size = UDim2.new(0, 200, 0, 30)
	box.Position = UDim2.new(0, 20, 0, posY)
	box.PlaceholderText = placeholder
	box.Text = ""
	box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	box.TextColor3 = Color3.new(1,1,1)
	box.Font = Enum.Font.SourceSans
	box.TextSize = 14
	box.FocusLost:Connect(callback)
	return box
end

local function makeButton(posY, text, callback)
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

makeBox("HeightBox", 60, "Tinggi (Y) misal: 14400", function()
	local y = tonumber(gui.HeightBox.Text)
	if y then heightY = y end
end).Name = "HeightBox"

makeBox("DelayBox", 100, "Delay antar reward (detik)", function()
	local d = tonumber(gui.DelayBox.Text)
	if d then delayTime = d end
end).Name = "DelayBox"

makeButton(140, "Auto Coin: OFF", function(self)
	farming = not farming
	self.Text = farming and "Auto Coin: ON" or "Auto Coin: OFF"
	self.BackgroundColor3 = farming and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
end)

-- Farming logic
task.spawn(function()
	while true do
		if farming then
			local X = -36.27
			local Z = -5148.75
			local towerPos = Vector3.new(X, heightY, Z)
			hrp.CFrame = CFrame.new(towerPos)
			wait(delayTime)
		else
			wait(0.5)
		end
	end
end)
