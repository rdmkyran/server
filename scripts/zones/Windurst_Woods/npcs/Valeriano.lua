-----------------------------------
-- Area: Windurst_Woods
--  NPC: Valeriano
-- Standard Merchant NPC
-- Working 100%
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
    player:showText(npc, ID.text.VALERIANO_SHOP_DIALOG)

    local stock =
    {
        xi.items.GINGER_COOKIE,                    10,
        xi.items.FLUTE,                           43,
        xi.items.PICCOLO,                        990,
        xi.items.SCROLL_OF_SCOPS_OPERETTA,        585,
        xi.items.SCROLL_OF_PUPPETS_OPERETTA,    16920,
        xi.items.SCROLL_OF_FOWL_AUBADE,          2916,
        xi.items.SCROLL_OF_ADVANCING_MARCH,      2059,
        xi.items.SCROLL_OF_GODDESSS_HYMNUS,     90000,
        xi.items.SCROLL_OF_FIRE_CAROL_II,       32844,
        xi.items.SCROLL_OF_WIND_CAROL_II,       30912,
        xi.items.SCROLL_OF_EARTH_CAROL_II,      27140,
        xi.items.SCROLL_OF_WATER_CAROL_II,      28520,
        xi.items.SCROLL_OF_MAGES_BALLAD_III,    123880
    }
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
