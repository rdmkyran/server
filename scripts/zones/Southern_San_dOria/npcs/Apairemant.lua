-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Apairemant
-- Gustaberg Regional Merchant
-- !pos 72 2 0 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.GUSTABERG) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.APAIREMANT_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.PINCH_OF_SULFUR,           703,
            xi.items.POPOTO,                      43,
            xi.items.BAG_OF_RYE_FLOUR,            36,
            xi.items.EGGPLANT,                   40,
        }

        player:showText(npc, ID.text.APAIREMANT_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
