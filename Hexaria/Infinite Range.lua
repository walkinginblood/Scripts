--Script
for i,v in pairs(debug.getregistry()) do
    if type(v) == "table" then
        if v.Range then
            v.Range = 20
        end
    end
end