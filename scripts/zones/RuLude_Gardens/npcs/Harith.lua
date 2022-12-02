-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Harith
-- !pos -4.349 1 134.014 243
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/items")
require("scripts/globals/missions")
local ID = require("scripts/zones/RuLude_Gardens/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    if player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) >= QUEST_ACCEPTED then
        local count = trade:getItemCount()
        local reward = xi.items.NONE
        local anima = xi.items.NONE

        if trade:hasItemQty(xi.items.RECOLLECTION_OF_SUFFERING, 1) and count == 1 then -- Recollection of Suffering
            reward = xi.items.HAMAYUMI
        elseif trade:hasItemQty(xi.items.RECOLLECTION_OF_ANIMOSITY, 1) and count == 1 then -- Recollection of Animosity
            reward = xi.items.DIA_WAND
        elseif trade:hasItemQty(xi.items.RECOLLECTION_OF_ANXIETY, 1) and count == 1 then -- Recollection of Anxiety
            reward = xi.items.STONE_GORGET
        elseif trade:hasItemQty(xi.items.RECOLLECTION_OF_PAIN, 1) and count == 2 then -- Recollection of Pain
            anima = xi.items.BOTTLE_OF_HYSTEROANIMA
        elseif trade:hasItemQty(xi.items.RECOLLECTION_OF_GUILT, 1) and count == 2 then -- Recollection of Guilt
            anima = xi.items.BOTTLE_OF_TERROANIMA
        elseif trade:hasItemQty(xi.items.RECOLLECTION_OF_FEAR, 1) and count == 2 then -- Recollection of Fear
            anima = xi.items.BOTTLE_OF_PSYCHOANIMA
        end

        if reward > 7000 then
            if player:getFreeSlotsCount() >= 1 then
                player:setCharVar("harithreward", reward)
                player:startEvent(110)
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward)
            end
        elseif anima > 5000 then
            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, anima)
            elseif trade:getGil() ~= 2000 then
                player:startEvent(108, 2000)
            else
                player:setCharVar("harithreward", anima)
                player:startEvent(109)
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) == QUEST_AVAILABLE and
        (player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.THE_MOTHERCRYSTALS or
         player:getCharVar("Mission[6][128]Option") > 0)
    then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES)
        player:startEvent(113)

    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) >= QUEST_ACCEPTED then
        player:startEvent(114)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 110 or csid == 109 then
        local objecttrade = player:getCharVar("harithreward")

        if player:hasItem(objecttrade) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, objecttrade)
        else
            player:tradeComplete()
            player:addItem(objecttrade)
            player:messageSpecial(ID.text.ITEM_OBTAINED, objecttrade)
            player:setCharVar("harithreward", 0)

            if player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) == QUEST_ACCEPTED then
                player:addFame(xi.quest.fame_area.JEUNO, 30)
                player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES)
            else
                player:addFame(xi.quest.fame_area.JEUNO, 5)
            end
        end
    end
end

return entity
