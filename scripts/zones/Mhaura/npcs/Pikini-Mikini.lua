-----------------------------------
-- Area: Mhaura
--  NPC: Pikini-Mikini
-- Standard Merchant NPC
-- !pos -48 -4 30 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FLASK_OF_EYE_DROPS,        2335,
        xi.items.ANTIDOTE,                   284,
        xi.items.FLASK_OF_ECHO_DROPS,        720,
        xi.items.POTION,                     819,
        xi.items.FLASK_OF_DISTILLED_WATER,    10,
        xi.items.SHEET_OF_PARCHMENT,         1821,
        xi.items.LUGWORM,                     9,
        xi.items.HATCHET,                    450,
        xi.items.STRIP_OF_MEAT_JERKY,        108,
        xi.items.DISH_OF_SALSA,              133,
        xi.items.MHAURA_WAYSTONE,           9000,
    }

    player:showText(npc, ID.text.PIKINIMIKINI_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
