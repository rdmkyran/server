-----------------------------------
-- Area: Port Windurst
--  NPC: Kucha Malkobhi
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.TARUTARU_KAFTAN,           273,
        xi.items.TARUTARU_MITTS,            163,
        xi.items.TARUTARU_BRACCAE,          236,
        xi.items.TARUTARU_CLOMPS,           163,
        xi.items.MITHRAN_SEPARATES,         273,
        xi.items.MITHRAN_GAUNTLETS,         163,
        xi.items.MITHRAN_LOINCLOTH,         236,
        xi.items.MITHRAN_GAITERS,           163,
    }

    player:showText(npc, ID.text.KUCHAMALKOBHI_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
