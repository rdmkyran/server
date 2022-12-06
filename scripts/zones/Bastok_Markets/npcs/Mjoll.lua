-----------------------------------
-- Area: Batok Markets
--  NPC: Mjoll
-- Standard Merchant NPC
-- !pos -318.902 -10.319 -178.087 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SILVER_ARROW,                 16, 1,
        xi.items.ZAMBURAK,                  14158, 1,
        xi.items.TATHLUM,                     294, 1,
        xi.items.WOODEN_ARROW,                  3, 2,
        xi.items.MYTHRIL_BOLT,                 22, 2,
        xi.items.IRON_ARROW,                    7, 3,
        xi.items.SCROLL_OF_DARK_THRENODY,      199, 3,
        xi.items.SCROLL_OF_ICE_THRENODY,      1000, 3,
        xi.items.LIGHT_CROSSBOW,              165, 3,
        xi.items.CROSSBOW,                   2166, 3,
        xi.items.CROSSBOW_BOLT,                 5, 3,
    }

    player:showText(npc, ID.text.MJOLL_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
