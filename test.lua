local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local GetKeyButton = Instance.new("TextButton")
local CheckKeyButton = Instance.new("TextButton")
local HelpButton = Instance.new("TextButton")
local NotificationLabel = Instance.new("TextLabel") -- Уведомление

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Уведомление
NotificationLabel.Parent = ScreenGui
NotificationLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationLabel.TextColor3 = Color3.new(1, 1, 1)
NotificationLabel.TextSize = 16
NotificationLabel.Font = Enum.Font.SourceSansBold
NotificationLabel.Position = UDim2.new(1, -210, 1, -50) -- Справа снизу
NotificationLabel.Size = UDim2.new(0, 200, 0, 40)
NotificationLabel.Text = ""
NotificationLabel.Visible = false
NotificationLabel.BorderSizePixel = 0

-- Функция для отображения уведомлений
local function showNotification(message, duration)
    NotificationLabel.Text = message
    NotificationLabel.Visible = true
    task.delay(duration, function()
        NotificationLabel.Visible = false
    end)
end

-- Увеличенный Frame для GUI
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Frame.Size = UDim2.new(0, 400, 0, 250)  -- Увеличен до 400x250
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.Active = true

-- Заголовок окна
TitleLabel.Parent = Frame
TitleLabel.Text = "Key System"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleLabel.TextColor3 = Color3.new(1, 1, 1)

-- Поле для ввода ключа
KeyInput.Parent = Frame
KeyInput.PlaceholderText = "Введите ключ"
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 18
KeyInput.Size = UDim2.new(0.9, 0, 0, 40)
KeyInput.Position = UDim2.new(0.05, 0, 0.3, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
KeyInput.TextColor3 = Color3.new(1, 1, 1)

-- Кнопка Check Key (слева)
CheckKeyButton.Parent = Frame
CheckKeyButton.Text = "Check Key"
CheckKeyButton.Font = Enum.Font.SourceSansBold
CheckKeyButton.TextSize = 18
CheckKeyButton.Size = UDim2.new(0.45, 0, 0, 40)
CheckKeyButton.Position = UDim2.new(0.05, 0, 0.55, 0)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
CheckKeyButton.TextColor3 = Color3.new(1, 1, 1)

-- Проверка ключа
local function checkKey()
    local correctKey = "mySecretKey"
    local inputKey = KeyInput.Text

    if inputKey == correctKey then
        print("Ключ верный, закрытие окна.")
        ScreenGui:Destroy()
    else
        showNotification("Invalid Key", 2)
    end
end

CheckKeyButton.MouseButton1Click:Connect(checkKey)

-- Кнопка Get Key (справа)
GetKeyButton.Parent = Frame
GetKeyButton.Text = "Get Key"
GetKeyButton.Font = Enum.Font.SourceSansBold
GetKeyButton.TextSize = 18
GetKeyButton.Size = UDim2.new(0.45, 0, 0, 40)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.55, 0)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
GetKeyButton.TextColor3 = Color3.new(1, 1, 1)

GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://example.com/getkey")
    showNotification("Link has been Copied", 2)
end)

-- Кнопка Need Help? (широкая, центрированная)
HelpButton.Parent = Frame
HelpButton.Text = "Need Help?"
HelpButton.Font = Enum.Font.SourceSansBold
HelpButton.TextSize = 18
HelpButton.Size = UDim2.new(0.9, 0, 0, 40)
HelpButton.Position = UDim2.new(0.05, 0, 0.75, 0)
HelpButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
HelpButton.TextColor3 = Color3.new(1, 1, 1)

HelpButton.MouseButton1Click:Connect(function()
    setclipboard("https://example.com/help")
    showNotification("Link has been Copied", 2)
end)

-- Перемещение окна
local dragging = false
local dragStart
local startPos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
