-----------------------------------
-- Area: The Colosseum
--  NPC: Zandjarl
-- Type: Pankration NPC
-- !pos -599 0 45 71
-----------------------------------
local ID = require("scripts/zones/The_Colosseum/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local result = nil
    local count = trade:getItemCount()
    local total = player:getCurrency("jetton")
    local max = 100000000

    if trade:hasItemQty(xi.items.IMPERIAL_BRONZE_PIECE, count) then
        result = 2 * count
    elseif trade:hasItemQty(xi.items.IMPERIAL_SILVER_PIECE, count) then
        result = 10 * count
    elseif trade:hasItemQty(xi.items.IMPERIAL_MYTHRIL_PIECE, count) then
        result = 30 * count
    elseif trade:hasItemQty(xi.items.IMPERIAL_GOLD_PIECE, count) then
        result = 200 * count
    end

    if result ~= nil then
        if (result + total) > max then
            -- player:startEvent(47); ..it no work..
            npc:showText(npc, ID.text.EXCEED_THE_LIMIT_OF_JETTONS)
        else
            -- packet cap says its a "showText" thing..
            npc:showText(npc, ID.text.I_CAN_GIVE_YOU, result)
            npc:showText(npc, ID.text.THANKS_FOR_STOPPING_BY)
            player:addCurrency("jetton", result)
            player:tradeComplete()
        end
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(1900, player:getCurrency("jetton"))
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 1900 then -- onTrigger
        local shop =
        {
            -- TODO: Bitwise math here on option
            [1] =      { itemID = xi.items.SOULTRAPPER, price = 2,    QTY =  1 },
            [257] =    { itemID = xi.items.SOULTRAPPER_2000, price = 500,  QTY =  1 },
            [513] =    { itemID = xi.items.ZORAAL_JAS_HELM, price = 5000, QTY =  1 },
            [65537] =  { itemID = xi.items.BLANK_SOUL_PLATE, price = 2,    QTY = 12 },
            [65793] =  { itemID = xi.items.BLANK_HIGH_SPEED_SOUL_PLATE, price = 500,  QTY = 12 },
            [66049] =  { itemID = xi.items.DARTORGORS_COIF, price = 5000, QTY =  1 },
            [131585] = { itemID = xi.items.LAMIA_NO3S_GARLAND, price = 5000, QTY =  1 },
            [197121] = { itemID = xi.items.CACAROONS_HOOD, price = 5000, QTY =  1 },
        }

        local result = shop[option]
        if result ~= nil then
            if result.itemID ~= nil then
                if player:addItem(result.itemID, result.QTY) then
                    player:delCurrency("jetton", result.price)
                    player:messageSpecial(ID.text.ITEM_OBTAINED, result.itemID)
                else
                    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, result.itemID)
                end
            end
        end
    end
end

return entity
