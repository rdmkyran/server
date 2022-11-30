-----------------------------------
-- Area: Waughroon Shrine
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- ENM: Fire in the Sky
    [962] =
    {
        {
            { itemid = xi.items.NONE, droprate = 950 },
            { itemid = xi.items.CLOUD_EVOKER, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.THUGS_ZAMBURAK, droprate = 250 },
            { itemid = xi.items.HORROR_VOULGE, droprate = 250 },
        },
        {
            { itemid = xi.items.NONE, droprate = 350 },
            { itemid = xi.items.CROSSBOWMANS_RING, droprate = 200 },
            { itemid = xi.items.WOODSMAN_RING, droprate = 150 },
            { itemid = xi.items.ETHER_RING, droprate = 300 },
        },
    },

    -- ENM: Bad Seed
    [963] =
    {
        {
            { itemid = xi.items.NONE, droprate = 950 },
            { itemid = xi.items.CLOUD_EVOKER, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.REVEREND_SASH, droprate = 250 },
            { itemid = xi.items.VANGUARD_BELT, droprate = 250 },
        },
        {
            { itemid = xi.items.NONE, droprate = 350 },
            { itemid = xi.items.CROSSBOWMANS_RING, droprate = 200 },
            { itemid = xi.items.WOODSMAN_RING, droprate = 150 },
            { itemid = xi.items.ETHER_RING, droprate = 300 },
        },
    },

    -- ENM: Bugard in the Clouds
    [964] =
    {
        {
            { itemid = xi.items.CHUNK_OF_ALUMINUM_ORE, droprate = 1000 },
        },
        {
            { itemid = xi.items.CHUNK_OF_ALUMINUM_ORE, droprate = 1000 },
        },
        {
            { itemid = xi.items.NONE, droprate = 950 },
            { itemid = xi.items.CLOUD_EVOKER, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 700 },
            { itemid = xi.items.CHANTERS_STAFF, droprate = 100 },
            { itemid = xi.items.KORYUKAGEMITSU, droprate = 100 },
            { itemid = xi.items.BUBOSO, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE, droprate = 600 },
            { itemid = xi.items.KSHAMA_RING_NO2, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO4, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO5, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO9, droprate = 100 },
        },
    },
    -- ENM: Beloved of the Atlantes
    [965] =
    {
        {
            { itemid = xi.items.CHUNK_OF_ALUMINUM_ORE, droprate = 1000 },
        },
        {
            { itemid = xi.items.CHUNK_OF_ALUMINUM_ORE, droprate = 1000 },
        },
        {
            { itemid = xi.items.CHUNK_OF_ALUMINUM_ORE, droprate = 1000 },
        },
        {
            { itemid = xi.items.CHUNK_OF_ALUMINUM_ORE, droprate = 1000 },
        },
        {
            { itemid = xi.items.NONE, droprate = 950 },
            { itemid = xi.items.CLOUD_EVOKER, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 600 },
            { itemid = xi.items.CHANTERS_STAFF, droprate = 100 },
            { itemid = xi.items.KORYUKAGEMITSU, droprate = 100 },
            { itemid = xi.items.BUBOSO, droprate = 100 },
            { itemid = xi.items.BUBOSO, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE, droprate = 600 },
            { itemid = xi.items.KSHAMA_RING_NO2, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO3, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO4, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO5, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO6, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO8, droprate = 100 },
            { itemid = xi.items.KSHAMA_RING_NO9, droprate = 100 },
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
