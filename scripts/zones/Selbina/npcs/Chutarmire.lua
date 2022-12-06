-----------------------------------
-- Area: Selbina
--  NPC: Chutarmire
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
        xi.items.SCROLL_OF_STONE_II,         5751,
        xi.items.SCROLL_OF_WATER_II,         8100,
        xi.items.SCROLL_OF_AERO_II,         11970,
        xi.items.SCROLL_OF_FIRE_II,         16560,
        xi.items.SCROLL_OF_BLIZZARD_II,     21870,
        xi.items.SCROLL_OF_THUNDER_II,      27900,
        xi.items.SCROLL_OF_STONEGA,          1165,
        xi.items.SCROLL_OF_WATERGA,          2097,
        xi.items.SCROLL_OF_AEROGA,           4147,
        xi.items.SCROLL_OF_FIRAGA,           7025,
        xi.items.SCROLL_OF_BLIZZAGA,        10710,
        xi.items.SCROLL_OF_THUNDAGA,        15120,
        xi.items.SCROLL_OF_POISON_II,       22680,
        xi.items.SCROLL_OF_BIO_II,          12600,
        xi.items.SCROLL_OF_POISONGA,         4644,
        xi.items.SCROLL_OF_SHOCK_SPIKES,     8100,
    }

    player:showText(npc, ID.text.CHUTARMIRE_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
