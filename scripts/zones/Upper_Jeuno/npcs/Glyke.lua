-----------------------------------
-- Area: Upper Jeuno
--  NPC: Glyke
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LOAF_OF_IRON_BREAD,          92,
        xi.items.TORTILLA,                   128,
        xi.items.LOAF_OF_WHITE_BREAD,        184,
        xi.items.BOWL_OF_PEA_SOUP,          1400,
        xi.items.BOILED_CRAB,               2070,
        xi.items.SLICE_OF_ROAST_MUTTON,      662,
        xi.items.BAKED_APPLE,                440,
        xi.items.WINDURST_SALAD,            1711,
        xi.items.SERVING_OF_HERB_QUUS,      4585,
        xi.items.BOTTLE_OF_ORANGE_JUICE,     184,
        xi.items.BOTTLE_OF_APPLE_JUICE,      276,
        xi.items.BOTTLE_OF_PINEAPPLE_JUICE,  368,
        xi.items.BOTTLE_OF_MELON_JUICE,     1012,
        xi.items.BOTTLE_OF_GRAPE_JUICE,      855,
    }

    player:showText(npc, ID.text.GLYKE_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
