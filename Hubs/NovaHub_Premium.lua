local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Libs/RedzhubUiLib.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Nova Hub (Español) 🎆",
    SubTitle = "by Roun95",
    SaveFolder = "NovaData"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://111486071468142", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

Window:Dialog({
    Title = "Aviso",
    Text = "Nova Hub fue creado y desarrollado por @Roun95, Sigueme para traer futuras actualizaciones y mejoras!",
    Options = {
	{"Esta bien", function()
	end}
    }
})
local Tab1 = Window:MakeTab({"Credits", "info"})
local Tab2 = Window:MakeTab({"Player", "user"})
local Tab3 = Window:MakeTab({"Avatar", "shirt"})
local Tab4 = Window:MakeTab({"House", "home"})
local Tab5 = Window:MakeTab({"Car", "car"})
local Tab6 = Window:MakeTab({"RGB", "brush"})
local Tab7 = Window:MakeTab({"Music All", "radio"})
local Tab8 = Window:MakeTab({"Music", "music"})
local Tab9 = Window:MakeTab({"Troll", "skull"})
local Tab10 = Window:MakeTab({"Lag Server", "bomb"})
local Tab11 = Window:MakeTab({"Scripts", "scroll"})
local Tab12 = Window:MakeTab({"Teleportes", "map-pin"})
local Tab13 = Window:MakeTab({"Shaders", "wind"})
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

Tab1:AddDiscordInvite({
    Name = "Nova Hub",
    Description = "Unete a nuestro Discord",
    Logo = "rbxassetid://111486071468142",
    Invite = "Proximamente",
})

local Section = Tab1:AddSection({"Version 1.12 (Premium)"})
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
local Section = Tab2:AddSection({"Personaje del jugador"})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local selectedPlayerName = nil
local headsitActive = false

local function headsitOnPlayer(targetPlayer)
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        warn("Su personaje no tiene cabeza.")
        return false
    end
    local targetHead = targetPlayer.Character.Head
    local localRoot = character:FindFirstChild("HumanoidRootPart")
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

    if humanoid then
        humanoid.Sit = true
    end

    print("Headsit activado en " .. targetPlayer.Name)
    return true
end

local function removeHeadsit()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local localRoot = character:FindFirstChild("HumanoidRootPart")
    if localRoot then
        for _, v in pairs(localRoot:GetChildren()) do
            if v:IsA("WeldConstraint") then
                v:Destroy()
            end
        end
    end
    if humanoid then
        humanoid.Sit = false
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
    local StarterGui = game:GetService("StarterGui")
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
Tab2:AddButton({"", function()
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
    Increase = 1,
    MinValue = 16,
    MaxValue = 500,
    Default = 16,
    Callback = function(Value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
			humanoid.WalkSpeed = Value
    	end
	end
})
 
Tab2:AddSlider({
    Name = "Salto",
    Increase = 1,
    MinValue = 50,
    MaxValue = 500,
    Default = 50,
    Callback = function(Value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.JumpPower = Value
    	end
	end
})
 
Tab2:AddSlider({
    Name = "Gravedad",
    Increase = 1,
    MinValue = 0,
    MaxValue = 5000,
    Default = 196.2,
    Callback = function(Value)
        game.Workspace.Gravity = Value
	end
})
 
local InfiniteJumpEnabled = false
 
game:GetService("UserInputService").JumpRequest:Connect(function()
	if InfiniteJumpEnabled then
	  local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
		character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
   end
end)

Tab2:AddButton({
    Name = "Restablecer Gravedad, Velocidad, Salto",
    Callback = function()
        -- Restablecer velocidad y salto
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16 -- Speed Value
            humanoid.JumpPower = 50 -- JumpPower Value
        end
        -- Restablecer gravedad
        game.Workspace.Gravity = 196.2 -- Gravity Value
        -- Desactivar salto infinito
        InfiniteJumpEnabled = false
	end
})

Tab2:AddToggle({
	Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
       InfiniteJumpEnabled = Value
    end
})

-- Interruptor para Anti-Sit
local antiSitConnection = nil
local antiSitEnabled = false

Tab2:AddToggle({
    Name = "Anti-Sit",
    Default = false,
    Callback = function(state)
        antiSitEnabled = state
        local LocalPlayer = game:GetService("Players").LocalPlayer

        if state then
            local function applyAntiSit(character)
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Sit = false
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if antiSitConnection then
                        antiSitConnection:Disconnect()
                    end
                    antiSitConnection = humanoid.Seated:Connect(function(isSeated)
                        if isSeated then
                            humanoid.Sit = false
                            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end
                    end)
                end
            end

            if LocalPlayer.Character then
                applyAntiSit(LocalPlayer.Character)
            end

            local characterAddedConnection
            characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(character)
                if not antiSitEnabled then
                    characterAddedConnection:Disconnect()
                    return
                end
                local humanoid = character:WaitForChild("Humanoid", 5)
                if humanoid then
                    applyAntiSit(character)
                end
            end)
        else
            if antiSitConnection then
				antiSitConnection:Disconnect()
                antiSitConnection = nil
            end

            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end
    end
})

-- Ejecutar Noclip
Tab2:AddButton({
    Name = "Noclip GUI Universal",
    Callback = function()
		local success, _ = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/Noclip.lua"))()
        end)

        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Exito" or "Error",
            Text = success and "Noclip GUI cargado!" or "Fallo al cargar Noclip GUI.",
            Duration = 5
        })
    end
})

-- Ejecutar Fly
Tab2:AddButton({
    Name = "Fly GUI Universal",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/Fly.lua"))()
        end)

        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Exito" or "Error",
            Text = success and "Fly GUI cargado!" or "Fallo al cargar Fly GUI.",
            Duration = 5
        })
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab2:AddSection({"ESP"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "RGB"

-- Menú desplegable de color
Tab2:AddDropdown({
    Name = "ESP Color",
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
    if player == Players.LocalPlayer then return end
    if not espEnabled then return end

    local character = player.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            if billboardGuis[player] then
                billboardGuis[player]:Destroy()
            end

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP_Billboard"
            billboard.Parent = head
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "TextLabel"
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
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
                                -- === Tab 3: Avatar Editor === --
----------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"Copiar avatar"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local PlayerValue
local Target = nil

-- Funcion para obtener los nombres de los jugadores
local function GetPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

-- Menu desplegable
local Dropdown = Tab3:AddDropdown({
    Name = "Seleccionar jugador",
    Description = "",
    Options = GetPlayerNames(),
    Default = "",
    Flag = "player list",
    Callback = function(playername)
        PlayerValue = playername
        Target = playername -- Conecta el menu con Copiar avatar
    end
})

local function UptadePlayers()
    Dropdown:Set(GetPlayerNames())
end

UptadePlayers()

-- Boton para actualizar lista de jugadores
Tab3:AddButton({"Actualizar lista", function()
    UptadePlayers()
end})

Players.PlayerAdded:Connect(UptadePlayers)
Players.PlayerRemoving:Connect(UptadePlayers)

-- Boton para copiar el avatar del jugador seleccionado
Tab3:AddButton({
    Name = "Copiar avatar",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                -- REINICIAR PERSONAJE
                local LDesc = LHumanoid:GetAppliedDescription()

                -- Remover accesorios, ropa y caras actuales
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                -- Copiar partes del cuerpo
                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                if tonumber(PDesc.WalkAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.WalkAnimation))
                    task.wait(0.3)
                end

                if tonumber(PDesc.RunAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.RunAnimation))
                    task.wait(0.3)
                end

                if tonumber(PDesc.JumpAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.JumpAnimation))
                    task.wait(0.3)
                end

                if tonumber(PDesc.FallAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.FallAnimation))
                    task.wait(0.3)
                end

                if tonumber(PDesc.SwimAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.SwimAnimation))
                    task.wait(0.3)
                end

                -- Nombre, Bio y Color
                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"Ropa 3D"})
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Espacio de nombres para evitar conflictos
local AvatarManager = {}
AvatarManager.ReplicatedStorage = ReplicatedStorage

-- Funcion para la notificacion
function AvatarManager:showNotify(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Aviso",
            Text = mensagem,
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
    local nomes = {}
    for _, avatar in ipairs(self.Avatares) do
        table.insert(nomes, avatar.Nome)
    end
    return nomes
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
local AvatarDropdown = Tab3:AddDropdown({
    Name = "Selecciona una opcion",
    Default = nil,
    Options = AvatarManager:GetAvatarNames(),
    Callback = function(avatarSelecionado)
        _G.SelectedAvatar = avatarSelecionado
    end
})

-- Boton para equipar el avatar seleccionado
Tab3:AddButton({
    Name = "Equipar",
    Callback = function()
        if not _G.SelectedAvatar or _G.SelectedAvatar == "" then
            AvatarManager:showNotify("Ningun avatar seleccionado!")
            return
        end
        AvatarManager:EquiparAvatar(_G.SelectedAvatar)
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"Editor de avatar"})

Tab3:AddParagraph({
    Title = "Tu avatar se reiniciara, Ajusta las proporciones de tu avatar para un mejor resultado",
})

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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
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
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas las partes han sido equipadas!")
    end
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab4: House === --
----------------------------------------------------------------------------------------------------
-- Boton para remover el baneo en todas las casas
Tab4:AddButton({
    Name = "Desbanear de todas las casas",
    Callback = function()
        local successCount = 0
        local failCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = Workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                local success, _ = pcall(function()
                    bannedBlock:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        for _, house in pairs(Workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                local success, _ = pcall(function()
                    house:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        if successCount > 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Exito",
                Text = "Desbaneado de " .. successCount .. " casas!",
                Duration = 5
            })
        end
        if failCount > 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Falta ser desbaneado de " .. failCount .. " casas.",
                Duration = 5
            })
        end
        if successCount == 0 and failCount == 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Ningun baneo encontrado para remover.",
                Duration = 5
            })
        end
    end
})

Tab4:AddParagraph({
    Title = "Proximamente mas cosas",
    Content = ""
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab5: Car === --
----------------------------------------------------------------------------------------------------
local Section = Tab5:AddSection({"Todas las funciones del vehiculo"})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Espacio de nombres para evitar conflictos
local vehicleTeleport = {}
vehicleTeleport.Players = Players
vehicleTeleport.Workspace = Workspace
vehicleTeleport.LocalPlayer = LocalPlayer
vehicleTeleport.Camera = Camera

-- Notificacion
function vehicleTeleport:showNotify(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Aviso",
            Text = mensagem,
            Duration = 5
        })
    end)
end

-- Funcion para activar/desactivar el daño de caida
function vehicleTeleport:ToggleFallDamage(disable)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return false end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if disable then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
        return true
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        return false
    end
end

-- Funcion para teletransportar el jugador al asiento del vehiculo
function vehicleTeleport:TeleportToSeat(seat, car)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
        self:showNotify("Personaje no encontrado!")
        return false
    end
    local humanoid = self.LocalPlayer.Character.Humanoid
    local rootPart = self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        self:showNotify("No se encontro HumanoidRootPart!")
        return false
    end

    humanoid.Sit = false
    task.wait(0.1)

    rootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
    task.wait(0.1)

    seat:Sit(humanoid)
    task.wait(0.5)
    return humanoid.SeatPart == seat
end

-- Funcion para teletransportar el vehiculo al vacío con retraso
function vehicleTeleport:TeleportToVoid(car)
    if not car then
        self:showNotify("Vehiculo invalido!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:showNotify("Parte principal del vehiculo no encontrado!")
            return
        end
    end
    local voidPosition = Vector3.new(0, -1000, 0)
    car:SetPrimaryPartCFrame(CFrame.new(voidPosition))
    task.wait(0.5)
end

-- Funcion para teletransportar el vehiculo a la posicion del jugador con retraso.
function vehicleTeleport:TeleportToPlayer(car, playerPos)
    if not car then
        self:showNotify("Vehiculo invalido!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:showNotify("Parte principal del vehiculo no encontrado!")
            return
        end
    end
    local targetPos = playerPos + Vector3.new(5, 0, 5)
    car:SetPrimaryPartCFrame(CFrame.new(targetPos))
    task.wait(0.5)
end

-- Funcion para salir del vehiculo y volver a la posicion original.
function vehicleTeleport:ExitCarAndReturn(originalPos)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if humanoid.SeatPart then
        humanoid.Sit = false
    end
    task.wait(0.1)
    if originalPos then
        self.LocalPlayer.Character:PivotTo(CFrame.new(originalPos))
    end
end

-- Funcion para actualizar la lista de vehiculos en el desplegable
function vehicleTeleport:UpdateVehicleList()
    local folderVehicles = self.Workspace:FindFirstChild("Vehicles")
    local listVehicles = {}
    
    if folderVehicles then
        for _, car in ipairs(folderVehicles:GetChildren()) do
            if car.Name:match("Car$") then
                table.insert(listVehicles, car.Name)
            end
        end
    end
    return listVehicles
end

-- Interruptor para eliminar todos los vehiculos
Tab5:AddToggle({
    Name = "Eliminar todos los vehiculos",
    Description = "Teletransporta los vehiculos al vacio",
    Default = false,
    Callback = function(state)
        local originalPosition
        local teleportActive = state
        local fallDamageDisabled = false

        if state then
            if self.LocalPlayer.Character and self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = self.LocalPlayer.Character.HumanoidRootPart.Position
            else
                vehicleTeleport:showNotify("Personaje no encontrado!")
                return
            end

            fallDamageDisabled = vehicleTeleport:ToggleFallDamage(true)

            spawn(function()
                local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
                if not vehiclesFolder then
                    vehicleTeleport:showNotify("Vehiculo no encontrado!")
                    return
                end

                local cars = {}
                for _, car in ipairs(vehiclesFolder:GetChildren()) do
                    if car.Name:match("Car$") then
                        table.insert(cars, car)
                    end
                end

                for _, car in ipairs(cars) do
                    if not teleportActive then break end

                    local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
                    if vehicleSeat and vehicleSeat.Occupant == nil then
                        local success = vehicleTeleport:TeleportToSeat(vehicleSeat, car)
                        if success then
                            vehicleTeleport:TeleportToVoid(car)
                            vehicleTeleport:ExitCarAndReturn(originalPosition)
                            task.wait(1)
                        end
                    end
                end

                if teleportActive then
                    teleportActive = false
                    vehicleTeleport:ToggleFallDamage(false)
                end
            end)
        else
            teleportActive = false
            vehicleTeleport:ToggleFallDamage(false)
        end
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab5:AddSection({"Características del vehiculo"})

local Dropdown = Tab5:AddDropdown({
    Name = "Seleccionar vehiculo",
    Description = "Seleccione el vehiculo de un jugador",
    Default = nil,
    Options = vehicleTeleport:UpdateVehicleList(),
    Callback = function(selectedCar)
        _G.SelectedVehicle = selectedCar
    end
})

-- Interruptor para ver la camara del vehiculo seleccionado
Tab5:AddToggle({
    Name = "Ver camara del vehiculo seleccionado",
    Description = "Ve la camara de un vehiculo",
    Default = false,
    Callback = function(state)
        if state then
            if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
                vehicleTeleport:showNotify("Ningun vehiculo seleccionado!")
                return
            end

            local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
            if not vehiclesFolder then
                vehicleTeleport:showNotify("Vehiculo no encontrado en la carpeta!")
                return
            end

            local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
            if not vehicle then
                vehicleTeleport:showNotify("Vehiculo no encontrado!")
                return
            end

            local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
            if not vehicleSeat then
                vehicleTeleport:showNotify("Asiento del vehiculo no encontrado!")
                return
            end

            -- Restaurar el estado de la camara del vehiculo
            vehicleTeleport.OriginalCameraSubject = vehicleTeleport.Camera.CameraSubject
            vehicleTeleport.OriginalCameraType = vehicleTeleport.Camera.CameraType

            -- Ajustar la camara para el asiento del vehiculo
            vehicleTeleport.Camera.CameraSubject = vehicleSeat
            vehicleTeleport.Camera.CameraType = Enum.CameraType.Follow
            vehicleTeleport:showNotify("Camara ajustada para el vehiculo " .. _G.SelectedVehicle .. "!")
        else
            -- Restaurar el estado original de la camara
            if vehicleTeleport.OriginalCameraSubject then
                vehicleTeleport.Camera.CameraSubject = vehicleTeleport.OriginalCameraSubject
                vehicleTeleport.Camera.CameraType = vehicleTeleport.OriginalCameraType or Enum.CameraType.Custom
                vehicleTeleport:showNotify("Camara restaurada!")
                vehicleTeleport.OriginalCameraSubject = nil
                vehicleTeleport.OriginalCameraType = nil
            end
        end
    end
})

--Actualizar el menu desplegable dinamicamente
vehicleTeleport.Workspace:WaitForChild("Vehicles").ChildAdded:Connect(function()
    Dropdown:Set(vehicleTeleport:UpdateVehicleList())
end)
vehicleTeleport.Workspace:WaitForChild("Vehicles").ChildRemoved:Connect(function()
    Dropdown:Set(vehicleTeleport:UpdateVehicleList())
end)

local Section = Tab5:AddSection({"Otras funciones"})

-- Boton para eliminar el vehiculo seleccionado
Tab5:AddButton({
    Name = "Eliminar vehiculo seleccionado",
    Description = "Teletransporta el vehiculo seleccionado al vacio",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            vehicleTeleport:showNotify("Ningun vehiculo seleccionado!")
            return
        end

        local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            vehicleTeleport:showNotify("Vehiculo no encontrado en la carpeta!")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            vehicleTeleport:showNotify("Vehiculo no encontrado!")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            vehicleTeleport:showNotify("Asiento del vehiculo no encontrado!")
            return
        end

        if vehicleSeat.Occupant then
            vehicleTeleport:showNotify("Vehiculo en uso, no fue posible eliminarlo!")
            return
        end

        local originalPos
        if vehicleTeleport.LocalPlayer.Character and vehicleTeleport.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = vehicleTeleport.LocalPlayer.Character.HumanoidRootPart.Position
        else
            vehicleTeleport:showNotify("Personaje del jugador no encontrado!")
            return
        end

        local isFallDamageOff = vehicleTeleport:ToggleFallDamage(true)
        local success = vehicleTeleport:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            vehicleTeleport:TeleportToVoid(vehicle)
            vehicleTeleport:showNotify("Vehiculo " .. _G.SelectedVehicle .. " Fue teletransportado al vacio!")
            vehicleTeleport:ExitCarAndReturn(originalPos)
        else
            vehicleTeleport:showNotify("Fallo al sentarte en el vehiculo!")
        end
        vehicleTeleport:ToggleFallDamage(false)
    end
})

-- Boton para teletransportar el vehiculo seleccionado a tu posicion
Tab5:AddButton({
    Name = "Traer vehiculo seleccionado",
    Description = "Teletransporta el vehiculo a tu posicion",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            vehicleTeleport:showNotify("Ningun vehiculo seleccionado!")
            return
        end

        local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            vehicleTeleport:showNotify("Vehiculo no encontrado en carpeta!")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            vehicleTeleport:showNotify("Vehiculo no encontrado!")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            vehicleTeleport:showNotify("Asiento del vehiculo no encontrado!")
            return
        end

        if vehicleSeat.Occupant then
            vehicleTeleport:showNotify("El vehiculo esta en uso, teletransporte fallido!")
            return
        end

        local originalPos
        if vehicleTeleport.LocalPlayer.Character and vehicleTeleport.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = vehicleTeleport.LocalPlayer.Character.HumanoidRootPart.Position
        else
            vehicleTeleport:showNotify("Personaje del jugador no encontrado!")
            return
        end

        local isFallDamageOff = vehicleTeleport:ToggleFallDamage(true)
        local success = vehicleTeleport:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            vehicleTeleport:TeleportToPlayer(vehicle, originalPos)
            vehicleTeleport:showNotify("Vehiculo " .. _G.SelectedVehicle .. " fue teletransportando a ti!")
            vehicleTeleport:ExitCarAndReturn(originalPos)
        else
            vehicleTeleport:showNotify("Fallo al sentarte en el vehiculo!")
        end
        vehicleTeleport:ToggleFallDamage(false)
    end
})

-- Boton para teletransportar todos los vehiculos a tu posicion
Tab5:AddButton({
    Name = "Traer todos los vehiculos",
    Description = "Teletransporta todos los vehiculos a tu posicion",
    Callback = function()
        local originalPos
        if vehicleTeleport.LocalPlayer.Character and vehicleTeleport.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = vehicleTeleport.LocalPlayer.Character.HumanoidRootPart.Position
        else
            vehicleTeleport:showNotify("Personaje del jugador no encontrado!")
            return
        end

        local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            vehicleTeleport:showNotify("Vehiculo no encontrado en carpeta!")
            return
        end

        local isFallDamageOff = vehicleTeleport:ToggleFallDamage(true)
        local cars = {}
        for _, car in ipairs(vehiclesFolder:GetChildren()) do
            if car.Name:match("Car$") then
                table.insert(cars, car)
            end
        end

        for _, car in ipairs(cars) do
            local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
            if vehicleSeat and vehicleSeat.Occupant == nil then
                local success = vehicleTeleport:TeleportToSeat(vehicleSeat, car)
                if success then
                    vehicleTeleport:TeleportToPlayer(car, originalPos)
                    vehicleTeleport:ExitCarAndReturn(originalPos)
                    vehicleTeleport:showNotify("Vehiculo " .. car.Name .. " fue teletransportado a ti!")
                    task.wait(1)
                else
                    vehicleTeleport:showNotify("No puedes sentarte en el vehiculo " .. car.Name .. "!")
                end
            else
                if vehicleSeat then
                    vehicleTeleport:showNotify("Vehiculo " .. car.Name .. " Vehiculo en uso!")
                else
                    vehicleTeleport:showNotify("Vehiculo " .. car.Name .. " Asiento no encontrado!")
                end
            end
        end

        vehicleTeleport:ToggleFallDamage(false)
        if #cars == 0 then
            vehicleTeleport:showNotify("Ningun vehiculo disponible para teletransportar!")
        end
    end
})

-- Mantener el daño por caida al reiniciar el personaje
local fallDamageDisabled = false
vehicleTeleport.LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    if fallDamageDisabled then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    end
end)
----------------------------------------------------------------------------------------------------
                                    -- === Tab6: RGB === --
----------------------------------------------------------------------------------------------------
local Section = Tab6:AddSection({"Velocidad RGB"})
-- Velocidad ajustable (cuanto mas alta, mas rapido)
local rgbSpeed = 1

Tab6:AddSlider({
    Name = "Ajusta la velocidad del RGB",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 2,
    Callback = function(Value)
        rgbSpeed = Value
    end
})

-- Funcion para crear un color RGB suave con HSV
local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5 -- gira o hue suavemente de 0 a 1
    return Color3.fromHSV(h, 1, 1)
end

-- Funcion para disparar eventos
local function fireServer(eventName, args)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end
----------------------------------------------------------------------------------------------------
local Section = Tab6:AddSection({"Jugador RGB"})

local nameBioRGBActive = false
Tab6:AddToggle({
    Name = "Nombre + Bio RGB",
    Default = false,
    Callback = function(state)
        nameBioRGBActive = state
        if state then
            task.spawn(function()
                while nameBioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPNameColor", color })
                    fireServer("1RPNam1eColo1r", { "PickingRPBioColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab6:AddSection({"Vehiculos y casas"})

local ToggleCasa = Tab6:AddToggle({
    Name = "Casa RGB",
    Default = false
})

ToggleCasa:Callback(function(Value)
    getgenv().rgbCasa = Value
    task.spawn(function()
        while getgenv().rgbCasa do
            fireServer("1Player1sHous1e", {
                "ColorPickHouse",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)

local carRGBActive = false
Tab6:AddToggle({
    Name = "Vehiculo RGB (Premium)",
    Description = "Cambia el color del auto a RGB (Necesario Premium)",
    Default = false,
    Callback = function(state)
        carRGBActive = state
        if state then
            task.spawn(function()
                while carRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1Player1sCa1r", { "PickingCarColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab 7: Music All === --
----------------------------------------------------------------------------------------------------
local loopAtivo = false
local InputID = ""

Tab7:AddTextBox({
    Name = "Reproductor de musica",
    Description = "Pon el ID del sonido para reproducir",
    Default = "",
    PlaceholderText = "ej: 6832470734",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

Tab7:AddButton({
    Name = "Reproducir musica",
    Callback = function()
        if InputID then
            fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
            local globalSound = Instance.new("Sound", Workspace)
            globalSound.SoundId = "rbxassetid://" .. InputID
            globalSound.Looped = false
            globalSound:Play()
            task.wait(3)
            globalSound:Destroy()
        end
    end
})

Tab7:AddToggle({
    Name = "Repetir",
    Description = "Repetir sonido en bucle",
    Default = false,
    Callback = function(state)
        loopAtivo = state
        if loopAtivo then
            spawn(function()
                while loopAtivo do
                    if InputID then
                        fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
                        local globalSound = Instance.new("Sound", Workspace)
                        globalSound.SoundId = "rbxassetid://" .. InputID
                        globalSound.Looped = false
                        globalSound:Play()
                        task.spawn(function()
                            task.wait(3)
                            globalSound:Destroy()
                        end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

local function createSoundDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" and music.id ~= "4354908569" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local selectedSoundID = nil
    local currentVolume = 1
    local currentPitch = 1

    local function playSound(soundId, volume, pitch)
        fireServer("1Gu1nSound1s", {Workspace, soundId, volume})
        local globalSound = Instance.new("Sound")
        globalSound.Parent = Workspace
        globalSound.SoundId = "rbxassetid://" .. soundId
        globalSound.Volume = volume
        globalSound.Pitch = pitch
        globalSound.Looped = false
        globalSound:Play()
        task.spawn(function()
            task.wait(3)
            globalSound:Destroy()
        end)
    end

    Tab7:AddDropdown({
        Name = title,
        Description = "Elige un sonido para reproducir en el servidor",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                selectedSoundID = categoryMap[selectedSound].id
            else
                selectedSoundID = nil
            end
        end
    })

    Tab7:AddButton({
        Name = "Reproducir sonido",
        Description = "Reproducir sonido seleccionado del menu",
        Callback = function()
            if selectedSoundID then
                playSound(selectedSoundID, currentVolume, currentPitch)
            end
        end
    })

    local dropdownLoopActive = false
    Tab7:AddToggle({
        Name = "Repetir",
        Description = "Repetir sonido en bucle",
        Default = false,
        Callback = function(state)
            dropdownLoopActive = state
            if state then
                task.spawn(function()
                    while dropdownLoopActive do
                        if selectedSoundID then
                            playSound(selectedSoundID, currentVolume, currentPitch)
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })
end

-- Dropdown "Memes"
createSoundDropdown("Selecione um meme", {
    ["Memes"] = {
        {name = "pankapakan", id = "122547522269143"}, 
       
        {name = "Gemido ultra rápido", id = "128863565301778"},
        {name = "Hoo ze da manga", id = "106624090319571"},
        {name = "dodichan onnn...", id = "134640594695384"},
        {name = "Loly gemiD0", id = "119277017538197"},
        {name = "Hentai wiaaaaan", id = "88332347208779"},
        {name = "aahhh plankton meme", id = "95982351322190"},
        {name = "vai g0z@?", id = "116293771329297"},
        {name = "G0z33iiii", id = "93462644278510"},
        {name = "Hommmm ", id = "133135656929513"},
        {name = "gemido1", id = "105263704862377"},
        {name = " gemido2", id = "92186909873950"},
        {name = "sus sex", id = "128137573022197"},
        {name = "gemido estranho", id = "131219411501419"},
        {name = "gemido kawai", id = "100409245129170"},
        {name = "iamete cunasai", id = "108494476595033"},
        {name = "ai poison", id = "115870718113313"},
        {name = "chegachega SUS", id = "77405864184828"},
        {name = "uwu", id = "76820720070248"},
        {name = "ai meu cuzin", id = "130714479795369"},
        {name = "girl audio 2", id = "84207358477461"},
        {name = "ai alexandre de moraes", id = "107261471941570"},
        {name = "haaii meme", id = "120006672159037"},
 
        {name = "GoGogo gogogo", id = "103262503950995"},
        {name = "Toma jack", id = "132603645477541"},
        {name = "Toma jackV2", id = "100446887985203"},
        {name = "Toma jack no sol quente", id = "97476487963273"},
        {name = "ifood", id = "133843750864059"},
        {name = "pelo geito ela ta querendo ram", id = "94395705857835"},
        {name = "lula vai todo mundo", id = "136804576009416"},
        {name = "coringa", id = "84663543883498"},
        {name = "shoope", id = "8747441609"},
        {name = "quenojo", id = "103440368630269"},
        {name = "sai dai lava prato", id = "101232400175829"},
        {name = "se e loko numconpeça", id = "78442476709262"},
        {name = "mita sequer que eu too uma", id = "94889439372168"},
        {name = "Hoje vou ser tua mulher e tu", id = "90844637105538"},
        {name = "Deita aqui eu mandei vc deitar sirens", id = "100291188941582"},
        {name = "miau", id = "131804436682424"},
        {name = "skibidi", id = "128771670035179"},
        {name = "BIRULEIBI", id = "121569761604968"},
        {name = "biseabesjnjkasnakjsndjkafb", id = "133106998846260"},
        {name = "vai corinthians!!....", id = "127012936767471"},
        {name = "my sigman", id = "103431815659907"},
        {name = "mama", id = "106850066985594"},
        {name = "OH MY GOD", id = "73349649774476"},
        {name = "CHINABOY", id = "84403553163931"},
        {name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470"},
        
        {name = "Sai d3sgraç@", id = "106973692977609"},
        
        {name = "opa salve tudo bem?", id = "80870678096428"},
        {name = "OLHA O CARRO DO DANONE", id = "110493863773948"},
        {name = "Nãoooo, Nãoooo, Nãooo!!!!!", id = "95825536480898"},
        {name = "UM PÉ DE SIRIGUELA KK", id = "112804043442210"},
        {name = "e o carro da pamonha", id = "94951629392683"},
        {name = "BOM DIAAAAAAAAAA", id = "136579844511260"},
        {name = "ai-meu-chiclete", id = "92911732806153"},
        {name = "posso te ligar ou tua mulher...", id = "103211341252816"},
        {name = "Boa chi joga muito cara", id = "110707564387669"},
        {name = "Oqueee meme", id = "120092799810101"},
        {name = "kkk muito fei", id = "79241074803021"},
        {name = "lula cade o ze gotinha", id = "86012585992725"},
        {name = "morreu", id = "8872409975"},
        {name = "a-pia-ta-cheia-de-louca", id = "98076927129047"},
        {name = "Mahito killSong", id = "128669424001766"},
        {name = "Sucumba", id = "7946300950"},
        {name = "nem clicou o thurzin", id = "84428355313544"},
        {name = "fiui OLHA MENSAGEM", id = "121668429878811"},
        {name = "tooomeee", id = "128319664118768"},
        {name = "risada de ladrao", id = "133065882609605"},
        {name = "E o PIX nada ainda", id = "113831443375212"},
        {name = "Vo nada vo nada", id = "89093085290586"},
        {name = "Eli gosta", id = "105012436535315"},
        {name = "um cavalo de tres pernas?", id = "8164241439"},
        {name = "voces sao um bado de fdp", id = "8232773326"},
        {name = "HAHA TROLLEI ATÉ VOCÊ", id = "7021794555"},
        
        

        {name = "Calaboca Kenga", id = "86494561679259"},
        {name = "alvincut", id = "88788640194373"},
        {name = "e a risada faz como?", id = "140713372459057"},
        {name = "voce deve se m@t4", id = "100227426848009"},
        {name = "receba", id = "94142662616215"},
        {name = "UUIIII", id = "73210569653520"},
        



        {name = "sai", id = "121169949217007"},
        {name = "risada boa dms", id = "127589011971759"},
        {name = "vacilo perna de pau", id = "106809680656199"},
        {name = "gomo gomo no!!!", id = "137067472449625"},
        {name = "arroto", id = "140203378050178"},
        {name = "iraaaa", id = "136752451575091"},
        {name = "não fica se achando muito não", id = "101588606280167"},
       
        {name = "WhatsApp notificaçaoV1", id = "107004225739474"},
        {name = "WhatsApp notificaçaoV2", id = "18850631582"},
        {name = "SamsungV1", id = "123767635061073"},
        {name = "SamsungV2", id = "96579234730244"}, 
        {name = "Shiiii", id = "120566727202986"},
        {name = "ai_tomaa miku", id = "139770074770361"},
        {name = "Miku Miku", id = "72812231495047"},
        {name = "kuru_kuru", id = "122465710753374"},
        {name = "PM ROCAM", id = "96161547081609"},
        {name = "cavalo!!", id = "78871573440184"},
        {name = "deixa os garoto brinca", id = "80291355054807"},
        {name = "flamengo", id = "137774355552052"},
        {name = "sai do mei satnas", id = "127944706557246"},
        {name = "namoral agora e a hora", id = "120677947987369"},
        {name = "n pode me chutar pq seu celebro e burro", id = "82284055473737"},
        {name = "vc ta fudido vou te pegar", id = "120214772725166"},
        {name = "deley", id = "102906880476838"},
        {name = "Tu e um beta", id = "130233956349541"},
        {name = "Porfavor n tira eu nao", id = "85321374020324"},
        {name = "Olá beleza vc pode me dá muitos", id = "74235334504693"},
        {name = "Discord sus", id = "122662798976905"},
        {name = "rojao apito", id = "6549021381"},
        {name = "off", id = "1778829098"},
        {name = "Kazuma kazuma", id = "127954653962405"},
        {name = "sometourado", id = "123592956882621"},
        {name = "Estouradoespad", id = "136179020015211"},
        {name = "Alaku bommm", id = "110796593805268"},
        {name = "busss", id = "139841197791567"},
        {name = "Estourado wItb", id = "137478052262430"},
        {name = "sla", id = "116672405522828"},
        {name = "HA HA HA", id = "138236682866721"}
    }
}, "pankapakan")
----------------------------------------------------------------------------------------------------
local Section = Tab7:AddSection({"Reproducir sonidos de terror o efectos"})

-- Dropdown "Efeito/Terror"
createSoundDropdown("Seleccione un sonido de terror o efecto", {
    ["efeito/terror"] = {
        {name = "SCP-096 Scream (raging)", id = "343430735"},
        {name = "Alarm bookhaven", id = "1526192493"},
        {name = "", id = ""}
    }
}, "Alarm bookhaven")
----------------------------------------------------------------------------------------------------
                                -- === Tab 8: Troll Musica === --
----------------------------------------------------------------------------------------------------
local function tocarMusica(id)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Radio (ToolMusicText)
    local argsRadio = {
        [1] = "ToolMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack(argsRadio))
    
    -- Casa (PickHouseMusicText)
    local argsCasa = {
        [1] = "PickHouseMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(argsCasa))

    -- Carro (PickingCarMusicText)
    local argsCarro = {
        [1] = "PickingCarMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(argsCarro))

    -- Scooter (PickingScooterMusicText)
    local argsScooter = {
        [1] = "PickingScooterMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(argsScooter))
end

local function isValidMusicId(value)
    return value and value ~= "" and value ~= "Option 1" and not value:match("novas musica adds") and not value:match("musica brasil") and not value:match("musica do meu interece") and not value:match("musica dls por elas") and not value:match("meme abaixo") and not value:match("estourada")
end

Tab8:AddTextBox({
    Name = "Pon el ID de la musica para reproducir",
    PlaceholderText = "ej: 6832470734",
    Callback = function(value)
        if value and value ~= "" then
            tocarMusica(tostring(value))
        end
    end
})

local function createMusicDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local function playMusic(soundId)
        tocarMusica(tostring(soundId)) -- Utiliza la funcion playMusic para reproducir en todos los lugares
    end

    Tab8:AddDropdown({
        Name = title,
        Description = "all",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                local soundId = categoryMap[selectedSound].id
                if soundId and soundId ~= "" and soundId ~= "4354908569" then
                    playMusic(soundId)
                end
            end
        end
    })
end

-- Dropdown "Forró"
createMusicDropdown("Forró", {
    ["forro"] = {
        {name = "forró ja cansou", id = "74812784884330"},
        {name = "lenbro ate hoje", id = "71531533552899"},
        {name = "escolha certa", id = "107088620814881"},
        {name = "forró da rezenha", id = "120973520531216"},
        {name = "forró dudu", id = "74404168179733"},
        {name = "forró sao joao", id = "106364874935196"},
        {name = "forró engraçado paia", id = "76524290482399"},
        {name = "100% forro vaquejada", id = "92295159623916"},
        
        {name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470"},
        {name = "PARA NÃO ESQUECER QUEM SOMOS", id = "88937498361674"},
        {name = "Uno zero", id = "112959083808887"},
        {name = "Iate do neymar", id = "135738534706063"},
        {name = "Batidao na aldeia", id = "79953696595578"}
    }
}, "Option 1")

-- Dropdown "Músicas e Memes Aleatório"
createMusicDropdown("Músicas e Memes Aleatório", {
    ["forro"] = {
        {name = "ANXIETY (Amapiano Re-fix)", id = "101483901475189"}, 
        {name = "Meu corpo, minhas regras", id = "127587901595282"},
        {name = "$$$$gg$$$$gg", id = "137471775091253"},
        {name = "Megalovania but its only the melodies", id = "104500091160463"},
        {name = "androphono strikes back", id = "78312089943968"},
        {name = "Bamm Bamm", id = "128730685516895"},
        {name = "chupa cabra", id = "132890273173295"},
        {name = "longe de mais", id = "124478512057763"},
        {name = "Garoto de Copacabana", id = "135648634110254"},
        {name = "CELL!", id = "117634275895085"},
        {name = "Boa vibe em Ubatuba", id = "139059061493558"},
        {name = "SLIP AWAY", id = "126152928520174"},
        {name = "Alone in Motion", id = "122379348696948"},
        {name = "Fade Away", id = "81002139735874"},
        {name = "Wounds & Wishes", id = "109347979566607"},
        {name = "Ascensão do Monarca", id = "101864243033211"},
        {name = "carro do ovo", id = "3148329638"},
        {name = "ingles bus (fling ou kill bus)", id = "123268013026823"},
        {name = "MIKU MIKU HATSUNE", id = "112783541496955"},
        {name = "Five Nights at Freddy's", id = "110733765539890"},
        {name = "Rat Dance", id = "133496635668044"},
        {name = "Escalando a Seleção Brasileira para a Copa", id = "116546457407236"}
    }
}, "Option 1")

-- Dropdown "Funk"
createMusicDropdown("Funk", {
    ["Funk"] = {
        {name = "sua mulher funk", id = "90844637105538"},
        {name = "fuga na viatura", id = "131891110268352"},
        {name = "funkphonk fumando verde", id = "112143944982807"},
        {name = "cauma xmara", id = "95664293972405"},
        {name = "que que sharke", id = "129546408528391"},
        {name = "Il Cacto Hipopotamo FUNK", id = "104491656009142"},
        {name = "Espressora Signora FUNK", id = "123394392737234"},
        {name = "trippi troop funk", id = "73049389767013"},
        {name = "bombini funkphonk", id = "88814770244609"},
        {name = "pre treino", id = "136869502216760"},
        {name = "CVRL", id = "124244582950595"},
        {name = "batida Brega Violino (Beat Brega Funk)", id = "99399643204701"},
        {name = "Dança do Canguru (Pke Gaz1nh)", id = "86876136192157"},
        {name = "espere 30segundos!! Ondas sonoras", id = "127757321382838"},
        {name = "MONTAGEM ARABIANA (Pke Gaz1nh)", id = "78076624091098"},
        {name = "Manda o papo (NGI)", id = "132642647937688"},
        {name = "Viver bem", id = "82805460494325"},
        {name = "Faixa estronda", id = "121187736532042"},
        {name = "Ritmo Pixelado", id = "93928823862203"},
        {name = "Viagem Sonora", id = "79349174602261"},
        {name = "Melodia Virtual", id = "139147474886402"},
        {name = "Melodia Serena", id = "97011217688307"},
        {name = "SENTA", id = "124085422276732"},
        {name = "TUNG TUNG TUNG TUNG SAHUR PHONK BRASILEIRO", id = "120353876640055"},
        {name = "crazy-lol", id = "106958630419629"},
        {name = "V7", id = "80348640826643"},
        {name = "UIUAH", id = "82894376737849"},
        {name = "meta ritmo", id = "110091098283354"},
        {name = "CAPPUCCINO ASSASSINO (SPEDUP)", id = "132733033157915"},
        {name = "haha (NGI)", id = "122114766584918"},
        {name = "DO PO", id = "114207745067816"}
    }
}, "Option 1")

-- Dropdown "Phonk"
createMusicDropdown("Phonk", {
    ["phonk"] = {
        {name = "wyles", id = "85385155970460"},
        {name = "phonk kawai", id = "91502410121438"},
        {name = "querendo da a bucet@", id = "72720721570850"},
        {name = "vem no pocpoc", id = "102333419023382"},
        {name = "tatiu wim", id = "122871512353520"},
        {name = "novinha sapeca", id = "111668097052966"},
        {name = "novinha representa", id = "93786060174790"},
        {name = "phonk1", id = "77501611905348"},
        {name = "phonk2", id = "126887144190812"},
        {name = "phonk osadia", id = "88033569921555"},
        {name = "phonk sarra", id = "132436320685732"},
        {name = "relaionamento sem crush", id = "105832154444494"},
        {name = "phonk3", id = "90323407842935"},
        {name = "novinha dançapanpa", id = "132245626038510"},
        {name = "phonk sexoagreçivo", id = "111995323199676"},
        {name = "phonk4", id = "115016589376700"},
        {name = "phonk5", id = "118740708757685"},
        {name = "phonk6", id = "139435437308948"},
        {name = "phonk chapaquente", id = "109189438638906"},
        {name = "phonk rajada", id = "105126065014034"},
        {name = "rede globo", id = "138487820505005"},
        {name = "phonk indiano", id = "87968531262747"},
        {name = "vapo do vapo", id = "106317184644394"},
        {name = "tutatatutata", id = "112068892721408"},
        {name = "phonk slower", id = "122852029094656"},
        {name = "phonk9", id = "91760524161503"},
        {name = "phonk10", id = "73140398421340"},
        {name = "phonk11", id = "137962454483542"},
        {name = "phonk12", id = "84733736048142"},
        {name = "phonk13", id = "106322173003761"},
        {name = "phonk14", id = "94604796823780"},
        {name = "phonk15", id = "118063577904953"},
        {name = "phonk16", id = "115567432786512"},
        {name = "phonk toq", id = "71304501822029"},
        {name = "phonk hey", id = "132218979961283"},
        {name = "phonk17", id = "102708912256857"},
        {name = "phonk18", id = "140642559093189"},
        {name = "phonk neve", id = "13530439660"},
        {name = "phonk19", id = "87863924786534"},
        {name = "phonk20", id = "133135085604736"},
        {name = "phonk lento", id = "97258811783169"},
        {name = "phonk21", id = "92308400487695"},
        {name = "tipo wym", id = "88064647826500"},
        {name = "estouradassa1", id = "92175624643620"},
        {name = "estouradassa2", id = "108099943758978"},
        {name = "Naaaaa", id = "109784877184952"},
        {name = "trem", id = "114608169341947"},
        {name = "eoropa", id = "111346133543699"},
        {name = "atimosphekika", id = "77857496821844"},
        {name = "phonk ALL THE TIME", id = "123809083385992"},
        {name = "Lifelong Memory", id = "81929101024622"},
        {name = "Automotivo Blondie (Pke Gaz1nh)", id = "74564219749776"},
        {name = "สวัสดีคนไทย v2", id =  "118225359190317"},
        {name = "MTG TU VAI SENTAR (Pke Gaz1nh)", id = "115317874112657"},
        {name = "SARRA FUNK", id = "96249826607044"},
        {name = "Catuquanvan", id = "88038595663211"},
        {name = "F-D-1 (slowed)", id = "124958445624871"},
        {name = "Sucessagem", id = "88551699463723"},
        {name = "ILOVE phonksla", id = "82148953715595"},
        {name = "SPEED SLIDE", id = "118959437310311"},
        {name = "TOMA FUNK PHONK", id = "126291069838831"},
        {name = "PASSO BEM SOLTO X NEW JAZZ", id = "122706595087279"},
        {name = "MONTAGEM BIONICA DIAMANTE", id = "122338822665007"},
        {name = "BALA SELVAGEM!", id = "96180057167470"},
        {name = "Luz <3", id = "74281337525581"},
        {name = "COMO TU", id = "86928685812280"},
        {name = "MONTAGEM SOLAR TROPICANO (SPEED UP)", id = "116461681407294"},
        {name = "MONTAGEM SOLAR TROPICANO (SLOWED)", id = "109308273341422"},
        {name = "YO DE TI", id = "125181345407169"},
        {name = "Beauty, (Phonk), Super sped up", id = "71123357599630"},
        {name = "MONTAGEM BOOMBOX DO MALA FUNK", id = "86537505028256"},
        {name = "BRAZIL DO FUNK", id = "133498554139200"},
        {name = "BRR BRR PATAPIM FUNK", id = "117170901476451"},
        {name = "MONTAGEM TERRA BELA FUNK", id = "134770548505933"},
        {name = "FUNK DO RAVE 1.0", id = "137135395010424"},
        
        {name = " Portao Funk", id = "70900514961735"},
        {name = " Espaço Funk", id = "110519906029322"},
        {name = " FUTABA", id = "91834632690710"},
        {name = " Melódica Explosão De Melodia", id = "98371771055411"},
        {name = " RASGO", id = "98267810117949"},
        {name = " HIPNOTIZA", id = "117668905142866"},
        {name = "CRISTAL NOTURNO", id = "103695219371872"},
        {name = " SKY HIGH", id = "123517126955383"},
        {name = "MIKU top", id = "102771149931910"},
        {name = " ACABU SO FUNK", id = "127870227978818"},
        {name = "CREATIFE FUNK", id = "130525387712209"},
        {name = "GOTH FUNK", id = "97662362226511"},
        {name = "PORTUGESE FUNK", id = "125858109122379"},
        {name = "SUBURBANA", id = "139825057894568"},
        {name = "ESPERA LA NOCHE FUNK", id = "139768056738146"},
        {name = "SIN PERMISO FUNK", id = "92572896648274"},
        {name = "MONTAGEM DACE RAT", id = "98711199754623"},
        {name = " LOVELY FUNK", id = "130633105268814"},
        {name = "STORYMODECOOL", id = "87115976125426"},
        {name = "BLACK COFFEE FUNK", id = "82705137378395"},
        {name = "KOBALT", id = "79381341943021"},
        {name = " andante bacterial", id = "105882833374061"},
        {name = "ANGEL Speed Up", id = "139593870988593"},
        {name = "LUTA ÉPICA", id = "73966367524216"},
        {name = "MALDITA", id = "133814632960968"},
        {name = "DA ZONA NTJ VERSON", id = "105770593501071"},
        {name = "HIPNOTIZA", id = "132015050363205"},
        {name = "MIDZUKI speed up", id = "129151948619922"},
        
        {name = "movimenta funk", id = "114994598691121"},
        {name = "CRISTAL", id = "103445348511856"},
        {name = "Letero funkphonk", id = "99409598156364"}
    }
}, "Option 1")

Tab8:AddButton({
    Name = "Parar musica",
    Callback = function()
        tocarMusica("")
    end
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab 9: Troll === --
----------------------------------------------------------------------------------------------------
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local selectedPlayer = nil
local isFollowingKill = false
local isFollowingPull = false
local running = false
local connection = nil
local flingConnection = nil
local originalPosition = nil
local savedPosition = nil
local originalProperties = {}
local selectedKillPullMethod = nil
local selectedFlingMethod = nil
local soccerBall = nil
local couch = nil
local isSpectating = false
local spectatedPlayer = nil
local characterConnection = nil
local flingToggle = nil

local SetNetworkOwnerEvent = Instance.new("RemoteEvent")
SetNetworkOwnerEvent.Name = "SetNetworkOwnerEvent_" .. tostring(math.random(1000, 9999))
SetNetworkOwnerEvent.Parent = ReplicatedStorage

local serverScriptCode = [[
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:WaitForChild("]] .. SetNetworkOwnerEvent.Name .. [[")
    
    event.OnServerEvent:Connect(function(player, part, networkOwner)
        if part and part:IsA("BasePart") then
            pcall(function()
                part:SetNetworkOwner(networkOwner)
                part.Anchored = false
                part.CanCollide = true
                part.CanTouch = true
            end)
        end
    end)
]]

pcall(function()
    loadstring(serverScriptCode)()
end)

local function disableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = true
    end
end

local function enableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = false
    end
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local function updateDropdown(dropdown, spectateToggle)
    pcall(function()
        local currentValue = dropdown:Get()
        local playerNames = getPlayerNames()
        dropdown:Set(playerNames) -- Mantiene el nombre del jugador
        if currentValue and not table.find(playerNames, currentValue) then
            dropdown:Set("")
            selectedPlayer = nil
            if isSpectating then
                stopSpectating()
                if spectateToggle then
                    pcall(function() spectateToggle:Set(false) end)
                end
            end
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() connection = nil end
                if flingConnection then flingConnection:Disconnect() flingConnection = nil end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
        elseif currentValue and table.find(playerNames, currentValue) then
            dropdown:Set(currentValue) -- Mantiene la seleccion si el jugador todavia esta en el juego
        end
    end)
end

local function spectatePlayer(playerName)
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer ~= LocalPlayer then
        spectatedPlayer = targetPlayer
        isSpectating = true

        local function updateCamera()
            if not isSpectating or not spectatedPlayer then return end
            if spectatedPlayer.Character and spectatedPlayer.Character:FindFirstChild("Humanoid") then
                Workspace.CurrentCamera.CameraSubject = spectatedPlayer.Character.Humanoid
            else
                Workspace.CurrentCamera.CameraSubject = nil
            end
        end

        updateCamera()

        characterConnection = RunService.Heartbeat:Connect(function()
            if not isSpectating then
                characterConnection:Disconnect()
                characterConnection = nil
                return
            end
            pcall(updateCamera)
        end)

        spectatedPlayer.CharacterAdded:Connect(function()
            if isSpectating then updateCamera() end
        end)
    else
        isSpectating = false
        spectatedPlayer = nil
    end
end

local function stopSpectating()
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    isSpectating = false
    spectatedPlayer = nil

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    else
        Workspace.CurrentCamera.CameraSubject = nil
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end

-- Funcion para teletransportarse al jugador seleccionado (con anclaje seguro)
local function teleportToPlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if not myHRP or not myHumanoid then
            print("Su personaje no ha cargado para teletransportarse.")
            return
        end

        -- Restablecer la fisica del personaje antes de la teletransportacion
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
                part.Anchored = true -- Anclar temporalmente para evitar el movimiento
            end
        end

        -- Teletransportarse a la posicion del jugador objetivo
        local success, errorMessage = pcall(function()
            myHRP.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)) -- Ligera elevacion para evitar colision con el suelo.
        end)
        if not success then
            warn("Error al transportar: " .. tostring(errorMessage))
            return
        end

        -- Asegurese de que el Humanoid salga del estado sentado o de vuelo.
        myHumanoid.Sit = false
        myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        -- Espere 0,5 segundos con el personaje anclado
        task.wait(0.5)

        -- Desacoplar todas las partes del personaje y restaurar la fisica.
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end

        print("Teletransportado al jugador: " .. playerName .. " con anclaje seguro.")
    else
        print("Jugador o personaje no encontrado para teletransportarse.")
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if isSpectating then
        stopSpectating()
        pcall(function() SpectateToggleTab10:Set(false) end)
    end
end)

local player_name_value

local DropdownPlayerTab2 = Tab9:AddDropdown({
    Name = "Seleccionar Jugador",
    Description = "Elige un jugador para matar, atraer, ver o lanzar",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player list",
    Callback = function(selectedPlayerName)
        player_name_value = selectedPlayerName
        if selectedPlayerName == "" or selectedPlayerName == nil then
            selectedPlayer = nil
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() end
                if flingConnection then flingConnection:Disconnect() end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
            if isSpectating then stopSpectating() end
        else
            selectedPlayer = Players:FindFirstChild(selectedPlayerName)
            if isSpectating then
                stopSpectating()
                spectatePlayer(selectedPlayerName)
            end
        end
    end
})

function UptadePlayers()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    DropdownPlayerTab2:Set(playerNames)
end

Tab9:AddButton({"Actualizar lista", function()
    UptadePlayers()
end})

UptadePlayers()

Tab9:AddButton({
    Title = "Teletransportarse al jugador",
    Desc = "Teletransportarse a la posicion del jugador seleccionado",
    Callback = function()
        local selectedPlayerName = player_name_value
        if selectedPlayerName and selectedPlayerName ~= "" then
            local success, errorMessage = pcall(teleportToPlayer, selectedPlayerName)
            if not success then
                warn("Error al teletransportarse: " .. tostring(errorMessage))
            end
        else
            print("Seleccione un jugador antes de teletransportarse.")
        end
    end
})

local SpectateToggleTab10 = Tab9:AddToggle({
    Name = "Visualizar jugador",
    Description = "Activar/desactivar la visualizacion del jugador seleccionado",
    Default = false,
    Callback = function(state)
        if state then
            if selectedPlayer then
                pcall(spectatePlayer, selectedPlayer.Name)
            else
                SpectateToggleTab10:Set(false)
            end
        else
            pcall(stopSpectating)
        end
    end
})

-- Remueve automaticamente los jugadores que salen
Players.PlayerRemoving:Connect(function(player)
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
    if selectedPlayer == player then
        selectedPlayer = nil
        if isSpectating then stopSpectating() end
        if running then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            if flingToggle then flingToggle:Set(false) end
        end
        SpectateToggleTab10:Set(false)
        DropdownPlayerTab2:Set("")
    end
end)

-- Actualizacion automatica de un nuevo jugador ingresado
Players.PlayerAdded:Connect(function()
    task.wait(1) -- Pequeño retraso para garantizar que el reproductor este listo
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
end)

-- Inicia el menu desplegable
updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
----------------------------------------------------------------------------------------------------
local Section = Tab9:AddSection({"Matar o Atraer jugador"})

local DropdownKillPullMethod = Tab9:AddDropdown({
    Name = "Selecciona una opcion",
    Description = "Elige una opcion para matar o atraer a un jugador",
    Options = {"Sofa", "Autobus"},
    Callback = function(value)
        selectedKillPullMethod = value
    end
})
----------------------------------------------------------------------------------------------------
-- Lanzar con Sofa --
local function equipSofa()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local sofa = backpack:FindFirstChild("Couch") or LocalPlayer.Character:FindFirstChild("Couch")
    if not sofa then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            sofa = backpack:FindFirstChild("Couch")
            task.wait()
        until sofa or task.wait(5)
        if not sofa then return false end
    end
    if sofa.Parent ~= LocalPlayer.Character then
        sofa.Parent = LocalPlayer.Character
    end
    return true
end

local function killWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingKill = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

local function pullWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingPull = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Autobus --
local function killWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local lastUpdate = tick()
    local updateInterval = 0.05
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
        local newTargetHRP = targetCharacter:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetCharacter:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then return end
        if not myHRP or not humanoid then running = false return end
        if tick() - lastUpdate < updateInterval then return end
        lastUpdate = tick()
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
        end
    end)
end

local followConnection
if followConnection then followConnection:Disconnect() end
followConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            local targetPosition = selectedPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
    end
end)

local sitCheckConnection
if sitCheckConnection then sitCheckConnection:Disconnect() end
sitCheckConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Humanoid") then
        pcall(function()
            if selectedPlayer.Character.Humanoid.Sit then
                if isFollowingKill then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
                        task.wait(0.5)
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "Couch")
                        task.wait(1)
                    end
                end
                isFollowingKill = false
                isFollowingPull = false
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and originalPosition then
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                    if myHRP then
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end
                    originalPosition = nil
                end
            end
        end)
    end
end)

Tab9:AddButton({
    Name = "Matar",
    Description = "Teletransporta el jugador seleccionado al vacio",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod then return end
        if selectedKillPullMethod == "Sofa" then
            killWithSofa(selectedPlayer)
        elseif selectedKillPullMethod == "Autobus" then
            killWithBus(selectedPlayer)
        end
    end
})

Tab9:AddButton({
    Name = "Atraer",
    Description = "Teletransporta el jugador seleccionado a tu posicion",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod or selectedKillPullMethod ~= "Sofa" then return end
        pullWithSofa(selectedPlayer)
    end
})

Tab9:AddButton({
    Name = "Parar todo (Matar o Atraer)",
    Callback = function()
        isFollowingKill = false
        isFollowingPull = false
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
        for _, seat in ipairs(Workspace:GetDescendants()) do
            if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
        end
        if originalPosition then
            local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end
            originalPosition = nil
        end

        disableCarClient()

        local args = { [1] = "DeleteAllVehicles" }
        pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
        end)
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab9:AddSection({"Lanzar Jugador"})

local DropdownFlingMethod = Tab9:AddDropdown({
    Name = "Selecciona una opcion",
    Description = "Elige una opcion para lanzar a un jugador",
    Options = {"Sofa", "Autobus", "Balon", "Balon V2", "Barco", "Camion"},
    Callback = function(value)
        selectedFlingMethod = value
    end
})
----------------------------------------------------------------------------------------------------
-- Lanzar con Sofa --
local function flingWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then
        return
    end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then
        return
    end
    savedPosition = myHRP.Position
    if not equipSofa() then return end
    task.wait(0.5)
    couch = character:FindFirstChild("Couch")
    if not couch then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if (obj.Name == "Couch" or obj.Name == "Couch" .. LocalPlayer.Name) and (obj:IsA("BasePart") or obj:IsA("Tool")) then
                couch = obj
                break
            end
        end
    end
    if not couch then
        return
    end
    if couch:IsA("BasePart") then
        originalProperties = {
            Anchored = couch.Anchored,
            CanCollide = couch.CanCollide,
            CanTouch = couch.CanTouch
        }
        couch.Anchored = false
        couch.CanCollide = true
        couch.CanTouch = true
        pcall(function() couch:SetNetworkOwner(nil) end)
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
    local startTime = tick()
    local walkFlingInstance = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then
            running = false
            return
        end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then
            running = false
            return
        end
        if not myHRP or not humanoid then
            running = false
            return
        end
        pcall(function()
            local targetPosition = newTargetHRP.Position
            character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        if newTargetHumanoid.Sit or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    pcall(function() part:SetNetworkOwner(nil) end)
                end
            end
            walkFlingInstance = Instance.new("BodyVelocity")
            walkFlingInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstance.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstance.Parent = myHRP
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16))
                myHRP.Anchored = false
            end)
            local spinStart = tick()
            local spinConnection
            spinConnection = RunService.Heartbeat:Connect(function()
                if tick() - spinStart >= 0.5 then
                    spinConnection:Disconnect()
                    return
                end
                pcall(function()
                    character:SetPrimaryPartCFrame(
                        myHRP.CFrame * CFrame.Angles(
                            math.rad(Workspace.DistributedGameTime * 12000),
                            math.rad(Workspace.DistributedGameTime * 15000),
                            math.rad(Workspace.DistributedGameTime * 18000)
                        )
                    )
                end)
            end)
            task.wait(0.5)
            local args = { [1] = "PlayerWantsToDeleteTool", [2] = "Couch" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
            end)
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end)
            if walkFlingInstance then
                walkFlingInstance:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            if flingToggle then
                flingToggle:SetValue(false)
            end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Autobus --
local function flingWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    local walkFlingInstancePlayer = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)

            walkFlingInstancePlayer = Instance.new("BodyVelocity")
            walkFlingInstancePlayer.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstancePlayer.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstancePlayer.Parent = myHRP
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if walkFlingInstancePlayer then
                walkFlingInstancePlayer:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Balon --
local function equipBall()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local ball = backpack:FindFirstChild("SoccerBall") or LocalPlayer.Character:FindFirstChild("SoccerBall")
    if not ball then
        local args = { [1] = "PickingTools", [2] = "SoccerBall" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            ball = backpack:FindFirstChild("SoccerBall")
            task.wait()
        until ball or task.wait(5)
        if not ball then return false end
    end
    if ball.Parent ~= LocalPlayer.Character then
        ball.Parent = LocalPlayer.Character
    end
    return true
end

local function flingWithBall(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid.Sit = false
    end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = true end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeDown", 4)
    end)
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp or not hum or not myHRP then return end
        local moveDir = hum.MoveDirection
        local isStill = moveDir.Magnitude < 0.1
        local isSitting = hum.Sit
        if isSitting then
            local y = math.sin(tick() * 50) * 2
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75 + y, 0))
        elseif isStill then
            local z = math.sin(tick() * 50) * 3
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75, z))
        else
            local offset = moveDir.Unit * math.clamp(hrp.Velocity.Magnitude * 0.15, 5, 12)
            soccerBall.CFrame = CFrame.new(hrp.Position + offset + Vector3.new(0, 0.75, 0))
        end
        myHRP.CFrame = CFrame.new(soccerBall.Position + Vector3.new(0, 1, 0))
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Balon V2 --
local function flingWithBallV2(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        local speed = hrp.Velocity.Magnitude
        local isMoving = hum.MoveDirection.Magnitude > 0.05
        local isJumping = hum:GetState() == Enum.HumanoidStateType.Jumping
        local offset
        if isMoving or isJumping then
            local extra = math.clamp(speed / 1.5, 6, 15)
            offset = hrp.CFrame.LookVector * extra + Vector3.new(0, 1, 0)
        else
            local wave = math.sin(tick() * 25) * 4
            local side = math.cos(tick() * 20) * 1.5
            offset = Vector3.new(side, 1, wave)
        end
        pcall(function()
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
        end)
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Barco --
local function flingWithBoat(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3359.52, -5.05, -501.94))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.4)
    args = { [1] = "PickingBoat", [2] = "MilitaryBoatFree" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1.5)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local boatName = LocalPlayer.Name .. "Car"
    local boat = vehiclesFolder:FindFirstChild(boatName)
    if not boat then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3358.85, 5.25, -521.95))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(boat:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            boat:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(boat:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                boat:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Camion --
local function flingWithTruck(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    -- Se teletransporta a la posicion inicial del autobus para invocar el camion.
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)
    -- Desactiva el cliente del vehiculo para evitar interferencias.
    disableCarClient()
    -- Eliminar cualquier vehiculo existente
    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    -- Invoca el camion (Semi) usando el comando dado
    args = { [1] = "PickingCar", [2] = "Semi" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    -- Encuentra el camion invocado
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local truckName = LocalPlayer.Name .. "Car"
    local truck = vehiclesFolder:FindFirstChild(truckName)
    if not truck then return end
    -- Se teletransporta al asiento del camion.
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1176.56, 79.90, -1166.65))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    -- Espera o jogador sentar no caminhão
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    -- Desactiva la colisión de piezas del camión y establece la propiedad de la red.
    for _, part in ipairs(truck:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    -- Inicia el proceso de lanzamiento
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)

    local startTime = tick()
    local lastFlingTime = 0
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        -- Encuentra la parte del Trailer para lanzar
        local trailer = truck:FindFirstChild("Body") and truck.Body:FindFirstChild("Trailer")
        if not trailer then return end
        -- Hace que el remolque se mueva hacia arriba y hacia abajo muy rápidamente.
        local verticalOffset = math.sin(tick() * 30) * 5 -- Oscila entre -5 y 5 unidades verticalmente, incluso más rápido.
        pcall(function()
            local targetPosition = newTargetHRP.Position + Vector3.new(0, verticalOffset, 0)
            trailer:PivotTo(CFrame.new(targetPosition)) -- Sólo movimiento vertical, sin rotación.
        end)
        -- Comprueba la distancia entre el remolque y el jugador objetivo para aplicar el lanzamiento.
        local dist = (trailer.Position - newTargetHRP.Position).Magnitude
        if dist < 5 and tick() - lastFlingTime > 0.4 then --Aplica el lanzamiento si el jugador está a menos de 5 unidades de distancia
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            -- Aplica un lanzamiento extremadamente fuerte.
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-10, 10), 50, math.random(-10, 10)).Unit * 10000000 + Vector3.new(0, 5000000, 0)
            fling.Parent = newTargetHRP
            task.delay(0.5, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
        -- Detiene el lanzamiento si el jugador objetivo está sentado, o después de 10 segundos.
        local playerSeated = false
        for _, seat in ipairs(truck:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end

        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            -- Teletransporta el camion a una posición fuera del mapa.
            pcall(function()
                truck:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)
            task.wait(0.5)
            -- Limpieza: elimina el camion y reinicia al jugador.
            disableCarClient()
            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)

            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end

            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end

            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)

            if flingToggle then flingToggle:Set(false) end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Stop All --
local function stopFling()
    running = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if flingConnection then
        flingConnection:Disconnect()
        flingConnection = nil
    end
    if soccerBall then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    if couch and couch:IsA("BasePart") then
        couch.Anchored = originalProperties.Anchored
        couch.CanCollide = originalProperties.CanCollide
        couch.CanTouch = originalProperties.CanTouch
    end

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.2)
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
    end
    local myHumanoid = character and character:FindFirstChild("Humanoid")
    if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
    end)
    if savedPosition then
        local myHRP = character and character:FindFirstChild("HumanoidRootPart")
        if myHRP then
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
        end
    end
end

flingToggle = Tab9:AddToggle({
    Name = "Lanzar jugador",
    Description = "Activa o desactiva el lanzamiento con el método seleccionado",
    Default = false,
    Callback = function(state)
        if state then
            if isFollowingKill or isFollowingPull or running then
                flingToggle:Set(false)
                return
            end
            if selectedFlingMethod == "Sofa" then
                flingWithSofa(selectedPlayer)
            elseif selectedFlingMethod == "Balon" then
                flingWithBall(selectedPlayer)
            elseif selectedFlingMethod == "Balon V2" then
                flingWithBallV2(selectedPlayer)
            elseif selectedFlingMethod == "Barco" then
                flingWithBoat(selectedPlayer)
            elseif selectedFlingMethod == "Camion" then
                flingWithTruck(selectedPlayer)
            elseif selectedFlingMethod == "Autobus" then
                flingWithBus(selectedPlayer)
            end
        else
            stopFling()
        end
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab9:AddSection({"Quite TODO y el RGB antes de usar"})

-- Variables globales al inicio de Tab2
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

orbitando = false
orbitConn = nil
allFling = false
allConn = nil
currentPlayerList = nil
currentPlayerIndex = nil
lastSwitchTime = nil
allFling2 = false
allConn2 = nil
soccerBall = nil
originalProperties = nil
excludedPlayers = {} -- Tabla para jugadores excluidos de los flings

-- Funcion auxiliar para obtener la foto de perfil del jugador
local function getPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, result = pcall(function()
        return Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    end)
    if success then
        return result
    else
        warn("Error al obtener la miniatura: " .. tostring(result))
        return nil
    end
end

-- Funcion para buscar jugadores por parte del nombre
local function findPlayerByPartialName(partialName)
    partialName = partialName:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(partialName) then
            return plr
        end
    end
    return nil
end

-- Funcion para mostrar las notificaciones
local function showNotification(title, description, icon)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = description,
            Icon = icon or "",
            Duration = 5
        })
    end)
end

-- Cuadro de texto para eliminar un jugador
Tab9:AddTextBox({
    Name = "Añadir jugador a la lista blanca",
    Description = "Ingrese parte del nombre del jugador",
    PlaceholderText = "ej: Rou → Roun95",
    Callback = function(Value)
        if Value == "" then
            showNotification("Ninguna accion", "Introduzca un nombre para agregar un jugador.", nil)
            return
        end

        local player = findPlayerByPartialName(Value)
        if player then
            -- Comprueba si el jugador ya esta excluido
            for _, excluded in ipairs(excludedPlayers) do
                if excluded == player then
                    showNotification("El jugador ya está en la lista de espera", "Jugador " .. player.Name .. " ya se ha añadido.", getPlayerThumbnail(player.UserId))
                    return
                end
            end
            table.insert(excludedPlayers, player)
            local thumbnail = getPlayerThumbnail(player.UserId)
            showNotification("Jugador añadido", "Jugador " .. player.Name .. " fue removido.", thumbnail)
        else
            showNotification("Jugador no encontrado", "No se encontraron jugadores con '" .. Value .. "'.", nil)
        end
    end
})

Tab9:AddButton({"Verificar lista blanca", function()
    if #excludedPlayers == 0 then
        showNotification("Aviso", "Ningun jugador fue removido.", nil)
        return
    end
    for i, player in ipairs(excludedPlayers) do
        local thumbnail = getPlayerThumbnail(player.UserId)
        showNotification("Jugador añadido " .. i, "Jugador " .. player.Name .. " fue removido.", thumbnail)
        task.wait(0.5) -- Breve retraso entre notificaciones para evitar superposiciones
    end
end})

Tab9:AddButton({"Remover lista blanca", function()
    if #excludedPlayers == 0 then
        showNotification("Aviso", "Ningun jugador de la lista blanca fue removido.", nil)
        return
    end
    excludedPlayers = {}
    showNotification("Aviso", "Todos los jugadores de la lista blanca fueron removidos.", nil)
end})

Tab9:AddButton({"Orbiting Fling Ball", function()
    if orbitando then return end
    if not equipBall() then return end
    task.wait(0.5)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    orbitando = true
    orbitConn = RunService.Heartbeat:Connect(function()
        if not orbitando or not soccerBall or not soccerBall.Parent or not myHRP or not myHRP.Parent or not character or not character.Parent then
            if orbitConn then
                orbitConn:Disconnect()
                orbitConn = nil
            end
            orbitando = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local t = tick() * 10
        local radius = 5
        local offset = Vector3.new(math.cos(t) * radius, -1, math.sin(t) * radius)
        soccerBall.CFrame = CFrame.new(myHRP.Position + offset)
        soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
    end)
end})

Tab9:AddButton({"Fling All V1", function()
    if allFling then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling = true

    local function getShuffledPlayers()
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        return playerList
    end

    allConn = RunService.Heartbeat:Connect(function()
        if not allFling or not soccerBall or not soccerBall.Parent then
            if allConn then
                allConn:Disconnect()
                allConn = nil
            end
            allFling = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            currentPlayerList = nil
            currentPlayerIndex = nil
            lastSwitchTime = nil
            return
        end

        if not currentPlayerList or #currentPlayerList == 0 then
            currentPlayerList = getShuffledPlayers()
            currentPlayerIndex = 1
            lastSwitchTime = tick()
        end

        if #currentPlayerList == 0 then
            return
        end

        if tick() - lastSwitchTime >= 4 then
            currentPlayerIndex = currentPlayerIndex + 1
            if currentPlayerIndex > #currentPlayerList then
                currentPlayerList = getShuffledPlayers()
                currentPlayerIndex = 1
            end
            lastSwitchTime = tick()
        end

        local target = currentPlayerList[currentPlayerIndex]
        if not target or not target.Character then
            return
        end

        local targetChar = target.Character
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
            local hrp = targetChar.HumanoidRootPart
            local humanoid = targetChar.Humanoid
            local velocity = hrp.Velocity
            local speed = velocity.Magnitude
            local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
            local isMoving = humanoid.MoveDirection.Magnitude > 0.05
            local offset
            if isMoving or isJumping then
                local moveDir = hrp.CFrame.LookVector
                local extraDist = math.clamp(speed / 1.5, 6, 18)
                offset = moveDir * extraDist + Vector3.new(0, 1, 0)
            else
                local waveZ = math.sin(tick() * 25) * 4
                local sideX = math.cos(tick() * 20) * 1.5
                offset = Vector3.new(sideX, 1, waveZ)
            end
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
            if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                local fling = Instance.new("BodyVelocity")
                fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
                fling.Parent = hrp
                task.delay(0.3, function()
                    fling:Destroy()
                end)
            end
        end
    end)
end})

Tab9:AddButton({"Fling All V2", function()
    if allFling2 then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling2 = true
    allConn2 = RunService.Heartbeat:Connect(function()
        if not allFling2 or not soccerBall or not soccerBall.Parent then
            if allConn2 then
                allConn2:Disconnect()
                allConn2 = nil
            end
            allFling2 = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        for _, target in ipairs(playerList) do
            if not allFling2 then break end
            local targetChar = target.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
                local hrp = targetChar.HumanoidRootPart
                local humanoid = targetChar.Humanoid
                local velocity = hrp.Velocity
                local speed = velocity.Magnitude
                local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
                local isMoving = humanoid.MoveDirection.Magnitude > 0.05
                local offset
                if isMoving or isJumping then
                    local moveDir = hrp.CFrame.LookVector
                    local extraDist = math.clamp(speed / 1.5, 6, 18)
                    offset = moveDir * extraDist + Vector3.new(0, 1, 0)
                else
                    local waveZ = math.sin(tick() * 25) * 4
                    local sideX = math.cos(tick() * 20) * 1.5
                    offset = Vector3.new(sideX, 1, waveZ)
                end
                soccerBall.CFrame = CFrame.new(hrp.Position + offset)
                soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
                if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                    local fling = Instance.new("BodyVelocity")
                    fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
                    fling.Parent = hrp
                    task.delay(0.3, function()
                        fling:Destroy()
                    end)
                end
            end
            task.wait(0.1)
        end
    end)
end})
-- Parar todo
Tab9:AddButton({"Parar todo", function()
    -- Parar Orbitando
    orbitando = false
    if orbitConn then
        orbitConn:Disconnect()
        orbitConn = nil
    end
    -- Parar Fling ALL V1
    allFling = false
    if allConn then
        allConn:Disconnect()
        allConn = nil
    end
    currentPlayerList = nil
    currentPlayerIndex = nil
    lastSwitchTime = nil
    -- Parar Fling ALL V2
    allFling2 = false
    if allConn2 then
        allConn2:Disconnect()
        allConn2 = nil
    end
    -- Restaurar las propiedades del balon
    if soccerBall and originalProperties then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    soccerBall = nil
    originalProperties = nil
    showNotification("Aviso", "Se han desactivado todas las funciones.", nil)
end})
----------------------------------------------------------------------------------------------------
                                -- === Tab 10: lag server === --
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
                                -- === Tab 11: Scripts === --
----------------------------------------------------------------------------------------------------
Tab11:AddButton({
    Name = "Super Ring Parts",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/SuperRing.lua"))()
    end
})

Tab11:AddButton({
    Name = "Bring Parts",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/BringParts.lua"))()
    end
})

Tab11:AddButton({
    Name = "Highlight Players",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/HighlightPlayers.lua"))()
    end
})

Tab11:AddButton({
    Name = "Click Teleport Tool",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/TPTool.lua"))()
    end
})

Tab11:AddButton({
    Name = "Shift Lock Mobile",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/Shiftlock.lua"))()
    end
})

Tab11:AddButton({
    Name = "Virtual Keyboard",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/VirtualKeyboard.lua"))()
    end
})

Tab11:AddButton({
    Name = "FE Particles Giver",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/ParticleGiver.lua"))()
    end
})

Tab11:AddButton({
    Name = "TP To Player",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/TptoPlayer.lua"))()
    end
})

Tab11:AddButton({
    Name = "ServerHop (Low Players)",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/Serverhop.lua"))()
        end)

        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Exito" or "Error",
            Text = success and "Has sido teletransportado!" or "Fallo el teletransporte.",
            Duration = 5
        })
    end
})

Tab11:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/RejoinServer.lua"))()
        end)

        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Exito" or "Error",
            Text = success and "Has sido Reingresado!" or "Fallo el Reingreso.",
            Duration = 5
        })
    end
})
----------------------------------------------------------------------------------------------------
local Section = Tab11:AddSection({"Paneles"})

Tab11:AddButton({
    Name = "AFEM Emotes Menu",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/AFEM.lua"))()
    end
})

Tab11:AddButton({
    Name = "Animation Changer Gui",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/AnimationChangerGui.lua"))()
    end
})

Tab11:AddButton({
    Name = "Admin Panel by @Roun95",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/AdminPanel.lua"))()
    end
})

Tab11:AddButton({
    Name = "PShade-Ultimate",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/pshade-ultimate/refs/heads/main/src/cd.lua"))()
    end
})

Tab11:AddButton({
    Name = "System Broken HUB",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/SystemBroken.lua"))()
    end
})

----------------------------------------------------------------------------------------------------
                                -- === Tab 12: Teleportes === --
----------------------------------------------------------------------------------------------------
local teleportPlayer = game.Players.LocalPlayer
local teleportLocation = "Inicio" -- Valor Predeterminado

local locations = {
    ["Colina"] = Vector3.new(-348.64, 65.94, -458.08),
    ["Inicio"] = Vector3.new(-26.17, 3.48, -0.93),
    ["Hotel"] = Vector3.new(159.10, 3.32, 164.97),
    ["Playa 1"] = Vector3.new(55.69, 2.94, -1403.60),
    ["Playa 2"] = Vector3.new(42.39, 2.94, 1336.14),
    ["Granja"] = Vector3.new(-766.41, 2.92, -61.10),
    ["CentroComercial"] = Vector3.new(151.05, 3.52, -190.64)
}

Tab12:AddDropdown({
    Name = "Lugares de Brookhaven",
    Description = "Seleccione un lugar para teletransportarse",
    Default = teleportLocation,
    Multi = false,
    Options = {
        "Colina",
        "Inicio",
        "Hotel",
        "Playa 1",
        "Playa 2",
        "Granja",
        "CentroComercial"
    },
    Callback = function(value)
        teleportLocation = value
    end
})

Tab12:AddButton({
    Name = "Teletransportarse",
    Description = "Teletransportarse al lugar seleccionado",
    Callback = function()
        if teleportPlayer.Character and teleportPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = teleportPlayer.Character.HumanoidRootPart
            local humanoid = teleportPlayer.Character:FindFirstChildOfClass("Humanoid")
            local pos = locations[teleportLocation]
            if pos then
                pcall(function()
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        humanoid.WalkSpeed = 0
                    end
                    humanoidRootPart.Anchored = true
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    task.wait(0.4)
                    humanoidRootPart.Anchored = false
                    if humanoid then
                        humanoid.WalkSpeed = 16
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            end
        end
    end
})

local Section = Tab13:AddSection({"Optimizacion"})

Tab13:AddButton({
    Name = "FPS Counter",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/FPS-Counter.lua"))()
    end
})

Tab13:AddButton({
    Name = "FPS Booster",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/FPS-Booster.lua"))()
    end
})

Tab13:AddButton({
    Name = "FPS Booster V2",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/FPS-BoosterV2.lua"))()
    end
})

Tab13:AddButton({
    Name = "FPS Booster (Max)",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/FPS-Booster_Max.lua"))()
    end
})

local Section = Tab13:AddSection({"Mejoras graficas"})

Tab13:AddButton({
    Name = "Improved Graphics",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/BetterGraphics.lua"))()
    end
})

Tab13:AddButton({
    Name = "Improved Graphics V2",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/BetterGraphicsV2.lua"))()
    end
})

Tab13:AddButton({"Shaders", function()

local workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local model = workspace:FindFirstChild("Model")

-- Sonido de inicio
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://2865227271"
sound.Volume = 1
sound.Parent = SoundService
sound:Play()

-- Aplicar texturas al mapa
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

local soundPart = Instance.new("Part")
soundPart.Size = Vector3.new(1,1,1)
soundPart.Transparency = 1
soundPart.Anchored = true
soundPart.CanCollide = false
soundPart.Parent = workspace
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local birdSound = Instance.new("Sound")
birdSound.Name = "BirdsSound"
birdSound.SoundId = "rbxassetid://1237969272"
birdSound.Looped = true
birdSound.Volume = 0.05
birdSound.Parent = soundPart

local wolfSound = Instance.new("Sound")
wolfSound.SoundId = "rbxassetid://6654360741"
wolfSound.Volume = 0.05
wolfSound.Looped = false
wolfSound.Parent = workspace

RunService.Heartbeat:Connect(function()
	if hrp and hrp.Parent then
		soundPart.Position = hrp.Position + Vector3.new(0,10,0)
	end
end)

local function isNight()
	local t = Lighting.ClockTime
	return (t >= 18 or t <= 6)
end

task.spawn(function()
	while true do
		if isNight() then
			if birdSound.IsPlaying then birdSound:Stop() end
			if wolfSound.IsPlaying then wolfSound:Stop() end
			wolfSound:Play()
		else
			if wolfSound.IsPlaying then wolfSound:Stop() end
			if not birdSound.IsPlaying then birdSound:Play() end
		end
		wait(20)
	end
end)

local fountainPart = Instance.new("Part")
fountainPart.Anchored = true
fountainPart.CanCollide = false
fountainPart.Transparency = 1
fountainPart.Size = Vector3.new(1,1,1)
fountainPart.Position = Vector3.new(-27,19,15)
fountainPart.Parent = workspace

local attachment = Instance.new("Attachment")
attachment.Position = Vector3.new(-27,19,15)
attachment.Parent = fountainPart

local fountainSound = Instance.new("Sound")
fountainSound.Name = "FountainSound"
fountainSound.SoundId = "rbxassetid://4766793559"
fountainSound.Looped = true
fountainSound.Volume = 0.03
fountainSound.EmitterSize = 10
fountainSound.RollOffMode = Enum.RollOffMode.Linear
fountainSound.MaxDistance = 100
fountainSound.Parent = attachment
fountainSound:Play()

local customSound = Instance.new("Sound")
customSound.Name = "MyCustomSound"
customSound.SoundId = "rbxassetid://9048659736"
customSound.Volume = 0.01
customSound.Looped = true
customSound.PlayOnRemove = false
customSound.Parent = workspace
customSound:Play()

local active = false
local stars = {}
local shootingStarsFolder = Instance.new("Folder",workspace)
shootingStarsFolder.Name = "ShootingStars"
local STAR_COUNT = 300
local SHOOTING_STAR_CHANCE = 0.3
local SHOOTING_STAR_MAX = 12
local shootingStarCooldown = 0.1

local spaceSound = Instance.new("Sound",workspace)
spaceSound.SoundId = "rbxassetid://1843520836"
spaceSound.Volume = 0.3
spaceSound.Looped = true
spaceSound.Name = "SpaceAmbience"

local function createStar()
	local star = Instance.new("Part")
	local size = math.random(1,3)*0.5
	star.Size = Vector3.new(size,size,size)
	star.Position = Vector3.new(math.random(-1000,1000),math.random(300,700),math.random(-1000,1000))
	star.Anchored = true
	star.CanCollide = false
	star.Material = Enum.Material.Neon
	local colors = {Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180),Color3.fromRGB(180,200,255)}
	star.Color = colors[math.random(1,#colors)]
	star.Name = "Star"
	star.Parent = workspace
	local light = Instance.new("PointLight",star)
	light.Brightness = 2 + math.random()*1.5
	light.Range = 12
	spawn(function()
		while star.Parent and active do
			star.Transparency = 0.2 + math.sin(tick()*math.random(2,5))*0.2
			RunService.Heartbeat:Wait()
		end
		if star.Parent then star:Destroy() end
	end)
	table.insert(stars,star)
end

local function createShootingStar()
	if not active then return end
	local startPos = Vector3.new(math.random(-1000,1000),math.random(350,600),math.random(-1000,1000))
	local dir = Vector3.new(math.random(-1,1),math.random(-0.1,0.1),math.random(-1,1)).Unit
	local speed = math.random(350,550)
	local isFire = math.random() <= SHOOTING_STAR_CHANCE
	local color = isFire and Color3.fromRGB(255,50,50) or Color3.fromRGB(255,255,220)
	local trailColor = isFire and ColorSequence.new(Color3.fromRGB(255,120,0),Color3.fromRGB(255,230,50)) or ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180))
	local star = Instance.new("Part")
	star.Size = Vector3.new(0.5,0.5,3)
	star.Position = startPos
	star.Anchored = true
	star.CanCollide = false
	star.Material = Enum.Material.Neon
	star.Color = color
	star.Name = "ShootingStar"
	star.Parent = shootingStarsFolder
	local att0 = Instance.new("Attachment",star)
	local att1 = Instance.new("Attachment",star)
	att1.Position = Vector3.new(0,0,-3)
	local trail = Instance.new("Trail",star)
	trail.Attachment0 = att0
	trail.Attachment1 = att1
	trail.Lifetime = 0.35
	trail.Color = trailColor
	trail.LightEmission = 1
	trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})
	local light = Instance.new("PointLight",star)
	light.Brightness = isFire and 12 or 7
	light.Range = 35
	light.Color = color
	if isFire then
		local fire = Instance.new("Fire",star)
		fire.Heat = 15
		fire.Size = 3.5
		fire.Color = Color3.fromRGB(255,110,0)
		fire.SecondaryColor = Color3.fromRGB(255,210,0)
	end
	local lifetime = math.random(1,1.5)
	local timePassed = 0
	local moveConn
	moveConn = RunService.Heartbeat:Connect(function(dt)
		if not active then moveConn:Disconnect() if star.Parent then star:Destroy() end return end
		timePassed += dt
		if timePassed >= lifetime then moveConn:Disconnect() if star.Parent then star:Destroy() end return end
		local curve = math.sin(timePassed*20)*0.5
		star.Position += (dir+Vector3.new(0,curve,0)).Unit*speed*dt
	end)
	Debris:AddItem(star,4)
end

local function updateSky()
	local hour = Lighting.ClockTime
	local shouldBeActive = hour >= 18 or hour < 6
	if shouldBeActive and not active then
		active = true
		Lighting.FogColor = Color3.fromRGB(10,10,30)
		Lighting.FogEnd = 5000
		Lighting.Brightness = 2
		for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
		stars = {}
		for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
		for i=1,STAR_COUNT do createStar() end
		spaceSound:Play()
	elseif not shouldBeActive and active then
		active = false
		for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
		stars = {}
		for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
		spaceSound:Stop()
		Lighting.FogColor = Color3.fromRGB(192,192,192)
		Lighting.FogEnd = 100000
		Lighting.Brightness = 2
	end
end

task.spawn(function()
	while true do
		if active then
			for i=1,SHOOTING_STAR_MAX do
				createShootingStar()
				task.wait(shootingStarCooldown)
			end
		else
			task.wait(1)
		end
	end
end)

task.spawn(function()
	while true do
		updateSky()
		task.wait(1)
	end
end)

local rainFolder = Instance.new("Folder",workspace)
rainFolder.Name = "FakeRain"
local isRaining = false

local birds = Instance.new("Sound",SoundService)
birds.SoundId = "rbxassetid://9111139882"
birds.Volume = 0.2
birds.Looped = true
birds:Play()

local rainSound = Instance.new("Sound",SoundService)
rainSound.SoundId = "rbxassetid://9118823106"
rainSound.Volume = 0.3
rainSound.Looped = true
rainSound:Play()

local thunder = Instance.new("Sound",SoundService)
thunder.SoundId = "rbxassetid://9120018695"
thunder.Volume = 0.4

local function updateBirdSound()
	birds.Volume = isRaining and 0 or 0.2
end

local function spawnRain()
	isRaining = true
	updateBirdSound()
	for i=1,120 do
		local drop = Instance.new("Part")
		drop.Size = Vector3.new(0.1,2,0.1)
		drop.Anchored = true
		drop.CanCollide = false
		drop.Material = Enum.Material.Glass
		drop.Transparency = 0.5
		drop.Color = Color3.fromRGB(160,160,255)
		drop.Position = Vector3.new(math.random(-150,150),100,math.random(-150,150))
		drop.Parent = rainFolder
		local tween = TweenService:Create(drop,TweenInfo.new(1),{Position=drop.Position-Vector3.new(0,60,0)})
		tween:Play()
		Debris:AddItem(drop,1.5)
	end
	wait(1.5)
	isRaining = false
	updateBirdSound()
end

local function lightningStrike()
	local flash = Instance.new("Part")
	flash.Size = Vector3.new(1,1000,1)
	flash.Anchored = true
	flash.CanCollide = false
	flash.Transparency = 0.4
	flash.Material = Enum.Material.Neon
	flash.Color = Color3.new(1,1,1)
	flash.Position = Vector3.new(math.random(-100,100),500,math.random(-100,100))
	flash.Parent = workspace
	Lighting.Brightness = Lighting.Brightness + 1.5
	thunder:Play()
	wait(0.1)
	Lighting.Brightness = Lighting.Brightness - 1.5
	flash:Destroy()
end

for _,part in pairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") and part.Material == Enum.Material.SmoothPlastic then
		part.Reflectance = 0.25
	end
end

task.spawn(function()
	while true do
		spawnRain()
		if math.random() < 0.2 then lightningStrike() end
		wait(1)
	end
end)

-- Iluminacion y ambiente
Lighting.Brightness = 2
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
Lighting.FogColor = Color3.fromRGB(120, 130, 140)
Lighting.FogStart = 80
Lighting.FogEnd = 600
Lighting.EnvironmentSpecularScale = 1
Lighting.EnvironmentDiffuseScale = 0.5

local sky = Instance.new("Sky")
sky.MoonTextureId = "http://www.roblox.com/asset/?id=9027816797"
sky.SunTextureId = "http://www.roblox.com/asset/?id=5560116180"
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
end
})
