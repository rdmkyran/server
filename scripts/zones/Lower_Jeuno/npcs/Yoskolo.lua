-----------------------------------
-- Area: Lower Jeuno
--  NPC: Yoskolo
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local priceMultiplier = (1 + (0.13 * (9 - player:getFameLevel(xi.quest.fame_area.JEUNO)) / 8)) * xi.settings.main.SHOP_PRICE
    local stock =
    {
        -- Scrolls are not effected by fame
        4509,    10 * priceMultiplier, -- Distilled Water
        4422,   184 * priceMultiplier, -- Orange Juice
        4423,   276 * priceMultiplier, -- Apple Juice
        4424,  1012 * priceMultiplier, -- Melon Juice
        4441,   855 * priceMultiplier, -- Grape Juice
        4442,   368 * priceMultiplier, -- Pineapple Juice
        4556,  5544 * priceMultiplier, -- Icecap Rolanberry
        xi.items.SCROLL_OF_FIRE_CAROL,       6380,
        xi.items.SCROLL_OF_ICE_CAROL,        7440,
        xi.items.SCROLL_OF_WIND_CAROL,       5940,
        xi.items.SCROLL_OF_EARTH_CAROL,      4600,
        xi.items.SCROLL_OF_LIGHTNING_CAROL,  7920,
        xi.items.SCROLL_OF_WATER_CAROL,      5000,
        xi.items.SCROLL_OF_LIGHT_CAROL,      4200,
        xi.items.SCROLL_OF_DARK_CAROL,       8400,
        -- 5078, 60000, -- Scroll of Sentinel's Scherzo (2010 Abyssea)
    }

    player:showText(npc, ID.text.YOSKOLO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
