-----------------------------------
-- Area: Mhaura
--  NPC: Runito-Monito
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CAT_BAGHNAKHS,              106,
        xi.items.BRASS_BAGHNAKHS,           1554,
        xi.items.BRASS_DAGGER,               855,
        xi.items.BRONZE_ROD,                  92,
        xi.items.BRASS_ROD,                  634,
        xi.items.BRASS_XIPHOS,              3601,
        xi.items.CLAYMORE,                  2502,
        xi.items.BUTTERFLY_AXE,              618,
        xi.items.DART,                         9,
        xi.items.WOODEN_ARROW,                 3,
        xi.items.BONE_ARROW,                   4,
        xi.items.CROSSBOW_BOLT,                5,
    }

    player:showText(npc, ID.text.RUNITOMONITO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
