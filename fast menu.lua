local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local ButtonSpy = Instance.new("TextButton")
local ButtonDex = Instance.new("TextButton")
local ButtonBetaOxyHub = Instance.new("TextButton")
local ButtonGlobalOxyHub = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройка ScreenGui
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- Настройка Frame
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0.5, -100, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Добавление UICorner для скругленных углов
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

-- Настройка кнопки закрытия
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.Parent = Frame
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Настройка кнопки сворачивания
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MinimizeButton.Text = "-"
MinimizeButton.Parent = Frame
local minimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    if not minimized then
        Frame.Visible = false -- Скрыть меню при сворачивании
        minimized = true
    else
        Frame.Visible = true -- Показать меню при разворачивании minimized = false
    end
end)

-- Функция для создания кнопок
local function createButton(name, position, url)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 50)
    button.Position = position button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Светлый текст button.Text = name button.Parent = Frame button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
    return button
end

-- Настройка кнопок
createButton("Spy", UDim2.new(0, 10, 0, 50), 'https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/refs/heads/master/SimpleSpy.lua')
createButton("Dex", UDim2.new(0, 10, 0, 110), "https://rawscripts.net/raw/Universal-Script-Keyless-mobile-dex-17888")
createButton("Beta OxyHub", UDim2.new(0, 10, 0, 170), "https://raw.githubusercontent.com/TeSey1/Oxyhub/refs/heads/main/main.lua")
createButton("Global OxyHub", UDim2.new(0, 10, 0, 230), "https://raw.githubusercontent.com/OxyHub-Team/main/refs/heads/main/main.lua")
