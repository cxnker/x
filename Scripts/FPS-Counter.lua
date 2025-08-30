repeat wait() until game:IsLoaded() wait(2)
local Gui = Instance.new("ScreenGui")
local Fps = Instance.new("TextLabel")

Gui.Parent = game.CoreGui
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Fps.Parent = Gui
Fps.BackgroundTransparency = 1
Fps.Position = UDim2.new(0.9, 0, 0, 0)
Fps.Size = UDim2.new(0,60,0,20)
Fps.Font = Enum.Font.SourceSans
Fps.TextColor3 = Color3.fromRGB(1,1,1)
Fps.TextScaled = true
Fps.TextSize = 18
Fps.TextWrapped = true

-- Scripts:
local script = Instance.new('LocalScript', Fps)
game:GetService("RunService").RenderStepped:Connect(function(frame) -- This will fire every time a frame is rendered
script.Parent.Text = ("FPS: "..math.round(1/frame)) 
end)
