local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Nova Hub",
    Icon = "door-open",
    Author = "by Roun95",
    Folder = "NovaSAB",
    Size = UDim2.fromOffset(300, 200),
    Transparent = true,
    Theme = "Red",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        xxxhey_lorenzo1 = true,
        Callback = function()
            print("clicked")
        end,
    },
    KeySystem = { 
        Key = { "1234", "5678" },
        Note = "Key: 1234",
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "Incomum Hub",
        },
        URL = "YOUR LINK TO GET KEY (Discord, Linkvertise, Pastebin, etc.)",
        SaveKey = false,
    },
})

local Tab1 = Window:Tab({
    Title = "Farm",
    Icon = "People",
    Locked = false,
})

local Button = Tab1:Button({
    Title = "Plataform",
    Desc = "ao ativar isso o seu personagem cria uma plataforma que consegue te fazer voar muito OP confia no vc777 o mais lindo!",
    Locked = false,
    Callback = function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local player = Players.LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local platform = nil
        local isActive = false
        local currentHeight = 0
        local elevationSpeed = 0.02
        local baseHeight = 0.5
        local platformSize = Vector3.new(8, 0.5, 8)
        local elevationConnection = nil

        local function createGUI()
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "PlatformToggleGUI"
            screenGui.ResetOnSpawn = false
            screenGui.Parent = playerGui
            local mainFrame = Instance.new("Frame")
            mainFrame.Name = "MainFrame"
            mainFrame.Size = UDim2.new(0, 200, 0, 100)
            mainFrame.Position = UDim2.new(0, 20, 0, 20)
            mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
            mainFrame.BorderSizePixel = 0
            mainFrame.Parent = screenGui
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 10)
            corner.Parent = mainFrame
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "TitleLabel"
            titleLabel.Size = UDim2.new(1, 0, 0, 30)
            titleLabel.Position = UDim2.new(0, 0, 0, 0)
            titleLabel.BackgroundTransparency = 1
            titleLabel.Text = "Plataforma Elevadora"
            titleLabel.TextColor3 = Color3.new(1, 1, 1)
            titleLabel.TextScaled = true
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Parent = mainFrame
            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "ToggleButton"
            toggleButton.Size = UDim2.new(0.8, 0, 0, 40)
            toggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
            toggleButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
            toggleButton.Text = "OFF"
            toggleButton.TextColor3 = Color3.new(1, 1, 1)
            toggleButton.TextScaled = true
            toggleButton.Font = Enum.Font.GothamBold
            toggleButton.Parent = mainFrame
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 8)
            buttonCorner.Parent = toggleButton
            local statusLabel = Instance.new("TextLabel")
            statusLabel.Name = "StatusLabel"
            statusLabel.Size = UDim2.new(1, 0, 0, 20)
            statusLabel.Position = UDim2.new(0, 0, 0.8, 0)
            statusLabel.BackgroundTransparency = 1
            statusLabel.Text = "Altura: 0 studs"
            statusLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
            statusLabel.TextScaled = true
            statusLabel.Font = Enum.Font.Gotham
            statusLabel.Parent = mainFrame
            return toggleButton, statusLabel
        end

        local function createPlatform()
            if platform then
                platform:Destroy()
            end
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then
                return
            end
            local rootPart = character.HumanoidRootPart
            local position = rootPart.Position
            platform = Instance.new("Part")
            platform.Name = "ElevatorPlatform"
            platform.Size = platformSize
            platform.Material = Enum.Material.Neon
            platform.BrickColor = BrickColor.new("Bright blue")
            platform.Anchored = true
            platform.CanCollide = true
            platform.Shape = Enum.PartType.Block
            platform.Position = Vector3.new(
                position.X,
                position.Y - (character.Humanoid.HipHeight + baseHeight + platformSize.Y/2),
                position.Z
            )
            platform.Parent = workspace
            currentHeight = 0
        end

        local function removePlatform()
            if platform then
                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local tween = TweenService:Create(platform, tweenInfo, {
                    Transparency = 1,
                    Size = Vector3.new(0.1, 0.1, 0.1)
                })
                tween:Play()
                tween.Completed:Connect(function()
                    platform:Destroy()
                    platform = nil
                end)
            end
            currentHeight = 0
        end

        local function updatePlatform()
            if platform and platform.Parent then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = character.HumanoidRootPart
                    local playerPos = rootPart.Position
                    currentHeight = currentHeight + elevationSpeed
                    local baseY = playerPos.Y - (character.Humanoid.HipHeight + baseHeight + platformSize.Y/2)
                    local newY = baseY + currentHeight
                    platform.Position = Vector3.new(
                        playerPos.X,
                        newY,
                        playerPos.Z
                    )
                end
            end
        end

        local function togglePlatform(button, statusLabel)
            isActive = not isActive
            if isActive then
                button.Text = "ON"
                button.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
                createPlatform()
                elevationConnection = RunService.Heartbeat:Connect(function()
                    updatePlatform()
                    statusLabel.Text = string.format("Altura: %.1f studs", currentHeight)
                end)
            else
                button.Text = "OFF"
                button.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
                if elevationConnection then
                    elevationConnection:Disconnect()
                    elevationConnection = nil
                end
                removePlatform()
                statusLabel.Text = "Altura: 0 studs"
            end
        end

        local function main()
            if not player.Character then
                player.CharacterAdded:Wait()
            end
            local toggleButton, statusLabel = createGUI()
            toggleButton.MouseButton1Click:Connect(function()
                togglePlatform(toggleButton, statusLabel)
            end)
            player.CharacterRemoving:Connect(function()
                if elevationConnection then
                    elevationConnection:Disconnect()
                    elevationConnection = nil
                end
                removePlatform()
                isActive = false
            end)
            player.CharacterAdded:Connect(function()
                wait(1)
                if isActive then
                    createPlatform()
                end
            end)
        end

        main()
        print("Script da Plataforma Elevadora com Seguimento carregado com sucesso!")
        print("okok")
    end
})

local Button = Tab1:Button({
    Title = "Float",
    Desc = "te ajuda no steal a faz crianças chorar recomendo demais!",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local forwardSpeed = 55
        local gravityScale = 0.1
        local floatDuration = 7
        local walkSpeed = 32
        local isFloating = false
        local bodyVelocity = nil
        local originalHeight = 0
        local screenGui = Instance.new("ScreenGui")
        screenGui.Parent = player:WaitForChild("PlayerGui")
        screenGui.Name = "FloatUI"
        local floatButton = Instance.new("TextButton")
        floatButton.Size = UDim2.new(0, 100, 0, 50)
        floatButton.Position = UDim2.new(0.5, -50, 0.8, -25)
        floatButton.Text = "Float"
        floatButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        floatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        floatButton.Parent = screenGui

        local function applyFloat()
            if humanoid and rootPart and not isFloating then
                isFloating = true
                floatButton.Text = "Floating..."
                floatButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
                originalHeight = rootPart.Position.Y
                game.Workspace.Gravity = 196.2 * gravityScale
                bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyVelocity.Velocity = rootPart.CFrame.LookVector * forwardSpeed + Vector3.new(0, 0, 0)
                bodyVelocity.Parent = rootPart
                local bodyGyro = Instance.new("BodyGyro")
                bodyGyro.MaxTorque = Vector3.new(4000, 0, 4000)
                bodyGyro.CFrame = rootPart.CFrame
                bodyGyro.Parent = rootPart
                humanoid.WalkSpeed = walkSpeed
                wait(floatDuration)
                if bodyVelocity then
                    bodyVelocity:Destroy()
                    bodyVelocity = nil
                end
                if bodyGyro then
                    bodyGyro:Destroy()
                end
                game.Workspace.Gravity = 196.2
                humanoid.WalkSpeed = 16
                isFloating = false
                floatButton.Text = "Float"
                floatButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            end
        end

        floatButton.MouseButton1Click:Connect(applyFloat)
        player.CharacterAdded:Connect(function(newCharacter)
            character = newCharacter
            humanoid = character:WaitForChild("Humanoid")
            rootPart = character:WaitForChild("HumanoidRootPart")
        end)
        print("clicked")
    end
})

local Button = Tab1:Button({
    Title = "plataform paga Op",
    Desc = "uma ui básica, mais um poder gigante aproveite pois e especial de aniversário.",
    Locked = false,
    Callback = function()
-- Serviços
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Variáveis
local chao = nil
local subindo = false
local parado = false
local controleClicks = 0

-- Criar UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 120)
Frame.Position = UDim2.new(0.5, -125, 0.8, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Frame
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

-- Função para criar botões
local function criarBotao(texto)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Text = texto
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Parent = Frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.AutoButtonColor = true
    return btn
end

-- Criar os botões
local abrirChaoBtn = criarBotao("Abrir Chão")
local controlarBtn = criarBotao("Controlar Chão")

-- Função de subir chão (gigante com textura)
local function subirChao()
    if not chao then
        chao = Instance.new("Part")
        chao.Size = Vector3.new(1000, 1, 1000) -- Tampar o mapa inteiro
        chao.Anchored = true
        chao.Position = player.Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0)
        chao.Name = "ChaoGigante"
        chao.Parent = workspace

        -- Adicionar textura com o ID
        local decal = Instance.new("Decal")
        decal.Texture = "rbxassetid://72831610283500"
        decal.Face = Enum.NormalId.Top -- Aplica na parte de cima
        decal.Parent = chao
    end
    subindo = true
    parado = false

    task.spawn(function()
        while subindo and not parado and chao do
            chao.Position = chao.Position + Vector3.new(0, 0.5, 0)
            task.wait(0.05)
        end
    end)
end

-- Função de descer chão
local function descerChao()
    if chao then
        task.spawn(function()
            while chao and chao.Position.Y > -200 do
                chao.Position = chao.Position - Vector3.new(0, 1, 0)
                task.wait(0.05)
            end
            if chao then
                chao:Destroy()
                chao = nil
            end
        end)
    end
end

-- Ações dos botões
abrirChaoBtn.MouseButton1Click:Connect(function()
    subirChao()
end)

controlarBtn.MouseButton1Click:Connect(function()
    controleClicks += 1
    if controleClicks == 1 then
        parado = true
        subindo = false
    elseif controleClicks == 2 then
        parado = false
        subindo = false
        descerChao()
        controleClicks = 0
    end
end)
        print("clicked")
    end
})