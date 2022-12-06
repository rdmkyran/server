-----------------------------------
-- Area: Port San d'Oria
--  NPC: Croumangue
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BOTTLE_OF_GRAPE_JUICE,      837, 1,
        xi.items.BOWL_OF_MUSHROOM_SOUP,     6300, 1,
        xi.items.ROAST_TROUT,                540, 1,
        xi.items.BOTTLE_OF_APPLE_JUICE,      270, 2,
        xi.items.ROAST_CARP,                 468, 2,
        xi.items.BOWL_OF_VEGETABLE_SOUP,    1355, 2,
        xi.items.LOAF_OF_WHITE_BREAD,        180, 2,
        xi.items.LOAF_OF_BLACK_BREAD,        108, 3,
        xi.items.BOILED_CRAYFISH,            360, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
        xi.items.BOWL_OF_PEBBLE_SOUP,        180, 3,
    }

    player:showText(npc, ID.text.CROUMANGUE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
