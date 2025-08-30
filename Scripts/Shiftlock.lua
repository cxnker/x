local player = game.Players.LocalPlayer
local cam = workspace.CurrentCamera
local humanoid
local shiftLocked = false

-- GUI button
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShiftLockMobile"
local button = Instance.new("ImageButton", gui)
button.Size = UDim2.new(0,35,0,35)
button.Position = UDim2.new(0.9,0,0.9,0) -- Left of jump
button.BackgroundTransparency = 1
button.Image = "rbxassetid://106470362496957"

-- Toggle function
local function applyShiftLock(enabled)
	if humanoid then if enabled then
			humanoid.CameraOffset = Vector3.new(2,0,0)
			button.ImageColor3 = Color3.fromRGB(0,170,255)
			cam.CameraSubject = humanoid
			humanoid.AutoRotate = false
		else
			humanoid.CameraOffset = Vector3.new(0,0,0)
			button.ImageColor3 = Color3.fromRGB(255,255,255)
			humanoid.AutoRotate = true
		end
	end
end

local function toggle()
	shiftLocked = not shiftLocked
	applyShiftLock(shiftLocked)
end
button.MouseButton1Click:Connect(toggle)

-- Keep new characters updated
player.CharacterAdded:Connect(function(char)
	humanoid = char:WaitForChild("Humanoid")
	if shiftLocked then
		applyShiftLock(true)
	end
end)

-- Update humanoid reference for first spawn
if player.Character then
	humanoid = player.Character:FindFirstChildOfClass("Humanoid")
end

-- Align character to camera while shift locked
game:GetService("RunService").RenderStepped:Connect(function()
	if shiftLocked and humanoid and humanoid.RootPart then
		local lookVector = cam.CFrame.LookVector
		local flatLook = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
		humanoid.RootPart.CFrame = CFrame.new(humanoid.RootPart.Position, humanoid.RootPart.Position + flatLook)
	end
end)
