-----------------------------------
-- Area: Selbina
--  NPC: Torapiont
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CLAWS,                     11491,
        xi.items.MYTHRIL_DAGGER,             7727,
        xi.items.TUCK,                      11588,
        xi.items.MYTHRIL_CLAYMORE,          37800,
        xi.items.BATTLEAXE,                 11040,
        xi.items.GREATAXE,                   4095,
        xi.items.WILLOW_WAND,                 333,
        xi.items.YEW_WAND,                   1409,
        xi.items.HOLLY_STAFF,                 571,
        xi.items.DART,                          9,
        xi.items.CROSSBOW_BOLT,                 5,
        xi.items.WOODEN_ARROW,                  3,
        xi.items.IRON_ARROW,                    7,
    }

    player:showText(npc, ID.text.TORAPIONT_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
