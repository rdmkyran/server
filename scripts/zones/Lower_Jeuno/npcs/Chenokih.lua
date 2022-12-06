-----------------------------------
-- Area: Lower Jeuno
--  NPC: Chenokih
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.HOSE,                      24500,
        xi.items.LINEN_SLACKS,              22632,
        xi.items.WOOL_HOSE,                 57600,
        xi.items.WOOL_SLOPS,                14756,
        xi.items.BLACK_SLACKS,               6348,
        xi.items.SOCKS,                     16000,
        xi.items.SHOES,                     14352,
        xi.items.WOOL_SOCKS,                35200,
        xi.items.CHESTNUT_SABOTS,            9180,
        xi.items.SANDALS,                    4128,
        xi.items.BLACK_CAPE,                11088,
        xi.items.SCARLET_RIBBON,             1250,
    }

    player:showText(npc, ID.text.ORTHONS_GARMENT_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
