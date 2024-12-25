-- AFEM v1.1.0

-- Instances:

local Converted = {
	["_AFEM"] = Instance.new("ScreenGui");
	["_Init"] = Instance.new("LocalScript");
	["_FUNCTIONS"] = Instance.new("ModuleScript");
	["_Notifications"] = Instance.new("Frame");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_UIPadding"] = Instance.new("UIPadding");
	["_Placeholder"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_TextLabel"] = Instance.new("TextLabel");
	["_SetCustomButtonEmote"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIStroke"] = Instance.new("UIStroke");
	["_UIGradient"] = Instance.new("UIGradient");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_UIScale"] = Instance.new("UIScale");
	["_TextLabel1"] = Instance.new("TextLabel");
	["_TextBox"] = Instance.new("TextBox");
	["_UICorner2"] = Instance.new("UICorner");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_TextLabel2"] = Instance.new("TextLabel");
	["_Add"] = Instance.new("TextButton");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIPadding2"] = Instance.new("UIPadding");
	["_UIStroke1"] = Instance.new("UIStroke");
	["_LocalScript"] = Instance.new("LocalScript");
	["_Cancel"] = Instance.new("TextButton");
	["_UICorner4"] = Instance.new("UICorner");
	["_UIPadding3"] = Instance.new("UIPadding");
	["_UIStroke2"] = Instance.new("UIStroke");
	["_LocalScript1"] = Instance.new("LocalScript");
	["_DraggableObject"] = Instance.new("ModuleScript");
	["_Menu"] = Instance.new("Frame");
	["_UICorner5"] = Instance.new("UICorner");
	["_UIScale1"] = Instance.new("UIScale");
	["_UIStroke3"] = Instance.new("UIStroke");
	["_UIGradient2"] = Instance.new("UIGradient");
	["_Animator"] = Instance.new("LocalScript");
	["_HubCredits"] = Instance.new("TextLabel");
	["_HubDesc"] = Instance.new("TextLabel");
	["_HubName"] = Instance.new("TextLabel");
	["_CanvasGroup"] = Instance.new("CanvasGroup");
	["_UICorner6"] = Instance.new("UICorner");
	["_ImageLabel"] = Instance.new("ImageLabel");
	["_Opener"] = Instance.new("TextButton");
	["_Area"] = Instance.new("Frame");
	["_Area1"] = Instance.new("ScrollingFrame");
	["_UIGridLayout"] = Instance.new("UIGridLayout");
	["_Sample"] = Instance.new("ImageButton");
	["_UICorner7"] = Instance.new("UICorner");
	["_UIStroke4"] = Instance.new("UIStroke");
	["_UIPadding4"] = Instance.new("UIPadding");
	["_ImageLabel1"] = Instance.new("ImageLabel");
	["_TextLabel3"] = Instance.new("TextLabel");
	["_UIPadding5"] = Instance.new("UIPadding");
	["_TextLabel4"] = Instance.new("TextLabel");
	["_TextBox1"] = Instance.new("TextBox");
	["_UICorner8"] = Instance.new("UICorner");
	["_UIPadding6"] = Instance.new("UIPadding");
	["_Search"] = Instance.new("LocalScript");
	["_Switch"] = Instance.new("TextButton");
	["_UICorner9"] = Instance.new("UICorner");
	["_UIPadding7"] = Instance.new("UIPadding");
	["_UIStroke5"] = Instance.new("UIStroke");
	["_UIGradient3"] = Instance.new("UIGradient");
	["_Switch1"] = Instance.new("LocalScript");
	["_UIGradient4"] = Instance.new("UIGradient");
	["_CloseArea"] = Instance.new("TextButton");
	["_Frame"] = Instance.new("Frame");
	["_UICorner10"] = Instance.new("UICorner");
	["_TextLabel5"] = Instance.new("TextLabel");
	["_UICorner11"] = Instance.new("UICorner");
	["_CloseOpen"] = Instance.new("LocalScript");
	["_Close"] = Instance.new("BindableEvent");
	["_ClickAndHold"] = Instance.new("ModuleScript");
	["_Spring"] = Instance.new("ModuleScript");
	["_EmoteList"] = Instance.new("LocalScript");
	["_FloatingButtons"] = Instance.new("Frame");
}

-- Properties:

Converted["_AFEM"].DisplayOrder = 3
Converted["_AFEM"].IgnoreGuiInset = true
Converted["_AFEM"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_AFEM"].ResetOnSpawn = false
Converted["_AFEM"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_AFEM"].Name = "AFEM"
Converted["_AFEM"].Parent = game:GetService("CoreGui")

Converted["_Notifications"].AnchorPoint = Vector2.new(1, 0.5)
Converted["_Notifications"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Notifications"].BackgroundTransparency = 1
Converted["_Notifications"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Notifications"].BorderSizePixel = 0
Converted["_Notifications"].Position = UDim2.new(0.99000001, 0, 0.5, 0)
Converted["_Notifications"].Size = UDim2.new(0, 242, 1, 0)
Converted["_Notifications"].Name = "Notifications"
Converted["_Notifications"].Parent = Converted["_AFEM"]

Converted["_UIListLayout"].Padding = UDim.new(0, 10)
Converted["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].VerticalAlignment = Enum.VerticalAlignment.Bottom
Converted["_UIListLayout"].Parent = Converted["_Notifications"]

Converted["_UIPadding"].PaddingBottom = UDim.new(0, 10)
Converted["_UIPadding"].PaddingLeft = UDim.new(0, 10)
Converted["_UIPadding"].Parent = Converted["_Notifications"]

Converted["_Placeholder"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_Placeholder"].BackgroundColor3 = Color3.fromRGB(31.000001952052116, 31.000001952052116, 31.000001952052116)
Converted["_Placeholder"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Placeholder"].BorderSizePixel = 0
Converted["_Placeholder"].Position = UDim2.new(0.0450000018, 0, 0.112000003, 0)
Converted["_Placeholder"].Visible = false
Converted["_Placeholder"].Name = "Placeholder"
Converted["_Placeholder"].Parent = Converted["_Notifications"]

Converted["_UICorner"].Parent = Converted["_Placeholder"]

Converted["_TextLabel"].Font = Enum.Font.Gotham
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_TextLabel"].Size = UDim2.new(0.899999976, 0, 0.800000012, 0)
Converted["_TextLabel"].Parent = Converted["_Placeholder"]

Converted["_SetCustomButtonEmote"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_SetCustomButtonEmote"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SetCustomButtonEmote"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SetCustomButtonEmote"].BorderSizePixel = 0
Converted["_SetCustomButtonEmote"].ClipsDescendants = true
Converted["_SetCustomButtonEmote"].Position = UDim2.new(0.5, 0, -0.5, 0)
Converted["_SetCustomButtonEmote"].Size = UDim2.new(0, 440, 0, 268)
Converted["_SetCustomButtonEmote"].ZIndex = 3
Converted["_SetCustomButtonEmote"].Name = "SetCustomButtonEmote"
Converted["_SetCustomButtonEmote"].Parent = Converted["_AFEM"]

Converted["_UICorner1"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_UIStroke"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke"].Thickness = 2
Converted["_UIStroke"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_UIGradient"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(53.00000064074993, 53.00000064074993, 53.00000064074993)),
	ColorSequenceKeypoint.new(0.15224914252758026, Color3.fromRGB(50.69031357765198, 50.69031357765198, 50.69031357765198)),
	ColorSequenceKeypoint.new(0.4723183512687683, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.7577854990959167, Color3.fromRGB(50.13314567506313, 50.13314567506313, 50.13314567506313)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(48.000000938773155, 48.000000938773155, 48.000000938773155))
}
Converted["_UIGradient"].Rotation = 62
Converted["_UIGradient"].Parent = Converted["_UIStroke"]

Converted["_UIGradient1"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(68.00000354647636, 68.00000354647636, 68.00000354647636))
}
Converted["_UIGradient1"].Rotation = 68
Converted["_UIGradient1"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_UIScale"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_TextLabel1"].Font = Enum.Font.Gotham
Converted["_TextLabel1"].Text = "Add a module"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].TextScaled = true
Converted["_TextLabel1"].TextSize = 14
Converted["_TextLabel1"].TextWrapped = true
Converted["_TextLabel1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel1"].BorderSizePixel = 0
Converted["_TextLabel1"].Position = UDim2.new(0.352256238, 0, 0.133915231, 0)
Converted["_TextLabel1"].Size = UDim2.new(0.619047642, 0, 0.125920027, 0)
Converted["_TextLabel1"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_TextBox"].ClearTextOnFocus = false
Converted["_TextBox"].Font = Enum.Font.Gotham
Converted["_TextBox"].PlaceholderText = "Custom module link"
Converted["_TextBox"].Text = ""
Converted["_TextBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].TextScaled = true
Converted["_TextBox"].TextSize = 14
Converted["_TextBox"].TextWrapped = true
Converted["_TextBox"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867)
Converted["_TextBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].BorderSizePixel = 0
Converted["_TextBox"].Position = UDim2.new(0.499648541, 0, 0.500059664, 0)
Converted["_TextBox"].Size = UDim2.new(0.804988742, 0, 0.544776142, 0)
Converted["_TextBox"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_UICorner2"].Parent = Converted["_TextBox"]

Converted["_UIPadding1"].PaddingBottom = UDim.new(0, 10)
Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 10)
Converted["_UIPadding1"].PaddingRight = UDim.new(0, 10)
Converted["_UIPadding1"].PaddingTop = UDim.new(0, 10)
Converted["_UIPadding1"].Parent = Converted["_TextBox"]

Converted["_TextLabel2"].Font = Enum.Font.Gotham
Converted["_TextLabel2"].Text = "Only add modules you trust!"
Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].TextScaled = true
Converted["_TextLabel2"].TextSize = 14
Converted["_TextLabel2"].TextWrapped = true
Converted["_TextLabel2"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextLabel2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].BackgroundTransparency = 1
Converted["_TextLabel2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel2"].BorderSizePixel = 0
Converted["_TextLabel2"].Position = UDim2.new(0.499648541, 0, 0.833542168, 0)
Converted["_TextLabel2"].Size = UDim2.new(0.619047642, 0, 0.0550245307, 0)
Converted["_TextLabel2"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_Add"].Font = Enum.Font.Gotham
Converted["_Add"].Text = "Add"
Converted["_Add"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Add"].TextScaled = true
Converted["_Add"].TextSize = 14
Converted["_Add"].TextWrapped = true
Converted["_Add"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Add"].BackgroundColor3 = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997)
Converted["_Add"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Add"].BorderSizePixel = 0
Converted["_Add"].Position = UDim2.new(0.108492024, 0, 0.927298486, 0)
Converted["_Add"].Size = UDim2.new(0.163265288, 0, 0.0858208984, 0)
Converted["_Add"].Name = "Add"
Converted["_Add"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_UICorner3"].Parent = Converted["_Add"]

Converted["_UIPadding2"].PaddingBottom = UDim.new(0, 5)
Converted["_UIPadding2"].PaddingLeft = UDim.new(0, 5)
Converted["_UIPadding2"].PaddingRight = UDim.new(0, 5)
Converted["_UIPadding2"].PaddingTop = UDim.new(0, 5)
Converted["_UIPadding2"].Parent = Converted["_Add"]

Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke1"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke1"].Parent = Converted["_Add"]

Converted["_Cancel"].Font = Enum.Font.Gotham
Converted["_Cancel"].Text = "Cancel"
Converted["_Cancel"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_Cancel"].TextScaled = true
Converted["_Cancel"].TextSize = 14
Converted["_Cancel"].TextWrapped = true
Converted["_Cancel"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Cancel"].BackgroundColor3 = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997)
Converted["_Cancel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Cancel"].BorderSizePixel = 0
Converted["_Cancel"].Position = UDim2.new(0.899875283, 0, 0.931029797, 0)
Converted["_Cancel"].Size = UDim2.new(0.163265288, 0, 0.0858208984, 0)
Converted["_Cancel"].Name = "Cancel"
Converted["_Cancel"].Parent = Converted["_SetCustomButtonEmote"]

Converted["_UICorner4"].Parent = Converted["_Cancel"]

Converted["_UIPadding3"].PaddingBottom = UDim.new(0, 5)
Converted["_UIPadding3"].PaddingLeft = UDim.new(0, 5)
Converted["_UIPadding3"].PaddingRight = UDim.new(0, 5)
Converted["_UIPadding3"].PaddingTop = UDim.new(0, 5)
Converted["_UIPadding3"].Parent = Converted["_Cancel"]

Converted["_UIStroke2"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke2"].Color = Color3.fromRGB(255, 0, 0)
Converted["_UIStroke2"].Parent = Converted["_Cancel"]

Converted["_Menu"].AnchorPoint = Vector2.new(1, 1)
Converted["_Menu"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Menu"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Menu"].BorderSizePixel = 0
Converted["_Menu"].Position = UDim2.new(0.986000001, 0, 0.967999995, 0)
Converted["_Menu"].Size = UDim2.new(0, 309, 0, 188)
Converted["_Menu"].Name = "Menu"
Converted["_Menu"].Parent = Converted["_AFEM"]

Converted["_UICorner5"].Parent = Converted["_Menu"]

Converted["_UIScale1"].Parent = Converted["_Menu"]

Converted["_UIStroke3"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke3"].Thickness = 2
Converted["_UIStroke3"].Parent = Converted["_Menu"]

Converted["_UIGradient2"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(53.00000064074993, 53.00000064074993, 53.00000064074993)),
	ColorSequenceKeypoint.new(0.15224914252758026, Color3.fromRGB(50.69031357765198, 50.69031357765198, 50.69031357765198)),
	ColorSequenceKeypoint.new(0.4723183512687683, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.7577854990959167, Color3.fromRGB(50.13314567506313, 50.13314567506313, 50.13314567506313)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(48.000000938773155, 48.000000938773155, 48.000000938773155))
}
Converted["_UIGradient2"].Rotation = 180
Converted["_UIGradient2"].Parent = Converted["_UIStroke3"]

Converted["_HubCredits"].Font = Enum.Font.GothamBold
Converted["_HubCredits"].Text = "made and open sourced by imperial"
Converted["_HubCredits"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HubCredits"].TextScaled = true
Converted["_HubCredits"].TextSize = 14
Converted["_HubCredits"].TextTransparency = 0.699999988079071
Converted["_HubCredits"].TextWrapped = true
Converted["_HubCredits"].TextXAlignment = Enum.TextXAlignment.Right
Converted["_HubCredits"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_HubCredits"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HubCredits"].BackgroundTransparency = 1
Converted["_HubCredits"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_HubCredits"].BorderSizePixel = 0
Converted["_HubCredits"].Position = UDim2.new(0.785926819, 0, 0.160157606, 0)
Converted["_HubCredits"].Size = UDim2.new(0.316320807, 0, 0.0585099049, 0)
Converted["_HubCredits"].Name = "HubCredits"
Converted["_HubCredits"].Parent = Converted["_Menu"]

Converted["_HubDesc"].Font = Enum.Font.GothamBold
Converted["_HubDesc"].Text = "a free emotes menu"
Converted["_HubDesc"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HubDesc"].TextSize = 14
Converted["_HubDesc"].TextWrapped = true
Converted["_HubDesc"].TextXAlignment = Enum.TextXAlignment.Right
Converted["_HubDesc"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_HubDesc"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HubDesc"].BackgroundTransparency = 1
Converted["_HubDesc"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_HubDesc"].BorderSizePixel = 0
Converted["_HubDesc"].Position = UDim2.new(0.708829343, 0, 0.116141364, 0)
Converted["_HubDesc"].Size = UDim2.new(0.470515788, 0, 0.082417585, 0)
Converted["_HubDesc"].Name = "HubDesc"
Converted["_HubDesc"].Parent = Converted["_Menu"]

Converted["_HubName"].Font = Enum.Font.GothamBold
Converted["_HubName"].Text = "AFEM"
Converted["_HubName"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HubName"].TextScaled = true
Converted["_HubName"].TextSize = 14
Converted["_HubName"].TextWrapped = true
Converted["_HubName"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_HubName"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_HubName"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HubName"].BackgroundTransparency = 1
Converted["_HubName"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_HubName"].BorderSizePixel = 0
Converted["_HubName"].Position = UDim2.new(0.186153606, 0, 0.112410031, 0)
Converted["_HubName"].Size = UDim2.new(0.259631485, 0, 0.0824175924, 0)
Converted["_HubName"].Name = "HubName"
Converted["_HubName"].Parent = Converted["_Menu"]

Converted["_CanvasGroup"].GroupTransparency = 1
Converted["_CanvasGroup"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_CanvasGroup"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CanvasGroup"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CanvasGroup"].BorderSizePixel = 0
Converted["_CanvasGroup"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_CanvasGroup"].Size = UDim2.new(1, 0, 1, 0)
Converted["_CanvasGroup"].Visible = false
Converted["_CanvasGroup"].ZIndex = 999999998
Converted["_CanvasGroup"].Parent = Converted["_Menu"]

Converted["_UICorner6"].Parent = Converted["_CanvasGroup"]

Converted["_ImageLabel"].Image = "rbxassetid://6567073136"
Converted["_ImageLabel"].ImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_ImageLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel"].BorderSizePixel = 0
Converted["_ImageLabel"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_ImageLabel"].Size = UDim2.new(0, 20, 0, 20)
Converted["_ImageLabel"].Parent = Converted["_CanvasGroup"]

Converted["_Opener"].Font = Enum.Font.SourceSans
Converted["_Opener"].Text = ""
Converted["_Opener"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Opener"].TextSize = 14
Converted["_Opener"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Opener"].BackgroundTransparency = 1
Converted["_Opener"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Opener"].BorderSizePixel = 0
Converted["_Opener"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Opener"].Name = "Opener"
Converted["_Opener"].Parent = Converted["_CanvasGroup"]

Converted["_Area"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Area"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Area"].BackgroundTransparency = 1
Converted["_Area"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Area"].BorderSizePixel = 0
Converted["_Area"].ClipsDescendants = true
Converted["_Area"].Position = UDim2.new(0.5, 0, 0.606000006, 0)
Converted["_Area"].Size = UDim2.new(1, 0, 0.783999979, 0)
Converted["_Area"].Name = "Area"
Converted["_Area"].Parent = Converted["_Menu"]

Converted["_Area1"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_Area1"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Area1"].ScrollBarThickness = 0
Converted["_Area1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Area1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Area1"].BackgroundTransparency = 1
Converted["_Area1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Area1"].BorderSizePixel = 0
Converted["_Area1"].Position = UDim2.new(0.50000006, 0, 0.598377109, 0)
Converted["_Area1"].Selectable = false
Converted["_Area1"].Size = UDim2.new(0.900000036, 0, 0.803245783, 0)
Converted["_Area1"].Name = "Area"
Converted["_Area1"].Parent = Converted["_Area"]

Converted["_UIGridLayout"].CellSize = UDim2.new(0, 110, 0, 110)
Converted["_UIGridLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIGridLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIGridLayout"].Parent = Converted["_Area1"]

Converted["_Sample"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_Sample"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample"].BorderSizePixel = 0
Converted["_Sample"].Size = UDim2.new(0, 80, 0, 80)
Converted["_Sample"].Visible = false
Converted["_Sample"].Name = "Sample"
Converted["_Sample"].Parent = Converted["_Area1"]

Converted["_UICorner7"].Parent = Converted["_Sample"]

Converted["_UIStroke4"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke4"].Parent = Converted["_Sample"]

Converted["_UIPadding4"].PaddingBottom = UDim.new(0, 5)
Converted["_UIPadding4"].Parent = Converted["_Sample"]

Converted["_ImageLabel1"].Image = "rbxthumb://type=Asset&id=14353423348&w=420&h=420"
Converted["_ImageLabel1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_ImageLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageLabel1"].BackgroundTransparency = 1
Converted["_ImageLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel1"].BorderSizePixel = 0
Converted["_ImageLabel1"].Position = UDim2.new(0.5, 0, 0.400000006, 0)
Converted["_ImageLabel1"].Size = UDim2.new(0.75, 0, 0.75, 0)
Converted["_ImageLabel1"].Parent = Converted["_Sample"]

Converted["_TextLabel3"].Font = Enum.Font.Gotham
Converted["_TextLabel3"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].TextScaled = true
Converted["_TextLabel3"].TextSize = 14
Converted["_TextLabel3"].TextWrapped = true
Converted["_TextLabel3"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextLabel3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].BackgroundTransparency = 1
Converted["_TextLabel3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel3"].BorderSizePixel = 0
Converted["_TextLabel3"].Position = UDim2.new(0.5, 0, 0.874418736, 0)
Converted["_TextLabel3"].Size = UDim2.new(1, 0, 0.251162499, 0)
Converted["_TextLabel3"].Parent = Converted["_Sample"]

Converted["_UIPadding5"].PaddingBottom = UDim.new(0, 5)
Converted["_UIPadding5"].PaddingLeft = UDim.new(0, 5)
Converted["_UIPadding5"].PaddingRight = UDim.new(0, 5)
Converted["_UIPadding5"].PaddingTop = UDim.new(0, 5)
Converted["_UIPadding5"].Parent = Converted["_Area1"]

Converted["_TextLabel4"].Font = Enum.Font.Gotham
Converted["_TextLabel4"].Text = "Loading..."
Converted["_TextLabel4"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel4"].TextScaled = true
Converted["_TextLabel4"].TextSize = 14
Converted["_TextLabel4"].TextWrapped = true
Converted["_TextLabel4"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextLabel4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel4"].BackgroundTransparency = 1
Converted["_TextLabel4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel4"].BorderSizePixel = 0
Converted["_TextLabel4"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_TextLabel4"].Size = UDim2.new(0, 200, 0, 50)
Converted["_TextLabel4"].Parent = Converted["_Area"]

Converted["_TextBox1"].Font = Enum.Font.Gotham
Converted["_TextBox1"].PlaceholderText = "Search..."
Converted["_TextBox1"].Text = ""
Converted["_TextBox1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox1"].TextScaled = true
Converted["_TextBox1"].TextSize = 14
Converted["_TextBox1"].TextWrapped = true
Converted["_TextBox1"].TextXAlignment = Enum.TextXAlignment.Right
Converted["_TextBox1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextBox1"].BackgroundColor3 = Color3.fromRGB(31.000001952052116, 31.000001952052116, 31.000001952052116)
Converted["_TextBox1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox1"].BorderSizePixel = 0
Converted["_TextBox1"].Position = UDim2.new(0.727198064, 0, 0.092922166, 0)
Converted["_TextBox1"].Size = UDim2.new(0, 132, 0, 22)
Converted["_TextBox1"].Parent = Converted["_Area"]

Converted["_UICorner8"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner8"].Parent = Converted["_TextBox1"]

Converted["_UIPadding6"].PaddingBottom = UDim.new(0, 5)
Converted["_UIPadding6"].PaddingLeft = UDim.new(0, 5)
Converted["_UIPadding6"].PaddingRight = UDim.new(0, 5)
Converted["_UIPadding6"].PaddingTop = UDim.new(0, 5)
Converted["_UIPadding6"].Parent = Converted["_TextBox1"]

Converted["_Switch"].Font = Enum.Font.Gotham
Converted["_Switch"].Text = "Emotes"
Converted["_Switch"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Switch"].TextScaled = true
Converted["_Switch"].TextSize = 14
Converted["_Switch"].TextWrapped = true
Converted["_Switch"].BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867)
Converted["_Switch"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Switch"].BorderSizePixel = 0
Converted["_Switch"].Position = UDim2.new(0.0550160818, 0, 0.0135692572, 0)
Converted["_Switch"].Size = UDim2.new(0, 89, 0, 22)
Converted["_Switch"].Name = "Switch"
Converted["_Switch"].Parent = Converted["_Area"]

Converted["_UICorner9"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner9"].Parent = Converted["_Switch"]

Converted["_UIPadding7"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding7"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding7"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding7"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding7"].Parent = Converted["_Switch"]

Converted["_UIStroke5"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke5"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke5"].Thickness = 1.600000023841858
Converted["_UIStroke5"].Parent = Converted["_Switch"]

Converted["_UIGradient3"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
Converted["_UIGradient3"].Rotation = -90
Converted["_UIGradient3"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient3"].Parent = Converted["_UIStroke5"]

Converted["_UIGradient4"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(68.00000354647636, 68.00000354647636, 68.00000354647636))
}
Converted["_UIGradient4"].Rotation = 68
Converted["_UIGradient4"].Parent = Converted["_Menu"]

Converted["_CloseArea"].Text = ""
Converted["_CloseArea"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_CloseArea"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CloseArea"].BackgroundTransparency = 1
Converted["_CloseArea"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CloseArea"].BorderSizePixel = 0
Converted["_CloseArea"].Position = UDim2.new(0.5, 0, 0.00295135868, 0)
Converted["_CloseArea"].Size = UDim2.new(0.326999992, 0, 0.184, 0)
Converted["_CloseArea"].Name = "CloseArea"
Converted["_CloseArea"].Parent = Converted["_Menu"]

Converted["_Frame"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BackgroundTransparency = 0.6499999761581421
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.5, 0, 0.699999988, 0)
Converted["_Frame"].Size = UDim2.new(0.699999988, 0, 0.100000001, 0)
Converted["_Frame"].Parent = Converted["_CloseArea"]

Converted["_UICorner10"].CornerRadius = UDim.new(0, 9999)
Converted["_UICorner10"].Parent = Converted["_Frame"]

Converted["_TextLabel5"].Font = Enum.Font.Gotham
Converted["_TextLabel5"].Text = "Tap here to minimize."
Converted["_TextLabel5"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel5"].TextSize = 15
Converted["_TextLabel5"].TextWrapped = true
Converted["_TextLabel5"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TextLabel5"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel5"].BackgroundTransparency = 0.4000000059604645
Converted["_TextLabel5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel5"].BorderSizePixel = 0
Converted["_TextLabel5"].Position = UDim2.new(0.5, 0, 0.600000024, 0)
Converted["_TextLabel5"].Size = UDim2.new(2, 0, 0.841000021, 0)
Converted["_TextLabel5"].Parent = Converted["_CloseArea"]

Converted["_UICorner11"].Parent = Converted["_TextLabel5"]

Converted["_Close"].Name = "Close"
Converted["_Close"].Parent = Converted["_Menu"]

Converted["_FloatingButtons"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_FloatingButtons"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_FloatingButtons"].BackgroundTransparency = 1
Converted["_FloatingButtons"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_FloatingButtons"].BorderSizePixel = 0
Converted["_FloatingButtons"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_FloatingButtons"].Size = UDim2.new(1, 0, 1, 0)
Converted["_FloatingButtons"].Name = "FloatingButtons"
Converted["_FloatingButtons"].Parent = Converted["_AFEM"]

-- Fake Module Scripts:

local fake_module_scripts = {}

do -- Fake Module: ServerStorage.AFEM.FUNCTIONS
    local script = Instance.new("ModuleScript")
    script.Name = "FUNCTIONS"
    script.Parent = Converted["_AFEM"]
    local function module_script()
		local FUNCTIONSmodule = {}
		
		local ts = game:GetService("TweenService")
		local uis = game:GetService("UserInputService")
		
		local area = script.Parent.Menu.Area.Area
		
		local function draggableobjectF()
			local function a(b,c,d)local e=d.AbsoluteSize;local f=b.X.Scale*e.X+b.X.Offset;local g=b.Y.Scale*e.Y+b.Y.Offset;local h=c.X.Scale*e.X+c.X.Offset;local i=c.Y.Scale*e.Y+c.Y.Offset;local j=f+h<=0;local k=f>=e.X;local l=g+i<=0;local m=g>=e.Y;return j or k or l or m end;local n=UDim2.new;local o=game:GetService("UserInputService")local p=game:GetService("TweenService")local q={}q.__index=q;function q.new(r,s,t,u)local self={}self.Object=r;self.ToMove=s;self.Smooth=t;self.CallbackOnly=u;self.DragStarted=nil;self.DragEnded=nil;self.Dragged=nil;self.Dragging=false;self.LastPosition=nil;self.Velocity=Vector2.new(0,0)setmetatable(self,q)return self end;function q:Enable()local v=self.Object;local w=self.ToMove;local x=nil;local y=nil;local z=nil;local A=false;local function B(C)local D=C.Position-y;local E=UDim2.new(z.X.Scale,z.X.Offset+D.X,z.Y.Scale,z.Y.Offset+D.Y)if a(E,v.Size,v:FindFirstAncestorWhichIsA("ScreenGui"))then warn("UDim2 is offscreen.")return E end;if self.CallbackOnly then else if(self.Smooth==nil or self.Smooth==true)and self.Smooth~=false then p:Create(w and w or v,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position=E}):Play()else local F=w and w or v;F.Position=E end end;return E end;self.InputBegan=v.InputBegan:Connect(function(C)if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then A=true;local G;G=C.Changed:Connect(function()if C.UserInputState==Enum.UserInputState.End and(self.Dragging or A)then self.Dragging=false;G:Disconnect()if self.DragEnded and not A then self.DragEnded(self.Velocity)end;A=false end end)end end)self.InputChanged=v.InputChanged:Connect(function(C)if C.UserInputType==Enum.UserInputType.MouseMovement or C.UserInputType==Enum.UserInputType.Touch then x=C end end)self.InputChanged2=o.InputChanged:Connect(function(C)if v.Parent==nil then self:Disable()return end;if A then A=false;if self.DragStarted then self.DragStarted()end;self.Dragging=true;y=C.Position;if w then z=w.Position else z=v.Position end;self.LastPosition=C.Position end;if C==x and self.Dragging then local E=B(C)self.Velocity=C.Position-self.LastPosition;self.LastPosition=C.Position;if self.Dragged then self.Dragged(E)end end end)end;function q:Disable()self.InputBegan:Disconnect()self.InputChanged:Disconnect()self.InputChanged2:Disconnect()if self.Dragging then self.Dragging=false;if self.DragEnded then self.DragEnded(self.Velocity)end end end;return q
		end
		local draggableobject = draggableobjectF()
		
		local function clickandholdF()
			local a={}a.__index=a;local b=game:GetService("UserInputService")function a.new(c,d)local self=setmetatable({},a)self.textButton=c;self.holdTime=d or 0.5;self.holdTask=nil;self.Holded=Instance.new("BindableEvent")self.textButton.MouseButton1Down:Connect(function()self.holdTask=task.spawn(function()task.wait(self.holdTime)if self.holdTask then self.Holded:Fire()end end)end)b.InputEnded:Connect(function(e,f)if e.UserInputType==Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch then if self.holdTask then coroutine.close(self.holdTask)self.holdTask=nil end end end)return self end;return a
		end
		local clickandhold = clickandholdF()
		
		local emoteBindings = {}
		
		function FUNCTIONSmodule.notification(s)
			task.spawn(function()
				local notif = script.Parent.Notifications.Placeholder:Clone()
				notif.Parent = script.Parent.Notifications
				notif.Visible = true
				notif.Name = "notification"
				notif.TextLabel.Text = s
				ts:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					Size = UDim2.new(1,0,0,math.clamp(#s, 40, 300))
				}):Play()
				task.wait(3)
				local dismiss = ts:Create(notif, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					Size = UDim2.new(0,0,0,0)
				})
				dismiss:Play()
				dismiss.Completed:Wait()
				notif:Destroy()
			end)
		end
		
		
		local animplaying = false
		local stopOnWalk
		local stopOnEnd
		function FUNCTIONSmodule.playanim(id)
			local anim = Instance.new("Animation")
			anim.AnimationId = id
			game.Players.LocalPlayer.Character:FindFirstChild("Animate").PlayEmote:Invoke(anim)
			--for _, anim in ipairs(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks()) do anim:Stop() end
			--local anim = Instance.new("Animation")
			--anim.AnimationId = id
			--local loadedanim = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(anim)
			--loadedanim:Play()
			--animplaying = true
			--stopOnWalk = task.spawn(function()
			--	repeat task.wait() until game.Players.LocalPlayer.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude > 0.1
			--	loadedanim:Stop()
			--	stopOnWalk:Disconnect()
			--	animplaying = false
			--	return
			--end)
			--stopOnEnd = loadedanim.Stopped:Connect(function()
			--	stopOnEnd:Disconnect()
			--	animplaying = false
			--end)
			script.Parent.Menu.Close:Fire()
		end
		
		uis.InputBegan:Connect(function(inp, proc)
			if proc then return end
			if emoteBindings[inp.KeyCode] then
				emoteBindings[inp.KeyCode]()
			end
		end)
		
		
		local equippedPack = nil
		
		
		function getAnimationPackFromBundleId(bID)
                        repeat task.wait() until _G.AFEMAnimationPacksList
			local animPackList = _G.AFEMAnimationPacksList
			for _, v in ipairs(animPackList) do
				if v["BundleId"] == tonumber(bID) then
					return v
				end
			end
			return nil
		end
		
		function FUNCTIONSmodule.applyPack(bID)
			equippedPack = bID
			local animPack = getAnimationPackFromBundleId(bID)
			if not animPack then
				warn("[AFEM] - Can't find this animation pack.")
				return
			end
			
			local char = game.Players.LocalPlayer.Character
			if not char then warn("[AFEM] - No character. Waiting for one...") char = game.Players.LocalPlayer.CharacterAdded:Wait() end
			local hum = char:WaitForChild("Humanoid")
			if not hum then warn("[AFEM] - No humanoid in character.") return end
			if hum.RigType.Name ~= "R15" then warn("[AFEM] - Your character is not R15") FUNCTIONSmodule.notification("Your character needs to be R15.") return end
			local animateScript = char:FindFirstChild("Animate")
			if not animateScript then warn("[AFEM] - Your character does not have the Animate script!") return end
			
			for _, animObj in ipairs(animateScript:GetChildren()) do
				if animPack["Animations"][animObj.Name] then
					for _, animAsset in ipairs(animObj:GetChildren()) do
						if animPack["Animations"][animObj.Name][animAsset.Name] then
							animAsset.AnimationId = animPack["Animations"][animObj.Name][animAsset.Name]
						end
					end
				end
			end
			
			print("[AFEM] - Animation pack applied!")
			FUNCTIONSmodule.notification("Animation pack applied! Try moving around.")
			local s, e = pcall(function()
				writefile("AFEMPersistentPack.txt", tostring(bID))
				print("[AFEM] - Current pack persistently saved")
			end)
			if not s then
				warn("[AFEM] - Failed to save persistent pack, not supported?")
				warn(e)
			end
		end
		
		-- Automatic applying after respawn
		game.Players.LocalPlayer.CharacterAdded:Connect(function()
			if equippedPack then
				FUNCTIONSmodule.applyPack(equippedPack)
			end
		end)
		
		local s, e = pcall(function()
			equippedPack = readfile("AFEMPersistentPack.txt")
                        print("[AFEM] - Persistent pack bundle ID found, applying (" .. tostring(equippedPack) .. ")")
                        FUNCTIONSmodule.applyPack(equippedPack)
		end)
		if not s then
			warn("[AFEM] - Reading persistent pack file failed. Not supported?")
			warn(e)
		end

		local inFloatingButton = nil
		function FUNCTIONSmodule.refresh()

	        repeat task.wait() until _G.AFEMAnimationPacksList
            repeat task.wait() until _G.AFEMEmoteList
			
			area.Parent.TextLabel.Visible = false
			local emoteList = _G.AFEMEmoteList
			local animPackList = _G.AFEMAnimationPacksList
			for _, v in ipairs(area:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "Sample" then
					v:Destroy()
				end
			end
			
			
			for _, emote in ipairs(emoteList) do
				if emote["_comment"] then continue end
				local buttonClone = area.Sample:Clone()
				buttonClone.Name = emote["name"] .. "EMOTE"
				buttonClone.Visible = true
				
				buttonClone.TextLabel.Text = emote["name"]
				buttonClone.ImageLabel.Image = "rbxthumb://type=Asset&id=" .. emote["id"] .. "&w=420&h=420"
				
				buttonClone.MouseButton1Click:Connect(function()
					FUNCTIONSmodule.playanim(emote["animationid"])
				end)
				
				clickandhold.new(buttonClone).Holded.Event:Connect(function()
					if script.Parent.FloatingButtons:FindFirstChild(buttonClone.Name) then
						local closeanim = ts:Create(script.Parent.FloatingButtons:FindFirstChild(buttonClone.Name), TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
							Size = UDim2.new()
						})
						closeanim:Play()
						closeanim.Completed:Connect(function()
							script.Parent.FloatingButtons:FindFirstChild(buttonClone.Name):Destroy()
						end)
					else
						local floatingButtonClone = buttonClone:Clone()
						floatingButtonClone.Parent = script.Parent.FloatingButtons
						floatingButtonClone.AnchorPoint = Vector2.zero
						floatingButtonClone.Position = UDim2.fromOffset(buttonClone.AbsolutePosition.X, buttonClone.AbsolutePosition.Y)
						
						floatingButtonClone.TextLabel.Visible = false
						floatingButtonClone.UIPadding.PaddingBottom = UDim.new()
						
						floatingButtonClone.ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
						
						ts:Create(floatingButtonClone, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
							AnchorPoint = Vector2.new(0.5,0.5),
							Position = UDim2.fromScale(0.5, 0.2),
							Size = UDim2.fromOffset(40, 40)
						}):Play()
		
						draggableobject.new(floatingButtonClone, nil, true):Enable()
						floatingButtonClone.MouseButton1Click:Connect(function()
							FUNCTIONSmodule.playanim(emote["animationid"])
							--local anim = Instance.new("Animation")
							--anim.AnimationId = emote["animationid"]
							--game.Players.LocalPlayer.Character:FindFirstChild("Animate").PlayEmote:Invoke(anim)
						end)
						
						if uis.KeyboardEnabled and uis.MouseEnabled then
							floatingButtonClone.MouseEnter:Connect(function()
								inFloatingButton = floatingButtonClone
							end)
							
							floatingButtonClone.MouseLeave:Connect(function()
								inFloatingButton = nil
							end)
							
							uis.InputBegan:Connect(function(inp, proc)
								if proc then return end
								if inFloatingButton == floatingButtonClone then
									
									FUNCTIONSmodule.notification("Emote " .. emote['name'] .. " binded to key " .. inp.KeyCode.Name)
									task.wait(0.2)
									emoteBindings[inp.KeyCode] = function()
										FUNCTIONSmodule.playanim(emote["animationid"])
									end
									
								end
							end)
						end
					end
				end)
				
				buttonClone.Parent = area
			end
			
			for _, animPack in ipairs(animPackList) do
				if animPack["_comment"] then continue end
				local buttonClone = area.Sample:Clone()
				buttonClone.Name = animPack["Name"] .. "ANPACK"
				buttonClone.Visible = false
		
				buttonClone.TextLabel.Text = animPack["Name"]
				if animPack["CustomImage"] then
					buttonClone.ImageLabel.Image = animPack["CustomImage"]
				else
					buttonClone.ImageLabel.Image = "rbxthumb://type=BundleThumbnail&id=" .. animPack["BundleId"] .. "&w=420&h=420"
				end
				buttonClone.MouseButton1Click:Connect(function()
					FUNCTIONSmodule.applyPack(animPack['BundleId'])
				end)
		
				
				buttonClone.Parent = area
			end
		end
		
		
		_G.AFEMFUNCTIONS = FUNCTIONSmodule
		return FUNCTIONSmodule
		
    end
    fake_module_scripts[script] = module_script
end
do -- Fake Module: ServerStorage.AFEM.DraggableObject
    local script = Instance.new("ModuleScript")
    script.Name = "DraggableObject"
    script.Parent = Converted["_AFEM"]
    local function module_script()
		local function a(b,c,d)local e=d.AbsoluteSize;local f=b.X.Scale*e.X+b.X.Offset;local g=b.Y.Scale*e.Y+b.Y.Offset;local h=c.X.Scale*e.X+c.X.Offset;local i=c.Y.Scale*e.Y+c.Y.Offset;local j=f+h<=0;local k=f>=e.X;local l=g+i<=0;local m=g>=e.Y;return j or k or l or m end;local n=UDim2.new;local o=game:GetService("UserInputService")local p=game:GetService("TweenService")local q={}q.__index=q;function q.new(r,s,t,u)local self={}self.Object=r;self.ToMove=s;self.Smooth=t;self.CallbackOnly=u;self.DragStarted=nil;self.DragEnded=nil;self.Dragged=nil;self.Dragging=false;self.LastPosition=nil;self.Velocity=Vector2.new(0,0)setmetatable(self,q)return self end;function q:Enable()local v=self.Object;local w=self.ToMove;local x=nil;local y=nil;local z=nil;local A=false;local function B(C)local D=C.Position-y;local E=UDim2.new(z.X.Scale,z.X.Offset+D.X,z.Y.Scale,z.Y.Offset+D.Y)if a(E,v.Size,v:FindFirstAncestorWhichIsA("ScreenGui"))then warn("UDim2 is offscreen.")return E end;if self.CallbackOnly then else if(self.Smooth==nil or self.Smooth==true)and self.Smooth~=false then p:Create(w and w or v,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position=E}):Play()else local F=w and w or v;F.Position=E end end;return E end;self.InputBegan=v.InputBegan:Connect(function(C)if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then A=true;local G;G=C.Changed:Connect(function()if C.UserInputState==Enum.UserInputState.End and(self.Dragging or A)then self.Dragging=false;G:Disconnect()if self.DragEnded and not A then self.DragEnded(self.Velocity)end;A=false end end)end end)self.InputChanged=v.InputChanged:Connect(function(C)if C.UserInputType==Enum.UserInputType.MouseMovement or C.UserInputType==Enum.UserInputType.Touch then x=C end end)self.InputChanged2=o.InputChanged:Connect(function(C)if v.Parent==nil then self:Disable()return end;if A then A=false;if self.DragStarted then self.DragStarted()end;self.Dragging=true;y=C.Position;if w then z=w.Position else z=v.Position end;self.LastPosition=C.Position end;if C==x and self.Dragging then local E=B(C)self.Velocity=C.Position-self.LastPosition;self.LastPosition=C.Position;if self.Dragged then self.Dragged(E)end end end)end;function q:Disable()self.InputBegan:Disconnect()self.InputChanged:Disconnect()self.InputChanged2:Disconnect()if self.Dragging then self.Dragging=false;if self.DragEnded then self.DragEnded(self.Velocity)end end end;return q
    end
    fake_module_scripts[script] = module_script
end
do -- Fake Module: ServerStorage.AFEM.ClickAndHold
    local script = Instance.new("ModuleScript")
    script.Name = "ClickAndHold"
    script.Parent = Converted["_AFEM"]
    local function module_script()
		local a={}a.__index=a;local b=game:GetService("UserInputService")function a.new(c,d)local self=setmetatable({},a)self.textButton=c;self.holdTime=d or 0.5;self.holdTask=nil;self.Holded=Instance.new("BindableEvent")self.textButton.MouseButton1Down:Connect(function()self.holdTask=task.spawn(function()task.wait(self.holdTime)if self.holdTask then self.Holded:Fire()end end)end)b.InputEnded:Connect(function(e,f)if e.UserInputType==Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch then if self.holdTask then coroutine.close(self.holdTask)self.holdTask=nil end end end)return self end;return a
    end
    fake_module_scripts[script] = module_script
end
do -- Fake Module: ServerStorage.AFEM.Spring
    local script = Instance.new("ModuleScript")
    script.Name = "Spring"
    script.Parent = Converted["_AFEM"]
    local function module_script()
		local a=game:GetService("RunService")local b={}function OverDamping(c,d,e,f,g,h)local i=d*d-4*e/c;local j=-1/2;local k=d+math.sqrt(i)local l=d-math.sqrt(i)local m,n=j*k,j*l;local o,p=(n*f-g)/(n-m),(m*f-g)/(m-n)local q=h/e;return{Offset=function(r)return o*math.exp(m*r)+p*math.exp(n*r)+q end,Velocity=function(r)return o*m*math.exp(m*r)+p*n*math.exp(n*r)end,Acceleration=function(r)return o*m*m*math.exp(m*r)+p*n*n*math.exp(n*r)end}end;function CriticalDamping(c,d,e,f,g,h)local s=-d/2;local o,p=f,g-s*f;local q=h/e;return{Offset=function(r)return math.exp(s*r)*(o+p*r)+q end,Velocity=function(r)return math.exp(s*r)*(p*s*r+o*s+p)end,Acceleration=function(r)return s*math.exp(s*r)*(p*s*r+o*s+2*p)end}end;function UnderDamping(c,d,e,f,g,h)local i=d*d-4*e/c;local s=-d/2;local t=math.sqrt(-i)local o,p=f,(g-s*f)/t;local q=h/e;return{Offset=function(r)return math.exp(s*r)*(o*math.cos(t*r)+p*math.sin(t*r))+q end,Velocity=function(r)return-math.exp(s*r)*((o*t-p*s)*math.sin(t*r)+(-p*t-o*s)*math.cos(t*r))end,Acceleration=function(r)return-math.exp(s*r)*((p*t*t+2*o*s*t-p*s*s)*math.sin(t*r)+(o*t*t-2*p*s*t-o*s*s)*math.cos(t*r))end}end;function b.F(u)local f,g,h=u.InitialOffset,u.InitialVelocity,u.ExternalForce;local c,d,e=u.Mass,u.Damping,u.Constant;local i=d*d-4*e/c;if i>0 then return OverDamping(c,d,e,f,g,h)elseif i==0 then return CriticalDamping(c,d,e,f,g,h)else return UnderDamping(c,d,e,f,g,h)end end;local v=b;local w=math.sqrt;local x=math.pi;local y={OFFSET="Offset",VELOCITY="Velocity",ACCELERATION="Acceleration",GOAL="Goal",FREQUENCY="Frequency"}local z=[[.]]local A=[[.]]local u={}local B={}B.__index=function(self,C)local D={[y.OFFSET]=function()local r=tick()-self.StartTick;local E=self.F;local F=E.Offset(r)return F end,[y.VELOCITY]=function()local r=tick()-self.StartTick;local E=self.F;local G=E.Velocity(r)return G end,[y.ACCELERATION]=function()local r=tick()-self.StartTick;local E=self.F;local H=E.Acceleration(r)return H end,[y.GOAL]=function()local I=self.ExternalForce;local J=self.Constant;return I/J end,[y.FREQUENCY]=function()local K=self.Damping;local L=self.Constant;local M=self.Mass;return w(-K*K+4*L/M)/(2*x)end}local N=rawget(self,C)if N~=nil then return N end;local O=D[C]if O~=nil then return O()end;return B[C]end;B.__tostring=function(self)local r=tick()-self.StartTick;local E=self.F;local P=self.AdvancedObjectStringEnabled;local Q;if P==false then Q=string.format(z,E.Offset(r),E.Velocity(r),E.Acceleration(r))elseif P==true then Q=string.format(A,self.Mass,self.Damping,self.Constant,self.Goal,self.Frequency,self.InitialOffset,self.InitialVelocity,self.ExternalForce,self.StartTick,E.Offset(r),E.Velocity(r),E.Acceleration(r))end;return Q end;function u.new(M,K,L,f,g,R)assert(M>0,"Mass for spring system cannot be less than or equal to 0")assert(L>0,"Spring constant for spring system cannot be less than or equal to 0")f=f or 0;g=g or 0;R=R or 0;local S=R*L;local T={Mass=M,Damping=K,Constant=L,InitialOffset=f-R,InitialVelocity=g,ExternalForce=S,AdvancedObjectStringEnabled=false,StartTick=0}setmetatable(T,B)T:Reset()return T end;function u.fromFrequency(M,K,U,f,g,R)assert(M>0,"Mass for spring system cannot be less than or equal to 0")assert(U>0,"Spring frequency for spring system cannot be less than or equal to 0")local L=0.25*M*(4*x*x*U*U+K*K)f=f or 0;g=g or 0;R=R or 0;local S=R*L;local T={Mass=M,Damping=K,Constant=L,InitialOffset=f-R,InitialVelocity=g,ExternalForce=S,AdvancedObjectStringEnabled=false,StartTick=0}setmetatable(T,B)T:Reset()return T end;function B:Reset()self.F=v.F(self)self.StartTick=tick()end;function B:SetExternalForce(V)self.ExternalForce=V;self.InitialOffset=self.Offset-V/self.Constant;self.InitialVelocity=self.Velocity;self:Reset()end;function B:SetGoal(R)self.ExternalForce=R*self.Constant;self.InitialOffset=self.Offset-R;self.InitialVelocity=self.Velocity;self:Reset()end;function B:SetFrequency(U)self.Constant=0.25*self.Mass*(4*x*x*U*U+self.Damping*self.Damping)self.InitialOffset=self.Offset;self.InitialVelocity=self.Velocity;self:Reset()end;function B:SnapToCriticalDamping()self.Damping=2*w(self.Constant/self.Mass)self.InitialOffset=self.Offset;self.InitialVelocity=self.Velocity;self:Reset()end;function B:SetOffset(F,W)self.InitialOffset=F-self.Goal;self.InitialVelocity=W and 0 or self.Velocity;self:Reset()end;function B:AddOffset(F)self.InitialOffset=self.Offset+F;self.InitialVelocity=self.Velocity;self:Reset()end;function B:SetVelocity(G)self.InitialOffset=self.Offset;self.InitialVelocity=G;self:Reset()end;function B:AddVelocity(G)self.InitialOffset=self.Offset;self.InitialVelocity=self.Velocity+G;self:Reset()end;function B:Print()local X=tostring(self)print(X)end;return u
    end
    fake_module_scripts[script] = module_script
end

-- Fake Local Scripts:

local function JVWUBPF_fake_script() -- Fake Script: ServerStorage.AFEM.Init
    local script = Instance.new("LocalScript")
    script.Name = "Init"
    script.Parent = Converted["_AFEM"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local ts = game:GetService("TweenService")
	
	
	_G.AFEM = script.Parent
	local COREGUI = game:GetService("CoreGui")
	function randomString()
		local length = math.random(10,20)
		local array = {}
		for i = 1, length do
			array[i] = string.char(math.random(32, 126))
		end
		return table.concat(array)
	end
	local s, e = pcall(function()
		if get_hidden_gui or gethui then
			local hiddenUI = get_hidden_gui or gethui
			script.Parent.Name = randomString()
			script.Parent.Parent = hiddenUI()
			print("[AFEM] - Using get_hidden_gui for anti-detection.")
		elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
			script.Parent.Name = randomString()
			syn.protect_gui(script.Parent)
			script.Parent.Parent = COREGUI
			print("[AFEM] - Using syn.protect_gui for anti-detection.")
		elseif COREGUI:FindFirstChild('RobloxGui') then
			script.Parent.Parent = COREGUI.RobloxGui
			print("[AFEM] - Using RobloxGui for anti-detection.")
		else
			warn("[AFEM] - Using CoreGui as anti-detection. This is the most basic coverage and can still be detected.")
		end
	end)
	
	print("[AFEM] - AFEM is now in " .. tostring(script.Parent:GetFullName()))
	if not s then
		warn("[AFEM] - Attempts at anti-detection failed. Using CoreGui as anti-detection.")
		warn(e)	
	end
	
	script.Parent.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	script.Parent.ScreenInsets = Enum.ScreenInsets.None
	script.Parent.ResetOnSpawn = false
	
	
	script.Parent.Menu.Position = UDim2.fromScale(1.2, 0.968)
	
	ts:Create(_G.AFEM.Menu, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), 
		{Position = UDim2.fromScale(0.986, 0.968)}
	):Play()
	
	repeat task.wait() until _G.AFEMEmoteList
	
	--repeat
	--	task.wait()
	--until #_G.AFEMEmoteList > 10
	
	require(script.Parent.FUNCTIONS).refresh()
	
	--require(script.Parent.FUNCTIONS).notification("Welcome to AFEM v1.0!")
	
	
	
end
local function GDYUXM_fake_script() -- Fake Script: ServerStorage.AFEM.SetCustomButtonEmote.Add.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Add"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local ts = game:GetService("TweenService")
	
	
	script.Parent.MouseButton1Click:Connect(function()
		if script.Parent.Parent.TextBox.Text == "" then return end
		ts:Create(script.Parent.Parent.Parent.Menu.UIScale, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Scale = 1
		}):Play()
		ts:Create(script.Parent.Parent, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.fromScale(0.5, -0.5)
		}):Play()
		
		
		local lastmodule = _G.Modules[#_G.Modules]
		require(script.Parent.Parent.Parent.FUNCTIONS).notification("Module is loading...")
		local newmodule = loadstring(game:HttpGet(script.Parent.Parent.TextBox.Text))()
		if newmodule["BG_TASK"] then
			coroutine.wrap(newmodule["BG_TASK"])()
		end
		if _G.Modules[#_G.Modules] ~= lastmodule then
			local newmodule = _G.Modules[#_G.Modules]
			require(script.Parent.Parent.Parent.FUNCTIONS).notification("New module added: " .. newmodule["Name"])
			require(script.Parent.Parent.Parent.FUNCTIONS).refreshlist()
		else
			require(script.Parent.Parent.Parent.FUNCTIONS).notification("Module failed to load after 5 seconds.")
		end
	end)
end
local function UYHWFHN_fake_script() -- Fake Script: ServerStorage.AFEM.SetCustomButtonEmote.Cancel.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Cancel"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local ts = game:GetService("TweenService")
	
	script.Parent.MouseButton1Click:Connect(function()
		ts:Create(script.Parent.Parent.Parent.Menu.UIScale, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Scale = 1
		}):Play()
		ts:Create(script.Parent.Parent, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.fromScale(0.5, -0.5)
		}):Play()
	end)
end
local function RMWYPO_fake_script() -- Fake Script: ServerStorage.AFEM.Menu.UIStroke.UIGradient.Animator
    local script = Instance.new("LocalScript")
    script.Name = "Animator"
    script.Parent = Converted["_UIGradient2"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local ts = game:GetService("TweenService")
	
	ts:Create(script.Parent, TweenInfo.new(
		10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,
		math.huge, false), {
			Rotation = -180
		}):Play()
end
local function DOXTRK_fake_script() -- Fake Script: ServerStorage.AFEM.Menu.Area.Search
    local script = Instance.new("LocalScript")
    script.Name = "Search"
    script.Parent = Converted["_Area"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	function levenshtein(str1, str2)
		local len1 = string.len(str1)
		local len2 = string.len(str2)
		local matrix = {}
	
		-- Initialize base cases
		for i = 0, len1 do
			matrix[i] = {}
			matrix[i][0] = i
		end
		for j = 0, len2 do
			matrix[0][j] = j
		end
	
		-- Calculate matrix
		for i = 1, len1 do
			for j = 1, len2 do
				local cost = (str1:sub(i, i) == str2:sub(j, j)) and 0 or 1
				matrix[i][j] = math.min(
					matrix[i - 1][j] + 1,   -- Deletion
					matrix[i][j - 1] + 1,   -- Insertion
					matrix[i - 1][j - 1] + cost) -- Substitution
			end
		end
	
		return matrix[len1][len2]
	end
	
	-- Function to perform fuzzy search with substring and case-insensitive matching
	function fuzzySearch(query, items)
		-- Normalize query and items to lowercase for case-insensitive matching
		query = string.lower(query)
	
		local results = {}
		for _, item in ipairs(items) do
			local normalizedItem = string.lower(item)
	
			-- Check if query is a substring of item
			local start, _ = string.find(normalizedItem, query)
	
			-- Calculate distance based on substring match or overall string
			local distance = (start ~= nil)
				and levenshtein(query, normalizedItem:sub(start, start + #query - 1))  -- Substring distance
				or levenshtein(query, normalizedItem)                                  -- Whole string distance
	
			table.insert(results, {item = item, distance = distance, hasSubstring = start ~= nil})
		end
	
		-- Sort results by distance (ascending), prioritizing substring matches and then alphabetical order
		table.sort(results, function(a, b)
			if a.distance ~= b.distance then
				return a.distance < b.distance
			elseif a.hasSubstring ~= b.hasSubstring then
				return a.hasSubstring 
			else
				return a.item < b.item -- Sort alphabetically if distances and substring presence are equal
			end
		end)
	
		-- Extract sorted items
		local sortedItems = {}
		for _, result in ipairs(results) do
			table.insert(sortedItems, result.item)
		end
	
		return sortedItems
	end
	names = {}
	repeat task.wait() until _G.AFEMEmoteList
	for _, v in ipairs(_G.AFEMEmoteList) do
		table.insert(names, v['name'])
	end
	repeat task.wait() until _G.AFEMAnimationPacksList
	for _, v in ipairs(_G.AFEMAnimationPacksList) do
		table.insert(names, v['name'])
	end
	script.Parent.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		local searchText = script.Parent.TextBox.Text
		script.Parent.Area.CanvasPosition = Vector2.zero
		if searchText == "" then
			for _, button in ipairs(script.Parent.Area:GetChildren()) do
				if button.Name == "Sample" then continue end
				if not button:IsA("ImageButton") then continue end
				button.LayoutOrder = 0
			end
			return
		end
		local result = fuzzySearch(searchText, names)
	
		for sort, item in ipairs(result) do
			if script.Parent.Area:FindFirstChild(item) then
				script.Parent.Area:FindFirstChild(item).LayoutOrder = sort
			end
		end
	end)
end
local function IFCGSF_fake_script() -- Fake Script: ServerStorage.AFEM.Menu.Area.Switch.Switch
    local script = Instance.new("LocalScript")
    script.Name = "Switch"
    script.Parent = Converted["_Switch"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local current = "EMOTE" -- emotes
	local toSwitch = "ANPACK" -- animation packs
	
	local area = script.Parent.Parent.Area
	
	function ends_with(str, ending)
		return ending == "" or str:sub(-#ending) == ending
	end
	
	script.Parent.MouseButton1Click:Connect(function()
		local placeholder = current
		current = toSwitch
		toSwitch = placeholder
		
		if current == "EMOTE" then
			script.Parent.Text = "Emotes"
		else
			script.Parent.Text = "Animation packs"
		end
		
		for _, v in ipairs(area:GetChildren()) do
			if not v:IsA("ImageButton") then continue end
			if not ends_with(v.Name, current) then
				v.Visible = false
			elseif ends_with(v.Name, current) then
				v.Visible = true
			end
		end
	end)
end
local function AGTY_fake_script() -- Fake Script: ServerStorage.AFEM.Menu.CloseArea.CloseOpen
    local script = Instance.new("LocalScript")
    script.Name = "CloseOpen"
    script.Parent = Converted["_CloseArea"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	
	local menu = script.Parent.Parent
	local Spring = require(menu.Parent.Spring)
	local DraggableObject = require(menu.Parent.DraggableObject)
	
	-- Tween the TextLabel transparency
	--TweenService:Create(script.Parent.TextLabel, TweenInfo.new(20, Enum.EasingStyle.Linear), {
	--	TextTransparency = 1,
	--	BackgroundTransparency = 1
	--}):Play()
	
	local closed = false
	local springing = false
	
	local lastPos = UDim2.fromScale(0.986, 0.968)
	local closedLastPos = UDim2.fromScale(0.1, 0.5)
	
	-- Initialize springs for menu position and size
	local MenuPosXScale = Spring.new(0.7, 30, 100, 0.986, 0, 0.986)
	local MenuPosYScale = Spring.new(1, 25, 100, menu.Position.Y.Scale, 0, menu.Position.Y.Scale)
	local MenuPosXOffset = Spring.new(0.7, 30, 100, 0, 0)
	local MenuPosYOffset = Spring.new(1, 25, 100, 0, 0)
	local MenuSizeXOffset = Spring.new(1.5, 25, 100, menu.Size.X.Offset, 0, menu.Size.X.Offset)
	local MenuSizeYOffset = Spring.new(1.5, 25, 100, menu.Size.Y.Offset, 0, menu.Size.Y.Offset)
	
	-- Functions to update spring goals and offsets
	local function setSpringPosGoal(udim2)
		MenuPosXScale:SetGoal(udim2.X.Scale)
		MenuPosYScale:SetGoal(udim2.Y.Scale)
		MenuPosXOffset:SetGoal(udim2.X.Offset)
		MenuPosYOffset:SetGoal(udim2.Y.Offset)
	end
	
	local function setSpringSizeGoal(udim2)
		MenuSizeXOffset:SetGoal(udim2.X.Offset)
		MenuSizeYOffset:SetGoal(udim2.Y.Offset)
	end
	
	-- Render step to update menu position and size based on spring values
	RunService.RenderStepped:Connect(function()
		if springing then
			menu.Position = UDim2.new(MenuPosXScale.Offset, MenuPosXOffset.Offset, MenuPosYScale.Offset, MenuPosYOffset.Offset)
			menu.Size = UDim2.fromOffset(MenuSizeXOffset.Offset, MenuSizeYOffset.Offset)
		end
	end)
	
	-- Initialize draggable menu
	local MenuDrag = DraggableObject.new(script.Parent, menu, false, true)
	MenuDrag:Enable()
	
	local OpenerMenuDrag = DraggableObject.new(script.Parent.Parent.CanvasGroup.Opener, menu, false, true)
	OpenerMenuDrag:Enable()
	local OpenerDraggable = true
	
	textHidden = false
	
	
	-- Dragging behavior
	MenuDrag.Dragged = function(pos)
		--if not textHidden then
		--	textHidden = true
		--	TweenService:Create(script.Parent.TextLabel, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
		--		TextTransparency = 1,
		--		BackgroundTransparency = 1
		--	}):Play()
		--end
		lastPos = pos
		setSpringPosGoal(pos)
	end
	
	OpenerMenuDrag.Dragged = function(pos)
		if OpenerDraggable then
			closedLastPos = pos
			setSpringPosGoal(pos)
		end
	end
	
	script.Parent.Parent.Close.Event:Connect(function()
		if not textHidden then
			textHidden = true
			TweenService:Create(script.Parent.TextLabel, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				TextTransparency = 1,
				BackgroundTransparency = 1
			}):Play()
		end
		TweenService:Create(menu, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			AnchorPoint = Vector2.new(0.5, 0.5)
		}):Play()
		springing = true
		setSpringPosGoal(closedLastPos)
		setSpringSizeGoal(UDim2.fromOffset(25, 25))
		--script.Parent.ZIndex = script.Parent.ZIndex - 2
		menu.CanvasGroup.Visible = true
		OpenerDraggable = true
		TweenService:Create(menu.CanvasGroup, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			GroupTransparency = 0
		}):Play()
	end)
	
	script.Parent.MouseButton1Click:Connect(function()
		if not textHidden then
			textHidden = true
			TweenService:Create(script.Parent.TextLabel, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				TextTransparency = 1,
				BackgroundTransparency = 1
			}):Play()
		end
		TweenService:Create(menu, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			AnchorPoint = Vector2.new(0.5, 0.5)
		}):Play()
		springing = true
		setSpringPosGoal(closedLastPos)
		setSpringSizeGoal(UDim2.fromOffset(25, 25))
		--script.Parent.ZIndex = script.Parent.ZIndex - 2
		menu.CanvasGroup.Visible = true
		OpenerDraggable = true
		TweenService:Create(menu.CanvasGroup, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			GroupTransparency = 0
		}):Play()
	end)
	
	-- Opener button behavior
	menu.CanvasGroup.Opener.MouseButton1Click:Connect(function()
		TweenService:Create(menu, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			AnchorPoint = Vector2.new(1, 1)
		}):Play()
	
		setSpringPosGoal(lastPos)
		setSpringSizeGoal(UDim2.fromOffset(309, 188))
		OpenerDraggable = false
		--script.Parent.ZIndex = script.Parent.ZIndex + 2
		local closing = TweenService:Create(menu.CanvasGroup, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			GroupTransparency = 1
		})
		closing:Play()
		closing.Completed:Once(function()
			menu.CanvasGroup.Visible = false
		end)
	end)
	
	task.wait(1)
	springing = true
end
local function YPOKF_fake_script() -- Fake Script: ServerStorage.AFEM.EmoteList
    local script = Instance.new("LocalScript")
    script.Name = "EmoteList"
    script.Parent = Converted["_AFEM"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	--task.wait(5)
	local http = game:GetService("HttpService")
	local s = pcall(function()
		print("[AFEM] -  Pulling emotes from GitHub repo...")
		_G.AFEMEmoteList = http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/AFEM/refs/heads/main/emotes.json"))
	end)
	if not s then
		print("[AFEM] - Getting from website failed. Using fallback...")
		-- There's no fallback.
		_G.AFEMEmoteList = http:JSONDecode('[{"id":14353423348,"animationid":"http://www.roblox.com/asset/?id=14352343065","name":"BabyQueen-BouncyTwirl"}]')
	end
	print("[AFEM] - Emote list listed.")
	
	local s = pcall(function()
		print("[AFEM] -  Pulling animation packs from GitHub repo...")
		_G.AFEMAnimationPacksList = http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/AFEM/refs/heads/main/animationpacks.json"))
	end)
	if not s then
		print("[AFEM] - Getting from website failed. Using fallback...")
		-- There's no fallback.
		_G.AFEMAnimationPacksList = http:JSONDecode('[{"_comment":"All animation IDs has been pulled independently by the YARHM Team. If you are gonna use this for your own emotes menu, please credit us. We will be updating this list periodically and automatically."},{"CustomImage":"rbxassetid://18812005744","Name":"Confident","ProductId":0,"Animations":{"walk":{"WalkAnim":"http://www.roblox.com/asset/?id=1070017263"},"swimidle":{"SwimIdle":"http://www.roblox.com/asset/?id=1070012133"},"idle":{"Animation1":"http://www.roblox.com/asset/?id=1069977950","Animation2":"http://www.roblox.com/asset/?id=1069987858"},"climb":{"ClimbAnim":"http://www.roblox.com/asset/?id=1069946257"},"jump":{"JumpAnim":"http://www.roblox.com/asset/?id=1069984524"},"fall":{"FallAnim":"http://www.roblox.com/asset/?id=1069973677"},"run":{"RunAnim":"http://www.roblox.com/asset/?id=1070001516"},"swim":{"Swim":"http://www.roblox.com/asset/?id=1070009914"}},"BundleId":0}]')
	end
	print("[AFEM] - Animation packs listed.")
end

coroutine.wrap(JVWUBPF_fake_script)()
coroutine.wrap(GDYUXM_fake_script)()
coroutine.wrap(UYHWFHN_fake_script)()
coroutine.wrap(RMWYPO_fake_script)()
coroutine.wrap(DOXTRK_fake_script)()
coroutine.wrap(IFCGSF_fake_script)()
coroutine.wrap(AGTY_fake_script)()
coroutine.wrap(YPOKF_fake_script)()
