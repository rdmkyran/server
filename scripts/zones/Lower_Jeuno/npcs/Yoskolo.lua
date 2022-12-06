-----------------------------------
-- Area: Lower Jeuno
--  NPC: Yoskolo
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/items")
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
        xi.items.FLASK_OF_DISTILLED_WATER,     10 * priceMultiplier,
        xi.items.BOTTLE_OF_ORANGE_JUICE,      184 * priceMultiplier,
        xi.items.BOTTLE_OF_APPLE_JUICE,       276 * priceMultiplier,
        xi.items.BOTTLE_OF_MELON_JUICE,      1012 * priceMultiplier,
        xi.items.BOTTLE_OF_GRAPE_JUICE,       855 * priceMultiplier,
        xi.items.BOTTLE_OF_PINEAPPLE_JUICE,   368 * priceMultiplier,
        xi.items.SERVING_OF_ICECAP_ROLANBERRY,  5544 * priceMultiplier,
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
