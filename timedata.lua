-- Create a ScreenGui for the GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame to hold the clock
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 90, 0, 20) -- Adjust size as needed
frame.Position = UDim2.new(0.8, 0, 0, 0) -- Adjust position as needed
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.BorderSizePixel = 0
frame.Parent = gui

-- Create a TextLabel to display the time
local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(1, 0, 1, 0)
timeLabel.Position = UDim2.new(0, 0, 0, 0)
timeLabel.BackgroundTransparency = 1
timeLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
timeLabel.Font = Enum.Font.SourceSans
timeLabel.TextSize = 20
timeLabel.TextStrokeTransparency = 0
timeLabel.Parent = frame

-- Function to update the time label
local function updateTime()
    local currentTime = os.date("%I:%M:%S %p") -- Format: 12-hour clock with AM/PM
    timeLabel.Text = currentTime
end

-- Update the time label every second
while true do
    updateTime()
    wait(1)
end
