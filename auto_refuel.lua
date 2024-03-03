print("Hello!")
print("How long you travellin', fella?")

local length = read()

print("Want me to pick up items for ya, chap? (y/n)")

local pickUp = read()

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
                print("No more fuel available. Thank you for using our service. Sex(c)")
            end
        end
    end

    if pickUp == "y" then
        turtle.dig()
        turtle.suck()
        turtle.forward()
        turtle.digUp()
        turtle.suckUp()
        turtle.dig()
        turtle.suck()
        turtle.digUp()
        turtle.suckUp()
        turtle.digDown()
        turtle.suckDown()
        turtle.down()
    elseif pickUp == "n" then
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.dig()
        turtle.digUp()
        turtle.digDown()
        turtle.down()
    else
        print("WRITE 'y' OR 'n', YOU IIIIDIOT!!")
    end

    if i==length then
        print("I'm done, chap! Thank you for using our service!")
    end
end

