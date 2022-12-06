-----------------------------------
-- Area: Mhaura
--  NPC: Tya Padolih
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
        xi.items.SCROLL_OF_REGEN,            4147,
        xi.items.SCROLL_OF_REGEN_II,         7516,
        xi.items.SCROLL_OF_SLEEPGA,         10752,
        xi.items.SCROLL_OF_BARAMNESIA,      29030,
        xi.items.SCROLL_OF_BARAMNESRA,      29030,
        xi.items.SCROLL_OF_INVISIBLE,        5523,
        xi.items.SCROLL_OF_SNEAK,            2400,
        xi.items.SCROLL_OF_DEODORIZE,        1243,
        xi.items.SCROLL_OF_DISTRACT,        18032,
        xi.items.SCROLL_OF_FRAZZLE,         25038,
    }

    player:showText(npc, ID.text.TYAPADOLIH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
