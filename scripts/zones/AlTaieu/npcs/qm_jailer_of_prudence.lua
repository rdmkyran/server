-----------------------------------
-- Area: Al'Taieu
--  NPC: qm_jailer_of_prudence (???)
-- Allows players to spawn the Jailer of Prudence by trading the Third Virtue, Deed of Sensibility, and High-Quality Hpemde Organ to a ???.
-- !pos , 706 -1 22
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- JAILER OF PRUDENCE
    if
        not GetMobByID(ID.mob.JAILER_OF_PRUDENCE_1):isSpawned() and
        not GetMobByID(ID.mob.JAILER_OF_PRUDENCE_2):isSpawned() and
        trade:hasItemQty(xi.items.THIRD_VIRTUE, 1) and
        trade:hasItemQty(xi.items.DEED_OF_SENSIBILITY, 1) and
        trade:hasItemQty(xi.items.HIGH_QUALITY_HPEMDE_ORGAN, 1) and
        trade:getItemCount() == 3 and
        npcUtil.popFromQM(player, npc, { ID.mob.JAILER_OF_PRUDENCE_1, ID.mob.JAILER_OF_PRUDENCE_2 }, { claim = true })
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
