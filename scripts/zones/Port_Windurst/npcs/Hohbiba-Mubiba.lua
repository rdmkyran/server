-----------------------------------
-- Area: Port Windurst
--  NPC: Hohbiba-Mubiba
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
        xi.items.YEW_WAND,                   1440, 1,
        xi.items.ELM_STAFF,                  3642, 1,
        xi.items.ELM_POLE,                  18422, 1,
        xi.items.BONE_CUDGEL,                4945, 2,
        xi.items.HOLLY_POLE,                 4669, 2,
        xi.items.MAPLE_WAND,                   47, 3,
        xi.items.WILLOW_WAND,                 340, 3,
        xi.items.BRONZE_ROD,                   91, 3,
        xi.items.ASH_CLUB,                     66, 3,
        xi.items.CHESTNUT_CLUB,              1600, 3,
        xi.items.ASH_STAFF,                    58, 3,
        xi.items.HOLLY_STAFF,                 584, 3,
        xi.items.ASH_POLE,                    386, 3,
    }

    player:showText(npc, ID.text.HOHBIBAMUBIBA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
