-----------------------------------
-- Area: Upper Jeuno
--  NPC: Khe Chalahko
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SALLET,                    29311,
        xi.items.BREASTPLATE,               45208,
        xi.items.CUISSES,                   34776,
        xi.items.PLATE_LEGGINGS,            21859,
        xi.items.BREECHES,                  53130,
        xi.items.SOLLERETS,                 32637,
    }

    player:showText(npc, ID.text.DURABLE_SHIELDS_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
