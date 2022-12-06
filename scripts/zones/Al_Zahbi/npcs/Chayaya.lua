-----------------------------------
-- Area: Al Zahbi
--  NPC: Chayaya
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.DART,                         10,
        xi.items.HAWKEYE,                      60,
        xi.items.GRENADE,                    1204,
        xi.items.IRON_ARROW,                    8,
        xi.items.WARRIOR_DIE,                68000,
        xi.items.MONK_DIE,                   22400,
        xi.items.WHITE_MAGE_DIE,              5000,
        xi.items.BLACK_MAGE_DIE,            108000,
        xi.items.RED_MAGE_DIE,               62000,
        xi.items.THIEF_DIE,                  50400,
        xi.items.PALADIN_DIE,                90750,
        xi.items.DARK_KNIGHT_DIE,             2205,
        xi.items.BEASTMASTER_DIE,            26600,
        xi.items.BARD_DIE,                   12780,
        xi.items.RANGER_DIE,                  1300,
        xi.items.DANCER_DIE,                 63375,
        xi.items.SCHOLAR_DIE,                68250
    }

    player:showText(npc, ID.text.CHAYAYA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
