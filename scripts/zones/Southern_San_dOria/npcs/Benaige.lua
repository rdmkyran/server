-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Benaige
-- Standard Merchant NPC
-- !pos -142 -6 47 230
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
        xi.items.STICK_OF_CINNAMON,           234, 1,
        xi.items.EAR_OF_MILLIONCORN,           43, 1,
        xi.items.PINCH_OF_DRIED_MARJORAM,      43, 2,
        xi.items.BAG_OF_SAN_DORIAN_FLOUR,      54, 2,
        xi.items.POT_OF_MAPLE_SUGAR,           36, 2,
        xi.items.BAG_OF_SEMOLINA,           1800, 2,
        xi.items.ZUCCHINI,                   442, 2,
        xi.items.CLUSTER_OF_PAPRIKA,         511, 2,
        xi.items.POT_OF_CRYING_MUSTARD,        25, 3,
        xi.items.BAG_OF_RYE_FLOUR,             36, 3,
        xi.items.CHUNK_OF_ROCK_SALT,           14, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
        xi.items.SPRIG_OF_CIBOL,             198, 3,
    }

    player:showText(npc, ID.text.BENAIGE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
