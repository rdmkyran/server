-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Justi
-- Conquest depending furniture seller
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.DRESSER,                   170726, 1,
        xi.items.CABINET,                    69888, 1,
        xi.items.CHIFFONIER,                 57333, 1,
        xi.items.COFFER,                     35272, 2,
        xi.items.SPOOL_OF_BUNDLING_TWINE,     92, 3,
        xi.items.WATER_CASK,                   518, 3,
        xi.items.CUPBOARD,                   15881, 3,
        xi.items.OAK_TABLE,                 129168, 3,
        xi.items.ARMOR_BOX,                   8376, 3,
    }

    player:showText(npc, ID.text.JUSTI_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
