-----------------------------------
-- Area: Lower Jeuno
--  NPC: Chetak
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
        xi.items.RED_CAP,                   20000,
        xi.items.WOOL_CAP,                  45760,
        xi.items.WOOL_HAT,                  11166,
        xi.items.GAMBISON,                  32500,
        xi.items.CLOAK,                     33212,
        xi.items.WOOL_GAMBISON,             68640,
        xi.items.WOOL_ROBE,                 18088,
        xi.items.BLACK_TUNIC,                9527,
        xi.items.BRACERS,                   16900,
        xi.items.LINEN_MITTS,               15732,
        xi.items.WOOL_CUFFS,                10234,
        xi.items.WHITE_MITTS,                4443,
    }

    player:showText(npc, ID.text.ORTHONS_GARMENT_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
