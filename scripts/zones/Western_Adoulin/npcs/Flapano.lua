-----------------------------------
-- Area: Western Adoulin
--  NPC: Flapno
-- Type: Standard NPC, Quest NPC, and Shop NPC
-- Starts, Involved with, and Finishes Quest: 'Exotic Delicacies'
-- Involved with Quest: 'All the Way to the Bank'
-- !pos 70 0 -13 256
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/utils")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local exoticDelicacies = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.EXOTIC_DELICACIES)

    -- ALL THE WAY TO THE BANK
    if
        player:hasKeyItem(xi.ki.TARUTARU_SAUCE_INVOICE) and
        npcUtil.tradeHas(trade, { { "gil", 5600 } })
    then
        local paidFlapano = utils.mask.getBit(player:getCharVar("ATWTTB_Payments"), 2)
        if not paidFlapano then
            player:startEvent(5071)
        end

    -- EXOTIC DELICACIES
    elseif exoticDelicacies == QUEST_ACCEPTED then
        if npcUtil.tradeHas(trade, { xi.items.PINCH_OF_SAFFRON, xi.items.MUSSEL, { xi.items.BARNACLE, 2 } }) then
            player:startEvent(2861)
        elseif npcUtil.tradeHas(trade, xi.items.PLATE_OF_BARNACLE_PAELLA) or npcUtil.tradeHas(trade, xi.items.PLATE_OF_FLAPANOS_PAELLA) then
            player:startEvent(2862)
        end
    end
end

entity.onTrigger = function(player, npc)
    local theWeatherspoonWar = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.THE_WEATHERSPOON_WAR)
    local exoticDelicacies = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.EXOTIC_DELICACIES)

    -- THE WEATHERSPOON WAR
    if
        theWeatherspoonWar == QUEST_ACCEPTED and
        player:getCharVar("Weatherspoon_War_Status") == 6
    then
        player:startEvent(191)

    -- EXOTIC DELICACIES
    -- Flapano offers his quest every other time the player talks to him
    elseif
        exoticDelicacies ~= QUEST_COMPLETED and
        player:getCharVar("Flapano_Odd_Even") == 0
    then
        if exoticDelicacies == QUEST_AVAILABLE then
            player:startEvent(2860)
        elseif exoticDelicacies == QUEST_ACCEPTED then
            player:startEvent(2863)
        end

        player:setCharVar("Flapano_Odd_Even", 1)

    -- SHOP
    else
        player:showText(npc, ID.text.FLAPANO_SHOP_TEXT)
        local stock =
        {
            xi.items.STRIP_OF_SMOKED_MACKEREL,  125,
            xi.items.EAR_OF_ROASTED_CORN,       124,
            xi.items.PLATE_OF_MUSHROOM_RISOTTO, 5000,
            xi.items.PLATE_OF_FISH_AND_CHIPS,   5600,
            xi.items.BOTTLE_OF_APPLE_JUICE,     300,
            xi.items.RICE_BALL,                 160,
            xi.items.SERVING_OF_MUSHROOM_SAUTE, 76475,
        }
        xi.shop.general(player, stock)

        if exoticDelicacies ~= QUEST_COMPLETED then
            player:setCharVar("Flapano_Odd_Even", 0)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- ALL THE WAY TO THE BANK
    if csid == 5071 then
        player:confirmTrade()
        player:setCharVar("ATWTTB_Payments", utils.mask.setBit(player:getCharVar("ATWTTB_Payments"), 2, true))
        if utils.mask.isFull(player:getCharVar("ATWTTB_Payments"), 5) then
            npcUtil.giveKeyItem(player, xi.ki.TARUTARU_SAUCE_RECEIPT)
        end

    -- EXOTIC DELICACIES
    elseif csid == 2860 and option == 1 then
        player:addQuest(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.EXOTIC_DELICACIES)
    elseif csid == 2861 then
        if npcUtil.completeQuest(player, xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.EXOTIC_DELICACIES, { bayld = 500, item = xi.items.PLATE_OF_FLAPANOS_PAELLA, xp = 1000 }) then
            player:confirmTrade()
            player:setCharVar("Flapano_Odd_Even", 0)
        end
    end
end

return entity
