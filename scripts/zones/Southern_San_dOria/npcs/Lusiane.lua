-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Lusiane
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BAMBOO_FISHING_ROD,         496, 1,
        xi.items.LUGWORM,                      9, 2,
        xi.items.YEW_FISHING_ROD,            217, 2,
        xi.items.LITTLE_WORM,                  3, 3,
        xi.items.SCROLL_OF_LIGHT_THRENODY,    110, 3,
        xi.items.SCROLL_OF_LIGHTNING_THRENODY,  1265, 3,
        xi.items.WILLOW_FISHING_ROD,          66, 3,
    }

    player:showText(npc, ID.text.LUSIANE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
