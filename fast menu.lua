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
        Frame.Size = UDim2.new(0, 30, 0, 30)
        minimized = true else
        Frame.Size = UDim2.new(0, 200, 0, 300)
        minimized = false end
end)

-- Настройка кнопки Spy
ButtonSpy.Size = UDim2.new(0, 180, 0, 50)
ButtonSpy.Position = UDim2.new(0, 10, 0, 50)
ButtonSpy.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonSpy.Text = "Spy"
ButtonSpy.Parent = Frame
ButtonSpy.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/refs/heads/master/SimpleSpy.lua'))()
end)

-- Настройка кнопки Dex
ButtonDex.Size = UDim2.new(0, 180, 0, 50)
ButtonDex.Position = UDim2.new(0, 10, 0, 110)
ButtonDex.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonDex.Text = "Dex"
ButtonDex.Parent = Frame
ButtonDex.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Keyless-mobile-dex-17888"))()
end)

-- Настройка кнопки Beta OxyHub
ButtonBetaOxyHub.Size = UDim2.new(0, 180, 0, 50)
ButtonBetaOxyHub.Position = UDim2.new(0, 10, 0, 170)
ButtonBetaOxyHub.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonBetaOxyHub.Text = "Beta OxyHub"
ButtonBetaOxyHub.Parent = Frame
ButtonBetaOxyHub.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TeSey1/Oxyhub/refs/heads/main/main.lua"))()
end)

-- Настройка кнопки Global OxyHub
ButtonGlobalOxyHub.Size = UDim2.new(0, 180, 0, 50)
ButtonGlobalOxyHub.Position = UDim2.new(0, 10, 0, 230)
ButtonGlobalOxyHub.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonGlobalOxyHub.Text = "Global OxyHub"
ButtonGlobalOxyHub.Parent = Frame
ButtonGlobalOxyHub.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OxyHub-Team/main/refs/heads/main/main.lua"))()
end)
