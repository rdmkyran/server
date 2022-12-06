-----------------------------------
-- Area: Port Windurst
--  NPC: Taniko-Maniko
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BONE_PICK,                 5864, 2,
        xi.items.CAT_BAGHNAKHS,              104, 3,
        xi.items.CESTI,                      129, 3,
        xi.items.BRASS_KNUCKLES,            1521, 3,
        xi.items.BRASS_BAGHNAKHS,           1521, 3,
        xi.items.BONE_AXE,                  4198, 3,
        xi.items.BRONZE_ZAGHNAL,             309, 3,
        xi.items.BRASS_ZAGHNAL,             2542, 3,
        xi.items.HARPOON,                     97, 3,
        xi.items.BRONZE_DAGGER,              143, 3,
        xi.items.BRASS_DAGGER,               837, 3,
        xi.items.DAGGER,                    1827, 3,
        xi.items.BILBO,                     3215, 3,
        xi.items.XIPHOS,                     618, 3,
        xi.items.SPATHA,                    1674, 3,
    }

    player:showText(npc, ID.text.TANIKOMANIKO_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
