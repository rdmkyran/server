-----------------------------------
-- Area: Kazham
--  NPC: Khifo Ryuhkowa
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Kazham/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.KUKRI,                       5713,
        xi.items.RAM_DAO,                   153014,
        xi.items.BRONZE_SPEAR,                 809,
        xi.items.SPEAR,                      16228,
        xi.items.PARTISAN,                   75541,
        xi.items.CHESTNUT_CLUB,               1600,
        xi.items.BONE_CUDGEL,                 4945,
        xi.items.CHESTNUT_WAND,               5255,
        xi.items.MAHOGANY_STAFF,             29752,
        xi.items.MAHOGANY_POLE,              99176,
        xi.items.BATTLE_BOW,                 39744,
        xi.items.HAWKEYE,                       55,
        xi.items.BOOMERANG,                   1610,
        xi.items.WOODEN_ARROW,                   3,
    }

    player:showText(npc, ID.text.KHIFORYUHKOWA_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
