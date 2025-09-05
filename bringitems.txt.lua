local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Libs/RedzhubUiLib.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Nova Hub 🎆",
    SubTitle = "by Roun95",
})

local Tabs = Window:MakeTab({"Items Manager", "info"})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local character
local humanoidRootPart
local inventory = player:WaitForChild("Inventory")

local function onCharacterAdded(char)
    character = char
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    onCharacterAdded(player.Character)
end

local sack = nil
local function findSack()
    for _, item in pairs(inventory:GetChildren()) do
        if string.find(item.Name, "Sack") then
            return item
        end
    end
    return nil
end

sack = findSack()

inventory.ChildAdded:Connect(function(child)
    if string.find(child.Name, "Sack") then
        sack = child
    end
end)

inventory.ChildRemoved:Connect(function(child)
    if sack and child == sack then
        sack = findSack()
    end
end)

local itemsFolder = workspace:FindFirstChild("Items")
local characters = workspace:FindFirstChild("Characters")
local lastPos = nil
local items = {}
local kids = {}
local name = nil

local function isSackFull()
    if not sack then return true end
    local current = sack:GetAttribute("NumberItems")
    local capacity = sack:GetAttribute("Capacity")
    return current ~= nil and capacity ~= nil and current >= capacity
end

local function store(item)
    if not sack then return end
    local part = item:FindFirstChildWhichIsA("BasePart")
    if part then
        humanoidRootPart.CFrame = part.CFrame
        task.wait(0.2)
        ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("RequestBagStoreItem"):InvokeServer(sack, item)
        task.wait(0.2)
    end
end

local Items = Tabs:AddDropdown({
    Name = "ItemsList",
    Options = items,
    Callback = function(Value)
    end
})

Items:OnChanged(function(Value)
    name = Value
end)

local Kids = Tabs:AddDropdown({
    Name = "KidsList",
    Options = kids,
    Callback = function(Value)
    end
})

Kids:OnChanged(function(Value)
    name = Value
end)

local debounce = false
local function updateItemsDropdown()
    if debounce then return end
    debounce = true

    task.delay(0.1, function()
        if not Items then return end

        local uniqueItems = {}
        local addedNames = {}

        for _, itm in pairs(itemsFolder:GetChildren()) do
            if typeof(itm.Name) == "string" and not addedNames[itm.Name] then
                table.insert(uniqueItems, itm.Name)
                addedNames[itm.Name] = true
            end
        end

        items = uniqueItems
        if typeof(Items.SetValues) == "function" then
            pcall(function()
                Items:SetValues(items)
            end)
        end

        debounce = false
    end)
end

local debounce2 = false
local function updateKidsDropdown()
    if debounce2 then return end
    debounce2 = true

    task.delay(0.1, function ()
        if not Kids then return end

        local uniqueKids = {}

        for _, kid in pairs(characters:GetChildren()) do
            if string.find(kid.Name, "Child") then
                table.insert(uniqueKids, kid.Name)
            end
        end

        kids = uniqueKids
        if typeof(Kids.SetValue) == "function" then
            pcall(function ()
                Kids:SetValues(kids)
            end)
        end

        debounce2 = false
    end)
end

updateItemsDropdown()
updateKidsDropdown()

Tabs:AddButton({
    Name = "Bring Item",
    Callback = function()
        lastPos = humanoidRootPart.CFrame
        pcall(function ()
            local all = {}
            for _, obj in pairs(itemsFolder:GetChildren()) do table.insert(all, obj) end
            for _, obj in pairs(characters:GetChildren()) do table.insert(all, obj) end

            for _, item in pairs(all) do
                if isSackFull() then break end
                if item.Name == name then
                    store(item)
                end
            end
        end)
        humanoidRootPart.CFrame = lastPos
    end
})

Tabs:AddButton({
    Name = "Teleport to Item",
    Callback = function()
        local item = itemsFolder:FindFirstChild(name) or characters:FindFirstChild(name)
        if item then
            local part = item:FindFirstChildWhichIsA("BasePart")
            if part then
                humanoidRootPart.CFrame = part.CFrame
            end
        end
    end
})

local campfire = workspace:FindFirstChild("Map"):FindFirstChild("Campground"):FindFirstChild("MainFire")
Tabs:AddButton({
    Title = "Teleport to Campfire",
    Callback = function()
        if campfire then
            local center = campfire:FindFirstChild("Center")
            if center then
                humanoidRootPart.CFrame = center.CFrame * CFrame.new(0, 13, 0)
            end
        end
    end
})

itemsFolder.ChildAdded:Connect(updateItemsDropdown)
itemsFolder.ChildRemoved:Connect(updateItemsDropdown)
characters.ChildAdded:Connect(updateKidsDropdown)
characters.ChildRemoved:Connect(updateKidsDropdown)