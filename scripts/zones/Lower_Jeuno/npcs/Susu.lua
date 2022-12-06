-----------------------------------
-- Area: Lower Jeuno
--  NPC: Susu
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_SLEEP_II,          8720,
        xi.items.SCROLL_OF_SLEEPGA,          11200,
        xi.items.SCROLL_OF_STONE_III,        19932,
        xi.items.SCROLL_OF_STONE_IV,        108000,
        xi.items.SCROLL_OF_STONEGA_II,       12000,
        xi.items.SCROLL_OF_STONEGA_III,      69875,
        xi.items.SCROLL_OF_WATER_III,        22682,
        xi.items.SCROLL_OF_WATER_IV,        116000,
        xi.items.SCROLL_OF_WATERGA_II,       13050,
        xi.items.SCROLL_OF_WATERGA_III,      82250,
        xi.items.SCROLL_OF_AERO_III,         27744,
        xi.items.SCROLL_OF_AERO_IV,         131750,
        xi.items.SCROLL_OF_AEROGA_II,        19800,
        xi.items.SCROLL_OF_AEROGA_III,       95625,
        xi.items.SCROLL_OF_FIRE_III,         33306,
        xi.items.SCROLL_OF_FIRE_IV,         148500,
        xi.items.SCROLL_OF_FIRAGA_II,        21307,
        xi.items.SCROLL_OF_FIRAGA_III,      112000,
        xi.items.SCROLL_OF_BLIZZARD_III,     39368,
        xi.items.SCROLL_OF_BLIZZARD_IV,     166250,
        xi.items.SCROLL_OF_BLIZZAGA_II,      26244,
        xi.items.SCROLL_OF_BLIZZAGA_III,    127500,
        xi.items.SCROLL_OF_THUNDER_III,      45930,
        xi.items.SCROLL_OF_THUNDER_IV,      185000,
        xi.items.SCROLL_OF_THUNDAGA_II,      31681,
        xi.items.SCROLL_OF_THUNDAGA_III,    144000,
        xi.items.SCROLL_OF_QUAKE,            60000,
        xi.items.SCROLL_OF_FLOOD,            67500,
        xi.items.SCROLL_OF_TORNADO,          56250,
        xi.items.SCROLL_OF_FLARE,            71250,
        xi.items.SCROLL_OF_FREEZE,           52500,
        xi.items.SCROLL_OF_BURST,            63750,
        xi.items.SCROLL_OF_FLARE_II,        119180,
        xi.items.SCROLL_OF_FREEZE_II,       119180,
        xi.items.SCROLL_OF_TORNADO_II,      119180,
        xi.items.SCROLL_OF_QUAKE_II,        119180,
        xi.items.SCROLL_OF_BURST_II,        119180,
        xi.items.SCROLL_OF_FLOOD_II,        119180,
        xi.items.SCROLL_OF_BIO_III,         139125,
        xi.items.SCROLL_OF_BLIND_II,        139125,
    }

    player:showText(npc, ID.text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
