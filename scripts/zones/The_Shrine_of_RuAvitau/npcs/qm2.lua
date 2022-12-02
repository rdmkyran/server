-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  NPC: ??? (Spawns Kirin)
-- !pos -81 32 2 178
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/items")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, { xi.items.SEAL_OF_GENBU, xi.items.SEAL_OF_SEIRYU, xi.items.SEAL_OF_BYAKKO, xi.items.SEAL_OF_SUZAKU }) then
        player:startEvent(101)
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(100)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 101 then
        SpawnMob(ID.mob.KIRIN):updateClaim(player)
        GetNPCByID(ID.npc.KIRIN_QM):setStatus(xi.status.DISAPPEAR)
    end
end

return entity
