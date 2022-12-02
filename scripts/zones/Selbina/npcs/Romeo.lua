-----------------------------------
-- Area: Selbina
--  NPC: Romeo
-- Starts and Finishes Quest: Donate to Recycling
-- !pos -11 -11 -6 248
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/items")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.DONATE_TO_RECYCLING) == QUEST_ACCEPTED and
        (
            npcUtil.tradeHas(trade, { { xi.items.ONION_DAGGER, 5 } }) or
            npcUtil.tradeHas(trade, { { xi.items.ONION_KNIFE, 5 } }) or
            npcUtil.tradeHas(trade, { { xi.items.ONION_SWORD, 5 } }) or
            npcUtil.tradeHas(trade, { { xi.items.ONION_ROD, 5 } }) or
            npcUtil.tradeHas(trade, { { xi.items.ONION_STAFF, 5 } })
        )
    then
        player:startEvent(21) -- Finish quest "Donate to Recycling"
    end
end

entity.onTrigger = function(player, npc)
    local donateToRecycling = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.DONATE_TO_RECYCLING)

    if donateToRecycling == QUEST_AVAILABLE then
        player:startEvent(20) -- Start quest "Donate to Recycling"
    elseif donateToRecycling == QUEST_ACCEPTED then
        player:startEvent(22) -- During quest "Donate to Recycling"
    else
        player:startEvent(23) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 20 then
        player:addQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.DONATE_TO_RECYCLING)
    elseif
        csid == 21 and
        npcUtil.completeQuest(player, xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.DONATE_TO_RECYCLING, { item = xi.items.WASTEBASKET, fame_area = xi.quest.fame_area.SELBINA_RABAO, title = xi.title.ECOLOGIST })
    then
        player:confirmTrade()
    end
end

return entity
