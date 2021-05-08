--Exploit Check
if not pcall(function() return getrawmetatable, newcclosure, setreadonly end) then
	spawn(function()
		game.Players.LocalPlayer:Kick("Exploit not supported")
	end)
	wait(2)
	game:Shutdown()
end

--Credits
loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

--Function
function getDescendants(tb)
	local variables = {}
	local function loop(tb)
		for _, v in pairs(tb) do
			if type(v) == 'table'  then
				loop(v)
			else
				table.insert(variables, v)
			end
		end
	end
    loop(tb)
	return variables
end

--Start
print("MADE BY MEGUMU, EAT MY ASS")

--LOL!
local mt = getrawmetatable(game)
setreadonly(mt, false)
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
        local method = getnamecallmethod()
        if method == "FireServer" and typeof(args[2]) == "table" and typeof(args[1]) == "string" then
            for i,v in pairs(getDescendants(args)) do
                if tostring(v) == "GlobalReplicate" or tostring(v) == "UpdateMag" then 
					return old(self, ...)
				end
            end
			if args[2]["AIs"] then
				for i,v in pairs(args[2]["AIs"][1]) do
					if typeof(v) == "number" then
						args[2]["AIs"][1][i] = 500
						return old(self, unpack(args))
					end
				end
			end
		end
        return old(self, ...)
    end
]])(old))