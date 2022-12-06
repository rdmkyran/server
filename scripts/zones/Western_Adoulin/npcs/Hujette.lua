-----------------------------------
-- Area: Western Adoulin
--  NPC: Hujette
-- Type: Quest NPC and Shop NPC
-- Involved with Quest: 'All the Way to the Bank'
-- !pos 35 0 -56 256
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/utils")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- ALL THE WAY TO THE BANK
    if player:hasKeyItem(xi.ki.TARUTARU_SAUCE_INVOICE) then
        local paidHujette = utils.mask.getBit(player:getCharVar("ATWTTB_Payments"), 1)
        if not paidHujette and npcUtil.tradeHas(trade, { { "gil", 3000 } }) then
            player:startEvent(5070)
        end
    end
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.HUJETTE_SHOP_TEXT)
    local stock =
    {
        xi.items.BAR_OF_CAMPFIRE_CHOCOLATE, 20,
        xi.items.TRAIL_COOKIE,              8,
        xi.items.PIECE_OF_CASCADE_CANDY,    20,
        xi.items.CHOCOLATE_CREPE,           544,
        xi.items.CONE_OF_SNOLL_GELATO,      3000,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- ALL THE WAY TO THE BANK
    if csid == 5070 then
        player:confirmTrade()
        player:setCharVar("ATWTTB_Payments", utils.mask.setBit(player:getCharVar("ATWTTB_Payments"), 2, true))
        if utils.mask.isFull(player:getCharVar("ATWTTB_Payments"), 5) then
            npcUtil.giveKeyItem(player, xi.ki.TARUTARU_SAUCE_RECEIPT)
        end
    end
end

return entity
