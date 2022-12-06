-----------------------------------
-- Area: Western Adoulin
--  NPC: Tevigogo
-- Type: Shop NPC
-- !pos -151 3 -36 256
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
    player:showText(npc, ID.text.TEVIGOGO_SHOP_TEXT)
    local stock =
    {
        xi.items.PICKAXE,                   200,
        xi.items.HATCHET,                   500,
        xi.items.SICKLE,                    300,
        xi.items.DART,                      10,
        xi.items.HAWKEYE,                   60,
        xi.items.IRON_ARROW,                8,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
