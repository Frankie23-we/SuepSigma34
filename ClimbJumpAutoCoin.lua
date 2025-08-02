
-- AUTO FARM DIAM DI ATAS TOWER
local plr = game.Players.LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")

-- Teleport ke posisi tower
local towerPosition = Vector3.new(-36.27, 14403.73, -5148.75)
task.wait(1)
hrp.CFrame = CFrame.new(towerPosition)

-- Tetap diam tapi sentuh semua coin sekitar
while true do
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent and v.Parent.Name:lower():find("coin") then
            firetouchinterest(hrp, v.Parent, 0)
            task.wait(0.1)
            firetouchinterest(hrp, v.Parent, 1)
        end
    end
    task.wait(1)
end
