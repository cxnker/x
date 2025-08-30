local Lighting = game:GetService("Lighting")
Lighting.Brightness = 2
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
Lighting.FogColor = Color3.fromRGB(120, 130, 140)
Lighting.FogStart = 80
Lighting.FogEnd = 600
Lighting.EnvironmentSpecularScale = 1
Lighting.EnvironmentDiffuseScale = 0.5

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454304"
sky.Parent = Lighting

local color = Instance.new("ColorCorrectionEffect", Lighting)
color.Brightness = 0.03
color.Contrast = 0.15
color.Saturation = 0.05
color.TintColor = Color3.fromRGB(255, 240, 220)

local bloom = Instance.new("BloomEffect", Lighting)
bloom.Intensity = 0.8
bloom.Size = 56
bloom.Threshold = 0.9

local sunRays = Instance.new("SunRaysEffect", Lighting)
sunRays.Intensity = 0.05
sunRays.Spread = 0.8

local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0