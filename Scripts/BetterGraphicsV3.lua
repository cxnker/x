local l = game.Lighting
local s = Instance.new("Sky", l)
local c = Instance.new("ColorCorrectionEffect", l)
local b = Instance.new("BloomEffect", l)
local sr = Instance.new("SunRaysEffect", l)
local bl = Instance.new("BlurEffect", l)

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