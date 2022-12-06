-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Dabih Jajalioh

-- TODO: Add support for occasional stock.
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CARNATION,                      60,
        xi.items.CHAMOMILE,                     119,
        xi.items.MARGUERITE,                    120,
        xi.items.RAIN_LILY,                      96,
        xi.items.RED_ROSE,                       80,
        xi.items.WIJNRUIT,                      110,
        --[[
        xi.items.AMARYLLIS,                     120,
        xi.items.BAG_OF_FRUIT_SEEDS,            900,
        xi.items.GOBLIN_DOLL,                  490,
        xi.items.KOMA,                         165,
        xi.items.LILAC,                         120,
        xi.items.LACQUER_TREE_LOG,           50000,
        xi.items.LIBATION_ABJURATION,       250000,
        xi.items.OGRE_PUMPKIN,                   88,
        xi.items.SCROLL_OF_RERAISE_III,     500000,
        xi.items.PINCH_OF_TWINKLE_POWDER,      354,
        xi.items.CHOCOBO_EGG_FAINTLY_WARM,    1040,
        --]]
    }

    player:showText(npc, ID.text.DABIHJAJALIOH_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
