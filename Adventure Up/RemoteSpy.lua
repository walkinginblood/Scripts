local fw = require(game.ReplicatedStorage:WaitForChild("Framework"))
local n = fw.Network

local old = n.Send
n.Send = function(self, type, ...)
    if type == "Character/Headtracking" or type == "Network/Ping" or type == "Audio/Footstep" then
        return old(self, type, ...)
    end
    warn(type,"fired with",...)
    return old(self, type, ...)
end

local fw = require(game.ReplicatedStorage:WaitForChild("Framework"))
local n = fw.Network

local old = n.Invoke
n.Invoke = function(self, type, ...)
    if type == "Cosmetics/GetTitle" then
        return old(self, type, ...)
    end
    warn(type,"invoked with",...)
    return old(self, type, ...)
end