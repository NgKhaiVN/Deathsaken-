--!nocheck
--!nolint

if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
	getgenv().WebSocket = nil
end

local scripturl = "https://cdn.authguard.org/virtual-file/6aa36dc4efd54745b90"
local repo: string = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showGUI = true

if not isfolder("Deathsaken") then
    makefolder("Deathsaken")
end

if isfile("Deathsaken/key.json") then
    local file = readfile("Deathsaken/key.json")
    if file == "300MEM" then
        loadstring(game:HttpGet(scripturl))()
        showGUI = false
    end
end


if showGUI then
    local Obsidian: any = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Deathsaken",
        Footer = "B2 by Deathsaken Dev Team | Key system",
        ToggleKeybind = Enum.KeyCode.F8,
        SetMobileButtonSide = "Right",
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = 135666356081915,
        IconSize = UDim2.fromOffset(40, 40),
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = {
        KeyTab = Window:AddKeyTab("Key", "key"),
    }

    Tabs.KeyTab:AddLabel({
        Text = "Deathsaken Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/Ug4k6BFgd3 noob",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard("discord.gg/Ug4k6BFgd3")
            Obsidian:Notify("Copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox("300MEM", function(Success, ReceivedKey)
        if Success then
            writefile("Deathsaken/key.json", ReceivedKey)
			Obsidian:Unload()
            loadstring(game:HttpGet(scripturl))()
        else
            Obsidian:Notify("Wrong key Noob >:(.", 5)
        end
    end)
end
