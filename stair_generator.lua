---@diagnostic disable: undefined-global
-- Global variables
local isEpic = false
local width = 0
local height = 0

local function funnyDig()
    if isBlock() then
        local whatBlock = scan()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
        pickUp(whatBlock, isEpic)
    end
end



local function digMove(where)
    -- LEFT
    if where == "left" then
        turtle.turnLeft()
        funnyDig()
        turtle.turnRight() 
    -- RIGHT
    elseif where == "right" then
        turtle.turnRight()
        funnyDig()
        turtle.turnLeft()
    -- UP
    elseif where == "up" then
        if isBlockUp() then
            local whatBlock = scanUp()
            turtle.digUp()
            pickUp(whatBlock, isEpic)
        end
        turtle.up()
    end
    -- DOWN
    if where == "down" then
        if isBlockDown() then
            local whatBlock = scanDown()
            turtle.digDown()
            pickUp(whatBlock, isEpic)
        end
        turtle.down()
    end
    -- FORWARD
    if where == "forward" then
        funnyDig()
    end
    -- BACKWARD
    if where == "backward" then
        turtle.turnLeft()
        turtle.turnLeft()
        funnyDig()
        turtle.turnLeft()
        turtle.turnLeft()
    end
end

local function refuelScan()
    for i=1, 16 do
        turtle.select(i)
        local id, count, damage = turtle.getItemDetail()
        if id.name == "minecraft:coal" or id.name == "minecraft:charcoal" or id.name == "minecraft:lava_bucket" then
            turtle.refuel()
            print("Refilling fuel")
            return true
        elseif turtle.getSelectedSlot() == 16 then
            print("No more fuel available. Ending program")
            return false
        end
    end
end

local function scan()
    local success, data = turtle.inspect()
    return data.name
end
local function scanUp()
    local success, data = turtle.inspectUp()
    return data.name
end
local function scanDown()
    local success, data = turtle.inspectDown()
    return data.name
end

local function widthDig(width, where)
    if where == "right" then
        for i=1, width do
            digMove("right")
        end
        turtle.down()
        digMove("forward")
        for i=1, width do
            digMove("left")
        end
        turtle.down()
        digMove("forward")
    elseif where == "left" then
        for i=1, width do
            digMove("left")
        end
        turtle.down()
        digMove("forward")
        for i=1, width do
            digMove("right")
        end
        turtle.down()
        digMove("forward")
    end
end


--isEpic: only valuables
local function pickUp(name, epic)
    if name == "minecraft:stone" or name == "minecraft:cobblestone" or name == "minecraft:dirt" or name == "minecraft:gravel" or name == "minecraft:sand" or name == "minecraft:sandstone" or name == "minecraft:clay" or name == "minecraft:mossy_cobblestone" or name == "minecraft:granite" or name == "minecraft:diorite" or name == "minecraft:andesite" or name == "minecraft:coarse_dirt" or name == "minecraft:podzol" or name == "minecraft:grass_block" or name == "minecraft:stone_bricks" or name == "minecraft:magma_block" or name == "minecraft:obsidian" or name == "minecraft:water" or name == "minecraft:lava" then
        if epic then
            return false
        elseif not epic then
            turtle.suck()
            turtle.suckUp()
            turtle.suckDown()
            return true
    -- if the block is anything else, we will pick it up anyway:
        else
            turtle.suck()
            turtle.suckUp()
            turtle.suckDown()
            return true
        end
    end
end

local function isBlock()
    return turtle.detect()
end
local function isBlockUp()
    return turtle.detectUp()
end
local function isBlockDown()
    return turtle.detectDown()
end

local function funnyDig()
    if isBlock() then
        local whatBlock = scan()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
        pickUp(whatBlock, isEpic)
    end
end



local function digMove(where)
    -- LEFT
    if where == "left" then
        turtle.turnLeft()
        funnyDig()
        turtle.turnRight() 
    -- RIGHT
    elseif where == "right" then
        turtle.turnRight()
        funnyDig()
        turtle.turnLeft()
    -- UP
    elseif where == "up" then
        if isBlockUp() then
            local whatBlock = scanUp()
            turtle.digUp()
            pickUp(whatBlock, isEpic)
        end
        turtle.up()
    end
    -- DOWN
    if where == "down" then
        if isBlockDown() then
            local whatBlock = scanDown()
            turtle.digDown()
            pickUp(whatBlock, isEpic)
        end
        turtle.down()
    end
    -- FORWARD
    if where == "forward" then
        funnyDig()
    end
    -- BACKWARD
    if where == "backward" then
        turtle.turnLeft()
        turtle.turnLeft()
        funnyDig()
        turtle.turnLeft()
        turtle.turnLeft()
    end
end

local function program()
    print("Go right or left? ( write'right'/'left')")
    local where = read()
    if where == "left" then
        for k=1, height do
            widthDig(width, "left")
        end
    elseif where == "right" then
        for j=1, height do
            widthDig(width, "right")
        end
    else
        print("Please write either 'left' or 'right'")
    end
end

local function start()
    print("Hello, fella!")
    print("How WIDE do you want these stairs?")
    width = tonumber(read())
    if type(width) ~= "number" then
        print("Please write me a valid number, my fella :(")
        --(re)
        start()
    end
    print("You chose: ", width)
    print("How deep shall i go?")
    height = tonumber(read())
    if type(height) ~= "number" then
        print("Please write me a valid number, my fella :(")
        --(re)
        start()
    end
    print("You chose: ", height)
    print("You are chosen:")
    print("Width: ", width, " blocks,")
    print("Height: ", height, " blocks,")
    print(" ")
    print("Press 'y' + ENTER to confirm")
    local confirmation = read()
    if confirmation ~= "y" then
        --(re)
        start()
    else
        refuelScan()
        if turtle.getFuelLevel() == 0 then
            print("The machine will not start without (char)coal/lava.")
            print("Please place this in any slot.")
            local y = 0
            while y == 0 do
                refuelScan()
                if refuelScan() then
                    y = 1
                end
            end
        end
        program()
    end
end





-- The program:

start()
