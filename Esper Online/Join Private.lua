while wait() do
	List = {
		[1] = "A";
		[2] = "B";
		[3] = "C";
		[4] = "D";
		[5] = "E";
		[6] = "F";
		[7] = "G";
		[8] = "H";
		[9] = "J";
		[10] = "K";
		[11] = "L";
		[12] = "M";
		[13] = "O";
		[14] = "P";
		[15] = "Q";
		[16] = "R";
		[17] = "S";
		[18] = "T";
		[19] = "W";
		[20] = "X";
		[21] = "Y";
		[22] = "Z";
		[23] = "1";
	};

	Digits = {
	[1] = math.random(1, 23);
	[2] = math.random(1, 23);
	[3] = math.random(1, 23);
	[4] = math.random(1, 23);
	[5] = math.random(1, 23);
	[6] = math.random(1, 23);
	};

	function Generate(eg)
        local tabl = {}
        for i, v in pairs(eg) do
            if v <= 22 and math.random(1, 2) == 1 then
				table.insert(tabl, _G.List[v]:lower())
			else
				table.insert(tabl, _G.List[v])
			end
		end
		return tabl
	end

	local NewDigits = Generate(Digits)

	if #NewDigits ~= 6 then 
		return
    end

	game.ReplicatedStorage.Remotes.PrivateServerRemote:FireServer("Join", NewDigits[1]..NewDigits[2]..NewDigits[3]..NewDigits[4]..NewDigits[5]..NewDigits[6])
end