-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Thadiene
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BOOMERANG,                  1575, 1,
        xi.items.GREAT_BOW,                 19630, 1,
        xi.items.SILVER_ARROW,                 16, 1,
        xi.items.WRAPPED_BOW,                7128, 1,
        xi.items.CROSSBOW_BOLT,                 5, 2,
        xi.items.FIRE_ARROW,                  126, 2,
        xi.items.IRON_ARROW,                    7, 2,
        xi.items.SELF_BOW,                    482, 2,
        xi.items.LONGBOW,                     442, 3,
        xi.items.SHORTBOW,                     38, 3,
        xi.items.WOODEN_ARROW,                  3, 3,
        xi.items.SCROLL_OF_BATTLEFIELD_ELEGY,   4320, 3,
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
