-----------------------------------
-- Area: Upper Jeuno
--  NPC: Deadly Minnow
-- Standard Merchant NPC
-- Involved in Quest: Borghertz's Hands (1st quest only)
-- !pos -5 1 48 244
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCharVar("BorghertzHandsFirstTime") == 1 then
        player:startEvent(24)
    else
        local stock =
        {
            xi.items.STUDDED_BANDANA,           13179,
            xi.items.SILVER_MASK,               22800,
            xi.items.BANDED_HELM,               47025,
            xi.items.STUDDED_VEST,              20976,
            xi.items.SILVER_MAIL,               35200,
            xi.items.BANDED_MAIL,               66792,
            xi.items.STUDDED_GLOVES,            11012,
            xi.items.SILVER_MITTENS,            18800,
            xi.items.GAUNTLETS,                 23846,
            xi.items.MUFFLERS,                  35673,
        }

        player:showText(npc, ID.text.DURABLE_SHIELDS_SHOP_DIALOG)
        xi.shop.general(player, stock)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 24 then
        player:setCharVar("BorghertzHandsFirstTime", 2)
    end
end

return entity
