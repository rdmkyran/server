-----------------------------------
-- Area: Windurst Walls
--  NPC: Ojha Rhawash
-- Starts and Finishes Quest: Flower Child
-- !pos -209 0 -134 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/items")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local flowerChild = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.FLOWER_CHILD)
    local itemQuality = 0

    if trade:getItemCount() == 1 and trade:getGil() == 0 then
        if trade:hasItemQty(xi.items.LILAC, 1) then
            itemQuality = 2
        elseif
            trade:hasItemQty(xi.items.AMARYLLIS, 1)  or
            trade:hasItemQty(xi.items.ASPHODEL, 1) or
            trade:hasItemQty(xi.items.CARNATION, 1)  or
            trade:hasItemQty(xi.items.CASABLANCA, 1) or
            trade:hasItemQty(xi.items.CATTLEYA, 1) or
            trade:hasItemQty(xi.items.CHAMOMILE, 1)  or
            trade:hasItemQty(xi.items.DAHLIA, 1)  or
            trade:hasItemQty(xi.items.FLAX_FLOWER, 1)  or
            trade:hasItemQty(xi.items.LYCOPODIUM_FLOWER, 1) or
            trade:hasItemQty(xi.items.MARGUERITE, 1)  or
            trade:hasItemQty(xi.items.OLIVE_FLOWER, 1) or
            trade:hasItemQty(xi.items.PAPAKA_GRASS, 1)  or
            trade:hasItemQty(xi.items.PHALAENOPSIS, 1) or
            trade:hasItemQty(xi.items.RAIN_LILY, 1)  or
            trade:hasItemQty(xi.items.RED_ROSE, 1)  or
            trade:hasItemQty(xi.items.SNOW_LILY, 1) or
            trade:hasItemQty(xi.items.SWEET_WILLIAM, 1) or
            trade:hasItemQty(xi.items.TAHRONGI_CACTUS, 1)  or
            trade:hasItemQty(xi.items.WATER_LILY, 1) or
            trade:hasItemQty(xi.items.WIJNRUIT, 1)
        then
            itemQuality = 1
        end
    end

    if itemQuality == 2 then
        if flowerChild == QUEST_COMPLETED then
            player:startEvent(10000, 0, 239, 4)
        else
            player:startEvent(10000, 0, 239, 2)
        end
    elseif itemQuality == 1 then
        if flowerChild == QUEST_COMPLETED then
            player:startEvent(10000, 0, 239, 5)
        elseif flowerChild == QUEST_ACCEPTED then
            player:startEvent(10000, 0, 239, 3)
        else
            player:startEvent(10000, 0, 239, 1)
        end
    else
        player:startEvent(10000, 0, 239, 0)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(10000, 0, 239, 10)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 10000 and option == 3002 then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.FLOWER_CHILD)
        player:addFame(xi.quest.fame_area.WINDURST, 120)
        player:setMoghouseFlag(4)
        player:messageSpecial(ID.text.MOGHOUSE_EXIT)
    elseif csid == 10000 and option == 1 then
        player:tradeComplete()
        player:addQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.FLOWER_CHILD)
    end
end

return entity
