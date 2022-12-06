-----------------------------------
-- Area: Selbina
--  NPC: Quelpia
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
        xi.items.SCROLL_OF_CURE_II,           585,
        xi.items.SCROLL_OF_CURE_III,         3261,
        xi.items.SCROLL_OF_CURAGA_II,       10080,
        xi.items.SCROLL_OF_RAISE,            5178,
        xi.items.SCROLL_OF_HOLY,            31500,
        xi.items.SCROLL_OF_DIA_II,          10080,
        xi.items.SCROLL_OF_BANISH_II,        8100,
        xi.items.SCROLL_OF_PROTECT_II,       6366,
        xi.items.SCROLL_OF_SHELL_II,        15840,
        xi.items.SCROLL_OF_HASTE,           18000,
        xi.items.SCROLL_OF_ENFIRE,           4644,
        xi.items.SCROLL_OF_ENBLIZZARD,       3688,
        xi.items.SCROLL_OF_ENAERO,           2250,
        xi.items.SCROLL_OF_ENSTONE,          1827,
        xi.items.SCROLL_OF_ENTHUNDER,        1363,
        xi.items.SCROLL_OF_ENWATER,          6366,
    }

    player:showText(npc, ID.text.QUELPIA_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
