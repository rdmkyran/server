-----------------------------------
-- Area: Upper Jeuno
--  NPC: Antonia
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ARASY_SAINTI,              100100,
        xi.items.ARASY_KNIFE,               100100,
        xi.items.ARASY_SWORD,               100100,
        xi.items.ARASY_CLAYMORE,            100100,
        xi.items.ARASY_TABAR,               100100,
        xi.items.ARASY_AXE,                 100100,
        xi.items.ARASY_SCYTHE,              100100,
        xi.items.ARASY_LANCE,               100100,
        xi.items.YOSHIKIRI,                 100100,
        xi.items.ASHIJIRO_NO_TACHI,         100100,
        xi.items.ARASY_ROD,                 100100,
        xi.items.ARASY_STAFF,               100100,
        xi.items.ARASY_BOW,                 100100,
        xi.items.ARASY_GUN,                 100100,
        xi.items.ANIMATOR_Z,                100100,
        xi.items.ARASY_SACHET,              100100,
    }

    player:showText(npc, ID.text.VIETTES_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
