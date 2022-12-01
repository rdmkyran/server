-----------------------------------
-- Area: Al'Taieu
--  NPC: qm_jailer_of_love (???)
-- Allows players to spawn the Jailer of Love by trading the Fourth Virtue, Fifth Virtue and Sixth Virtue to a ???.
-- Allows players to spawn Absolute Virtue by killing Jailer of Love.
-- !pos , 431 -0 -603
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- JAILER OF LOVE
    if
        (not GetMobByID(ID.mob.JAILER_OF_LOVE):isSpawned() and
        not GetMobByID(ID.mob.ABSOLUTE_VIRTUE):isSpawned() and
        trade:hasItemQty(xi.items.FOURTH_VIRTUE, 1) and
        trade:hasItemQty(xi.items.FIFTH_VIRTUE, 1) and
        trade:hasItemQty(xi.items.SIXTH_VIRTUE, 1) and
        trade:getItemCount() == 3 and
        npcUtil.popFromQM(player, npc, { ID.mob.JAILER_OF_LOVE }, { claim = true }))
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
