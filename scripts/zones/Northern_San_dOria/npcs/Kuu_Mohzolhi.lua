-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Kuu Mohzolhi
-- Starts and Finishes Quest: Growing Flowers
-- !pos -123 0 80 231
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Northern_San_dOria/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local itemQuality = 0

    if trade:getItemCount() == 1 and trade:getGil() == 0 then
        if trade:hasItemQty(xi.items.MARGUERITE, 1) then
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
            trade:hasItemQty(xi.items.LILAC, 1)  or
            trade:hasItemQty(xi.items.LYCOPODIUM_FLOWER, 1) or
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

    local growingFlowers = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.GROWING_FLOWERS)

    if itemQuality == 2 then
        if growingFlowers == QUEST_COMPLETED then
            player:startEvent(605, 0, 231, 4)
        else
            player:startEvent(605, 0, 231, 2)
        end
    elseif itemQuality == 1 then
        if growingFlowers == QUEST_ACCEPTED then
            player:startEvent(605, 0, 231, 3)
        else
            player:startEvent(605, 0, 231, 1)
        end
    else
        player:startEvent(605, 0, 231, 0)
    end

end

entity.onTrigger = function(player, npc)
    player:startEvent(605, 0, 231, 10)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 605 and option == 1002 then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.GROWING_FLOWERS)
        player:addFame(xi.quest.fame_area.SANDORIA, 120)
        player:setMoghouseFlag(1)
        player:messageSpecial(ID.text.MOGHOUSE_EXIT)
    elseif csid == 605 and option == 1 then
        player:tradeComplete()
        player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.GROWING_FLOWERS)
    end
end

return entity
