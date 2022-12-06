-----------------------------------
-- Area: Western Adoulin
--  NPC: Ledericus
-- Type: Shop NPC
-- !pos 37 32 117 256
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
    player:showText(npc, ID.text.LEDERICUS_SHOP_TEXT)
    local stock =
    {
        xi.items.SCROLL_OF_FIRA,            34000,
        xi.items.SCROLL_OF_FIRA_II,         604800,
        xi.items.SCROLL_OF_BLIZZARA,        46440,
        xi.items.SCROLL_OF_BLIZZARA_II,     652800,
        xi.items.SCROLL_OF_AERORA,          26600,
        xi.items.SCROLL_OF_AERORA_II,       556800,
        xi.items.SCROLL_OF_STONERA,         7476,
        xi.items.SCROLL_OF_STONERA_II,      504000,
        xi.items.SCROLL_OF_THUNDARA,        54600,
        xi.items.SCROLL_OF_THUNDARA_II,     722700,
        xi.items.SCROLL_OF_WATERA,          21000,
        xi.items.SCROLL_OF_WATERA_II,       530265,
        xi.items.SCROLL_OF_FOIL,            83160,
        xi.items.SCROLL_OF_HASTE_II,        396825,
        xi.items.SCROLL_OF_FLURRY_II,       396825,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
