if game.PlaceId == 1538933949 then
	local old
	old = hookfunction(getrawmetatable(game).__namecall,function(...)
		local Method = getnamecallmethod();
		if Method == "Kick" or Method == "kick" then
			return
		end
		return old(...)
	end)
end