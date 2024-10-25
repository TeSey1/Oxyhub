
local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/kocmoc/main/api.lua"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local trueData = "c39033ee5e85468ab0402b7d08deac1f"
local falseData = "94ea3aaf5d674510b6d4681616d702de"
local GameLoad = nil
local PlaceId = nil

KeyGuardLibrary.Set({
    publicToken = "b030632d85974e03bf9c53e4ff973c6f",
    privateToken = "de882543421a41c5b333a184b61983be",
    trueData = trueData,
    falseData = falseData,
})

local key = ""

function StartScript()
    wait(8)
    OrionLib:Destroy()
    if game.PlaceId == 18901165922 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JUSTaOxy/Scripts/refs/heads/main/P1.lua"))()
    else
        print("game not supported")
    end
end

local Window = OrionLib:MakeWindow({Name = "OxyHub ┃ Key System", HidePremium = false, SaveConfig = true, ConfigFolder = "OxyHubKey", IntroEnabled = true, IntroText = "OxyHub is Loading", IntroIcon = "rbxassetid://137607810655683"})

local Tab = Window:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://102213054980369",
	PremiumOnly = false
})
local Tab2 = Window:MakeTab({
	Name = "Need Help?",
	Icon = "rbxassetid://95650442256545",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "Enter Key Here",
	TextDisappear = true,
	Callback = function(Value)
		key = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
        local response = KeyGuardLibrary.validateDefaultKey(key) and KeyGuardLibrary.validatePremiumKey(key)
        if response == trueData then
            OrionLib:MakeNotification({
                Name = "Key is Valid",
                Content = "Wait for the script to load.",
                Image = "rbxassetid://137607810655683",
                Time = 5
            })
            StartScript()
        else
            OrionLib:MakeNotification({
                Name = "Key is Invalid",
                Content = "Please try again.",
                Image = "rbxassetid://137607810655683",
                Time = 5
            })
        end
  	end    
})

Tab:AddButton({
	Name = "Get Key",
	Callback = function()
        setclipboard(KeyGuardLibrary.getLink())
  	end    
})

Tab2:AddParagraph("Need Help?","Please create a ticket on the discord server and describe your problem.")
Tab2:AddButton({
	Name = "Copy Discord Server Link",
	Callback = function()
      setclipboard("https://discord.gg/BD3bc5MpNE")
      OrionLib:MakeNotification({
        Name = "The link has been copied!",
        Content = "Please paste the link into your browser or discord.",
        Image = "rbxassetid://137607810655683",
        Time = 5
    })
  	end   
})
