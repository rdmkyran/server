-----------------------------------
-- Area: Spire of Vahzl
-- NPC:  Enigmatic Sphere
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- ENM: Pulling the Plug
    [865] =
    {
        {
            { itemid = xi.items.CLUSTER_OF_BITTER_MEMORIES, droprate =   97 },
            { itemid = xi.items.CLUSTER_OF_BURNING_MEMORIES, droprate =  174 },
            { itemid = xi.items.CLUSTER_OF_FLEETING_MEMORIES, droprate =  124 },
            { itemid = xi.items.CLUSTER_OF_MALEVOLENT_MEMORIES, droprate =  140 },
            { itemid = xi.items.CLUSTER_OF_PROFANE_MEMORIES, droprate =  124 },
            { itemid = xi.items.CLUSTER_OF_RADIANT_MEMORIES, droprate =  124 },
            { itemid = xi.items.CLUSTER_OF_SOMBER_MEMORIES, droprate =   93 },
            { itemid = xi.items.CLUSTER_OF_STARTLING_MEMORIES, droprate =  124 },
        },
        {
            { itemid = xi.items.BEATIFIC_IMAGE, droprate =  291 },
            { itemid = xi.items.GRAVE_IMAGE, droprate =  372 },
            { itemid = xi.items.VALOROUS_IMAGE, droprate =  337 },
        },
        {
            { itemid = xi.items.ANCIENT_IMAGE, droprate =  523 },
            { itemid = xi.items.VIRGIN_IMAGE, droprate =  477 },
        },
        {
            { itemid = xi.items.NONE, droprate =  736 },
            { itemid = xi.items.IMPETUOUS_VISION, droprate =  167 },
            { itemid = xi.items.SNIDE_VISION, droprate =   66 },
            { itemid = xi.items.TENUOUS_VISION, droprate =   31 },
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
