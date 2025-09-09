local Services= setmetatable({}, {
__index= function(_, name)
return game:GetService(name) end})


local TweenService= game:GetService("TweenService")
local Players= game:GetService("Players")

function createRoundedCorner(parent, cornerRadius, outlineColor, outlineThickness)
    local corner= Instance.new("UICorner")
    corner.CornerRadius= UDim.new(0, cornerRadius)
    corner.Parent= parent
    task.wait(0.05)
    return corner
end

 function createGradient(parent, color1, color2, rotation)
	assert(parent and parent:IsA("GuiObject"), "parent must be a GuiObject")
	assert(typeof(color1)== "Color3" and typeof(color2)== "Color3", "colors must be Color3")

	local base= parent.BackgroundColor3
	local blend= 0.9

	 function mix(c1, c2, t)
		return Color3.new(
			c1.R + (c2.R - c1.R) * t,
			c1.G + (c2.G - c1.G) * t,
			c1.B + (c2.B - c1.B) * t
		)
	end

	local mixed1= mix(base, color1, 1 - blend) 
	local mixed2= mix(base, color2, 1 - blend)
	
 old= parent:FindFirstChild("UIGradient")
	if old then old:Destroy() end

	local gradient= Instance.new("UIGradient")
	gradient.Color= ColorSequence.new{
		ColorSequenceKeypoint.new(0, mixed1),
		ColorSequenceKeypoint.new(1, mixed2)
	}
	gradient.Rotation= rotation or 0
	gradient.Parent= parent
task.wait(0.05)
	return gradient
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local cg = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui", cg)
gui.Name = "What A Silly Notify"
gui.IgnoreGuiInset = true

local container = Instance.new("Frame")
container.AnchorPoint = Vector2.new(1,0) -- top-right anchor
container.Position = UDim2.new(1, -16, 0, 80)
container.Size = UDim2.new(0, 240, 1, -32)
container.BackgroundTransparency = 1
container.Parent = gui

local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Vertical
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)
layout.Parent = container

local padding = Instance.new("UIPadding")
padding.PaddingRight = UDim.new(0, 0)
padding.Parent = container

function notify(title, description, duration)
    duration = duration or 3

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 220, 0, 70) -- smaller
    main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    main.ClipsDescendants = true
    main.Parent = container
    main.Visible = false
    main.LayoutOrder = -os.clock()
    createRoundedCorner(main, 10)
    createGradient(main, Color3.fromRGB(40, 40, 40), Color3.fromRGB(30, 30, 30), 90)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, -20, 0, 22)
    titleLabel.Position = UDim2.new(0, 10, 0, 6)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextScaled = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = title or "Title"
    titleLabel.Parent = main

    local underline = Instance.new("Frame")
    underline.Size = UDim2.new(1, -20, 0, 2)
    underline.Position = UDim2.new(0, 10, 0, 30)
    underline.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    underline.BorderSizePixel = 0
    underline.Parent = main

    local descLabel = Instance.new("TextLabel")
    descLabel.BackgroundTransparency = 1
    descLabel.Size = UDim2.new(1, -20, 1, -44)
    descLabel.Position = UDim2.new(0, 10, 0, 36)
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextScaled = true
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextYAlignment = Enum.TextYAlignment.Top
    descLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    descLabel.TextWrapped = true
    descLabel.Text = description or "Description goes here"
    descLabel.Parent = main

    local barBG = Instance.new("Frame")
    barBG.Size = UDim2.new(1, -20, 0, 4)
    barBG.Position = UDim2.new(0, 10, 1, -8)
    barBG.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    barBG.BorderSizePixel = 0
    barBG.Parent = main
    createRoundedCorner(barBG, 4)

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 1, 0)
    bar.Position = UDim2.new(0, 0, 0, 0)
    bar.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
    bar.BorderSizePixel = 0
    bar.Parent = barBG
    createRoundedCorner(bar, 4)

    -- Start position (offscreen right)
    main.Position = UDim2.new(0, 40, 0, 0)
    main.BackgroundTransparency = 1

    -- Fade In (slide left)
    local inTween = TweenService:Create(
        main,
        TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0}
    )
    inTween:Play()

    -- Progress bar
    TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()

    -- Fade Out (slide right)
    task.delay(duration, function()
        local outTween = TweenService:Create(
            main,
            TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
            {Position = UDim2.new(0, 40, 0, 0), BackgroundTransparency = 1}
        )
        outTween:Play()
        outTween.Completed:Wait()
        main:Destroy()
    end)
end





 Players= Services.Players
 player= Players.LocalPlayer
 RunService= Services.RunService
 HttpService= Services.HttpService
 TweenService= Services.TweenService
 
EMOTES_FILE= "emotes.json"
defaultEmotes= loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Default%20Emote'))()
local Screen= setmetatable({}, {
__index= function(_, key)
local cam= workspace.CurrentCamera
local size= cam and cam.ViewportSize or Vector2.new(1920, 1080)
if key== "Width" then
return size.X
elseif key== "Height" then
return size.Y
elseif key== "Size" then
return size
end end})

function scale(axis, value)
if axis== "X" then
        return value * (Screen.Width / 1920) * 1.5
    elseif axis== "Y" then
        return value * (Screen.Height / 1080) * 1.5
end end

function saveEmotes()
    local ok, json= pcall(HttpService.JSONEncode, HttpService, emotes)
    if not ok then return false end
    writefile(EMOTES_FILE, json)
    return true
end
function loadEmotes()
    if isfile(EMOTES_FILE) then
        local success, data= pcall(function()
            return HttpService:JSONDecode(readfile(EMOTES_FILE))
        end)
        
        if success and type(data)== "table" then
            return data
        end
    end return nil
end

 function initEmotes()
    local loaded= loadEmotes()
    if loaded then
        emotes= loaded
    else
        emotes= defaultEmotes
        saveEmotes()
end end

initEmotes()

 function createShadow(parent, size, position, zindex)
    local shadow= Instance.new("ImageLabel")
    shadow.Name= "Shadow"
    shadow.BackgroundTransparency= 1
    shadow.Size= UDim2.fromOffset(size.X, size.Y)
    shadow.Position= UDim2.fromOffset(position.X, position.Y)
    shadow.ZIndex= zindex or (parent.ZIndex - 1)
    shadow.Image= "rbxassetid://1316045217"
    shadow.ImageColor3= Color3.new(0, 0, 0)
    shadow.ImageTransparency= 0.5
    shadow.ScaleType= Enum.ScaleType.Slice
    shadow.SliceCenter= Rect.new(10, 10, 118, 118)

    shadow.Parent= parent
    return shadow
end

 

gui= Instance.new("ScreenGui")
gui.Name= "EmoteGui"
gui.ZIndexBehavior= Enum.ZIndexBehavior.Sibling
gui.Parent= game:GetService("CoreGui")


 shadowContainer= Instance.new("Frame")
shadowContainer.Size= UDim2.new(0, scale("X", 500), 0, scale("Y", 600))
shadowContainer.Position= UDim2.new(0, scale("X", 20), 0.5, -scale("Y", 300))
shadowContainer.BackgroundTransparency= 1
shadowContainer.Parent= gui
shadowContainer.Active= true
shadowContainer.Draggable= true
shadowContainer.Selectable= true
createShadow(shadowContainer, UDim2.new(1, 10, 1, 10), UDim2.new(0, -5, 0, -5))

local main= Instance.new("Frame")
main.Size= UDim2.new(1, 0, 1, 0)
main.BackgroundColor3= Color3.fromRGB(35, 35, 35)
main.Parent= shadowContainer
createRoundedCorner(main, 12)
createGradient(main, Color3.fromRGB(40, 40, 40), Color3.fromRGB(30, 30, 30))

 topBar= Instance.new("Frame")
topBar.Size= UDim2.new(1, 0, 0, scale("Y", 40))
topBar.BackgroundColor3= Color3.fromRGB(50, 50, 50)
topBar.Name= "TopBar"
topBar.Parent= main
createRoundedCorner(topBar, 12)
createGradient(topBar, Color3.fromRGB(60, 60, 60), Color3.fromRGB(45, 45, 45))

 title= Instance.new("TextLabel")
title.Size= UDim2.new(0, scale("X", 80), 0, scale("Y", 45))
title.BackgroundTransparency= 1
title.Text= ":3 Emotes"
title.TextColor3= Color3.new(1, 1, 1)
title.Font= Enum.Font.SourceSansBold
title.TextScaled= true
title.TextXAlignment= Enum.TextXAlignment.Left
title.Position= UDim2.new(0, 5, 0, 0)
title.Parent= topBar

 searchBox= Instance.new("TextBox")
searchBox.Size= UDim2.new(0, scale("X", 200), 0, scale("Y", 28))
searchBox.Position= UDim2.new(0, scale("X", 110), 0.5, -scale("Y", 14))
searchBox.BackgroundColor3= Color3.fromRGB(30, 30, 30)
searchBox.TextColor3= Color3.new(1, 1, 1)
searchBox.PlaceholderText= "Search emotes..."
searchBox.PlaceholderColor3= Color3.new(0.7, 0.7, 0.7)
searchBox.Font= Enum.Font.Gotham
searchBox.TextScaled= true
searchBox.Text= ""
searchBox.ClearTextOnFocus= false
searchBox.ZIndex= 3
searchBox.Parent= topBar

createRoundedCorner(searchBox, 8)

 minButton= Instance.new("TextButton")
minButton.Size= UDim2.new(0, scale("X", 35), 0, scale("Y", 35))
minButton.Position= UDim2.new(1, -scale("X", 75), 0.5, -scale("Y", 17.5))
minButton.BackgroundTransparency= 1
minButton.TextColor3= Color3.new(1, 1, 1)
minButton.Text= "-"
minButton.Font= Enum.Font.GothamBold
minButton.TextScaled= true
minButton.ZIndex= 3
minButton.Parent= topBar

 closeButton= Instance.new("TextButton")
closeButton.Size= UDim2.new(0, scale("X", 35), 0, scale("Y", 35))
closeButton.Position= UDim2.new(1, -scale("X", 35), 0.5, -scale("Y", 17.5))
closeButton.BackgroundTransparency= 1
closeButton.TextColor3= Color3.new(1, 1, 1)
closeButton.Text= "×"
closeButton.Font= Enum.Font.GothamBold
closeButton.TextScaled= true
closeButton.ZIndex= 3
closeButton.Parent= topBar


 scroll= Instance.new("ScrollingFrame")
scroll.Size= UDim2.new(1, -scale("X", 15), 1, -scale("Y", 50))
scroll.Position= UDim2.new(0, scale("X", 7.5), 0, scale("Y", 45))
scroll.CanvasSize= UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness= scale("X", 8)
scroll.ScrollBarImageColor3= Color3.fromRGB(100, 100, 100)
scroll.BackgroundTransparency= 1
scroll.Parent= main


 layout= Instance.new("UIGridLayout")
layout.CellSize= UDim2.new(0, scale("X", 110), 0, scale("Y", 180))
layout.CellPadding= UDim2.new(0, scale("X", 10), 0, scale("Y", 15))
layout.HorizontalAlignment= Enum.HorizontalAlignment.Center
layout.Parent= scroll


 filterFrame= Instance.new("Frame")
filterFrame.Size= UDim2.new(0, scale("X", 140), 0, scale("Y", 320))
filterFrame.Position= UDim2.new(1, scale("X", 15), 0, scale("Y", 45))
filterFrame.BackgroundColor3= Color3.fromRGB(45, 45, 45)
filterFrame.Parent= main

createRoundedCorner(filterFrame, 12)
createShadow(filterFrame, UDim2.new(1, 10, 1, 10), UDim2.new(0, -5, 0, -5))
createGradient(filterFrame, Color3.fromRGB(50, 50, 50), Color3.fromRGB(40, 40, 40))


 function makeBtn(txt, y, callback)
    local btnContainer= Instance.new("Frame")
    btnContainer.Size= UDim2.new(1, -scale("X", 12), 0, scale("Y", 35))
    btnContainer.Position= UDim2.new(0, scale("X", 6), 0, y)
    btnContainer.BackgroundTransparency= 1
    btnContainer.Parent= filterFrame
    
    local shadow= createShadow(btnContainer, UDim2.new(1, 6, 1, 6), UDim2.new(0, -3, 0, -3))
    
    local b= Instance.new("TextButton")
    b.Size= UDim2.new(1, 0, 1, 0)
    b.BackgroundColor3= Color3.fromRGB(70, 70, 70)
    b.TextColor3= Color3.new(1, 1, 1)
    b.Font= Enum.Font.GothamBold
    b.TextScaled= true
    b.Text= txt
    b.AutoButtonColor= false
    b.Parent= btnContainer
    
    createRoundedCorner(b, 8)
    createGradient(b, Color3.fromRGB(80, 80, 80), Color3.fromRGB(60, 60, 60))
    
    
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(90, 90, 90)}):Play()
    end)
    
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(70, 70, 70)}):Play()
    end)
    
    b.MouseButton1Click:Connect(function()
        callback(b)
    end)
    
    return b
end

 sortModes= {"New", "Old", "Expensive", "Cheap", "A-Z", "Z-A"}
 sortIndex= 1
 ugcOnly= nil
 searchText= ""

local minimized= false
local originalSize= shadowContainer.Size
local minimizedSize= UDim2.new(0, scale("X", 400), 0, scale("Y", 40))

minButton.MouseButton1Click:Connect(function()
    minimized= not minimized
    if minimized then
        TweenService:Create(shadowContainer, TweenInfo.new(0.3), {Size= minimizedSize}):Play()
        scroll.Visible= false
        filterFrame.Visible= false
        minButton.Text= "+"
    else
        TweenService:Create(shadowContainer, TweenInfo.new(0.3), {Size= originalSize}):Play()
        scroll.Visible= true
        filterFrame.Visible= true
        minButton.Text= "-"
    end
end)


local function stopCurrentAnimation()
    if currentAnimationTrack then
        currentAnimationTrack:Stop(0.1)
        currentAnimationTrack= nil
    end
end


local function createConfirmation(title, message, beg, callback)
    if gui:FindFirstChild("ConfirmationFrame") then
        gui:FindFirstChild("ConfirmationFrame"):Destroy()
    end
    
    
    local confirmationFrame= Instance.new("Frame")
    confirmationFrame.Size= UDim2.new(2, 0, 2, 0)
    confirmationFrame.Position= UDim2.new(-0.5, 0, -0.5, 0)
    confirmationFrame.BackgroundColor3= Color3.new(0, 0, 0)
    confirmationFrame.BackgroundTransparency= 0.6
    confirmationFrame.ZIndex= 100
    confirmationFrame.Name= "ConfirmationFrame"
    confirmationFrame.Parent= gui
    
    local dialogContainer= Instance.new("Frame")
    dialogContainer.Size= UDim2.new(0, scale("X", 350), 0, scale("Y", 200))
    dialogContainer.Position= UDim2.new(0.5, -scale("X", 175), 0.5, -scale("Y", 100))
    dialogContainer.BackgroundTransparency= 1
    dialogContainer.ZIndex= 101
    dialogContainer.Parent= confirmationFrame
    
    createShadow(dialogContainer, UDim2.new(1, 10, 1, 10), UDim2.new(0, -5, 0, -5))
    
    local dialog= Instance.new("Frame")
    dialog.Size= UDim2.new(1, 0, 1, 0)
    dialog.BackgroundColor3= Color3.fromRGB(50, 50, 50)
    dialog.ZIndex= 102
    dialog.Parent= dialogContainer
    
    createRoundedCorner(dialog, 12)
    createGradient(dialog, Color3.fromRGB(55, 55, 55), Color3.fromRGB(45, 45, 45))
    
    local titleLbl= Instance.new("TextLabel")
    titleLbl.Size= UDim2.new(1, 0, 0, scale("Y", 40))
    titleLbl.BackgroundColor3= Color3.fromRGB(70, 70, 70)
    titleLbl.Text= title
    titleLbl.TextColor3= Color3.new(1, 1, 1)
    titleLbl.Font= Enum.Font.GothamBold
    titleLbl.TextScaled= true
    titleLbl.ZIndex= 103
    titleLbl.Parent= dialog
    
    createRoundedCorner(titleLbl, 12)
    
    local messageLbl= Instance.new("TextLabel")
    messageLbl.Size= UDim2.new(1, -scale("X", 20), 0, scale("Y", 50))
    messageLbl.Position= UDim2.new(0, scale("X", 10), 0, scale("Y", 45))
    messageLbl.BackgroundTransparency= 1
    messageLbl.Text= message
    messageLbl.TextColor3= Color3.new(1, 1, 1)
    messageLbl.TextWrapped= true
    messageLbl.Font= Enum.Font.Gotham
    messageLbl.TextScaled= true
    messageLbl.ZIndex= 103
    messageLbl.Parent= dialog
    
    local begLbl= Instance.new("TextLabel")
    begLbl.Size= UDim2.new(1, -scale("X", 20), 0, scale("Y", 30))
    begLbl.Position= UDim2.new(0, scale("X", 10), 0, scale("Y", 95))
    begLbl.BackgroundTransparency= 1
    begLbl.Text= beg
    begLbl.TextColor3= Color3.new(1, 0.3, 0.3)
    begLbl.TextWrapped= true
    begLbl.Font= Enum.Font.GothamBlack
    begLbl.TextScaled= true
    begLbl.ZIndex= 103
    begLbl.Parent= dialog
    
    local buttonContainer= Instance.new("Frame")
    buttonContainer.Size= UDim2.new(1, -scale("X", 20), 0, scale("Y", 40))
    buttonContainer.Position= UDim2.new(0, scale("X", 10), 1, -scale("Y", 50))
    buttonContainer.BackgroundTransparency= 1
    buttonContainer.ZIndex= 103
    buttonContainer.Parent= dialog
    
    local noButton= Instance.new("TextButton")
    noButton.Size= UDim2.new(0.45, 0, 1, 0)
    noButton.Position= UDim2.new(0, 0, 0, 0)
    noButton.BackgroundColor3= Color3.fromRGB(80, 80, 80)
    noButton.TextColor3= Color3.new(1, 1, 1)
    noButton.Text= "NO"
    noButton.Font= Enum.Font.GothamBold
    noButton.TextScaled = true
    noButton.ZIndex= 104
    noButton.Parent= buttonContainer
    
    createRoundedCorner(noButton, 8)
    createGradient(noButton, Color3.fromRGB(90, 90, 90), Color3.fromRGB(70, 70, 70))
    
    local yesButton= Instance.new("TextButton")
    yesButton.Size= UDim2.new(0.45, 0, 1, 0)
    yesButton.Position= UDim2.new(0.55, 0, 0, 0)
    yesButton.BackgroundColor3= Color3.fromRGB(180, 60, 60)
    yesButton.TextColor3= Color3.new(1, 1, 1)
    yesButton.Text= "YES"
    yesButton.Font= Enum.Font.GothamBold
    yesButton.TextScaled= true
    yesButton.ZIndex= 104
    yesButton.Parent= buttonContainer
    
    createRoundedCorner(yesButton, 8)
    createGradient(yesButton, Color3.fromRGB(200, 70, 70), Color3.fromRGB(160, 50, 50))
    
    
    noButton.MouseButton1Click:Connect(function()
        confirmationFrame:Destroy()
    end)
    
    yesButton.MouseButton1Click:Connect(function()
        confirmationFrame:Destroy()
        callback()
    end)
    
    
    noButton.MouseEnter:Connect(function()
        TweenService:Create(noButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(100, 100, 100)}):Play()
    end)
    
    noButton.MouseLeave:Connect(function()
        TweenService:Create(noButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(80, 80, 80)}):Play()
    end)
    
    yesButton.MouseEnter:Connect(function()
        TweenService:Create(yesButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(200, 70, 70)}):Play()
    end)
    
    yesButton.MouseLeave:Connect(function()
        TweenService:Create(yesButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(180, 60, 60)}):Play()
    end)
end


closeButton.MouseButton1Click:Connect(function()
    createConfirmation(
        "CLOSE GUI", 
        "ARE YOU SURE YOU WANT TO CLOSE THIS COOL EMOTE GUI?",
        "PLEASE DON'T CLOSE ME!",
        function()
            gui:Destroy()
        end
    )
end)


local function openEditUI(emote)
    editingEmote= emote
    
    
    local editContainer= Instance.new("Frame")
    editContainer.Size= UDim2.new(0, scale("X", 600), 0, scale("Y", 500))
    editContainer.Position= UDim2.new(0.5, -scale("X", 300), 0.5, -scale("Y", 250))
    editContainer.BackgroundTransparency= 1
    editContainer.ZIndex= 50
    editContainer.Parent= gui
    
    createShadow(editContainer, UDim2.new(1, 10, 1, 10), UDim2.new(0, -5, 0, -5))
    
    local editFrame= Instance.new("Frame")
    editFrame.Size= UDim2.new(1, 0, 1, 0)
    editFrame.BackgroundColor3= Color3.fromRGB(45, 45, 45)
    editFrame.Parent= editContainer
    editFrame.Draggable= true
    editFrame.Active= true
    
    createRoundedCorner(editFrame, 12)
    createGradient(editFrame, Color3.fromRGB(50, 50, 50), Color3.fromRGB(40, 40, 40))
    
    
    local titleBar= Instance.new("Frame")
    titleBar.Size= UDim2.new(1, 0, 0, scale("Y", 40))
    titleBar.BackgroundColor3= Color3.fromRGB(60, 60, 60)
    titleBar.Name= "TitleBar"
    titleBar.ZIndex= 51
    titleBar.Parent= editFrame
    
    createRoundedCorner(titleBar, 12)
    createGradient(titleBar, Color3.fromRGB(70, 70, 70), Color3.fromRGB(55, 55, 55))
    
    
    local titleLabel= Instance.new("TextLabel")
    titleLabel.Size= UDim2.new(0, scale("X", 250), 1, 0)
    titleLabel.BackgroundTransparency= 1
    titleLabel.Text= "Edit Emote: "..emote.n
    titleLabel.TextColor3= Color3.new(1, 1, 1)
    titleLabel.Font= Enum.Font.GothamBold
    titleLabel.TextScaled = true
    titleLabel.TextXAlignment= Enum.TextXAlignment.Left
    titleLabel.Position= UDim2.new(0, scale("X", 15), 0, 0)
    titleLabel.ZIndex= 52
    titleLabel.Parent= titleBar
    
    
    local editMinButton= Instance.new("TextButton")
    editMinButton.Size= UDim2.new(0, scale("X", 35), 0, scale("Y", 35))
    editMinButton.Position= UDim2.new(1, -scale("X", 75), 0.5, -scale("Y", 17.5))
    editMinButton.BackgroundTransparency= 1
    editMinButton.TextColor3= Color3.new(1, 1, 1)
    editMinButton.Text= "-"
    editMinButton.Font= Enum.Font.GothamBold
    editMinButton.TextScaled = true
    editMinButton.ZIndex= 52
    editMinButton.Parent= titleBar
    
    
    local editCloseButton= Instance.new("TextButton")
    editCloseButton.Size= UDim2.new(0, scale("X", 35), 0, scale("Y", 35))
    editCloseButton.Position= UDim2.new(1, -scale("X", 35), 0.5, -scale("Y", 17.5))
    editCloseButton.BackgroundTransparency= 1
    editCloseButton.TextColor3= Color3.new(1, 1, 1)
    editCloseButton.Text= "×"
    editCloseButton.Font= Enum.Font.GothamBold
    editCloseButton.TextScaled= true
    editCloseButton.ZIndex= 52
    editCloseButton.Parent= titleBar
    
    
    local content= Instance.new("Frame")
    content.Size= UDim2.new(1, 0, 1, -scale("Y", 40))
    content.Position= UDim2.new(0, 0, 0, scale("Y", 40))
    content.BackgroundTransparency= 1
    content.Name= "Content"
    content.ZIndex= 51
    content.Parent= editFrame
    
    -- Preview section (left side)
    local previewFrame= Instance.new("Frame")
    previewFrame.Size= UDim2.new(0.45, 0, 1, 0)
    previewFrame.BackgroundColor3= Color3.fromRGB(35, 35, 35)
    previewFrame.ZIndex= 52
    previewFrame.Parent= content
    
    createRoundedCorner(previewFrame, 8)
    createGradient(previewFrame, Color3.fromRGB(40, 40, 40), Color3.fromRGB(30, 30, 30))
    
    
 
    local imageContainer= Instance.new("Frame")
    imageContainer.Size= UDim2.new(1, -scale("X", 20), 0.8, -scale("Y", 10))
    imageContainer.Position= UDim2.new(0, scale("X", 10), 0, scale("Y", 10))
    imageContainer.BackgroundTransparency= 1
    imageContainer.ClipsDescendants= true
    imageContainer.ZIndex= 53
    imageContainer.Parent= previewFrame
    
    local previewImage= Instance.new("ImageLabel")
    previewImage.Size= UDim2.new(1, 0, 1, 0)
    previewImage.AnchorPoint= Vector2.new(0.5, 0.5)
    previewImage.Position= UDim2.new(0.5, 0, 0.5, 0)
    previewImage.BackgroundTransparency= 1
    previewImage.ScaleType= Enum.ScaleType.Fit
    previewImage.ZIndex= 54
    
    if emote.imageId and emote.imageId > 0 then
        previewImage.Image= "rbxthumb://type=Asset&id=".. emote.imageId .."&w=420&h=420"
    end
    
    previewImage.Parent= imageContainer
    
    local previewLabel= Instance.new("TextLabel")
    previewLabel.Size= UDim2.new(1, -scale("X", 20), 0, scale("Y", 30))
    previewLabel.Position= UDim2.new(0, scale("X", 10), 0.8, scale("Y", 10))
    previewLabel.BackgroundTransparency= 1
    previewLabel.Text= emote.n
    previewLabel.TextColor3= Color3.new(1, 1, 1)
    previewLabel.Font= Enum.Font.GothamBold
    previewLabel.TextScaled = true
    previewLabel.ZIndex= 53
    previewLabel.Parent= previewFrame
    
   
    local settingsFrame= Instance.new("Frame")
    settingsFrame.Size= UDim2.new(0.55, -scale("X", 10), 1, 0)
    settingsFrame.Position= UDim2.new(0.45, scale("X", 10), 0, 0)
    settingsFrame.BackgroundTransparency= 1
    settingsFrame.ZIndex= 52
    settingsFrame.Parent= content
    
    local yPos= scale("Y", 10)
    
    local function addField(label, value, isNumeric)
        local frame= Instance.new("Frame")
        frame.Size= UDim2.new(1, 0, 0, scale("Y", 35))
        frame.Position= UDim2.new(0, 0, 0, yPos)
        frame.BackgroundTransparency= 1
        frame.ZIndex= 53
        frame.Parent= settingsFrame
        
        local lbl= Instance.new("TextLabel")
        lbl.Size= UDim2.new(0.4, 0, 1, 0)
        lbl.BackgroundTransparency= 1
        lbl.Text= label
        lbl.TextColor3= Color3.new(1, 1, 1)
        lbl.Font= Enum.Font.Gotham
        lbl.TextScaled = true
        lbl.TextXAlignment= Enum.TextXAlignment.Left
        lbl.ZIndex= 54
        lbl.Parent= frame
        
        local boxContainer= Instance.new("Frame")
        boxContainer.Size= UDim2.new(0.6, 0, 1, 0)
        boxContainer.Position= UDim2.new(0.4, 0, 0, 0)
        boxContainer.BackgroundTransparency= 1
        boxContainer.ZIndex= 54
        boxContainer.Parent= frame
        
        createShadow(boxContainer, UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2))
        
        local box= Instance.new("TextBox")
        box.Size= UDim2.new(1, 0, 1, 0)
        box.BackgroundColor3= Color3.fromRGB(30, 30, 30)
        box.TextColor3= Color3.new(1, 1, 1)
        box.Text= tostring(value)
        box.Font= Enum.Font.Gotham
        box.TextScaled = true
        box.ZIndex= 55
        box.Parent= boxContainer
        
        createRoundedCorner(box, 6)
        
        
        if isNumeric then
            box:GetPropertyChangedSignal("Text"):Connect(function()
                if not tonumber(box.Text) then
                    box.Text= box.Text:gsub("%D", "")
                end
            end)
        end
        
        yPos += scale("Y", 40)
        return box
    end
    
    
    local nameBox= addField("Name:", emote.n)
    local idBox= addField("ID:", emote.id)
    local priceBox= addField("Price:", emote.price, true)
    local imageBox= addField("Image ID:", emote.imageId or emote.id)
    local dateBox= addField("Date:", emote.cr) -- Date field
    
    
    imageBox.FocusLost:Connect(function()
        local newId= tonumber(imageBox.Text)
        if newId then
            previewImage.Image= "rbxthumb://type=Asset&id="..newId.."&w=420&h=420"
            previewLabel.Text= nameBox.Text
        end
    end)
    
    -- Update preview name when name changes
    nameBox:GetPropertyChangedSignal("Text"):Connect(function()
        previewLabel.Text= nameBox.Text
    end)
    
    -- Animation type toggle
    local animFrame= Instance.new("Frame")
    animFrame.Size= UDim2.new(1, 0, 0, scale("Y", 35))
    animFrame.Position= UDim2.new(0, 0, 0, yPos)
    animFrame.BackgroundTransparency= 1
    animFrame.ZIndex= 53
    animFrame.Parent= settingsFrame
    
    local animLbl= Instance.new("TextLabel")
    animLbl.Size= UDim2.new(0.4, 0, 1, 0)
    animLbl.BackgroundTransparency= 1
    animLbl.Text= "Animation:"
    animLbl.TextColor3= Color3.new(1, 1, 1)
    animLbl.Font= Enum.Font.Gotham
    animLbl.TextScaled = true
    animLbl.TextXAlignment= Enum.TextXAlignment.Left
    animLbl.ZIndex= 54
    animLbl.Parent= animFrame
    
    local animToggleContainer= Instance.new("Frame")
    animToggleContainer.Size= UDim2.new(0.2, 0, 0.8, 0)
    animToggleContainer.Position= UDim2.new(0.4, 0, 0.1, 0)
    animToggleContainer.BackgroundTransparency= 1
    animToggleContainer.ZIndex= 54
    animToggleContainer.Parent= animFrame
    
    createShadow(animToggleContainer, UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2))
    
    local animToggle= Instance.new("TextButton")
    animToggle.Size= UDim2.new(1, 0, 1, 0)
    animToggle.BackgroundColor3= emote.isAnimation and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    animToggle.Text= emote.isAnimation and "YES" or "NO"
    animToggle.TextColor3= Color3.new(1, 1, 1)
    animToggle.Font= Enum.Font.GothamBold
    animToggle.TextScaled = true
    animToggle.ZIndex= 55
    animToggle.Parent= animToggleContainer
    
    createRoundedCorner(animToggle, 6)
    
    animToggle.MouseButton1Click:Connect(function()
        emote.isAnimation= not emote.isAnimation
        animToggle.Text= emote.isAnimation and "YES" or "NO"
        animToggle.BackgroundColor3= emote.isAnimation and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    end)
    
    yPos += scale("Y", 40)
    
    -- UGC type toggle
    local ugcFrame= Instance.new("Frame")
    ugcFrame.Size= UDim2.new(1, 0, 0, scale("Y", 35))
    ugcFrame.Position= UDim2.new(0, 0, 0, yPos)
    ugcFrame.BackgroundTransparency= 1
    ugcFrame.ZIndex= 53
    ugcFrame.Parent= settingsFrame
    
    local ugcLbl= Instance.new("TextLabel")
    ugcLbl.Size= UDim2.new(0.4, 0, 1, 0)
    ugcLbl.BackgroundTransparency= 1
    ugcLbl.Text= "UGC:"
    ugcLbl.TextColor3= Color3.new(1, 1, 1)
    ugcLbl.Font= Enum.Font.Gotham
    ugcLbl.TextScaled = true
    ugcLbl.TextXAlignment= Enum.TextXAlignment.Left
    ugcLbl.ZIndex= 54
    ugcLbl.Parent= ugcFrame
    
    local ugcToggleContainer= Instance.new("Frame")
    ugcToggleContainer.Size= UDim2.new(0.2, 0, 0.8, 0)
    ugcToggleContainer.Position= UDim2.new(0.4, 0, 0.1, 0)
    ugcToggleContainer.BackgroundTransparency= 1
    ugcToggleContainer.ZIndex= 54
    ugcToggleContainer.Parent= ugcFrame
    
    createShadow(ugcToggleContainer, UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2))
    
    local ugcToggle= Instance.new("TextButton")
    ugcToggle.Size= UDim2.new(1, 0, 1, 0)
    ugcToggle.BackgroundColor3= emote.ugc and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    ugcToggle.Text= emote.ugc and "YES" or "NO"
    ugcToggle.TextColor3= Color3.new(1, 1, 1)
    ugcToggle.Font= Enum.Font.GothamBold
    ugcToggle.TextScaled = true
    ugcToggle.ZIndex= 55
    ugcToggle.Parent= ugcToggleContainer
    
    createRoundedCorner(ugcToggle, 6)
    
    ugcToggle.MouseButton1Click:Connect(function()
        emote.ugc= not emote.ugc
        ugcToggle.Text= emote.ugc and "YES" or "NO"
        ugcToggle.BackgroundColor3= emote.ugc and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    end)
    
    yPos += scale("Y", 45)
    
    -- Button container
    local buttonContainer= Instance.new("Frame")
    buttonContainer.Size= UDim2.new(1, 0, 0, scale("Y", 45))
    buttonContainer.Position= UDim2.new(0, 0, 0, yPos)
    buttonContainer.BackgroundTransparency= 1
    buttonContainer.ZIndex= 53
    buttonContainer.Parent= settingsFrame
    
    -- Save button
    local saveBtnContainer= Instance.new("Frame")
    saveBtnContainer.Size= UDim2.new(0.45, -scale("X", 5), 1, 0)
    saveBtnContainer.Position= UDim2.new(0, 0, 0, 0)
    saveBtnContainer.BackgroundTransparency= 1
    saveBtnContainer.ZIndex= 54
    saveBtnContainer.Parent= buttonContainer
    
    createShadow(saveBtnContainer, UDim2.new(1, 6, 1, 6), UDim2.new(0, -3, 0, -3))
    
    local saveBtn= Instance.new("TextButton")
    saveBtn.Size= UDim2.new(1, 0, 1, 0)
    saveBtn.BackgroundColor3= Color3.new(0, 0.5, 0)
    saveBtn.Text= "SAVE CHANGES"
    saveBtn.TextColor3= Color3.new(1, 1, 1)
    saveBtn.Font= Enum.Font.GothamBold
    saveBtn.TextScaled = true
    saveBtn.ZIndex= 55
    saveBtn.Parent= saveBtnContainer
    
    createRoundedCorner(saveBtn, 8)
    createGradient(saveBtn, Color3.new(0, 0.6, 0), Color3.new(0, 0.4, 0))
    
    saveBtn.MouseButton1Click:Connect(function()
        emote.n= nameBox.Text
        emote.id= tonumber(idBox.Text) or emote.id
        emote.price= tonumber(priceBox.Text) or emote.price
        emote.imageId= tonumber(imageBox.Text) or emote.imageId or emote.id
        emote.cr= dateBox.Text -- Save date
        saveEmotes()  
        editContainer:Destroy()
        refresh()
    end)
    
    
    local deleteBtnContainer= Instance.new("Frame")
    deleteBtnContainer.Size= UDim2.new(0.45, -scale("X", 5), 1, 0)
    deleteBtnContainer.Position= UDim2.new(0.55, 0, 0, 0)
    deleteBtnContainer.BackgroundTransparency= 1
    deleteBtnContainer.ZIndex= 54
    deleteBtnContainer.Parent= buttonContainer
    
    createShadow(deleteBtnContainer, UDim2.new(1, 6, 1, 6), UDim2.new(0, -3, 0, -3))
    
    local deleteBtn= Instance.new("TextButton")
    deleteBtn.Size= UDim2.new(1, 0, 1, 0)
    deleteBtn.BackgroundColor3= Color3.new(0.5, 0, 0)
    deleteBtn.Text= "DELETE EMOTE"
    deleteBtn.TextColor3= Color3.new(1, 1, 1)
    deleteBtn.Font= Enum.Font.GothamBold
    deleteBtn.TextScaled = true
    deleteBtn.ZIndex= 55
    deleteBtn.Parent= deleteBtnContainer
    
    createRoundedCorner(deleteBtn, 8)
    createGradient(deleteBtn, Color3.new(0.6, 0, 0), Color3.new(0.4, 0, 0))
    
    deleteBtn.MouseButton1Click:Connect(function()
        createConfirmation(
            "DELETE EMOTE",
            "ARE YOU SURE YOU WANT TO PERMANENTLY DELETE THIS EMOTE?",
            "THIS CANNOT BE UNDONE!",
            function()
                -- Find and remove the emote
                for i, e in ipairs(emotes) do
                    if e== emote then
                    notify("Emote Removed", "Please dont cry Abt It :D" )
                        table.remove(emotes, i)
                        break
                    end
                end
            
                saveEmotes()
                
                editContainer:Destroy()
                refresh()
            end
        )
    end)
    
    -- Button hover effects
    saveBtn.MouseEnter:Connect(function()
        TweenService:Create(saveBtn, TweenInfo.new(0.2), {BackgroundColor3= Color3.new(0, 0.6, 0)}):Play()
    end)
    
    saveBtn.MouseLeave:Connect(function()
        TweenService:Create(saveBtn, TweenInfo.new(0.2), {BackgroundColor3= Color3.new(0, 0.5, 0)}):Play()
    end)
    
    deleteBtn.MouseEnter:Connect(function()
        TweenService:Create(deleteBtn, TweenInfo.new(0.2), {BackgroundColor3= Color3.new(0.6, 0, 0)}):Play()
    end)
    
    deleteBtn.MouseLeave:Connect(function()
        TweenService:Create(deleteBtn, TweenInfo.new(0.2), {BackgroundColor3= Color3.new(0.5, 0, 0)}):Play()
    end)
    
    animToggle.MouseEnter:Connect(function()
        TweenService:Create(animToggle, TweenInfo.new(0.2), {
            BackgroundColor3= emote.isAnimation and Color3.new(0, 0.6, 0) or Color3.new(0.6, 0, 0)
        }):Play()
    end)
    
    animToggle.MouseLeave:Connect(function()
        TweenService:Create(animToggle, TweenInfo.new(0.2), {
            BackgroundColor3= emote.isAnimation and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
        }):Play()
    end)
    
    ugcToggle.MouseEnter:Connect(function()
        TweenService:Create(ugcToggle, TweenInfo.new(0.2), {
            BackgroundColor3= emote.ugc and Color3.new(0, 0.6, 0) or Color3.new(0.6, 0, 0)
        }):Play()
    end)
    
    ugcToggle.MouseLeave:Connect(function()
        TweenService:Create(ugcToggle, TweenInfo.new(0.2), {
            BackgroundColor3= emote.ugc and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
        }):Play()
    end)
    
    local editMinimized= false
    local originalEditSize= editContainer.Size
    local minimizedEditSize= UDim2.new(0, scale("X", 350), 0, scale("Y", 40))
    
    editMinButton.MouseButton1Click:Connect(function()
        editMinimized= not editMinimized
        if editMinimized then
            TweenService:Create(editContainer, TweenInfo.new(0.3), {Size= minimizedEditSize}):Play()
            content.Visible= false
            editMinButton.Text= "+"
        else
            TweenService:Create(editContainer, TweenInfo.new(0.3), {Size= originalEditSize}):Play()
            content.Visible= true
            editMinButton.Text= "-"
        end
    end)
    
    editCloseButton.MouseButton1Click:Connect(function()
        editContainer:Destroy()
    end)
end

local function playAnimation(emote)
    stopCurrentAnimation()
    
    local humanoid= player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    if emote.isAnimation then 
        local animation= Instance.new("Animation")
        animation.AnimationId= "rbxassetid://"..emote.id
        currentAnimationTrack= humanoid:LoadAnimation(animation)
        currentAnimationTrack:Play(0.1)
        currentAnimationTrack:AdjustWeight(100, 0) 
    else
        
        humanoid:PlayEmoteAndGetAnimTrackById(emote.id)
    end
end

RunService.Heartbeat:Connect(function()
    if currentAnimationTrack and player.Character then
        local humanoid= player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if humanoid.MoveDirection.Magnitude > 0 or humanoid:GetState()== Enum.HumanoidStateType.Jumping then
                stopCurrentAnimation()
            end
        end
    end
end)

local function createPlaceholderEmote()
    local newEmote= {
        n= "PlaceHolder",
        id= 0,  -- 0 indicates placeholder
        price= 0,
        cr= os.date("%b %d, %Y"),  -- current date
        ugc= true,
        fav= false,
        isAnimation= false,
        imageId= 0  -- placeholder image
    }
    table.insert(emotes, newEmote)
    saveEmotes()
    openEditUI(newEmote)  -- Open edit UI immediately
    refresh()
end

local addBtn= makeBtn("Add New", scale("Y", 10), function()
    createPlaceholderEmote()
end)

local sortBtn= makeBtn("Sort: "..sortModes[sortIndex], scale("Y", 55), function(btn)
    sortIndex= sortIndex % #sortModes + 1
    refresh()
end)

local ugcBtn= makeBtn("All", scale("Y", 100), function(btn)
    if ugcOnly== nil then
        ugcOnly= true
    elseif ugcOnly== true then
        ugcOnly= false
    else
        ugcOnly= nil
    end
    refresh()
end)

-- Updated refresh function with modern card design
function refresh()
    sortBtn.Text= "Sort: "..sortModes[sortIndex]
    
    if ugcOnly== nil then
        ugcBtn.Text= "All"
    elseif ugcOnly== true then
        ugcBtn.Text= "UGC"
    else
        ugcBtn.Text= "Roblox"
    end

    
    local existingCards= {}
    for _, child in ipairs(scroll:GetChildren()) do
        if not child:IsA("UIGridLayout") then
            table.insert(existingCards, child)
            child.Visible= false  -- Hide initially
        end
    end

    local sorted= {}
    for i, emote in ipairs(emotes) do
        table.insert(sorted, emote)
    end
    
    local mode= sortModes[sortIndex]

    table.sort(sorted, function(a, b)
        
        if a.fav and not b.fav then
            return true
        elseif not a.fav and b.fav then
            return false
        end
        
        
        if a.id== 0 and b.id ~= 0 then
            return true
        elseif a.id ~= 0 and b.id== 0 then
            return false
        end
        
        
        if a.id== 0 and b.id== 0 then
            return a.n < b.n
        end
        
        
        if mode== "A-Z" then
            return a.n < b.n
        elseif mode== "Z-A" then
            return a.n > b.n
        elseif mode== "Expensive" then
            return a.price > b.price
        elseif mode== "Cheap" then
            return a.price < b.price
        elseif mode== "New" then
            local function parseDate(dateStr)
                local months= {
                    Jan= 1, Feb= 2, Mar= 3, Apr= 4, May= 5, Jun= 6,
                    Jul= 7, Aug= 8, Sep= 9, Oct= 10, Nov= 11, Dec= 12
                }
                local month, day, year= dateStr:match("(%a+) (%d+), (%d+)")
                return os.time({year= tonumber(year), month= months[month], day= tonumber(day)})
            end
            
            local timeA= a.cr and parseDate(a.cr) or 0
            local timeB= b.cr and parseDate(b.cr) or 0
            return timeA > timeB
        elseif mode== "Old" then
            local function parseDate(dateStr)
                local months= {
                    Jan= 1, Feb= 2, Mar= 3, Apr= 4, May= 5, Jun= 6,
                    Jul= 7, Aug= 8, Sep= 9, Oct= 10, Nov= 11, Dec= 12
                }
                local month, day, year= dateStr:match("(%a+) (%d+), (%d+)")
                return os.time({year= tonumber(year), month= months[month], day= tonumber(day)})
            end
            
            local timeA= a.cr and parseDate(a.cr) or 0
            local timeB= b.cr and parseDate(b.cr) or 0
            return timeA < timeB
        end
        
        return false
    end)
    
    local searchLower= string.lower(searchText)
    local cardIndex= 0
    
    for _, em in ipairs(sorted) do
    
        if ugcOnly== true and not em.ugc then continue end
        if ugcOnly== false and em.ugc then continue end
        if searchLower ~= "" and not string.find(string.lower(em.n), searchLower, 1, true) then continue end

        cardIndex= cardIndex + 1
        
        
        local cardContainer
        local elements= {}
        
        if cardIndex <= #existingCards then
            
            cardContainer= existingCards[cardIndex]
            cardContainer.Visible= true
            
            
            local container= cardContainer:FindFirstChild("Container")
            if container then
                elements.favButton= container:FindFirstChild("FavButton", true)
                elements.editButton= container:FindFirstChild("EditButton", true)
                elements.img= container:FindFirstChild("EmoteImage", true)
                elements.animIndicator= container:FindFirstChild("AnimIndicator", true)
                elements.lbl= container:FindFirstChild("NameLabel", true)
                elements.dateLbl= container:FindFirstChild("DateLabel", true)
                elements.playButton= container:FindFirstChild("PlayButton", true)
                elements.placeholderIndicator= container:FindFirstChild("PlaceholderIndicator", true)
            end
        else
        
            
            cardContainer= Instance.new("Frame")
            cardContainer.Name= "EmoteCard"
            cardContainer.Size= UDim2.new(0, scale("X", 110), 0, scale("Y", 180))
            cardContainer.BackgroundTransparency= 1
            cardContainer.Parent= scroll
            
            createShadow(cardContainer, UDim2.new(1, 6, 1, 6), UDim2.new(0, -3, 0, -3))
            
            local container= Instance.new("Frame")
            container.Name= "Container"
            container.Size= UDim2.new(1, 0, 1, 0)
            container.BackgroundColor3= Color3.fromRGB(60, 60, 60)
            container.Parent= cardContainer
            
            createRoundedCorner(container, 10)
            createGradient(container, Color3.fromRGB(70, 70, 70), Color3.fromRGB(50, 50, 50))
            
            
            local topButtons= Instance.new("Frame")
            topButtons.Name= "TopButtons"
            topButtons.Size= UDim2.new(1, -scale("X", 4), 0, scale("Y", 25))
            topButtons.Position= UDim2.new(0, scale("X", 2), 0, scale("Y", 2))
            topButtons.BackgroundTransparency= 1
            topButtons.Parent= container
            
            
            local favBtnContainer= Instance.new("Frame")
            favBtnContainer.Name= "FavButtonContainer"
            favBtnContainer.Size= UDim2.new(0, scale("X", 20), 0, scale("Y", 20))
            favBtnContainer.Position= UDim2.new(0, 0, 0, 0)
            favBtnContainer.BackgroundTransparency= 1
            favBtnContainer.Parent= topButtons
            
            createShadow(favBtnContainer, UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2))
            
            local favButton= Instance.new("TextButton")
            favButton.Name= "FavButton"
            favButton.Size= UDim2.new(1, 0, 1, 0)
            favButton.Font= Enum.Font.GothamBold
            favButton.TextScaled= true
            favButton.Parent= favBtnContainer
            
            createRoundedCorner(favButton, 6)
            
            elements.favButton= favButton
            
            
            local editBtnContainer= Instance.new("Frame")
            editBtnContainer.Name= "EditButtonContainer"
            editBtnContainer.Size= UDim2.new(0, scale("X", 20), 0, scale("Y", 20))
            editBtnContainer.Position= UDim2.new(0, scale("X", 25), 0, 0)
            editBtnContainer.BackgroundTransparency= 1
            editBtnContainer.Parent= topButtons
            
            createShadow(editBtnContainer, UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2))
            
            local editButton= Instance.new("TextButton")
            editButton.Name= "EditButton"
            editButton.Size= UDim2.new(1, 0, 1, 0)
            editButton.BackgroundColor3= Color3.fromRGB(80, 80, 80)
            editButton.Text= "Edit"
            editButton.TextColor3= Color3.new(0.8, 0.8, 1)
            editButton.Font= Enum.Font.GothamBold
            editButton.TextScaled = true
            editButton.Parent= editBtnContainer
            
            createRoundedCorner(editButton, 6)
            createGradient(editButton, Color3.fromRGB(90, 90, 90), Color3.fromRGB(70, 70, 70))
            elements.editButton= editButton
            
           
            local imgContainer= Instance.new("Frame")
            imgContainer.Name= "ImageContainer"
            imgContainer.Size= UDim2.new(1, -scale("X", 10), 0, scale("Y", 90))
            imgContainer.Position= UDim2.new(0, scale("X", 5), 0, scale("Y", 30))
            imgContainer.BackgroundTransparency= 1
            imgContainer.ClipsDescendants= true
            imgContainer.Parent= container
            
            local img= Instance.new("ImageLabel")
            img.Name= "EmoteImage"
            img.Size= UDim2.new(1, 0, 1, 0)
            img.AnchorPoint= Vector2.new(0.5, 0.5)
            img.Position= UDim2.new(0.5, 0, 0.5, 0)
            img.BackgroundTransparency= 1
            img.ScaleType= Enum.ScaleType.Fit
            img.Parent= imgContainer
            elements.img= img
            
            local animIndicator= Instance.new("TextLabel")
            animIndicator.Name= "AnimIndicator"
            animIndicator.Size= UDim2.new(1, 0, 0, scale("Y", 15))
            animIndicator.Position= UDim2.new(0, 0, 0, scale("Y", 70))
            animIndicator.BackgroundTransparency= 1
            animIndicator.Text= "ANIMATION"
            animIndicator.TextColor3= Color3.new(0.5, 1, 0.5)
            animIndicator.Font= Enum.Font.GothamBold
            animIndicator.TextScaled = true
            animIndicator.Visible= false
            animIndicator.Parent= container
            elements.animIndicator= animIndicator
            local lbl= Instance.new("TextLabel")
            lbl.Name= "NameLabel"
            lbl.Size= UDim2.new(1, -scale("X", 4), 0, scale("Y", 40))
            lbl.Position= UDim2.new(0, scale("X", 2), 0, scale("Y", 110))
            lbl.BackgroundTransparency= 1
            lbl.TextColor3= Color3.new(1, 1, 1)
            lbl.Text = ":3"
            lbl.TextScaled = true
            lbl.Font= Enum.Font.GothamBold
            lbl.TextWrapped= true
            lbl.Parent= container
            elements.lbl= lbl
            local dateLbl= Instance.new("TextLabel")
            dateLbl.Name= "DateLabel"
            dateLbl.Size= UDim2.new(1, -scale("X", 4), 0, scale("Y", 15))
            dateLbl.Position= UDim2.new(0, scale("X", 2), 1, -scale("Y", 5))
            dateLbl.BackgroundTransparency= 1
            dateLbl.TextColor3= Color3.new(0.7, 0.7, 0.7)
            dateLbl.Font= Enum.Font.Gotham
            dateLbl.TextScaled = true
            dateLbl.Parent= container
            elements.dateLbl= dateLbl
            local playBtnContainer= Instance.new("Frame")
            playBtnContainer.Name= "PlayButtonContainer"
            playBtnContainer.Size= UDim2.new(1, -scale("X", 10), 0, scale("Y", 25))
            playBtnContainer.Position= UDim2.new(0, scale("X", 5), 1, -scale("Y", 30))
            playBtnContainer.BackgroundTransparency= 1
            playBtnContainer.Parent= container
            
            createShadow(playBtnContainer, UDim2.new(1, 6, 1, 6), UDim2.new(0, -3, 0, -3))
            
            local playButton= Instance.new("TextButton")
            playButton.Name= "PlayButton"
            playButton.Size= UDim2.new(1, 0, 1, 0)
            playButton.BackgroundColor3= Color3.fromRGB(60, 180, 60)
            playButton.Text= "PLAY"
            playButton.TextColor3= Color3.new(1, 1, 1)
            playButton.Font= Enum.Font.GothamBold
            playButton.TextScaled = true
            playButton.AutoButtonColor= false
            playButton.Parent= playBtnContainer
            
            createRoundedCorner(playButton, 8)
            createGradient(playButton, Color3.fromRGB(70, 200, 70), Color3.fromRGB(50, 160, 50))
            elements.playButton= playButton
            
            -- Placeholder indicator
            local placeholderIndicator= Instance.new("TextLabel")
            placeholderIndicator.Name= "PlaceholderIndicator"
            placeholderIndicator.Size= UDim2.new(1, 0, 0, scale("Y", 15))
            placeholderIndicator.Position= UDim2.new(0, 0, 0, scale("Y", 110))
            placeholderIndicator.BackgroundTransparency= 1
            placeholderIndicator.Text= "PLACEHOLDER"
            placeholderIndicator.TextColor3= Color3.new(1, 0.5, 0.5)
            placeholderIndicator.Font= Enum.Font.GothamBold
            placeholderIndicator.TextScaled = true
            placeholderIndicator.Visible= false
            placeholderIndicator.Parent= container
            elements.placeholderIndicator= placeholderIndicator
        end
        
        if elements.favButton then
            for _, connection in ipairs(getconnections(elements.favButton.MouseButton1Click)) do
                connection:Disconnect()
            end
        end
        
        if elements.editButton then
            for _, connection in ipairs(getconnections(elements.editButton.MouseButton1Click)) do
                connection:Disconnect()
            end
        end
        
        if elements.playButton then
            for _, connection in ipairs(getconnections(elements.playButton.MouseButton1Click)) do
                connection:Disconnect()
            end
            for _, connection in ipairs(getconnections(elements.playButton.MouseEnter)) do
                connection:Disconnect()
            end
            for _, connection in ipairs(getconnections(elements.playButton.MouseLeave)) do
                connection:Disconnect()
            end
        end
        
        
        elements.favButton.BackgroundColor3= em.fav and Color3.fromRGB(80, 80, 80) or Color3.fromRGB(80, 80, 80)
        elements.favButton.Text= em.fav and "★" or "☆"
        elements.favButton.TextColor3= em.fav and Color3.fromRGB(215, 200, 0) or Color3.new(1, 1, 1)
        
        
        elements.favButton.MouseButton1Click:Connect(function()
            em.fav= not em.fav
            elements.favButton.Text= em.fav and "★" or "☆"
            elements.favButton.TextColor3= em.fav and Color3.fromRGB(215, 200, 0) or Color3.new(1, 1, 1)
            saveEmotes()
            refresh()
        end)
        
        
        elements.editButton.MouseButton1Click:Connect(function()
            openEditUI(em)
        end)
        
        
        if em.imageId and em.imageId > 0 then
            elements.img.Image= "rbxthumb://type=Asset&id="..em.imageId.."&w=150&h=150"
        end
        
        
        elements.animIndicator.Visible= em.isAnimation or false
        local name= em.n
if #name > 8 then
    name= string.sub(name, 1, 8) .. "..."
end

elements.lbl.Text= name .. "\n" .. em.price .. "R$"
        
        
        elements.dateLbl.Text= em.cr or "Unknown"
        
        
       
        
        
        elements.playButton.MouseButton1Click:Connect(function()
            playAnimation(em)
        end)
        
        
        elements.playButton.MouseEnter:Connect(function()
            TweenService:Create(elements.playButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(80, 220, 80)}):Play()
        end) 
        elements.playButton.MouseLeave:Connect(function()
            TweenService:Create(elements.playButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(60, 180, 60)}):Play()
        end)
        elements.favButton.MouseEnter:Connect(function()
            TweenService:Create(elements.favButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(100, 100, 100)}):Play()
        end)
        
        elements.favButton.MouseLeave:Connect(function()
            TweenService:Create(elements.favButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(80, 80, 80)}):Play()
        end)
        
        elements.editButton.MouseEnter:Connect(function()
            TweenService:Create(elements.editButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(100, 100, 100)}):Play()
        end)
        
        elements.editButton.MouseLeave:Connect(function()
            TweenService:Create(elements.editButton, TweenInfo.new(0.2), {BackgroundColor3= Color3.fromRGB(80, 80, 80)}):Play()
        end)
 
        scroll.CanvasSize= UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + scale("Y", 10))
    end

    
    for i= cardIndex + 1, #existingCards do
        existingCards[i].Visible= false
    end

    scroll.CanvasSize= UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + scale("Y", 10))
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText= searchBox.Text
    refresh()
end)



refresh()

