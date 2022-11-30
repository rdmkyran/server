-----------------------------------
-- Area: Al'Taieu
--  NPC: qm_jailer_of_hope (???)
-- Allows players to spawn the Jailer of Hope by trading the First Virtue, Deed of Placidity and HQ Phuabo Organ to a ???.
-- !pos -693 -1 -62 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- JAILER OF HOPE
    if
        not GetMobByID(ID.mob.JAILER_OF_HOPE):isSpawned() and
        trade:hasItemQty(xi.items.FIRST_VIRTUE, 1) and
        trade:hasItemQty(xi.items.DEED_OF_PLACIDITY, 1) and
        trade:hasItemQty(xi.items.HIGH_QUALITY_PHUABO_ORGAN, 1) and
        trade:getItemCount() == 3 and
        npcUtil.popFromQM(player, npc, { ID.mob.JAILER_OF_HOPE }, { claim = true })
    then
        player:tradeComplete()
    end
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
