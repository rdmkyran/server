-----------------------------------
-- Area: Bastok Markets
--  NPC: Raghd
-- Standard Merchant NPC
-- !pos -149.200 -4.819 -74.939 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SILVER_RING,               1150, 1,
        xi.items.SILVER_EARRING,            1150, 1,
        xi.items.BRASS_RING,                 184, 2,
        xi.items.COPPER_RING,                 69, 3,
    }

    player:showText(npc, ID.text.RAGHD_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
