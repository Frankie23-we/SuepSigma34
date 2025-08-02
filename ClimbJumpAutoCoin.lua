
-- Auto Coin Farming + GUI ON/OFF
local plr = game.Players.LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")

-- Posisi tower
local towerTop = Vector3.new(-36.27, 14403.73, -5148.75)
local towerBottom = towerTop - Vector3.new(0, 15, 0)

-- Buat GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local toggleBtn = Instance.new("TextButton", gui)

toggleBtn.Size = UDim2.new(0, 120, 0, 40)
toggleBtn.Position = UDim2.new(0, 30, 0, 100)
toggleBtn.Text = "Auto Coin: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 18
toggleBtn.BorderSizePixel = 0
toggleBtn.AutoButtonColor = true
toggleBtn.Visible = true

-- Script kontrol
local farming = false

toggleBtn.MouseButton1Click:Connect(function()
    farming = not farming
    if farming then
        toggleBtn.Text = "Auto Coin: ON"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    else
        toggleBtn.Text = "Auto Coin: OFF"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

-- Loop farming
task.spawn(function()
    while true do
        if farming and plr.Character and hrp then
            -- Naik
            hrp.CFrame = CFrame.new(towerTop)
            wait(2) -- Delay 2 detik di atas
            -- Turun
            hrp.CFrame = CFrame.new(towerBottom)
            wait(1.5)
        else
            wait(0.5)
        end
    end
end)
