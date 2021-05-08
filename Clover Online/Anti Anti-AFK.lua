game.ReplicatedStorage.KickRemote:Destroy()
local metatable = getrawmetatable(game)
setreadonly(metatable,false)
local namecall = metatable.__namecall
metatable.__namecall = function(self,...)
local dict = {...}
if dict[#dict] == "Kick" or dict[#dict] == "BreakJoints" or dict[#dict] == "kick" and functiontable then
return nil
end
return namecall(self,...)
end