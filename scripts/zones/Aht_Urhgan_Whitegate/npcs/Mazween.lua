-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mazween
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_SLEEPGA,         11200,
        xi.items.SCROLL_OF_SLEEP_II,        18720,
        xi.items.SCROLL_OF_POISON_II,       25200,
        xi.items.SCROLL_OF_BIO_II,          14000,
        xi.items.SCROLL_OF_POISONGA,         5160,
        xi.items.SCROLL_OF_STONE_III,       19932,
        xi.items.SCROLL_OF_WATER_III,       22682,
        xi.items.SCROLL_OF_AERO_III,        27744,
        xi.items.SCROLL_OF_FIRE_III,        33306,
        xi.items.SCROLL_OF_BLIZZARD_III,    39368,
        xi.items.SCROLL_OF_THUNDER_III,     45930,
        xi.items.SCROLL_OF_ABSORB_TP,       27000,
        xi.items.SCROLL_OF_DRAIN_II,        30780,
        xi.items.SCROLL_OF_DREAD_SPIKES,    70560,
        xi.items.SCROLL_OF_ABSORB_ACC,      44000,
        xi.items.SCROLL_OF_ASPIR_II,        79800
    }

    player:showText(npc, ID.text.MAZWEEN_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
