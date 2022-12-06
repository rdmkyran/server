-----------------------------------
-- Area: Rabao
--  NPC: Brave Wolf
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BUCKLER,                   31201,
        xi.items.DARKSTEEL_BUCKLER,         60260,
        xi.items.SILVER_BANGLES,            24373,
        xi.items.BANDED_MAIL,               66066,
        xi.items.MUFFLERS,                  35285,
        xi.items.BREECHES,                  52552,
        xi.items.SOLLERETS,                 32382,
        xi.items.BLACK_TUNIC,                9423,
        xi.items.WHITE_MITTS,                4395,
        xi.items.BLACK_SLACKS,               6279,
        xi.items.SANDALS,                    4084,
        xi.items.PADDED_ARMOR,              28654,
        xi.items.IRON_MITTENS,              15724,
        xi.items.IRON_SUBLIGAR,             23063,
        xi.items.LEGGINGS,                  14327,
    }

    player:showText(npc, ID.text.BRAVEWOLF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
