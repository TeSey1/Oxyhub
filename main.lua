local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()

getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/kocmoc/main/api.lua"))()
local trueData = "496fd135863a486e88dddf0cece470bb"
local falseData = "bbe44066cce342fa961cfed79773141d"
local GameLoad = nil
local PlaceId = nil

function StartScript()
    OrionLib:Destroy()
    wait(2)
    if game.PlaceId == 18901165922 then
        GameLoad = "P1"
    end
    local var,err = pcall(function ()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JUSTaOxy/Scripts/blob/main/" .. GameLoad .. ".lua"))()
    end)
    if var == false  then
        print("Error : " .. err)
    end
end

KeyGuardLibrary.Set({
    publicToken = "b030632d85974e03bf9c53e4ff973c6f",
    privateToken = "de882543421a41c5b333a184b61983be",
    trueData = trueData,
    falseData = falseData,
})

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local key = ""

local Window = Rayfield:CreateWindow({
    Name = "OxyHub ┃ Key System",
    LoadingTitle = "Key System is Loading, please Wait.",
    LoadingSubtitle = "by OxyHub Development",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = OxyHubKey,
       FileName = "OxyHubKey"
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

local Tab = Window:CreateTab("Key System", 102213054980369)
local Tab2 = Window:CreateTab("Need Help?", 95650442256545)

local Input = Tab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Enter Key Here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        key = Value
    end,
})

local Button = Tab:CreateButton({
    Name = "Check Key",
    Callback = function()
        local response = KeyGuardLibrary.validateDefaultKey(key) and KeyGuardLibrary.validatePremiumKey(key)
        if response == trueData then
            Rayfield:Notify({
                Title = "Key is Valid!",
                Content = "Wait for the script to load.",
                Duration = 6.5,
                Image = 137607810655683,
             })
            StartScript()
        else
            Rayfield:Notify({
                Title = "Key is Invalid!",
                Content = "Please try again",
                Duration = 6.5,
                Image = 137607810655683,
             })
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Key",
    Callback = function()
        setclipboard(KeyGuardLibrary.getLink())
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The link has been copied to your clipboard",
            Duration = 6.5,
            Image = 137607810655683,
         })
    end,
})
