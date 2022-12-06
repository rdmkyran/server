-----------------------------------
-- Area: Nashmau
--  NPC: Mamaroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_STUN,             27000,
        xi.items.SCROLL_OF_ENFIRE,            5160,
        xi.items.SCROLL_OF_ENBLIZZARD,        4098,
        xi.items.SCROLL_OF_ENAERO,            2500,
        xi.items.SCROLL_OF_ENSTONE,           2030,
        xi.items.SCROLL_OF_ENTHUNDER,         1515,
        xi.items.SCROLL_OF_ENWATER,           7074,
        xi.items.SCROLL_OF_SHOCK_SPIKES,      9000,
        xi.items.WHITE_PUPPET_TURBAN,        29950,
        xi.items.BLACK_PUPPET_TURBAN,        29950,
        xi.items.SCROLL_OF_ENLIGHT,         100800,
        xi.items.SCROLL_OF_ENDARK,          100800,
    }

    player:showText(npc, ID.text.MAMAROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
