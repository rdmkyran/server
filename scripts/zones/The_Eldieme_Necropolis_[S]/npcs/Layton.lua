-----------------------------------
-- Area: The Eldieme Necropolis (S)
--  NPC: Layton
-- Type: Standard Merchant NPC
-- Note: Available during Campaign battles
-- !pos 382.679 -39.999 3.541 175
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis_[S]/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FIRESTORM_SCHEMA,           8060,
        xi.items.RAINSTORM_SCHEMA,           6318,
        xi.items.THUNDERSTORM_SCHEMA,        9100,
        xi.items.HAILSTORM_SCHEMA,           8580,
        xi.items.SANDSTORM_SCHEMA,           5200,
        xi.items.WINDSTORM_SCHEMA,           6786,
        xi.items.AURORASTORM_SCHEMA,        11440,
        xi.items.VOIDSTORM_SCHEMA,          10725,
        xi.items.PYROHELIX_SCHEMA,           7714,
        xi.items.HYDROHELIX_SCHEMA,          6786,
        xi.items.IONOHELIX_SCHEMA,           8625,
        xi.items.CRYOHELIX_SCHEMA,           7896,
        xi.items.GEOHELIX_SCHEMA,            6591,
        xi.items.ANEMOHELIX_SCHEMA,          6981,
        xi.items.LUMINOHELIX_SCHEMA,         8940,
        xi.items.NOCTOHELIX_SCHEMA,          8790,
    }

    player:showText(npc, ID.text.LAYTON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
