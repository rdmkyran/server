-----------------------------------
-- Area: Windurst Waters
--  NPC: Ness Rugetomal
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/items")
require("scripts/globals/shop")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.NESSRUGETOMALL_SHOP_DIALOG)

    local stock =
    {
        xi.items.GINGER_COOKIE,               10, 1,
        xi.items.CARP_SUSHI,                 727, 1,
        xi.items.BOTTLE_OF_TOMATO_JUICE,     323, 1,
        xi.items.NEBIMONITE_BAKE,           1656, 1,
        xi.items.CINNA_COOKIE,                14, 2,
        xi.items.BOTTLE_OF_ORANGE_JUICE,     184, 2,
        xi.items.BOILED_CRAB,               2070, 2,
        xi.items.ACORN_COOKIE,                21, 3,
        xi.items.STRIP_OF_MEAT_JERKY,        108, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
        xi.items.ROAST_PIPIRA,               846, 3,
    }

    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
