--Settings
_G.Loop = false --true | false

--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")
local placed

--Mine
local function mine()
	for i, child in ipairs(work.BlockField:GetChildren()) do 
		if _G.Material == "Surrounding" and player:DistanceFromCharacter(child.Position) < 35 then 
			for i = 1, 10 do
				work.DigHandler.MineEvent:FireServer(child.Position, Enum.NormalId.Top, child, tonumber(i/10), placed)	
			end
		elseif child.Name == _G.Material then 
			for i = 1, 20 do
				work.DigHandler.MineEvent:FireServer(child.Position, Enum.NormalId.Top, child, tonumber(i/10), placed)
			end
		end
	end
end

--Start
mine()

--Loop
while _G.Loop do
	wait(2.5)
	mine()
end