-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Macchi Gazlitah
-- TODO: Add support for occasional stock.
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.JUG_OF_ULEGUERAND_MILK,       100,
        xi.items.WEDGE_OF_CHALAIMBILLE,        250,
        xi.items.JUG_OF_WORMY_BROTH,          100,
        --[[
        xi.items.CHEESE_SANDWICH,              800,
        xi.items.SERVING_OF_BAVAROIS,         3360,
        xi.items.CREAM_PUFF,                  1300,
        xi.items.BUFFALO_MILK_CASE,            5000,
        xi.items.SLICE_OF_BUFFALO_MEAT,       1280,
        xi.items.SCROLL_OF_ENFIRE_II,        31878,
        xi.items.SCROLL_OF_ENBLIZZARD_II,    30492,
        xi.items.SCROLL_OF_ENAERO_II,        27968,
        xi.items.SCROLL_OF_ENSTONE_II,       26112,
        xi.items.SCROLL_OF_ENTHUNDER_II,     25600,
        xi.items.SCROLL_OF_ENWATER_II,       33000,
        xi.items.SCROLL_OF_REFRESH_II,      150000,
        --]]
    }

    player:showText(npc, ID.text.MACCHI_GAZLITAH_SHOP_DIALOG1)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
