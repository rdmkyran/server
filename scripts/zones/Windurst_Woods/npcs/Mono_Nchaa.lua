-----------------------------------
-- Area: Windurst Woods
--  NPC: Mono Nchaa
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.WOODEN_ARROW,              3,    2,
        xi.items.BONE_ARROW,                4,    3,
        xi.items.ICE_ARROW,                 131,  2,
        xi.items.LIGHTNING_ARROW,           131,  2,
        xi.items.CROSSBOW_BOLT,             5,    3,
        xi.items.HAWKEYE,                   55,   2,
        xi.items.BOOMERANG,                 1645, 2,
        xi.items.SHORTBOW,                  45,   2,
        xi.items.SELF_BOW,                  503,  2,
        xi.items.WRAPPED_BOW,               7444, 2,
        xi.items.LIGHT_CROSSBOW,            165,  2,
        xi.items.SCROLL_OF_HUNTERS_PRELUDE,  2649, 3
    }

    player:showText(npc, ID.text.MONONCHAA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
