local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local SpyButton = Instance.new("TextButton")
local DexButton = Instance.new("TextButton")
local BetaOxyHubButton = Instance.new("TextButton")
local GlobalOxyHubButton = Instance.new("TextButton")

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
ToggleButton.Size = UDim2.new(0, 30, 0, 30)
ToggleButton.Position = UDim2.new(1, -35, 0, 5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Text = "🔼"
ToggleButton.Parent = MainFrame

-- Функция для сворачивания/разворачивания
local isOpen = true
ToggleButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen MainFrame.Size = isOpen and UDim2.new(0, 300, 0, 200) or UDim2.new(0, 50, 0, 30)
    ToggleButton.Text = isOpen and "🔼" or "🔽"
end)

-- Перетаскивание GUI
local dragging
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Настройка кнопок
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

-- Создание кнопок
createButton("Console", UDim2.new(0, 0, 0, 40), "https://rawscripts.net/raw/Universal-Script-Mobile-Console-20913")
createButton("Spy", UDim2.new(0, 0, 0, 40), 'https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/refs/heads/master/SimpleSpy.lua')
createButton("Dex", UDim2.new(0, 0, 0, 80), "https://rawscripts.net/raw/Universal-Script-Keyless-mobile-dex-17888")
createButton("Beta OxyHub (for tests)", UDim2.new(0, 0, 0, 120), "https://raw.githubusercontent.com/TeSey1/Oxyhub/refs/heads/main/main.lua")
createButton("Global OxyHub", UDim2.new(0, 0, 0, 160), "https://raw.githubusercontent.com/OxyHub-Team/main/refs/heads/main/main.lua")

-- Установка стилей кнопок
for _, button in pairs(MainFrame:GetChildren()) do if button:IsA("TextButton") then button.Font = Enum.Font.SourceSans
        button.TextSize = 18 button.BackgroundTransparency = 0.3 button.BorderSizePixel = 0
    end
end

-- Установка скругленных углов для основного фрейма
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Установка скругленных углов для кнопки переключения
local ToggleCorner = Instance.new("UICorner", ToggleButton)
ToggleCorner.CornerRadius = UDim.new(0, 10)
