local f = Instance.new("TextLabel")
f.Parent = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
f.BackgroundTransparency = 1
f.Position = UDim2.new(0.9,0,0,0)
f.Size = UDim2.new(0,60,0,20)
f.Font = Enum.Font.SourceSans
f.TextColor3 = Color3.fromRGB(1,1,1)
f.TextSize = 18

local lastUpdate = tick()
local frameCount = 0
game:GetService("RunService").RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastUpdate >= 1 then
        f.Text = string.format("FPS: %f", frameCount / (currentTime - lastUpdate))
        frameCount = 0
        lastUpdate = currentTime
    end
end)
