local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Hubs/DESARROLLO/NovaHubUi.lua"))()
local Window = Lib:MakeWindow({
    Title = "Nova Hub (Español) | Brookhaven 🎆",
    SubTitle = "by Roun95",
    SaveFolder = "NovaData"
})

Window:AddMinimizeButton({
    Button = {Image = "rbxassetid://111486071468142", BackgroundTransparency = 0},
    Corner = {CornerRadius = UDim.new(1,1)},
})

local Tab1 = Window:MakeTab({"Credits", "info"})
local Tab2 = Window:MakeTab({"Player", "user"})
local Tab3 = Window:MakeTab({"Avatar", "rbxassetid://10734952036"})
local Tab4 = Window:MakeTab({"House", "rbxassetid://10723407389"})
local Tab5 = Window:MakeTab({"Car", "rbxassetid://10709789810"})
local Tab6 = Window:MakeTab({"RGB", "rbxassetid://10709782758"})
local Tab7 = Window:MakeTab({"Music All", "rbxassetid://10734931596"})
local Tab8 = Window:MakeTab({"Music", "rbxassetid://10734905958"})
local Tab9 = Window:MakeTab({"Troll", "rbxassetid://10734962068"})
local Tab10 = Window:MakeTab({"Lag Server", "rbxassetid://10709781460"})
local Tab11 = Window:MakeTab({"Teleportes", "rbxassetid://10734886004"})
local Tab12 = Window:MakeTab({"Scripts", "rbxassetid://10734943448"})
local Tab13 = Window:MakeTab({"Shaders", "rbxassetid://10747382750"})
----------------------------------------------------------------------------------------------------
                                    -- === Tab 1: Credits === --
----------------------------------------------------------------------------------------------------
local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif syn then
        return "Synapse X"
    elseif KRNL_LOADED then
        return "KRNL"
    elseif is_sirhurt_closure then
        return "SirHurt"
    elseif pebc_execute then
        return "ProtoSmasher"
    elseif getexecutorname then
        return getexecutorname()
    else
        return "Executor Desconocido"
    end
end

local executorName = detectExecutor()
Tab1:AddParagraph({"Executor", executorName})

Tab1:AddSection({"Version 1.4"})
Tab1:AddParagraph({"Creador", "Sigueme en Roblox como:\n@Roun95 (Nova)"})

Tab1:AddButton({
    Name = "Sigueme en Tiktok (Copiar URL)",
    Callback = function()
    setclipboard("https://www.tiktok.com/@lxvap")
	end
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab 2: User === --
----------------------------------------------------------------------------------------------------
Tab2:AddSection({"Personaje del jugador"})

local selectedPlayerName = nil
local headsitActive = false

local function headsitOnPlayer(targetPlayer)
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        warn("Su personaje no tiene cabeza.")
        return false
    end
    local targetHead = targetPlayer.Character.Head
    local localRoot = Character:FindFirstChild("HumanoidRootPart")
    if not localRoot then
        warn("Su personaje no tiene HumanoidRootPart.")
        return false
    end
    localRoot.CFrame = targetHead.CFrame * CFrame.new(0, 2.2, 0)
    for _, v in pairs(localRoot:GetChildren()) do
        if v:IsA("WeldConstraint") then
            v:Destroy()
        end
    end

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = localRoot
    weld.Part1 = targetHead
    weld.Parent = localRoot

    if Humanoid then
        Humanoid.Sit = true
    end

    print("Headsit activado en " .. targetPlayer.Name)
    return true
end

local function removeHeadsit()
    local localRoot = Character:FindFirstChild("HumanoidRootPart")
    if localRoot then
        for _, v in pairs(localRoot:GetChildren()) do
            if v:IsA("WeldConstraint") then
                v:Destroy()
            end
        end
    end
    if Humanoid then
        Humanoid.Sit = false
    end
    print("Headsit desactivado.")
end

-- Funcion para buscar jugadores por nombre parcial
local function findPlayerByPartialName(partial)
    partial = partial:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Name:lower():sub(1, #partial) == partial then
            return player
        end
    end
    return nil
end

-- Notificacion con imagen del jugador seleccionado
local function notifyPlayerSelected(player)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, _ = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)

    StarterGui:SetCore("SendNotification", {
        Title = "Jugador Seleccionado",
        Text = player.Name .. " fue seleccionado!",
        Icon = content,
        Duration = 5
    })
end

-- Cuadro de texto para escribir el nombre del jugador
Tab2:AddTextBox({
    Name = "Headsit Player",
    Description = "Ingrese parte del nombre del jugador",
    PlaceholderText = "ej: Rou → Roun95",
    Callback = function(Value)
    local foundPlayer = findPlayerByPartialName(Value)
        if foundPlayer then
            selectedPlayerName = foundPlayer.Name
            notifyPlayerSelected(foundPlayer)
        else
            warn("Ningun jugador encontrado con ese nombre.")
        end
    end
})

-- Boton para activar/desactivar el head-sit
Tab2:AddButton({"Activar Headsit", function()
    if not selectedPlayerName then
        return
    end
    if not headsitActive then
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and headsitOnPlayer(target) then
			headsitActive = true
        end
    else
        removeHeadsit()
		headsitActive = false
    end
end
})

Tab2:AddSlider({
    Name = "Velocidad",
    Min = 1,
    Max = 900,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
        Humanoid.WalkSpeed = Value
    end
})

Tab2:AddSlider({
    Name = "Salto",
    Min = 1,
    Max = 900,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        Humanoid.JumpPower = Value
    end
})

Tab2:AddSlider({
    Name = "Gravedad",
    Min = 1,
    Max = 900,
    Increase = 1,
    Default = 196,
    Callback = function(Value)
        workspace.Gravity = Value
    end
})
 
local InfJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
	if InfJumpEnabled then
      if Character and Character:FindFirstChild("Humanoid") then
		Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
   end
end)

Tab2:AddButton({
    Name = "Reset Status",
    Callback = function()
        workspace.Gravity = 196.2
        Humanoid.JumpPower = 50
        Humanoid.WalkSpeed = 16
        InfJumpEnabled = false
    end
})

Tab2:AddToggle({
	Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
       InfJumpEnabled = Value
    end
})

Tab2:AddToggle({
    Name = "Anti Sit",
    Default = false,
    Callback = function(state)
        if state then
            antiSitEnabled = RunService.Heartbeat:Connect(function()
                if Humanoid then
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if Humanoid:GetState() == Enum.HumanoidStateType.Seated then
                        Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                    if Humanoid.SeatPart then
                        Humanoid.Sit = false
                        Humanoid.SeatPart = nil
                    end
                end
            end)
        else
            if antiSitEnabled then antiSitEnabled:Disconnect() end
            if Humanoid then
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            end
        end
    end
})

Tab2:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(v)
        noclipEnabled = v
    end
})

RunService.Stepped:Connect(function()
    if noclipEnabled and Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
	else
		if noclipEnabled then noclipEnabled:Disconnect() end
			for _, part in pairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
	end
end)

-- Ejecutar Fly
Tab2:AddButton({
    Name = "Fly GUI Universal",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/Fly.lua"))()
        end)

        StarterGui:SetCore("SendNotification", {
            Title = success and "Exito" or "Error",
            Text = success and "Fly GUI cargado!" or "Fallo al cargar Fly GUI.",
            Duration = 5
        })
    end
})
----------------------------------------------------------------------------------------------------
Tab2:AddSection({"ESP"})

local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "RGB"

-- Menú desplegable de color
Tab2:AddDropdown({
    Name = "Seleccionar color",
    Default = "RGB",
    Options = {
        "RGB", "Blanco", "Negro", "Rojo",
        "Verde", "Azul", "Amarillo", "Rosado", "Morado"
    },
    Callback = function(value)
        selectedColor = value
    end
})

-- Funcion para obtener el color
local function getESPColor()
    if selectedColor == "RGB" then
        local h = (tick() % 5) / 5
        return Color3.fromHSV(h, 1, 1)
    elseif selectedColor == "Negro" then
        return Color3.fromRGB(0, 0, 0)
    elseif selectedColor == "Blanco" then
        return Color3.fromRGB(255, 255, 255)
    elseif selectedColor == "Rojo" then
        return Color3.fromRGB(255, 0, 0)
    elseif selectedColor == "Verde" then
        return Color3.fromRGB(0, 255, 0)
    elseif selectedColor == "Azul" then
        return Color3.fromRGB(0, 170, 255)
    elseif selectedColor == "Amarillo" then
        return Color3.fromRGB(255, 255, 0)
    elseif selectedColor == "Rosado" then
        return Color3.fromRGB(255, 105, 180)
    elseif selectedColor == "Morado" then
        return Color3.fromRGB(128, 0, 128)
    end
    return Color3.new(1, 1, 1)
end

-- Funcion para crear el ESP
local function updateESP(player)
    if player == LocalPlayer then return end
    if not espEnabled then return end

    if Character then
        local head = Character:FindFirstChild("Head")
        if head then
            if billboardGuis[player] then
                billboardGuis[player]:Destroy()
            end

            local billboard = Instance.new("BillboardGui")
            billboard.Parent = head
            billboard.Adornee = head
            billboard.Size = UDim2.new(0,200,0,50)
            billboard.StudsOffset = Vector3.new(0,3,0)
            billboard.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1,0,1,0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0.5
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 14
            textLabel.Text = player.Name .. " | " .. player.AccountAge .. " dias"
            textLabel.TextColor3 = getESPColor()

            billboardGuis[player] = billboard
        end
    end
end

-- Funcion para eliminar el ESP
local function removeESP(player)
    if billboardGuis[player] then
        billboardGuis[player]:Destroy()
        billboardGuis[player] = nil
    end
end

-- Interruptor para activar el ESP
local Toggle1 = Tab2:AddToggle({
    Name = "Espiar jugadores",
    Description = "Muestra la entidad de los jugadores.",
    Default = false
})

Toggle1:Callback(function(value)
    espEnabled = value

    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            updateESP(player)
        end

        local updateConnection = RunService.Heartbeat:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                updateESP(player)
            end
            if selectedColor == "RGB" then
                for _, player in pairs(Players:GetPlayers()) do
                    local gui = billboardGuis[player]
                    if gui and gui:FindFirstChild("TextLabel") then
                        gui.TextLabel.TextColor3 = getESPColor()
                    end
                end
            end
        end)
        table.insert(connections, updateConnection)

        local playerAdded = Players.PlayerAdded:Connect(function(player)
            updateESP(player)
            local charConn = player.CharacterAdded:Connect(function()
                updateESP(player)
            end)
            table.insert(connections, charConn)
        end)
        table.insert(connections, playerAdded)

        local playerRemoving = Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
        table.insert(connections, playerRemoving)

    else
        for _, player in pairs(Players:GetPlayers()) do
            removeESP(player)
        end
        for _, conn in pairs(connections) do
            conn:Disconnect()
        end
        connections = {}
        billboardGuis = {}
    end
end)
----------------------------------------------------------------------------------------------------
Tab3:AddSection({"Ropa 3D"})

-- Espacio de nombres para evitar conflictos
local AvatarManager = {}
AvatarManager.ReplicatedStorage = ReplicatedStorage

-- Funcion para la notificacion
function AvatarManager:showNotify(msgN)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Aviso",
            Text = msgN,
            Duration = 5
        })
    end)
end

-- Lista de ropa 3D
AvatarManager.Avatares = {
    { Nome = "Black-Arm-Bandages-1-0", ID = 11458078735 },
    { Nome = "Black-Oversized-Warmers", ID = 10789914680 },
    { Nome = "Black-Oversized-Off-Shoulder-Hoodie", ID = 18396592827 },
    { Nome = "White-Oversized-Off-Shoulder-Hoodie", ID = 18396754379 },
    { Nome = "Left-Leg-Spikes", ID = 10814325667 },

    { Nome = "Mini-Cat-Suit", ID = 121465611890520 }
}

-- Funcion para obtener los nombres de los avatares del menu
function AvatarManager:GetAvatarNames()
    local names = {}
    for _, avatar in ipairs(self.Avatares) do
        table.insert(names, avatar.Nome)
    end
    return names
end

-- Funcion para equipar el avatar seleccionado
function AvatarManager:EquiparAvatar(avatarName)
    for _, avatar in ipairs(self.Avatares) do
        if avatar.Nome == avatarName then
            local args = { avatar.ID }
            local success, result = pcall(function()
                return self.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
            end)
            if success then
                self:showNotify("Avatar " .. avatarName .. " Equipado!")
            else
                self:showNotify("No se pudo equipar " .. avatarName .. "!")
            end
            return
        end
    end
    self:showNotify("Avatar " .. avatarName .. " no encontrado!")
end

-- Menu desplegable
Tab3:AddDropdown({
    Name = "Selecciona una opcion",
    Default = nil,
    Options = AvatarManager:GetAvatarNames(),
    Callback = function(SelectedAvatar)
        eSelectedAvatar = SelectedAvatar
    end
})

-- Boton para equipar el avatar seleccionado
Tab3:AddButton({
    Name = "Equipar",
    Callback = function()
        if not eSelectedAvatar or eSelectedAvatar == "" then
            AvatarManager:showNotify("Ningun avatar seleccionado!")
            return
        end
        AvatarManager:EquiparAvatar(eSelectedAvatar)
    end
})
----------------------------------------------------------------------------------------------------
Tab3:AddSection({"Editor de avatar"})

Tab3:AddParagraph({"Tu avatar se reiniciara, Ajusta las proporciones de tu avatar para un mejor resultado"})

-- Boton para equipar todas las partes del cuerpo.
Tab3:AddButton({
    Name = "Mini-Plushie (Headless)",
    Callback = function()
        local args = {
            {
                107431241133468, -- Right Leg
                103380121023771,  -- Left Leg
                76079756909323,  -- Right Arm
                82598238110471,  -- Left Arm
                112722466960512, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "S15-Thin-Hourglass (Headless)",
    Callback = function()
        local args = {
            {
                128776848621889, -- Right Leg
                81547744637409,  -- Left Leg
                133466157082146,  -- Right Arm
                73001997018020,  -- Left Arm
                129543160215232, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "inf15-Thin (Headless)",
    Callback = function()
        local args = {
            {
                84418052877367, -- Right Leg
                124343282827669,  -- Left Leg
                99519402284266,  -- Right Arm
                115905570886697,  -- Left Arm
                92757812011061, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "Blush-Fashion-Doll (Headless)",
    Callback = function()
        local args = {
            {
                127241951574732, -- Right Leg
                118303475394830,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                115745153758680, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "E-Girl Body (Headless)",
    Callback = function()
        local args = {
            {
                127241951574732, -- Right Leg
                118303475394830,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                114206707267907, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "E-Girl Body (Headless/Korblox)",
    Callback = function()
        local args = {
            {
                139607718, -- Right Leg
                118303475394830,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                114206707267907, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "E-Boy Body (Headless)",
    Callback = function()
        local args = {
            {
                2517207746, -- Right Leg
                2517204456,  -- Left Leg
                4416788553,  -- Right Arm
                4416785861,  -- Left Arm
                32336059, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "E-Girl Body ()",
    Callback = function()
        local args = {
            {
                127968751428204, -- Right Leg
                101521138059051,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                114206707267907, -- Torso
                14970560459   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "Classic-Female-v2-Torso (Headless)",
    Callback = function()
        local args = {
            {
                4637265517, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})

Tab3:AddButton({
    Name = "Headless/Korblox (BETA)",
    Callback = function()
        local args = {
            {
                139607718, -- Right Leg
                15093053680   -- Head
            }
        }
        ReplicatedStorage
        :WaitForChild("Remotes")
        :WaitForChild("ChangeCharacterBody")
        :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})
