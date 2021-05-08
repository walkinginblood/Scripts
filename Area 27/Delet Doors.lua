local ch = workspace.DoorStructs:GetChildren()
for i = 1, #ch do local v = ch[i]
	if string.find(v.Name, "Door") then
		v.CFrame = CFrame.new()
	end
end