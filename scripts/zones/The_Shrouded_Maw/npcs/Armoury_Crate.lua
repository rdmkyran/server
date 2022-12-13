-----------------------------------
-- Area: The Shrouded Maw
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- Test your Mite
    [705] =
    {
        {
            { itemid = xi.items.NONE,                      droprate = 950 },
            { itemid = xi.items.CLOUD_EVOKER,              droprate =  50 },
        },
        {
            { itemid = xi.items.NONE,                      droprate = 750 },
            { itemid = xi.items.GEIST_EARRING,             droprate = 250 },
            { itemid = xi.items.QUICK_BELT,                droprate = 250 },
        },
        {
            { itemid = xi.items.NONE,                      droprate = 350 },
            { itemid = xi.items.CROSSBOWMANS_RING,         droprate = 200 },
            { itemid = xi.items.WOODSMAN_RING,             droprate = 150 },
            { itemid = xi.items.ETHER_RING,                droprate = 300 },
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
