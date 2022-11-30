-----------------------------------
-- Area: Spire of Mea
-- NPC: Enigmatic Sphere
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- ENM: Playing Host
    [833] =
    {
        {
            { itemid =    xi.items.NONE, droprate = 200 },
            { itemid = xi.items.CLUSTER_OF_BITTER_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_BURNING_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_FLEETING_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_MALEVOLENT_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_PROFANE_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_RADIANT_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_SOMBER_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_STARTLING_MEMORIES, droprate = 100 },
        },
        {
            { itemid =    xi.items.NONE, droprate = 200 },
            { itemid = xi.items.CLUSTER_OF_BITTER_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_BURNING_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_FLEETING_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_MALEVOLENT_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_PROFANE_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_RADIANT_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_SOMBER_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_STARTLING_MEMORIES, droprate = 100 },
        },
        {
            { itemid =    xi.items.NONE, droprate = 200 },
            { itemid = xi.items.CLUSTER_OF_BITTER_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_BURNING_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_FLEETING_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_MALEVOLENT_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_PROFANE_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_RADIANT_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_SOMBER_MEMORIES, droprate = 100 },
            { itemid = xi.items.CLUSTER_OF_STARTLING_MEMORIES, droprate = 100 },
        },
        {
            { itemid =    xi.items.NONE, droprate = 500 },
            { itemid = xi.items.SOLEMN_VISION, droprate = 100 },
            { itemid = xi.items.VALIANT_VISION, droprate = 100 },
            { itemid = xi.items.PRETENTIOUS_VISION, droprate = 100 },
            { itemid = xi.items.MALICIOUS_VISION, droprate = 100 },
            { itemid = xi.items.PRISTINE_VISION, droprate = 100 },
        },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        xi.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
