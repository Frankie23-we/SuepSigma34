
-- Auto naik dan turun tower terus-menerus

local plr = game.Players.LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")

-- Lokasi atas tower (ganti sesuai yang kamu kasih)
local towerTop = Vector3.new(-36.27, 14403.73, -5148.75)

-- Lokasi bawah (biar dianggap turun)
local towerBottom = towerTop - Vector3.new(0, 15, 0) -- turun 15 stud

while true do
    -- Teleport ke atas tower
    hrp.CFrame = CFrame.new(towerTop)
    wait(1.5)

    -- Turun ke bawah
    hrp.CFrame = CFrame.new(towerBottom)
    wait(1.5)
end
