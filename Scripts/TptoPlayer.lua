local gui = Instance.new("ScreenGui")
gui.Name = "Teleport GUI"
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 70)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.new(1, 1, 1)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Text = "Teleport to player:"
label.Position = UDim2.new(0, 5, 0, 5)
label.Size = UDim2.new(0, 100, 0, 20)
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Parent = frame

local textbox = Instance.new("TextBox")
textbox.Position = UDim2.new(0, 5, 0, 25)
textbox.Size = UDim2.new(0, 140, 0, 20)
textbox.Text = ""
textbox.ClearTextOnFocus = true
textbox.Parent = frame

local button = Instance.new("TextButton")
button.Text = "Teleport"
button.Position = UDim2.new(0, 5, 0, 50)
button.Size = UDim2.new(0, 140, 0, 20)
button.Parent = frame

local madeBy = Instance.new("TextLabel")
madeBy.Text = "by @Roun95"
madeBy.Position = UDim2.new(0, 5, 0, 75)
madeBy.Size = UDim2.new(0, 140, 0, 20)
madeBy.TextColor3 = Color3.new(1, 1, 1)
madeBy.BackgroundTransparency = 1
madeBy.Parent = frame

button.MouseButton1Click:Connect(function()
    local targetName = textbox.Text
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), string.lower(targetName)) then
            game.Players.LocalPlayer.Character:MoveTo(player.Character.Head.Position)
            break
        end
    end
end)
