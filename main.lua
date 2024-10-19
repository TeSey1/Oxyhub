local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/OxyHub-Team/ui-library/refs/heads/main/orion.lua')))()
getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/kocmoc/main/api.lua"))()
local Window = OrionLib:MakeWindow({Name = "PETS GO ┃ OxyHub b0.1", HidePremium = false, SaveConfig = true, ConfigFolder = "OxyHub", IntroIcon = "rbxassetid://137607810655683", IntroText = "OxyHub", Icon = "rbxassetid://137607810655683"})

_G.rolls = true
_G.autoupgrades = true

function rolls()
  while _G.rolls == true do
       game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Eggs_Roll"):InvokeServer()
       wait(1)  -- Пауза в 1 секунду между вызовами (можно изменить)
  end
end

function autoupgrades()
  while _G.autoupgrades == true do
    local upgradeObject = workspace.__THINGS.Upgrades["Upgrades Frontend Render"]
    
    if upgradeObject then
        for _, child in pairs(upgradeObject:GetChildren()) do
            print(child.Name) -- Выводим имя каждого дочернего объекта
        end
    else
        print("Объект не найден!")
    end
  end
end

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

local Section = Tab:AddSection({
  Name = "Information"
})
Tab:AddParagraph("Welcome " .. api.nickname .. "!","\nScript Version: b0.1 \nPlace Version: " .. api.placeversion)

Tab3:AddToggle({
  Name = "Auto Roll",
  Default = false,
  Callback = function(Value)
      _G.rolls = Value
      rolls()
  end    
})

Tab5:AddToggle({
  Name = "Auto Upgrades",
  Default = false,
  Callback = function(Value)
    _G.autoupgrades = Value
    autoupgrades()
  end    
})
