local function main()
    print("WELCOME TO LE STAIR MAKER 2000")
    print("REMEMBER! the stair will be making it FORWARD to where u place it... if u know what i mean (sex)")
    print("Enter da lengthe of le stairs")
    local length = read()

    -- If you write wronge...
    if type(length) != "number" then
        fail()
    end

    print("Allah, du valgte den ", length, " du...")

    print("Enter da widhte of le stairs")
    local width = read()

    -- If you write wronge...
    if type(length) != "number" then
        fail()
    end

    print("DO YOU WANT ME TO ONLY PICK UP diamonds/gold/all dat sexy shit (not stone)? (type 'y' or 'n')")
    local isPickUpOK = read()
    if (isPickUpOK == "y")  
        local pickUpEpic = true;
        local pickUpStatus = "Pick only up epic stuff";
    elseif (isPickUpOK == "n")  
        local pickUpEpic = false;
        local pickUpStatus = "Pick up everytheng :D"
    else
        fail()
    end
        

    
    print("Length: ", length, " - Width: ", width, " - ", pickUpStatus, " - IS THIS OK? (type 'y' or 'n')")
    local isOK = read()

    if isOK="n" then
        main()
    elseif isOK="y" then
        for i=0, length, do
            widthDig(width, right)
            digMove("down")
            widthDig(width, left)
            digMove("down")
            widthDig(width, right)
            widthDig(width, left)
            turtle.up()
            turtle.up()
            digMove("forward")
    else
        fail()
    end
end

function digMove(where)
    if where="right" then
        local erBlokk = turtle.detectRight()
        turtle.turnRight()
        if erBlokk = true then
            turtle.dig()
        end
        turtle.forward()
        turtle.turnLeft()
    end
    elseif where="left" then
        local erBlokk = turtle.detectLeft()
        turtle.turnLeft()
        if erBlokk = true then
            turtle.dig()
        end
        turtle.forward()
        turtle.turnRight()
    end
    elseif where="backward" then
        local erBlokk = turtle.detect()
        if erBlokk = true then
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.dig()
        end
        turtle.forward()
        turtle.turnLeft()
        turtle.turnLeft()
    end
    elseif where="forward" then
        local erBlokk = turtle.detect()
        if erBlokk = true then
            turtle.dig()
        end
            turtle.forward()
    end
    elseif where="up" then
        local erBlokk = turtle.detectUp()
        if erBlokk = true then
            turtle.digUp()
        end
        turtle.up()
    end
    elseif where="down" then
        local erBlokk = turtle.detectDown()
        if erBlokk = true then
            turtle.digDown()
        end
        turtle.down()
    end
end

function dig(where)
    if where="right" then
        local erBlokk = turtle.detectRight()
        turtle.turnRight()
        if erBlokk = true then
            turtle.dig()
        end
        turtle.turnLeft()
    end
    elseif where="left" then
        local erBlokk = turtle.detectLeft()
        turtle.turnLeft()
        if erBlokk = true then
            turtle.dig()
        end
        turtle.turnRight()
    end
    elseif where="backward" then
        local erBlokk = turtle.detect()
        if erBlokk = true then
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.dig()
        end
        turtle.turnLeft()
        turtle.turnLeft()
    end
    elseif where="forward" then
        local erBlokk = turtle.detect()
        if erBlokk = true then
            turtle.dig()
        end
    end
    elseif where="up" then
        local erBlokk = turtle.detectUp()
        if erBlokk = true then
            turtle.digUp()
        end
    end
    elseif where="down" then
        local erBlokk = turtle.detectDown()
        if erBlokk = true then
            turtle.digDown()
        end
    end
end

    
widthDig(width, where)

    if where="right" then
        for i=0, width, do
            digMove("right");
        end
    end
    if where="left" then
        for i=0, width, do
            digMove("left");
        end
    end
    if where="forward" then
        for i=0, width, do
            digMove("forward");
        end
    end
    if where="backward" then
        for i=0, width, do
            digMove("backward");
        end
    end
    if where="up" then
        for i=0, width, do
            digMove("up");
        end
    end
    if where="down" then
        for i=0, width, do
            digMove("down");
        end
    end

end


