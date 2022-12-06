-----------------------------------
-- Area: Nashmau
--  NPC: Wata Khamazom
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SHORTBOW,                     44,
        xi.items.SELF_BOW,                    536,
        xi.items.WRAPPED_BOW,                7920,
        xi.items.LONGBOW,                     492,
        xi.items.GREAT_BOW,                 21812,
        xi.items.WOODEN_ARROW,                  4,
        xi.items.IRON_ARROW,                    8,
        xi.items.SILVER_ARROW,                 18,
        xi.items.FIRE_ARROW,                  140,
        xi.items.CROSSBOW_BOLT,                 6,
        xi.items.THROWING_TOMAHAWK,           248,
    }

    player:showText(npc, ID.text.WATAKHAMAZOM_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
