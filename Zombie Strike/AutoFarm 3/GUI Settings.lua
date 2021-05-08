-- Check for settings
local e = pcall(function()
	readfile("ZombieStrike_Settings.dat")
end)
-- Create & save settings
if not e or (e and game:GetService("HttpService"):JSONDecode(readfile("ZombieStrike_Settings.dat")).UID ~= game.Players.LocalPlayer.Character.Gun.UUID.Value) then
    getgenv().Settings["UID"] = game.Players.LocalPlayer.Character.Gun.UUID.Value
    -- Save Bullets
    function shoot()
        -- Wait for load
        local load
        repeat
            load = pcall(function()
                local a = game.ReplicatedStorage.Remotes.CreateLobby
                local b = game.ReplicatedStorage.Remotes.PlayLobby
                local c = game.ReplicatedStorage.Lobbies
            end)
            wait()
        until load
        --Thing
        local mt = getrawmetatable(game)
        make_writeable(mt)
        local old = mt.__namecall
        mt.__namecall = newcclosure(loadstring([[
            local old = ...
            return function(self, ...)
                local len = select("#", ...)
                local pack = {...}
                local args = {}
                for i=1,len do
                    args[i] = pack[i]
                end
                if getnamecallmethod() == "FireServer" and tostring(self) == "Shoot" and args[2] and typeof(args[2]) == "table" then
                    warn("kelli king")
                    print(Settings)
                    getgenv().Settings["Bullets"] = #args[2]
                    getgenv().Settings["Common"] = _G.common
                    getgenv().Settings["Uncommon"] = _G.uncommon
                    getgenv().Settings["Rare"] = _G.rare
                    getgenv().Settings["Epic"] = _G.epic
                    writefile("ZombieStrike_Settings.dat", game:GetService("HttpService"):JSONEncode(getgenv().Settings))
                    return game:GetService("TeleportService"):Teleport(3759927663, game.Players.LocalPlayer)
                end
                return old(self, ...)
            end
        ]])(old))
    end
    -- Save Difficulty
    local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
    local w = library:CreateWindow('Settings')
    local autosell = library:CreateWindow('Auto Sell')
    autosell:Toggle('Common', {flag = "common"})
    autosell:Toggle('Uncommon', {flag = "uncommon"})
    autosell:Toggle('Rare', {flag = "rare"})
    autosell:Toggle('Epic', {flag = "epic"})
    autosell:Button('Save', function()
        _G.common = autosell.flags.common
        _G.uncommon = autosell.flags.uncommon
        _G.rare = autosell.flags.rare
        _G.epic = autosell.flags.epic
    end)
    w:Section("Made by Megumu")
    w:Dropdown("Gamemode", {
        location = _G;
        flag = "gamemode";
        list = {
            "Mission";
            "Arena";
        }
    }, function(new)
        if new == "Mission" and _G.one then
            _G.one = false
            getgenv().Settings["Gamemode"] = "Mission"
            w:Dropdown("Map", {
                location = _G;
                flag = "map";
                list = {
                    "Retro City";
                    "Factory";
                    'Firelands';
                    'Frostlands';
                }
            }, function(new)
                if new == "Retro City" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 1
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="Easy - 1";[2]="Medium - 2";[3]="Hard - 3";[4]="Very Hard - 4";[5]="Extreme - 5";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                elseif new == "Factory" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 2
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="Easy - 1";[2]="Medium - 2";[3]="Hard - 3";[4]="Very Hard - 4";[5]="Extreme - 5";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                elseif new == "Firelands" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 3
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="Hard - 1";[2]="Very Hard - 2";[3]="Extreme - 3";[4]="Insane - 4";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                elseif new == "Frostlands" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 4
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="Hard - 1";[2]="Very Hard - 2";[3]="Extreme - 3";[4]="Insane - 4";[5]="Impossible - 5";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                end
            end)
        elseif new == "Arena" and _G.one then
            _G.one = false
            getgenv().Settings["Gamemode"] = "Arena" 
            w:Dropdown("Map", {
                location = _G;
                flag = "map";
                list = {
                    "Retro City";
                    "Factory";
                    'Firelands';
                    'Frostlands';
                }
            }, function(new)
                if new == "Retro City" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 1
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="LV. 1";[2]="LV. 20";[3]="LV. 40";[4]="LV. 60";[5]="LV. 80";[6]="LV. 100";[7]="LV. 120";[8]="LV. 140";[9]="LV. 160";[10]="LV. 180";[11]="LV. 200";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                elseif new == "Factory" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 2
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="LV. 1";[2]="LV. 20";[3]="LV. 40";[4]="LV. 60";[5]="LV. 80";[6]="LV. 100";[7]="LV. 120";[8]="LV. 140";[9]="LV. 160";[10]="LV. 180";[11]="LV. 200";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                elseif new == "Firelands" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 3
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="LV. 1";[2]="LV. 20";[3]="LV. 40";[4]="LV. 60";[5]="LV. 80";[6]="LV. 100";[7]="LV. 120";[8]="LV. 140";[9]="LV. 160";[10]="LV. 180";[11]="LV. 200";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                elseif new == "Frostlands" and _G.two then
                    _G.two = false
                    getgenv().Settings["Map"] = 4
                    w:Dropdown("Difficulty", {
                        location = _G;
                        flag = "diff";
                        list = {[1]="LV. 1";[2]="LV. 20";[3]="LV. 40";[4]="LV. 60";[5]="LV. 80";[6]="LV. 100";[7]="LV. 120";[8]="LV. 140";[9]="LV. 160";[10]="LV. 180";[11]="LV. 200";}
                    }, function(new)
                        if _G.three then
                            _G.three = false
                            getgenv().Settings["Level"] = tonumber(string.split(new, " - ")[2])
                            w:Section("Shoot once")
                            shoot()
                        end
                    end)
                end
            end)
        end
    end)
    return
else
    local thing = game:GetService("HttpService"):JSONDecode(readfile("ZombieStrike_Settings.dat"))
    getgenv().Settings["Map"] = thing.Map
    getgenv().Settings["Level"] = thing.Level
    getgenv().Settings["Bullets"] = thing.Bullets
    getgenv().Settings["Common"] = thing.Common
    getgenv().Settings["Uncommon"] = thing.Uncommon
    getgenv().Settings["Rare"] = thing.Rare
    getgenv().Settings["Epic"] = thing.Epic
    getgenv().Settings["Gamemode"] = thing.Gamemode
end