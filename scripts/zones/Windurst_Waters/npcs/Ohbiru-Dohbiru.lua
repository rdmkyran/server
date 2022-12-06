-----------------------------------
-- Area: Windurst Waters
-- NPC: Ohbiru-Dohbiru
-- Involved in quest: Food For Thought, Say It with Flowers
-- Starts and finishes quests: Toraimarai Turmoil, Water Way to Go
-- !pos 23 -5 -193 238
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/items")
require("scripts/globals/titles")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)

    local needToZone = player:needToZone()
    local sayFlowers = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.SAY_IT_WITH_FLOWERS)
    local flowerProgress = player:getCharVar("FLOWER_PROGRESS")

    if
        (sayFlowers == QUEST_ACCEPTED or sayFlowers == QUEST_COMPLETED) and
        flowerProgress == 1
    then
        if needToZone then
            player:startEvent(518)
        elseif player:getCharVar("FLOWER_PROGRESS") == 2 then
            player:startEvent(517, 0, 0, 0, 0, 950)
        else
            player:startEvent(516, 0, 0, 0, 0, 950)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local flowerList =
    {
        [0] = { itemid = xi.items.CARNATION, gil = 300 },
        [1] = { itemid = xi.items.RED_ROSE, gil = 200 },
        [2] = { itemid = xi.items.RAIN_LILY, gil = 250 },
        [3] = { itemid = xi.items.LILAC, gil = 150 },
        [4] = { itemid = xi.items.AMARYLLIS, gil = 200 },
        [5] = { itemid = xi.items.MARGUERITE, gil = 100 }
    }

    -- Check Missions first (priority?)
    if csid == 516 then
        if option < 7 then
            local choice = flowerList[option]
            if choice and player:getGil() >= choice.gil then
                if player:getFreeSlotsCount() > 0 then
                    player:addItem(choice.itemid)
                    player:messageSpecial(ID.text.ITEM_OBTAINED, choice.itemid)
                    player:delGil(choice.gil)
                    player:needToZone(true)
                else
                    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, choice.itemid)
                end
            else
                player:messageSpecial(ID.text.NOT_HAVE_ENOUGH_GIL)
            end
        elseif option == 7 then
            player:setCharVar("FLOWER_PROGRESS", 2)
        end
    end
end

return entity
