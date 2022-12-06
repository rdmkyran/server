-----------------------------------
-- Area: Western Adoulin
--  NPC: Ishvad
-- Type: Shop NPC
-- !pos 44 32 125 256
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
    player:showText(npc, ID.text.ISHVAD_SHOP_TEXT)
    local stock =
    {
        xi.items.PLATE_OF_INDI_POISON,      100,
        xi.items.PLATE_OF_INDI_VOIDANCE,    372,
        xi.items.PLATE_OF_INDI_PRECISION,   1400,
        xi.items.PLATE_OF_INDI_REGEN,       2335,
        xi.items.PLATE_OF_INDI_ATTUNEMENT,  2425,
        xi.items.PLATE_OF_INDI_FOCUS,       6692,
        xi.items.PLATE_OF_INDI_BARRIER,     10926,
        xi.items.PLATE_OF_INDI_REFRESH,     21000,
        xi.items.PLATE_OF_INDI_CHR,         21000,
        xi.items.PLATE_OF_INDI_MND,         23940,
        xi.items.PLATE_OF_INDI_FURY,        25270,
        xi.items.PLATE_OF_INDI_INT,         30912,
        xi.items.PLATE_OF_INDI_AGI,         32640,
        xi.items.PLATE_OF_INDI_FEND,        34000,
        xi.items.PLATE_OF_INDI_VIT,         43740,
        xi.items.PLATE_OF_INDI_DEX,         46440,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
