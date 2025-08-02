
-- ✅ Climb + Jump + Auto Coin Script

-- AUTO JUMP + CLIMB
spawn(function()
    while true do
        wait(0.5)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Jump = true
            char:Move(Vector3.new(0, 10, 0))
        end
    end
end)

-- AUTO COLLECT COINS
spawn(function()
    while true do
        wait(1)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") and v.Parent and v.Parent.Name:lower():find("coin") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)
