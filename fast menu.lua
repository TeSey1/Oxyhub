local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local SpyButton = Instance.new("TextButton")
local DexButton = Instance.new("TextButton")
local BetaOxyHubButton = Instance.new("TextButton")
local GlobalOxyHubButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.5
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame:CornerRadius(UDim.new(0, 10))

-- Close Button
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Parent = MainFrame

-- Button Properties
local function createButton(name, position, url)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 280, 0, 40)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = MainFrame button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)

    return button
end

-- Creating Buttons
SpyButton = createButton("Spy", UDim2.new(0, 10, 0, 40), 'https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/refs/heads/master/SimpleSpy.lua')
DexButton = createButton("Dex", UDim2.new(0, 10, 0, 90), "https://rawscripts.net/raw/Universal-Script-Keyless-mobile-dex-17888")
BetaOxyHubButton = createButton("Beta OxyHub", UDim2.new(0, 10, 0, 140), "https://raw.githubusercontent.com/TeSey1/Oxyhub/refs/heads/main/main.lua")
GlobalOxyHubButton = createButton("Global OxyHub", UDim2.new(0, 10, 0, 190), "https://raw.githubusercontent.com/OxyHub-Team/main/refs/heads/main/main.lua")

-- Toggle Button
ToggleButton.Size = UDim2.new(0, 30, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -15, 0, 5)
ToggleButton.Text = "-"
ToggleButton.Parent = MainFrame

local isCollapsed = false

ToggleButton.MouseButton1Click:Connect(function()
    isCollapsed = not isCollapsed if isCollapsed then
        MainFrame.Size = UDim2.new(0, 30, 0, 30)
        ToggleButton.Text = "+"
        SpyButton.Visible = false
        DexButton.Visible = false
        BetaOxyHubButton.Visible = false GlobalOxyHubButton.Visible = false else
        MainFrame.Size = UDim2.new(0, 300, 0, 200)
        ToggleButton.Text = "-"
        SpyButton.Visible = true
        DexButton.Visible = true
        BetaOxyHubButton.Visible = true
        GlobalOxyHubButton.Visible = true end
end)

-- Close Functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

Найти еще
