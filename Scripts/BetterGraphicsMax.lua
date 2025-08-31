local l = game.Lighting
local s = Instance.new("Sky", l)
local c = Instance.new("ColorCorrectionEffect", l)
local b = Instance.new("BloomEffect", l)
local sr = Instance.new("SunRaysEffect", l)
local bl = Instance.new("BlurEffect", l)

local model = game:GetService("Workspace"):FindFirstChild("Model")
if model then
	local function setMat(obj)
		for _, c in pairs(obj:GetChildren()) do
			if c:IsA("BasePart") then
				c.Material = Enum.Material.Basalt
			elseif c:IsA("Model") or c:IsA("Folder") then
				setMat(c)
			end
		end
	end
	if model:FindFirstChild("001_SnowStreet") then
		setMat(model["001_SnowStreet"])
	end
	if model:FindFirstChild("Street") then
		for _, o in pairs(model.Street:GetDescendants()) do
			if o:IsA("BasePart") then
				o.Material = Enum.Material.Basalt
			end
		end
	end
	for _, o in pairs(model:GetChildren()) do
		if o:IsA("BasePart") and (o.Name == "Sidewalk" or o.Name == "Wedge") and o.Material == Enum.Material.SmoothPlastic then
			o.Material = Enum.Material.Cobblestone
		end
	end
	model.ChildAdded:Connect(function(obj)
		if obj:IsA("BasePart") and (obj.Name == "Sidewalk" or obj.Name == "Wedge") and obj.Material == Enum.Material.SmoothPlastic then
			obj.Material = Enum.Material.Cobblestone
		end
	end)
end

l.Brightness = 2
l.GlobalShadows = true
l.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
l.FogColor = Color3.fromRGB(120, 130, 140)
l.FogStart = 80
l.FogEnd = 600
l.EnvironmentSpecularScale = 1
l.EnvironmentDiffuseScale = 0.5

s.MoonTextureId = "rbxassetid://9027816797"
s.SunTextureId = "rbxassetid://5560116180"
s.SkyboxBk = "rbxassetid://159454299"
s.SkyboxDn = "rbxassetid://159454296"
s.SkyboxFt = "rbxassetid://159454293"
s.SkyboxLf = "rbxassetid://159454286"
s.SkyboxRt = "rbxassetid://159454300"
s.SkyboxUp = "rbxassetid://159454304"

c.Brightness = 0.03
c.Contrast = 0.15
c.Saturation = 0.05
c.TintColor = Color3.fromRGB(255, 240, 220)

b.Intensity = 0.8
b.Size = 56
b.Threshold = 0.9

sr.Intensity = 0.05
sr.Spread = 0.8

bl.Size = 0