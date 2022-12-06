-----------------------------------
-- Area: Southern San dOria
--  NPC: Shilah
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.PLATE_OF_MUSHROOM_RISOTTO, 4500, 1,
        xi.items.BOWL_OF_MUSHROOM_SOUP,     6300, 1,
        xi.items.POT_OF_SAN_DORIAN_TEA,     2494, 1,
        xi.items.LOAF_OF_WHITE_BREAD,        180, 2,
        xi.items.BOWL_OF_DELICIOUS_PULS,    1080, 2,
        xi.items.BOWL_OF_VEGETABLE_SOUP,    1355, 2,
        xi.items.SERVING_OF_BEAUGREEN_SAUTE, 1669, 2,
        xi.items.BOTTLE_OF_GRAPE_JUICE,      837, 2,
        xi.items.LOAF_OF_BLACK_BREAD,        108, 3,
        xi.items.BOWL_OF_PULS,               540, 3,
        xi.items.BOWL_OF_PEBBLE_SOUP,        180, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
        xi.items.BUNCH_OF_ROYAL_GRAPES,     1260, 3,
    }

    player:showText(npc, ID.text.SHILAH_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
