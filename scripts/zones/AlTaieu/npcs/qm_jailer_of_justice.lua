-----------------------------------
-- Area: Al'Taieu
--  NPC: qm_jailer_of_justice (???)
-- Allows players to spawn the Jailer of Justice by trading the Second Virtue, Deed of Moderation, and HQ Xzomit Organ to a ???.
-- !pos , -278 0 -463
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    -- JAILER OF JUSTICE
    if
        (not GetMobByID(ID.mob.JAILER_OF_JUSTICE):isSpawned() and
        trade:hasItemQty(xi.items.SECOND_VIRTUE, 1) and
        trade:hasItemQty(xi.items.DEED_OF_MODERATION, 1) and
        trade:hasItemQty(xi.items.HIGH_QUALITY_XZOMIT_ORGAN, 1) and
        trade:getItemCount() == 3 and
        npcUtil.popFromQM(player, npc, { ID.mob.JAILER_OF_JUSTICE }, { claim = true }))
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
