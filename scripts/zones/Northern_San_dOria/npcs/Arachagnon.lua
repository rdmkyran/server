-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arachagnon
-- Standard Merchant NPC
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
        xi.items.ELVAAN_JERKIN,             270,
        xi.items.ELVAAN_BODICE,             270,
        xi.items.ELVAAN_GLOVES,             162,
        xi.items.ELVAAN_GAUNTLETS,          162,
        xi.items.ELVAAN_M_CHAUSSES,         234,
        xi.items.ELVAAN_F_CHAUSSES,         234,
        xi.items.ELVAAN_M_LEDELSENS,        162,
        xi.items.ELVAAN_F_LEDELSENS,        162,
    }

    player:showText(npc, ID.text.ARACHAGNON_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
