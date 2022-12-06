-----------------------------------
-- Area: Windurst Waters
--  NPC: Moogle (Vendor variant)
-- Type: Special Events Vendor Moogles
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/items")
require("scripts/globals/events/starlight_celebrations")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

local starlight_stock1 =
    {
        xi.items.POPSTAR,                   40,
        xi.items.BRILLIANT_SNOW,            40,
        xi.items.SPARKLING_HAND,            25,
        xi.items.AIR_RIDER,                 100,
        xi.items.CRACKER,                   8,
        xi.items.TWINKLE_SHOWER,            25,
        xi.items.LITTLE_COMET,              25,
        xi.items.DREAM_HAT,                 500,
        xi.items.SAN_DORIAN_HOLIDAY_TREE,     10000,
        xi.items.BASTOKAN_HOLIDAY_TREE,      10000,
        xi.items.WINDURSTIAN_HOLIDAY_TREE,   10000,
    }

    local starlight_stock2 =
    {
        xi.items.SNOWMAN_KNIGHT,            10000,
        xi.items.SNOWMAN_MINER,             10000,
        xi.items.SNOWMAN_MAGE,              10000,
        xi.items.SNOWMAN_CAP,               5000,
        xi.items.BUNCH_OF_FORTUNE_FRUITS,   777,
        xi.items.CHUNK_OF_GOBLIN_CHOCOLATE, 50
    }

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if npc:getID() == 17752561 then
        player:showText(npc, ID.text.STARLIGHT_VENDOR_MOOGLE)
        xi.shop.general(player, starlight_stock1)
    elseif npc:getID() == 17752560 then
        player:showText(npc, ID.text.STARLIGHT_VENDOR_MOOGLE)
        xi.shop.general(player, starlight_stock2)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
