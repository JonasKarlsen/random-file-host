local function main()
    print("WELCOME TO LE STAIR MAKER 2000")
    print("REMEMBER! the stair will be making it FORWARD to where u place it... if u know what i mean (sex)")
    print("Enter da lengthe of le stairs")
    local length = tonumber(read())

    -- If you write wrong...
    if type(length) ~= "number" then
        fail()
    end

    print("Allah, du valgte den ", length, " du...")

    print("Enter da widhte of le stairs")
    local width = tonumber(read())

    -- If you write wrong...
    if type(width) ~= "number" then
        fail()
    end

    print("DO YOU WANT ME TO ONLY PICK UP diamonds/gold/all dat sexy shit (not stone)? (type 'y' or 'n')")
    local isPickUpOK = read()
    if isPickUpOK == "y" then
        local pickUpEpic = true;
        local pickUpStatus = "Pick only up epic stuff";
    elseif isPickUpOK == "n" then
        local pickUpEpic = false;
        local pickUpStatus = "Pick up everytheng :D"
    else
        fail()
    end
        
    print("Length: ", length, " - Width: ", width, " - ", pickUpStatus, " - IS THIS OK? (type 'y' or 'n')")
    local isOK = read()

    if isOK == "n" then
        main()
    elseif isOK == "y" then
        widthDig(width, "right")
    else
        fail()
    end
end

function fail()
    print("Something went wrong!")
    main()
end

function digMove(where)
    if where == "right" then
        turtle.turnRight()
        local erBlokk = turtle.detect()
        if erBlokk then
            turtle.dig()
            pickup(pickUpEpic)
        end
        turtle.forward()
        turtle.turnLeft()
    elseif where == "left" then
        turtle.turnLeft()
        local erBlokk = turtle.detect()
        if erBlokk then
            turtle.dig()
            pickup(pickUpEpic)
        end
        turtle.forward()
        turtle.turnRight()
    elseif where == "backward" then
        turtle.turnLeft()
        turtle.turnLeft()
        local erBlokk = turtle.detect()
        if erBlokk then
            turtle.dig()
            pickup(pickUpEpic)
        end
        turtle.forward()
        turtle.turnLeft()
        turtle.turnLeft()
    elseif where == "forward" then
        local erBlokk = turtle.detect()
        if erBlokk then
            turtle.dig()
            pickup(pickUpEpic)
        end
        turtle.forward()
    elseif where == "up" then
        local erBlokk = turtle.detectUp()
        if erBlokk then
            turtle.digUp()
            pickup(pickUpEpic)
        end
        turtle.up()
    elseif where == "down" then
        local erBlokk = turtle.detectDown()
        if erBlokk then
            turtle.digDown()
            pickup(pickUpEpic)
        end
        turtle.down()
    end
end

-- epic = no stone, normal = sex
function pickUp(epicPickUp)
    if epicPickUp then
        turtle.suck()
        for j=0, 16, do
            turtle.select(j)
            local id, count, damage = turtle.getItemDetail()
            if id = minecraft:stone or minecraft:cobblestone or minecraft:dirt or minecraft:gravel or minecraft:sand or minecraft:sandstone or minecraft:clay or minecraft:mossy_cobblestone or minecraft:granite or minecraft:diorite or minecraft:andesite or minecraft:coarse_dirt or minecraft:podzol or minecraft:grass_block or minecraft:stone_bricks or minecraft:magma_block or minecraft:obsidian or minecraft:water or minecraft:lava then
                for i=0, 42069, do
                    turtle.turnLeft()
                    if turtle.detect() == false then
                        turtle.drop()
                        break
                    end
                end
            end
        end
    end
    if not epicPickUp then
        turtle.suck()
    end
end
            

function widthDig(width, where)
    if where == "right" then
        for i=0, width do
            digMove("right")
        end
    elseif where == "left" then
        for i=0, width do
            digMove("left")
        end
    elseif where == "forward" then
        for i=0, width do
            digMove("forward")
        end
    elseif where == "backward" then
        for i=0, width do
            digMove("backward")
        end
    elseif where == "up" then
        for i=0, width do
            digMove("up")
        end
    elseif where == "down" then
        for i=0, width do
            digMove("down")
        end
    end
end
