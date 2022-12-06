-----------------------------------
-- Area: Bastok Mines
--  NPC: Griselda
-- Standard Merchant NPC
-- !pos -25.749 -0.044 52.360 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BOTTLE_OF_PINEAPPLE_JUICE, 360, 1,
        xi.items.BRETZEL,                    21, 2,
        xi.items.PICKLED_HERRING,           432, 2,
        xi.items.BOTTLE_OF_MELON_JUICE,     990, 2,
        xi.items.LOAF_OF_IRON_BREAD,         90, 3,
        xi.items.STRIP_OF_MEAT_JERKY,       108, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,   10, 3,
    }

    player:showText(npc, ID.text.GRISELDA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
