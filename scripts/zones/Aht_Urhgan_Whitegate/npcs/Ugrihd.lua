-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ugrihd
-- Coin Exchange Vendor
-- !pos -63.079 -6 -28.571 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------
require("scripts/globals/besieged")
require("scripts/globals/status")
-----------------------------------
local entity = {}

local ImperialPieces =
{
    [1] = -- Imperial Bronze Piece
    {
        item = xi.items.IMPERIAL_BRONZE_PIECE,
        price = 20
    },
    [2] = -- Imperial Silver Piece
    {
        item = xi.items.IMPERIAL_SILVER_PIECE,
        price = 100
    },
    [3] = -- Imperial Mythril Piece
    {
        item = xi.items.IMPERIAL_MYTHRIL_PIECE,
        price = 200
    },
    [4] = -- Imperial Gold Piece
    {
        item = xi.items.IMPERIAL_GOLD_PIECE,
        price = 1000
    }
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local points = player:getCurrency("imperial_standing")
    local rank   = xi.besieged.getMercenaryRank(player)
    local badge  = 0
    if rank > 0 then
        badge = xi.besieged.badges[rank]
    end

    player:startEvent(150, rank, badge, points, 0, 0, 0, 0, 0, 0)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 150 and option < 0x40000000 and option > 255 then
        local coinType  = bit.band(option, 0xFF)
        local quantity  = bit.rshift(option, 0x8)
        local stacks    = math.floor(quantity / 99)
        local remainder = quantity % 99
        local item      = ImperialPieces[coinType].item
        local price     = ImperialPieces[coinType].price

        if player:getCurrency("imperial_standing") < quantity * price then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
            return
        end

        local slotsNeeded = stacks
        if remainder > 0 then
            slotsNeeded = slotsNeeded + 1
        end

        if player:getFreeSlotsCount() < slotsNeeded then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
            return
        end

        for i = 1, stacks do
            player:addItem(item, 99)
        end

        if remainder > 0 then
            player:addItem(item, remainder)
        end

        player:delCurrency("imperial_standing", quantity * price)
        npc:showText(npc, ID.text.UGRIHD_PURCHASE_DIALOGUE)
        player:messageSpecial(ID.text.ITEM_OBTAINED, item)
    end
end

return entity
