-----------------------------------
-- Area: Mhaura
--  NPC: Orlando
-- !pos -37.268 -9 58.047 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local questStatus = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
    local itemID = trade:getItemId()
    local itemList =
    {
        {   xi.items.SACK_OF_FINGERNAILS, 200 },
        {   xi.items.SACK_OF_TEETH, 250 },
        {   xi.items.GOBLIN_CUP, 200 },
        {   xi.items.GOBLIN_DIE, 120 },
        {   xi.items.BEASTCOIN, 600 },
        {   xi.items.GOLD_BEASTCOIN, 900 },
        {   xi.items.MYTHRIL_BEASTCOIN, 800 },
        {   xi.items.SILVER_BEASTCOIN, 750 },
        {   xi.items.CHICKEN_BONE, 120 },
        {   xi.items.SET_OF_FISH_BONES, 100 },
        { xi.items.PIECE_OF_ROTTEN_MEAT, 150 },
    }

    for x, item in pairs(itemList) do
        if
            questStatus == QUEST_ACCEPTED or
            player:getLocalVar("OrlandoRepeat") == 1
        then
            if item[1] == itemID then
                if trade:hasItemQty(itemID, 8) and trade:getItemCount() == 8 then
                    -- Correct amount, valid item.
                    player:setCharVar("ANTIQUE_PAYOUT", xi.settings.main.GIL_RATE * item[2])
                    player:startEvent(102, xi.settings.main.GIL_RATE * item[2], itemID)
                elseif trade:getItemCount() < 8 then
                    -- Wrong amount, but valid item.
                    player:startEvent(104)
                end
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    local questStatus = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)

    if player:getFameLevel(xi.quest.fame_area.WINDURST) >= 2 then
        if player:hasKeyItem(xi.ki.CHOCOBO_LICENSE) then
            if questStatus ~= QUEST_AVAILABLE then
                player:startEvent(103)
            elseif questStatus == QUEST_AVAILABLE then
                player:startEvent(101)
            end
        else
            player:startEvent(100)
        end
    else
        player:startEvent(106)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local questStatus = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
    local payout = player:getCharVar("ANTIQUE_PAYOUT")

    if csid == 101 then
        player:addQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
    elseif csid == 102 then
        player:tradeComplete()
        player:addFame(xi.quest.fame_area.WINDURST, 10)
        player:addGil(payout)
        player:messageSpecial(ID.text.GIL_OBTAINED, payout)
        player:completeQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
        player:setCharVar("ANTIQUE_PAYOUT", 0)
        player:setLocalVar("OrlandoRepeat", 0)
    elseif csid == 103 then
        if questStatus == QUEST_COMPLETED then
            player:setLocalVar("OrlandoRepeat", 1)
        end
    end
end

return entity
