-----------------------------------
-- Area: Western Adoulin
--  NPC: Eukalline
-- Type: Shop NPC
-- !pos 40 32 121 256
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
    player:showText(npc, ID.text.EUKALLINE_SHOP_TEXT)
    local stock =
    {
        xi.items.PLATE_OF_INDI_ACUMEN,      52080,
        xi.items.PLATE_OF_INDI_STR,         53460,
        xi.items.PLATE_OF_INDI_SLOW,        53460,
        xi.items.PLATE_OF_INDI_TORPOR,      61875,
        xi.items.PLATE_OF_INDI_SLIP,        83160,
        xi.items.PLATE_OF_INDI_LANGUOR,     94185,
        xi.items.PLATE_OF_INDI_PARALYSIS,   103040,
        xi.items.PLATE_OF_INDI_VEX,         504000,
        xi.items.PLATE_OF_INDI_FRAILTY,     537030,
        xi.items.PLATE_OF_INDI_WILT,        576300,
        xi.items.PLATE_OF_INDI_MALAISE,     617100,
        xi.items.PLATE_OF_INDI_GRAVITY,     617100,
        xi.items.PLATE_OF_INDI_FADE,        703800,
        xi.items.PLATE_OF_INDI_HASTE,       709716,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
