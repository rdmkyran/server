-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Tavourine
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.MYTHRIL_CLAYMORE,          37800, 1,
        xi.items.KNIFE,                      2182, 1,
        xi.items.ROD,                        2386, 1,
        xi.items.BRONZE_AXE,                  284, 2,
        xi.items.BRONZE_KNIFE,                147, 2,
        xi.items.BRASS_ROD,                   621, 2,
        xi.items.CLAYMORE,                   2448, 2,
        xi.items.MACE,                       4363, 2,
        xi.items.BRONZE_ROD,                   90, 3,
        xi.items.BRONZE_MACE,                 169, 3,
        xi.items.LANCE,                     16578, 3,
    }

    player:showText(npc, ID.text.TAVOURINE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
