local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSCounter"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a TextLabel to display the FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FPSLabel"
fpsLabel.Size = UDim2.new(0, 100, 0, 50)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.TextStrokeTransparency = 0.5
fpsLabel.Text = "FPS: 0"
fpsLabel.Font = Enum.Font.SourceSans
fpsLabel.TextSize = 24
fpsLabel.Parent = screenGui

-- Variables to calculate FPS
local lastUpdate = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastUpdate >= 1 then
        local fps = frameCount / (currentTime - lastUpdate)
        fpsLabel.Text = string.format("FPS: %.2f", fps)
        frameCount = 0
        lastUpdate = currentTime
    end
end)