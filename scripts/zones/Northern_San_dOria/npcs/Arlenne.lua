-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arlenne
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.YEW_WAND,                   1409, 1,
        xi.items.ELM_STAFF,                  3245, 1,
        xi.items.ELM_POLE,                  16416, 1,
        xi.items.ZAGHNAL,                   11286, 1,
        xi.items.HOLLY_POLE,                 4568, 2,
        xi.items.ASH_CLUB,                     66, 3,
        xi.items.MAPLE_WAND,                   46, 3,
        xi.items.WILLOW_WAND,                 333, 3,
        xi.items.ASH_STAFF,                    57, 3,
        xi.items.HOLLY_STAFF,                 571, 3,
        xi.items.ASH_POLE,                    386, 3,
        xi.items.CESTI,                       132, 3,
        xi.items.BRASS_KNUCKLES,              828, 3,
        xi.items.BRASS_BAGHNAKHS,            1554, 3,
        xi.items.BRONZE_ZAGHNAL,              309, 3,
        xi.items.BRASS_ZAGHNAL,              2542, 2,
    }

    player:showText(npc, ID.text.ARLENNE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
