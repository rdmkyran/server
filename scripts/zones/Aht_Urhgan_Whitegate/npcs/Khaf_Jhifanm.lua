-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Khaf Jhifanm
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.DRIED_DATE,                  200,
        xi.items.FLASK_OF_AYRAN,              800,
        xi.items.BALIK_SANDVICI,             3750,
        xi.items.BAG_OF_WILDGRASS_SEEDS,      320,
        xi.items.SCROLL_OF_RAPTOR_MAZURKA,   4400,
        xi.items.EMPIRE_WAYSTONE,           10000
    }

    player:showText(npc, ID.text.KHAFJHIFANM_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
