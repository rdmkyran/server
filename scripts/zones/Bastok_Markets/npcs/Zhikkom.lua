-----------------------------------
-- Area: Bastok Markets
--  NPC: Zhikkom
-- Standard Merchant NPC
-- !pos -288.669 -10.319 -135.064 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.MYTHRIL_SWORD,             31648, 1,
        xi.items.BROADSWORD,                21535, 1,
        xi.items.TUCK,                      11845, 1,
        xi.items.FALCHION,                  62560, 1,
        xi.items.IRON_SWORD,                 7286, 2,
        xi.items.SCIMITAR,                   4163, 2,
        xi.items.BRONZE_SWORD,                246, 3,
        xi.items.DEGEN,                      9406, 3,
        xi.items.SAPARA,                      713, 3,
        xi.items.XIPHOS,                      618, 3,
        xi.items.SPATHA,                     1711, 3,
        xi.items.BILBO,                      3215, 3,
    }

    player:showText(npc, ID.text.ZHIKKOM_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
