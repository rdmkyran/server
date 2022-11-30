-----------------------------------
-- Area: Mhaura
--  NPC: Wilhelm
-- Type: Standard NPC
-- !pos -22.746 -5 17.157 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local limbusArmor =
{
    [xi.items.PIECE_OF_ULTIMAS_CEREBRUM] = { csid = 328, reward = xi.items.NASHIRA_TURBAN },
    [xi.items.PIECE_OF_ULTIMAS_HEART] = { csid = 328, reward = xi.items.NASHIRA_MANTEEL },
    [xi.items.SEGMENT_OF_ULTIMAS_CLAW] = { csid = 328, reward = xi.items.NASHIRA_GAGES },
    [xi.items.SEGMENT_OF_ULTIMAS_LEG] = { csid = 328, reward = xi.items.NASHIRA_SERAWEELS },
    [xi.items.SEGMENT_OF_ULTIMAS_TAIL] = { csid = 328, reward = xi.items.NASHIRA_CRACKOWS },
    [xi.items.PIECE_OF_OMEGAS_EYE] = { csid = 330, reward = xi.items.HOMAM_ZUCCHETTO },
    [xi.items.PIECE_OF_OMEGAS_HEART] = { csid = 330, reward = xi.items.HOMAM_CORAZZA },
    [xi.items.SEGMENT_OF_OMEGAS_FORELEG] = { csid = 330, reward = xi.items.HOMAM_MANOPOLAS },
    [xi.items.SEGMENT_OF_OMEGAS_HIND_LEG] = { csid = 330, reward = xi.items.HOMAM_COSCIALES },
    [xi.items.SEGMENT_OF_OMEGAS_TAIL] = { csid = 330, reward = xi.items.HOMAM_GAMBIERAS },
}

entity.onTrade = function(player, npc, trade)
    for k, v in pairs(limbusArmor) do
        if npcUtil.tradeHasExactly(trade, k) then
            player:setLocalVar("wilhelmTrade", k)
            player:startEvent(v.csid, v.reward)
            break
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.THE_WARRIORS_PATH then
        player:startEvent(326)
    else
        player:startEvent(325)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 328 or csid == 330 then
        -- cheat prevention
        local info = limbusArmor[player:getLocalVar("wilhelmTrade")]
        player:setLocalVar("wilhelmTrade", 0)

        if
            info and
            info.csid == csid and
            info.reward == option and
            npcUtil.giveItem(player, option)
        then
            player:confirmTrade()
        end
    end
end

return entity
