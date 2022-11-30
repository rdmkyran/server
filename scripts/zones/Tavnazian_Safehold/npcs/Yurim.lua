-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Yurim
-- !pos 83.697 -25.000 3.250 26
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local nosTrades =
{
    [xi.items.SANATIVE_EARRING] = { hint = 17, base = { xi.items.SILVER_EARRING, xi.items.WHITE_CHIP },   organs = { { xi.items.SAMPLE_OF_LUMINIAN_TISSUE, 5 }, { xi.items.EUVHI_ORGAN, 5 } } },
    [xi.items.RELAXING_EARRING] = { hint = 17, base = { xi.items.SILVER_EARRING, xi.items.BLACK_CHIP },   organs = { { xi.items.SAMPLE_OF_LUMINIAN_TISSUE, 5 }, { xi.items.EUVHI_ORGAN, 5 } } },

    [xi.items.KARIN_OBI] = { hint = 1, base = { xi.items.SILVER_OBI, xi.items.RED_CHIP          },organs = { { xi.items.PHUABO_ORGAN, 7 }, { xi.items.XZOMIT_ORGAN, 3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE, 3 } } },
    [xi.items.HYORIN_OBI] = { hint =  2, base = { xi.items.SILVER_OBI, xi.items.CLEAR_CHIP     }, organs = { { xi.items.XZOMIT_ORGAN,  7 }, { xi.items.PHUABO_ORGAN, 3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },
    [xi.items.FURIN_OBI] = { hint =  3, base = { xi.items.SILVER_OBI, xi.items.GREEN_CHIP     }, organs = { { xi.items.AERN_ORGAN,    7 }, { xi.items.HPEMDE_ORGAN, 3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },
    [xi.items.DORIN_OBI] = { hint =  4, base = { xi.items.SILVER_OBI, xi.items.YELLOW_CHIP    }, organs = { { xi.items.HPEMDE_ORGAN,  7 }, { xi.items.AERN_ORGAN,   3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },
    [xi.items.RAIRIN_OBI] = { hint =  5, base = { xi.items.SILVER_OBI, xi.items.PURPLE_CHIP    }, organs = { { xi.items.PHUABO_ORGAN,  7 }, { xi.items.HPEMDE_ORGAN, 3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },
    [xi.items.SUIRIN_OBI] = { hint =  6, base = { xi.items.SILVER_OBI, xi.items.BLUE_CHIP      }, organs = { { xi.items.HPEMDE_ORGAN,  7 }, { xi.items.PHUABO_ORGAN, 3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },
    [xi.items.KORIN_OBI] = { hint =  7, base = { xi.items.SILVER_OBI, xi.items.WHITE_CHIP     }, organs = { { xi.items.XZOMIT_ORGAN,  7 }, { xi.items.AERN_ORGAN,   3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },
    [xi.items.ANRIN_OBI] = { hint =  8, base = { xi.items.SILVER_OBI, xi.items.BLACK_CHIP     }, organs = { { xi.items.AERN_ORGAN,    7 }, { xi.items.XZOMIT_ORGAN, 3 }, { xi.items.SAMPLE_OF_LUMINIAN_TISSUE,  3 }               } },

    [xi.items.FLAME_GORGET] = { hint =  9, base = { xi.items.GORGET, xi.items.RED_CHIP    }, organs = { { xi.items.PHUABO_ORGAN, 10 }, { xi.items.XZOMIT_ORGAN, 5 }, { xi.items.YOVRA_ORGAN,  1 }               } },
    [xi.items.SNOW_GORGET] = { hint = 10, base = { xi.items.GORGET, xi.items.CLEAR_CHIP  }, organs = { { xi.items.PHUABO_ORGAN, 10 }, { xi.items.AERN_ORGAN,   5 }, { xi.items.YOVRA_ORGAN,  1 }               } },
    [xi.items.BREEZE_GORGET] = { hint = 11, base = { xi.items.GORGET, xi.items.GREEN_CHIP  }, organs = { { xi.items.PHUABO_ORGAN, 10 }, { xi.items.HPEMDE_ORGAN, 5 }, { xi.items.YOVRA_ORGAN,  1 }               } },
    [xi.items.SOIL_GORGET] = { hint = 12, base = { xi.items.GORGET, xi.items.YELLOW_CHIP }, organs = { { xi.items.XZOMIT_ORGAN, 10 }, { xi.items.AERN_ORGAN,   5 }, { xi.items.YOVRA_ORGAN,  1 }               } },
    [xi.items.THUNDER_GORGET] = { hint = 13, base = { xi.items.GORGET, xi.items.PURPLE_CHIP }, organs = { { xi.items.XZOMIT_ORGAN, 10 }, { xi.items.HPEMDE_ORGAN, 5 }, { xi.items.YOVRA_ORGAN,  1 }               } },
    [xi.items.AQUA_GORGET] = { hint = 14, base = { xi.items.GORGET, xi.items.BLUE_CHIP   }, organs = { { xi.items.AERN_ORGAN,   10 }, { xi.items.HPEMDE_ORGAN, 5 }, { xi.items.YOVRA_ORGAN,  1 }               } },
    [xi.items.LIGHT_GORGET] = { hint = 15, base = { xi.items.GORGET, xi.items.WHITE_CHIP  }, organs = { { xi.items.AERN_ORGAN,    7 }, { xi.items.PHUABO_ORGAN, 3 }, { xi.items.HPEMDE_ORGAN, 3 }, { xi.items.YOVRA_ORGAN, 2 } } },
    [xi.items.SHADOW_GORGET] = { hint = 16, base = { xi.items.GORGET, xi.items.BLACK_CHIP  }, organs = { { xi.items.HPEMDE_ORGAN,  7 }, { xi.items.PHUABO_ORGAN, 3 }, { xi.items.AERN_ORGAN,   3 }, { xi.items.YOVRA_ORGAN, 2 } } },
}

entity.onTrade = function(player, npc, trade)
    local nameOfScience  = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE)
    local itemInProgress = player:getCharVar("NAME_OF_SCIENCE_target")

    if
        itemInProgress > 0 and
        npcUtil.tradeHas(trade, nosTrades[itemInProgress].organs)
    then
        player:startEvent(529, xi.items.GORGET, xi.items.SILVER_EARRING, xi.items.SILVER_OBI)
    elseif
        (nameOfScience == QUEST_ACCEPTED or nameOfScience == QUEST_COMPLETED) and
        npcUtil.tradeHas(trade, xi.items.APPLE_PIE) and
        itemInProgress > 0
    then
        -- apple pie hint
        player:startEvent(531, xi.items.APPLE_PIE, 0, nosTrades[itemInProgress].hint)
    elseif
        (nameOfScience == QUEST_ACCEPTED or nameOfScience == QUEST_COMPLETED) and
        itemInProgress == 0
    then
        for k, v in pairs(nosTrades) do
            if npcUtil.tradeHas(trade, v.base) then
                player:setCharVar("NAME_OF_SCIENCE_target", k)
                player:startEvent(526, unpack(v.base))
                break
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    -- IN THE NAME OF SCIENCE
    if player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_WARRIORS_PATH) then
        local nameOfScience  = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE)
        local itemInProgress = player:getCharVar("NAME_OF_SCIENCE_target")

        if nameOfScience == QUEST_AVAILABLE then
            player:startEvent(524, xi.items.SILVER_OBI, xi.items.SILVER_EARRING, xi.items.GORGET)
        elseif
            (nameOfScience == QUEST_ACCEPTED or nameOfScience == QUEST_COMPLETED) and
            itemInProgress == 0
        then
            player:startEvent(525, xi.items.SILVER_OBI, xi.items.SILVER_EARRING, xi.items.GORGET)
        elseif nameOfScience == QUEST_ACCEPTED or nameOfScience == QUEST_COMPLETED then
            if math.random(1, 100) <= 30 then
                player:startEvent(532, unpack(nosTrades[itemInProgress].base))
            else
                player:startEvent(528, unpack(nosTrades[itemInProgress].base))
            end
        end

    -- STANDARD DIALOG
    -- TODO: This is not a true default action, and needs to be verified for when this begins to be displayed
    -- else
    --    player:startEvent(519)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 524 then
        player:addQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE)
    elseif csid == 531 then
        player:confirmTrade()
    elseif csid == 526 then
        player:confirmTrade()
    elseif csid == 529 then
        local itemInProgress = player:getCharVar("NAME_OF_SCIENCE_target")
        if npcUtil.completeQuest(player, xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE, { item = itemInProgress, var = { "NAME_OF_SCIENCE_target" } }) then
            player:confirmTrade()
        end
    end
end

return entity
