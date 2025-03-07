-----------------------------------
-- Area: Western Altepa Desert
--  NPC: ??? (Beastmen Treasure qm10/chest7)
-- !pos -670.697 -8.438 -677.751 125
-----------------------------------
local ID = zones[xi.zone.WESTERN_ALTEPA_DESERT]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    xi.bmt.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY, ID.npc.BEASTMEN_TREASURE)
end

entity.onTrade = function(player, npc, trade)
    xi.bmt.handleQmOnTrade(player, npc, trade, ID.npc.BEASTMEN_TREASURE)
end

entity.onEventFinish = function(player, csid)
    xi.bmt.handleQmOnEventFinish(player, csid)
end

return entity
