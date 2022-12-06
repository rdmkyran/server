-----------------------------------
-- Area: Bastok Mines
--  NPC: Boytz
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ETHER,                     4445, 1,
        xi.items.FLASK_OF_ECHO_DROPS,        736, 2,
        xi.items.POTION,                     837, 2,
        xi.items.WOODEN_ARROW,                3, 2,
        xi.items.BRASS_FLOWERPOT,             900, 3,
        xi.items.PICKAXE,                     180, 3,
        xi.items.FLASK_OF_EYE_DROPS,        2387, 3,
        xi.items.ANTIDOTE,                   290, 3,
        xi.items.IRON_ARROW,                  7, 3,
        xi.items.CROSSBOW_BOLT,               5, 3,
    }

    local rank = GetNationRank(xi.nation.BASTOK)

    if rank ~= 1 then
        table.insert(stock, 1022) -- Thief's Tools
        table.insert(stock, 3643)
        table.insert(stock, 3)
    end

    if rank == 3 then
        table.insert(stock, 1023) -- Living Key
        table.insert(stock, 5520)
        table.insert(stock, 3)
    end

    player:showText(npc, ID.text.BOYTZ_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
