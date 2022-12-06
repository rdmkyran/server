-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- Standard Merchant NPC
-- !pos 70 0 61 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BASELARD,                   4309, 1,
        xi.items.GLADIUS,                   16934, 1,
        xi.items.BROADSWORD,                21067, 1,
        xi.items.HUNTING_SWORD,             35769, 1,
        xi.items.FLEURET,                   13406, 1,
        xi.items.DAGGER,                     1827, 2,
        xi.items.IRON_SWORD,                 7128, 2,
        xi.items.LONGSWORD,                  8294, 2,
        xi.items.BRONZE_DAGGER,               140, 3,
        xi.items.BRASS_DAGGER,                837, 3,
        xi.items.BRASS_XIPHOS,               3523, 3,
        xi.items.BRONZE_SWORD,                241, 3,
        xi.items.SPATHA,                     1674, 3,
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
