-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Meret
-- !pos 83.166 -25.082 4.633 26
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/items")
-----------------------------------
local entity = {}

-- [tradedItemId] = rewardItemId
local trades =
{
    [xi.items.SAMPLE_OF_LUMINIAN_TISSUE] = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.PHUABO_ORGAN]              = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.XZOMIT_ORGAN]              = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.AERN_ORGAN]                = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.HPEMDE_ORGAN]              = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.YOVRA_ORGAN]               = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.EUVHI_ORGAN]               = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.LUMINION_CHIP]             = xi.items.VIRTUE_STONE_POUCH,
    [xi.items.VICE_OF_ANTIPATHY]         = xi.items.MERCIFUL_CAPE,
    [xi.items.VICE_OF_AVARICE]           = xi.items.ALTRUISTIC_CAPE,
    [xi.items.VICE_OF_ASPERSION]         = xi.items.ASTUTE_CAPE,
    [xi.items.AURA_OF_ADULATION]         = xi.items.NOVIO_EARRING,
    [xi.items.AURA_OF_VORACITY]          = xi.items.NOVIA_EARRING,
    [xi.items.SIN_OF_INDIGNATION]        = xi.items.NINURTAS_SASH,
    [xi.items.SIN_OF_INDOLENCE]          = xi.items.AUREOLE,
    [xi.items.SIN_OF_INDULGENCE]         = xi.items.FUTSUNO_MITAMA,
    [xi.items.SIN_OF_INVIDIOUSNESS]      = xi.items.RAPHAELS_ROD,
    [xi.items.SIN_OF_INSOLENCE]          = xi.items.MARSS_RING,
    [xi.items.SIN_OF_INFATUATION]        = xi.items.BELLONAS_RING,
    [xi.items.SIN_OF_INTEMPERANCE]       = xi.items.MINERVAS_RING,
}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == QUEST_COMPLETED then
        for k, v in pairs(trades) do
            if npcUtil.tradeHasExactly(trade, k) then
                player:setLocalVar("meretReward", v)
                player:startEvent(586, k, v)
                break
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.THE_WARRIORS_PATH then
        if player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == QUEST_COMPLETED then
            if math.random() < 0.5 then
                player:startEvent(582)
            else
                player:startEvent(583)
            end
        else
            player:startEvent(585)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 586 and option == player:getLocalVar("meretReward") then
        player:setLocalVar("meretReward", 0)

        if npcUtil.giveItem(player, option) then
            player:confirmTrade()
        end
    end
end

return entity
