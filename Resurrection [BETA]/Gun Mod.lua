local module = require(game.ReplicatedStorage.Module)

for i, v in pairs(module.guns) do 
	if v.ammo then 
		v.ammo = math.huge
	end
	if v.maxammo then 
		v.maxammo = math.huge
	end
	if v.spareammo then 
		v.spareaammo = math.huge
	end
	if v.recoil then 
		v.recoil = 0.01
	end
	if v.damage then 
		v.damage = math.huge
	end
end