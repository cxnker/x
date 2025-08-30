local Vignette = true -- change to false if you don't want a shadow frame

local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local Bloom = Instance.new("BloomEffect")
local Blur = Instance.new("BlurEffect")
local ColorCor = Instance.new("ColorCorrectionEffect")
local SunRays = Instance.new("SunRaysEffect")
local Sky = Instance.new("Sky")
local Atmosphere = Instance.new("Atmosphere")
local DepthOfField = Instance.new("DepthOfFieldEffect")

for i, v in pairs(Lighting:GetChildren()) do
	if v then
		v:Destroy()
	end
end

Bloom.Parent = Lighting
Blur.Parent = Lighting
ColorCor.Parent = Lighting
SunRays.Parent = Lighting
Sky.Parent = Lighting
Atmosphere.Parent = Lighting
DepthOfField.Parent = Lighting

if Vignette == true then
	local Gui = Instance.new("ScreenGui")
	Gui.Parent = StarterGui
	Gui.IgnoreGuiInset = true
	
	local ShadowFrame = Instance.new("ImageLabel")
	ShadowFrame.Parent = Gui
	ShadowFrame.AnchorPoint = Vector2.new(0.5,1)
	ShadowFrame.Position = UDim2.new(0.5,0,1,0)
	ShadowFrame.Size = UDim2.new(1,0,1.05,0)
	ShadowFrame.BackgroundTransparency = 1
	ShadowFrame.Image = "rbxassetid://4576475446"
	ShadowFrame.ImageTransparency = 0.3
	ShadowFrame.ZIndex = 10
end

Bloom.Intensity = 0.5
Bloom.Size = 30
Bloom.Threshold = 0.6

Blur.Size = 7

ColorCor.Brightness = 0.1
ColorCor.Contrast = 0.5
ColorCor.Saturation = -0.3
ColorCor.TintColor = Color3.fromRGB(255, 235, 203)

DepthOfField.FarIntensity = 0.21
DepthOfField.FocusDistance = 15
DepthOfField.InFocusRadius = 50
DepthOfField.NearIntensity = 0.75

SunRays.Intensity = 0.075
SunRays.Spread = 0.727

Sky.CelestialBodiesShown = true
Sky.StarCount = 4500
Sky.SunAngularSize = 9
Sky.MoonAngularSize = 9
Sky.MoonTextureId = "http://www.roblox.com/asset/?id=9027816797"
Sky.SunTextureId = "http://www.roblox.com/asset/?id=5560116180"
Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=133184290"
Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=133184311"
Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=133184318"
Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=133184299"
Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=133184333"
Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=133184341"

Lighting.Ambient = Color3.fromRGB(2,2,2)
Lighting.Brightness = 0.1
Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
Lighting.EnvironmentDiffuseScale = 0.2
Lighting.EnvironmentSpecularScale = 0.2
Lighting.GlobalShadows = true
Lighting.ShadowSoftness = 0.2
Lighting.GeographicLatitude = 45
Lighting.ExposureCompensation = 0.5

Atmosphere.Density = 0.48
Atmosphere.Offset = 0.556
Atmosphere.Color = Color3.fromRGB(199, 175, 166)
Atmosphere.Decay = Color3.fromRGB(44, 39, 33)
Atmosphere.Glare = 0.36
Atmosphere.Haze = 1.72

script:Destroy()