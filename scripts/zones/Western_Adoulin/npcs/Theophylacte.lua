-----------------------------------
-- Area: Western Adoulin
--  NPC: Theophylacte
-- Type: Shop NPC
-- !pos 154 4 -33 256
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/items")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Standard shop
    player:showText(npc, ID.text.THEOPHYLACTE_SHOP_TEXT)
    local stock =
    {
        xi.items.POTION,                    910,
        xi.items.HI_POTION,                 4500,
        xi.items.ETHER,                     4832,
        xi.items.HI_ETHER,                  28000,
        xi.items.ANTIDOTE,                  316,
        xi.items.FLASK_OF_ECHO_DROPS,       800,
        xi.items.REMEDY,                    3360,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
