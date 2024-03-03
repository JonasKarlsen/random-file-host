print("Hello!")
print("How long you travellin', fella?")

local length = read()

for i=1, length do
    if turtle.getFuelLevel() < 1 then
        for i=1, 16 do
            turtle.select(i)
            local id, count, damage = turtle.getItemDetail()
            if id == "minecraft:coal" or id == "minecraft:charcoal" or id == "minecraft:lava_bucket" then
                turtle.refuel()
                print("Refilling fuel")
                break
            elseif turtle.getSelectedSlot() == 16 then
                print("No more fuel available. Exiting program.")
            end
        end
    end

    ## INSERT LE FUNNY CODE HERE
end