-----------------------------------
-- Area: Port Bastok
--  NPC: Ilita
-- Linkshell Merchant
--   !pos -142 -1 -25 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.NEW_LINKSHELL,              6000,
    }

    player:showText(npc, ID.text.ILITA_SHOP_DIALOG, 513)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
