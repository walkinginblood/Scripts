local LMAO = game:GetService("ReplicatedStorage").NetworkFolder:FindFirstChild("KickPlayer")
if LMAO then 
	LMAO:Destroy()
end

local functiontable
for i,v in next,getreg() do 
if type(v) == "function" and islclosure(v) then 
for i,x in pairs(debug.getconstants(v)) do
if x == "Kick" then
functiontable = x
end
end
end
end

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