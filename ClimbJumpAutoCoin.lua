
-- GUI Buatan Frankie23 + ChatGPT 😎
local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "AutoFarmGUI"

local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.05, 0, 0.3, 0)
button.BackgroundColor3 = Color3.new(0.2, 0.5, 1)
button.TextColor3 = Color3.new(1,1,1)
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.Text = "AutoFarm: OFF"

local autoFarm = false

button.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    button.Text = "AutoFarm: " .. (autoFarm and "ON" or "OFF")

    if autoFarm then
        -- AUTO JUMP + CLIMB
        spawn(function()
            while autoFarm do
                local char = plr.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.Jump = true
                    char:Move(Vector3.new(0,10,0))
                end
                wait(0.5)
            end
        end)

        -- AUTO COIN
        spawn(function()
            while autoFarm do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("TouchTransmitter") and v.Parent and v.Parent.Name:lower():find("coin") then
                        firetouchinterest(plr.Character.HumanoidRootPart, v.Parent, 0)
                        wait(0.1)
                        firetouchinterest(plr.Character.HumanoidRootPart, v.Parent, 1)
                    end
                end
                wait(0.5)
            end
        end)
    end
end)
