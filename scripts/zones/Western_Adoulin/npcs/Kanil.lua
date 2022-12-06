-----------------------------------
-- Area: Western Adoulin
--  NPC: Kanil
-- Type: Shop NPC
-- !pos 154 4 -5 256
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/items")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Standard shop
    player:showText(npc, ID.text.KANIL_SHOP_TEXT)
    local stock =
    {
        xi.items.BAG_OF_SAN_DORIAN_FLOUR,   60,
        xi.items.FLASK_OF_DISTILLED_WATER,  12,
        xi.items.CHUNK_OF_ROCK_SALT,        16,
        xi.items.FLASK_OF_OLIVE_OIL,        16,
        xi.items.DISH_OF_SALSA,             148,
        xi.items.SPRIG_OF_APPLE_MINT,       316,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
