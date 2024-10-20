local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local CreateButton = Instance.new("TextButton")
local NameInput = Instance.new("TextBox")
local UrlInput = Instance.new("TextBox")

-- Настройки GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Темный фон
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.2
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 40, 0, 40) -- Увеличенный размер
ToggleButton.Position = UDim2.new(1, -45, 0, 5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Text = "🔼"
ToggleButton.Parent = MainFrame

CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -90, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный цвет для кнопки закрытия
CloseButton.Text = "❌"
CloseButton.Parent = MainFrame

CreateButton.Name = "CreateButton"
CreateButton.Size = UDim2.new(1, 0, 0, 40)
CreateButton.Position = UDim2.new(0, 0, 0, 200)
CreateButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CreateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CreateButton.Text = "Создать кнопку"
CreateButton.Parent = MainFrame

NameInput.Size = UDim2.new(0, 200, 0, 30)
NameInput.Position = UDim2.new(0, 0, 0, 240)
NameInput.PlaceholderText = "Введите название"
NameInput.Parent = MainFrame

UrlInput.Size = UDim2.new(0, 200, 0, 30)
UrlInput.Position = UDim2.new(0, 0, 0, 280)
UrlInput.PlaceholderText = "Введите URL"
UrlInput.Parent = MainFrame

-- Функция для сворачивания/разворачивания
local isOpen = true
ToggleButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen 
    MainFrame.Size = isOpen and UDim2.new(0, 300, 0, 200) or UDim2.new(0, 40, 0, 40) -- Увеличенный размер в свернутом состоянии ToggleButton.Text = isOpen and "🔼" or "🔽"
end)

-- Функция для закрытия GUI
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Удаление GUI
end)

-- Функция для создания новой кнопки
local function createButton(name, position, url)
    local button = Instance.new("TextButton")
    button.Name = name button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = position button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.Parent = MainFrame button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

-- Создание кнопок по умолчанию
local buttonYPosition = 40
createButton("Spy", UDim2.new(0, 0, 0, buttonYPosition), 'https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/refs/heads/master/SimpleSpy.lua')
buttonYPosition = buttonYPosition + 40
createButton("Dex", UDim2.new(0, 0, 0, buttonYPosition), "https://rawscripts.net/raw/Universal-Script-Keyless-mobile-dex-17888")
buttonYPosition = buttonYPosition + 40
createButton("Beta OxyHub (for tests)", UDim2.new(0, 0, 0, buttonYPosition), "https://raw.githubusercontent.com/TeSey1/Oxyhub/refs/heads/main/main.lua")
buttonYPosition = buttonYPosition + 40
createButton("Global OxyHub", UDim2.new(0, 0, 0, buttonYPosition), "https://raw.githubusercontent.com/OxyHub-Team/main/refs/heads/main.lua")

-- Функция для добавления новой кнопки по вводу
CreateButton.MouseButton1Click:Connect(function()
    local buttonName = NameInput.Text
    local buttonUrl = UrlInput.Text if buttonName ~= "" and buttonUrl ~= "" then
        createButton(buttonName, UDim2.new(0, 0, 0, buttonYPosition), buttonUrl) -- Создание новой кнопки buttonYPosition = buttonYPosition + 40 -- Увеличение позиции для следующей кнопки
        NameInput.Text = "" -- Очистка поля ввода
        UrlInput.Text = "" -- Очистка поля ввода
    else print("Пожалуйста, введите название и URL.") -- Сообщение об ошибке
    end
end)

-- Перетаскивание GUI
local dragging
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then 
        dragging = true dragStart = input.Position
        startPos = MainFrame.Position 
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false
            end end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then local delta = input.Position - dragStart MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Установка стилей кнопок
for _, button in pairs(MainFrame:GetChildren()) do if button:IsA("TextButton") then 
        button.Font = Enum.Font.SourceSans button.TextSize = 18 button.BackgroundTransparency = 0.3 button.BorderSizePixel = 0
    end
end

-- Установка скругленных углов для основного фрейма
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Установка скругленных углов для кнопки переключения
local ToggleCorner = Instance.new("UICorner", ToggleButton)
ToggleCorner.CornerRadius = UDim.new(0, 10)

-- Установка скругленных углов для кнопки закрытия
local CloseCorner = Instance.new("UICorner", CloseButton)
CloseCorner.CornerRadius = UDim.new(0, 10)

-- Установка скругленных углов для кнопки создания
local CreateCorner = Instance.new("UICorner", CreateButton)
CreateCorner.CornerRadius = UDim.new(0, 10)

-- Установка скругленных углов для полей ввода
local NameInputCorner = Instance.new("UICorner", NameInput)
NameInputCorner.CornerRadius = UDim.new(0, 5)

local UrlInputCorner = Instance.new("UICorner", UrlInput)
UrlInputCorner.CornerRadius = UDim.new(0, 5)
