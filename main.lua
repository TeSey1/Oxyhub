local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/OxyHub-Team/ui-library/refs/heads/main/orion.lua'))()
getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/kocmoc/main/api.lua"))()
local Window = OrionLib:MakeWindow({Name = "PETS GO ┃ OxyHub b0.1", HidePremium = false, SaveConfig = true, ConfigFolder = "OxyHub", IntroIcon = "rbxassetid://137607810655683", IntroText = "OxyHub", Icon = "rbxassetid://137607810655683"})

-----------------------------------------------

_G.rolls = true
_G.autoupgrades = true
_G.unrenderDetails = true
_G.UnrenderPets = true
_G.UnrenderWater = true

-----------------------------------------------

-----------------------------------------------

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
            print("Прокачано" .. objectName)
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
    print("Детали карты скрыты.")
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
    print("Детали карты восстановлены.")
end


function hidePets()
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
            print(obj.Name .. " перемещен в ReplicatedStorage.")
        end
    end
    print("Питомцы скрыты.")
end
    
function showPets()
    local petsFolder = game.Workspace:WaitForChild("__THINGS"):WaitForChild("Pets") -- Папка с питомцами
    local storage = game.ReplicatedStorage:FindFirstChild("Pets") -- Папка для хранения скрытых объектов
    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = petsFolder -- Перемещаем объекты обратно в Pets
        print(obj.Name .. " восстановлен в Pets.")
    end
    print("Все питомцы восстановлены.")
end

function hideWater()
    local waterFolder = game.Workspace:WaitForChild("OUTER"):WaitForChild("Water") -- Папка с водой
    local storage = game.ReplicatedStorage:FindFirstChild("Water") -- Папка для хранения скрытых объектов
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Water"
        storage.Parent = game.ReplicatedStorage 
    end

    for _, obj in ipairs(waterFolder:GetChildren()) do 
        obj.Parent = storage -- Перемещаем объект в ReplicatedStorage
        print(obj.Name .. " перемещен в ReplicatedStorage.")
    end 
    print("Все объекты в Water скрыты.")
end

function showWater()
    local waterFolder = game.Workspace:WaitForChild("OUTER"):WaitForChild("Water") -- Папка с водой 
    local storage = game.ReplicatedStorage:FindFirstChild("Water") -- Папка для хранения скрытых объектов 
    if not storage then
        storage = Instance.new("Folder")
        storage.Name = "Water"
        storage.Parent = game.ReplicatedStorage 
    end
    for _, obj in ipairs(storage:GetChildren()) do
        obj.Parent = waterFolder -- Перемещаем объекты обратно в Water 
        print(obj.Name .. " восстановлен в Water.")
    end 
    print("Все объекты в Water восстановлены.")
end



-----------------------------------------------

-----------------------------------------------

local Tab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://138276043416989",
    PremiumOnly = false
})
local Tab2 = Window:MakeTab({
    Name = "Optimization",
    Icon = "rbxassetid://103268983581906",
    PremiumOnly = false
})
local Tab3 = Window:MakeTab({
    Name = "Rolls",
    Icon = "rbxassetid://106353115333120",
    PremiumOnly = false
})
local Tab4 = Window:MakeTab({
    Name = "Breakbles",
    Icon = "rbxassetid://135708807327995",
    PremiumOnly = false
})
local Tab5 = Window:MakeTab({
    Name = "Autos",
    Icon = "rbxassetid://139399181305478",
    PremiumOnly = false
})
local Tab6 = Window:MakeTab({
    Name = "Profile",
    Icon = "rbxassetid://117514197104865",
    PremiumOnly = false
})
local Tab7 = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://86008121828405",
    PremiumOnly = false
})

-----------------------------------------------

-----------------------------------------------

local Section = Tab:AddSection({
    Name = "Information"
})

Tab:AddParagraph("Hello " .. api.nickname .. "!","\nScript version: b0.1\nLast Update: 10/19/2024\n")
Tab:AddButton({
	Name = "Copy Discord Server Link",
	Callback = function()
        setclipboard("https://discord.gg/gPt63592fA")
  	end    
})

-----------------------------------------------

Tab2:AddToggle({
    Name = "Unrender Pets",
    Default = false,
    Callback = function(Value)
        _G.UnrenderPets = Value
        if _G.UnrenderPets == true then
            hidePets()
        else
            showPets()
        end
    end
})

Tab2:AddToggle({
    Name = "Unrender Details",
    Default = false,
    Callback = function(Value)
        _G.unrenderDetails = Value
        if _G.unrenderDetails == true then
            hideDetails()
        else
            showDetails()
        end
    end
})

Tab2:AddToggle({
    Name = "Unrender Water",
    Default = false,
    Callback = function(Value)
        _G.UnrenderWater = Value
        if _G.UnrenderWater == true then
            hideWater()
        else
            showWater()
        end
    end
})

-----------------------------------------------

Tab3:AddToggle({
    Name = "Auto Roll",
    Default = false,
    Callback = function(Value)
        _G.rolls = Value
        rolls()
    end    
})

-----------------------------------------------

-----------------------------------------------

Tab5:AddToggle({
    Name = "Auto Upgrades",
    Default = false,
    Callback = function(Value)
        _G.autoupgrades = Value
        autoupgrades()
    end    
})

-----------------------------------------------
