-----------------------------------
-- Area: Selbina
--  NPC: Dohdjuma
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BAG_OF_RYE_FLOUR,             36,
        xi.items.SCROLL_OF_SHEEPFOE_MAMBO,   233,
        xi.items.FLASK_OF_EYE_DROPS,        2335,
        xi.items.ANTIDOTE,                   284,
        xi.items.FLASK_OF_DISTILLED_WATER,    10,
        xi.items.POTION,                     819,
        xi.items.LUGWORM,                    10,
        xi.items.JUG_OF_SELBINA_MILK,         54,
        xi.items.PICKLED_HERRING,            432,
        xi.items.SERVING_OF_HERB_QUUS,      4485,
        xi.items.SELBINA_WAYSTONE,          9200,
    }

    player:showText(npc, ID.text.DOHDJUMA_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
