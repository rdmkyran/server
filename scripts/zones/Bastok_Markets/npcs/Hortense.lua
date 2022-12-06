-----------------------------------
-- Area: Bastok Markets
--  NPC: Hortense
-- Standard Merchant NPC
-- !pos -82.503 -4.849 -132.376 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_FOE_REQUIEM,        64, 3,
        xi.items.SCROLL_OF_FOE_REQUIEM_II,    441, 3,
        xi.items.SCROLL_OF_FOE_REQUIEM_III,  3960, 3,
        xi.items.SCROLL_OF_FOE_REQUIEM_IV,   6912, 3,
        xi.items.SCROLL_OF_FOE_REQUIEM_VII, 47196, 3,
        xi.items.SCROLL_OF_ARMYS_PAEON,        37, 3,
        xi.items.SCROLL_OF_ARMYS_PAEON_II,    321, 3,
        xi.items.SCROLL_OF_ARMYS_PAEON_III,  3240, 3,
        xi.items.SCROLL_OF_ARMYS_PAEON_IV,   5940, 3,
        xi.items.SCROLL_OF_ARMYS_PAEON_VI,  48944, 3,
        xi.items.SCROLL_OF_VALOR_MINUET,       21, 3,
        xi.items.SCROLL_OF_VALOR_MINUET_II,  1101, 3,
        xi.items.SCROLL_OF_VALOR_MINUET_III,  5544, 3,
        xi.items.SCROLL_OF_VALOR_MINUET_V,  53820, 3,
    }

    player:showText(npc, ID.text.HORTENSE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
