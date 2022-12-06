-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Ezura-Romazura
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_STONE_V,         123750,
        xi.items.SCROLL_OF_WATER_V,         133110,
        xi.items.SCROLL_OF_AERO_V,          144875,
        xi.items.SCROLL_OF_FIRE_V,          162500,
        xi.items.SCROLL_OF_BLIZZARD_V,      186375,
        xi.items.SCROLL_OF_STONEJA,         168150,
        xi.items.SCROLL_OF_WATERJA,         176700,
        xi.items.SCROLL_OF_FIRAJA,          193800,
        xi.items.SCROLL_OF_AEROJA,          185240,
        xi.items.SCROLL_OF_BREAK,           126000,
    }

    player:showText(npc, ID.text.EZURAROMAZURA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
