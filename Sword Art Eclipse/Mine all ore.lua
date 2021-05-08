local Nodes = game.Workspace.NodesandMaterials
local stuff = {
    ["Iron Ore"] = true,
    ["Gold Ore"] = true,
    ["Wood"] = true,
    ["Silver Ore"] = true,
    ["Coal"] = true,
    ["Bronze Ore"] = true,
    ["Slime Crystalite"] = true,
    ["Arlemite Ore"] = true,
    ["Kolbold Ore"] = true,
}

for i, Item in pairs(Nodes:GetChildren()) do
    if stuff[Item.GucciName.Value] then
        game.ReplicatedStorage.Resources.Assets.Events.Mining:FireServer(Item, true)
    end
end