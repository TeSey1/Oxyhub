getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/OxyHub-Team/ui-library/refs/heads/main/RayField.lua'))()
getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/kocmoc/main/api.lua"))()

-------------------------------------

_G.rolls = true
_G.autoupgrades = true
_G.Pets = true
_G.World = true
_G.Breakables = true
_G.Orbs = true
_G.Fruits = true

-------------------------------------

function rolls()
    while _G.rolls == true do
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Eggs_Roll"):InvokeServer()
        wait(1)  -- Пауза в 1 секунду между вызовами (можно изменить)
    end
end


function autoupgrades()
    while _G.autoupgrades == true do
	wait(0.5)
        -- Функция для "прокачки" объекта
        local function upgradeObject(objectName)
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Upgrades_Purchase"):InvokeServer(objectName)
            -- Здесь можно добавить логику для прокачки объекта
        end

        -- Рекурсивная функция для обхода всех объектов, включая вложенные
        local function processFolder(folder)
            -- Перебираем все объекты в папке
            for _, obj in ipairs(folder:GetChildren()) do
                -- Вызываем функцию для текущего объекта
                upgradeObject(obj.Name)

                -- Если объект сам является контейнером для других объектов (например, это модель или папка),
                -- вызываем эту же функцию рекурсивно для обработки вложенных объектов
                if #obj:GetChildren() > 0 then
                    processFolder(obj)  -- Рекурсивный вызов
                end
            end
        end

        -- Пример использования: передаем папку для обработки
        local rootFolder = game:GetService("ReplicatedStorage").__DIRECTORY.Upgrades.Root  -- Замените на вашу папку
        processFolder(rootFolder)
    end
end


function hideDetails()
    local detailsFolder = game.Workspace:FindFirstChild("MAP"):FindFirstChild("PARTS"):FindFirstChild("DETAILS")  -- Папка с деталями карты
    local storage = game.ReplicatedStorage:FindFirstChild("Details")  -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Details"
        storage.Parent = game.ReplicatedStorage
    end
    for _, obj in ipairs(detailsFolder:GetChildren()) do
        obj.Parent = storage  -- Перемещаем объект в ReplicatedStorage
    end
end

function showDetails()
    local detailsFolder = game.Workspace:FindFirstChild("MAP"):FindFirstChild("PARTS"):FindFirstChild("DETAILS")  -- Папка с деталями карты
    local storage = game.ReplicatedStorage:FindFirstChild("Details")  -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Details"
        storage.Parent = game.ReplicatedStorage
    end
    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = detailsFolder  -- Перемещаем объекты обратно в Workspace
    end
end


function hidePets()
    while _G.Pets == true do
        local petsFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Pets") -- Папка с питомцами
        local storage = game.ReplicatedStorage:FindFirstChild("Pets") -- Папка для хранения скрытых объектов
        if not storage then
            storage = Instance.new("Folder")
            storage.Name = "Pets"
            storage.Parent = game.ReplicatedStorage
        end

        for _, obj in ipairs(petsFolder:GetChildren()) do
            if obj.Name ~= "Highlight" then
                obj.Parent = storage -- Перемещаем объект в ReplicatedStorage
            end
        end
        wait(1)
    end
end
    
function showPets()
    local petsFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Pets") -- Папка с питомцами
    local storage = game.ReplicatedStorage:FindFirstChild("Pets") -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Pets"
        storage.Parent = game.ReplicatedStorage
    end
    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = petsFolder -- Перемещаем объекты обратно в Pets
    end
end


function hideWorld()
    local waterFolder = game.Workspace:WaitForChild("OUTER") -- Папка с водой
    local storage = game.ReplicatedStorage:FindFirstChild("World") -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "World"
        storage.Parent = game.ReplicatedStorage
    end

    for _, obj in ipairs(waterFolder:GetChildren()) do
        obj.Parent = storage -- Перемещаем объект в ReplicatedStorage
    end
end

function showWorld()
    local waterFolder = game.Workspace:WaitForChild("OUTER") -- Папка с водой 
    local storage = game.ReplicatedStorage:FindFirstChild("World") -- Папка для хранения скрытых объектов 
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "World"
        storage.Parent = game.ReplicatedStorage
    end
    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = waterFolder -- Перемещаем объекты обратно в Water 
    end 
end


function hideBreakables()
    while _G.Breakables == true do
        local breakablesFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Breakables") -- Папка с ломаемыми объектами
        local storage = game.ReplicatedStorage:FindFirstChild("Breakables") -- Папка для хранения скрытых объектов
        if not storage then
            storage = Instance.new("Folder")
            storage.Name = "Breakables"
            storage.Parent = game.ReplicatedStorage
        end

        for _, obj in ipairs(breakablesFolder:GetChildren()) do
            if obj.Name ~= "Highlight" then
                obj.Parent = storage -- Перемещаем объект в ReplicatedStorage 
            end
        end
        wait(1)
    end
end

function showBreakables()
    local breakablesFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Breakables") -- Папка с ломаемыми объектами
    local storage = game.ReplicatedStorage:FindFirstChild("Breakables") -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Breakables"
        storage.Parent = game.ReplicatedStorage 
    end

    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = breakablesFolder -- Перемещаем объекты обратно в Breakables
    end
end



function hideOrbs()
    while _G.Orbs == true do
        local breakablesFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Orbs") -- Папка с ломаемыми объектами
        local storage = game.ReplicatedStorage:FindFirstChild("Orbs") -- Папка для хранения скрытых объектов
        if not storage then
            storage = Instance.new("Folder")
            storage.Name = "Orbs"
            storage.Parent = game.ReplicatedStorage 
        end

        for _, obj in ipairs(breakablesFolder:GetChildren()) do
            if obj.Name ~= "Highlight" then 
                obj.Parent = storage -- Перемещаем объект в ReplicatedStorage 
            end
        end
        wait(1)
    end
end

function showOrbs()
    local breakablesFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Orbs") -- Папка с ломаемыми объектами
    local storage = game.ReplicatedStorage:FindFirstChild("Orbs") -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Orbs"
        storage.Parent = game.ReplicatedStorage 
    end

    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = breakablesFolder -- Перемещаем объекты обратно в Breakables
    end
end

function teleportToFruits()
    local player = game.Players.LocalPlayer -- Получаем игрока (если скрипт локальный)
    local character = player.Character or player.CharacterAdded:Wait() -- Получаем персонажа игрока
    while _G.Fruits == true do
        local replicatedBreakablesFolder = game:GetService("ReplicatedStorage"):WaitForChild("Breakables") -- Папка с ломаемыми объектами в ReplicatedStorage
        local breakablesFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Breakables") -- Папка с ломаемыми объектами в Workspace

        if _G.Breakables == true then
            -- Проходим по всем объектам в ReplicatedStorage.Breakables
            for _, obj in ipairs(replicatedBreakablesFolder:GetChildren()) do
                if obj:FindFirstChild("base") then -- Проверяем, есть ли дочерний объект с именем "base"
                    -- Переносим объект в Workspace
                    obj.Parent = breakablesFolder -- Переносим в нужную папку

                    -- Теперь проверяем, есть ли у клонированного объекта "base"
                    local basePart = obj:FindFirstChild("base") -- Получаем объект "base"
                    character:SetPrimaryPartCFrame(basePart.CFrame) -- Телепортируем персонажа к объекту "base"
                end
            end
        elseif _G.Breakables == false then
            for _, obj in ipairs(breakablesFolder:GetChildren()) do
                if obj:FindFirstChild("base") then -- Проверяем, есть ли дочерний объект с именем "base"
                    local basePart = obj.base -- Получаем объект "base"
                    character:SetPrimaryPartCFrame(basePart.CFrame) -- Телепортируем персонажа к объекту "base"        
                end
            end
        end
        wait(2)
    end
end

-------------------------------------


local Window = Rayfield:CreateWindow({
    Name = "PETS GO ┃ OxyHub b0.1",
    LoadingTitle = "OxyHub is loading",
    LoadingSubtitle = "by sexy boys",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = OxyHub,
       FileName = "PETSGO"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hello"}
    }
 })
-------------------------------------

 local Tab = Window:CreateTab("Home", 138276043416989)
 local Tab2 = Window:CreateTab("Optimization", 103268983581906)
 local Tab3 = Window:CreateTab("Rolls", 106353115333120)
 local Tab4 = Window:CreateTab("Farming", 135708807327995)
 local Tab5 = Window:CreateTab("Autos", 139399181305478)
 local Tab6 = Window:CreateTab("Profile", 117514197104865)
 local Tab7 = Window:CreateTab("Settings", 86008121828405)

-------------------------------------

 local Section = Tab:CreateSection("Information:")
 local Paragraph = Tab:CreateParagraph({Title = "Hello " .. api.nickname .. "!", Content = "\nScript version: b0.1\nLast Update: 10/19/2024\n"})
 local Button = Tab:CreateButton({
    Name = "Copy Discord Server Link",
    Callback = function()
        setclipboard("https://discord.gg/JRf8ynwAYC")
    end,
 })

-------------------------------------
local Paragraph = Tab2:CreateParagraph({Title = "ATTENTION!", Content = "\nSometimes after optimization functions, you will need to re-enter the game to enable them back.\n"})

local Toggle = Tab2:CreateToggle({
    Name = "Unrender Orbs",
    CurrentValue = false,
    Flag = "Unrender Orbs",
    Callback = function(Value)
        _G.Orbs = Value
        if _G.Orbs == true then
            hideOrbs()
        else
            showOrbs()
        end
    end,
 })

local Toggle = Tab2:CreateToggle({
    Name = "Unrender Breakables",
    CurrentValue = false,
    Flag = "Unrender Breakables",
    Callback = function(Value)
        _G.Breakables = Value
        if _G.Breakables == true then
            hideBreakables()
        else
            showBreakables()
        end
    end,
 })

local Toggle = Tab2:CreateToggle({
    Name = "Unrender Pets",
    CurrentValue = false,
    Flag = "Unrender Pets",
    Callback = function(Value)
        _G.Pets = Value
        if _G.Pets == true then
            hidePets()
        else
            showPets()
        end
    end,
 })

local Toggle = Tab2:CreateToggle({
    Name = "Unrender World/Water",
    CurrentValue = false,
    Flag = "Unrender World/Water",
    Callback = function(Value)
        _G.World = Value
        if _G.World == true then
            hideWorld()
            hideDetails()
        else
            showWorld()
            showDetails()
        end
    end,
 })

-------------------------------------

local Toggle = Tab3:CreateToggle({
    Name = "Auto Roll",
    CurrentValue = false,
    Flag = "Auto Roll",
    Callback = function(Value)
        _G.rolls = Value
        rolls()
    end,
 })

-------------------------------------

local Toggle = Tab4:CreateToggle({
    Name = "Auto Farm Fruits",
    CurrentValue = false,
    Flag = "Auto Farm Fruits",
    Callback = function(Value)
        _G.Fruits = Value
        teleportToFruits()
    end,
 })

-------------------------------------

local Toggle = Tab5:CreateToggle({
    Name = "Auto Upgrades",
    CurrentValue = false,
    Flag = "Auto Upgrades",
    Callback = function(Value)
        _G.autoupgrades = Value
        autoupgrades()
    end,
 })

-------------------------------------

Rayfield:Notify({
    Title = "OxyHub successfully loaded!",
    Content = "PLEASE, if you find a bug or have a suggestion on what to add to the script, let us know on the discord server.",
    Duration = 5,
    Image = 137607810655683,
    Actions = {
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("okay")
       end
    },
 },
 })

 Rayfield:LoadConfiguration()
-------------------------------------
