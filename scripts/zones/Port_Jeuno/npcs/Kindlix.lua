-----------------------------------
-- Area: Port Jeuno
--  NPC: Kindlix
-- Standard Merchant NPC
-- !pos -18.820 4.000 23.302 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

local stock =
{
    xi.items.CRACKLER,                    22,
    xi.items.CRACKER,                     25,
    xi.items.TWINKLE_SHOWER,              25,
    xi.items.LITTLE_COMET,                25,
    xi.items.SPARKLING_HAND,              25,
    xi.items.POPSTAR,                     50,
    xi.items.BRILLIANT_SNOW,              50,
    xi.items.POPPER,                      50,
    xi.items.AIRBORNE,                   100,
    xi.items.AIR_RIDER,                  100,
    xi.items.BUBBLE_BREEZE,              150,
    xi.items.FALLING_STAR,               200,
    xi.items.MARINE_BLISS,               250,
    xi.items.PAPILLION,                  300,
    xi.items.ANGELWING,                  300,
    xi.items.MOG_MISSILE,                300,
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if  player:getCharVar("spokeKindlix") == 1 then
        player:startEvent(348)
    else
        player:showText(npc, ID.text.KINDLIX_SHOP_DIALOG)
        xi.shop.general(player, stock)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 348 and option == 0 then
        xi.shop.general(player, stock)
        player:setCharVar("spokeKindlix", 0)
    end
end

return entity
