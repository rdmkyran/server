-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Aveline
-- Standard Merchant NPC
-- !pos -139 -6 46 230
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
        xi.items.BOTTLE_OF_APPLE_VINEGAR,    79, 1,
        xi.items.HANDFUL_OF_BAY_LEAVES,     117, 1,
        xi.items.FROST_TURNIP,              28, 1,
        xi.items.SARUTA_ORANGE,             28, 1,
        xi.items.FAERIE_APPLE,              39, 2,
        xi.items.LA_THEINE_CABBAGE,         21, 2,
        xi.items.FLASK_OF_OLIVE_OIL,         14, 3,
        xi.items.SPRIG_OF_SAGE,             166, 3,
        xi.items.SAN_DORIAN_CARROT,         28, 3,
        xi.items.BUNCH_OF_SAN_DORIAN_GRAPES, 68, 3,
    }

    player:showText(npc, ID.text.RAIMBROYS_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
