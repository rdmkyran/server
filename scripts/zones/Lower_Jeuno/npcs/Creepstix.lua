-----------------------------------
-- Area: Lower Jeuno
--  NPC: Creepstix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_GOBLIN_GAVOTTE,    8160,
        xi.items.SCROLL_OF_PROTECTRA_II,      7074,
        xi.items.SCROLL_OF_SHELLRA,           1700,
        xi.items.SCROLL_OF_GAIN_VIT,         73740,
        xi.items.SCROLL_OF_GAIN_MND,         77500,
        xi.items.SCROLL_OF_GAIN_AGI,         85680,
        xi.items.SCROLL_OF_GAIN_CHR,         81900,
        xi.items.SCROLL_OF_BOOST_VIT,        73740,
        xi.items.SCROLL_OF_BOOST_MND,        77500,
        xi.items.SCROLL_OF_BOOST_AGI,        85680,
        xi.items.SCROLL_OF_BOOST_CHR,        81900,
        xi.items.SCROLL_OF_ADDLE,           130378,
    }

    player:showText(npc, ID.text.JUNK_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
