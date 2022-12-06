-----------------------------------
-- Area: Rabao
--  NPC: Brave Ox
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_PROTECT_IV,       77350,
        xi.items.SCROLL_OF_PROTECTRA_IV,     73710,
        xi.items.SCROLL_OF_DISPEL,           63700,
        xi.items.SCROLL_OF_STUN,             31850,
        xi.items.SCROLL_OF_FLASH,            31850,
        xi.items.SCROLL_OF_RERAISE_III,     546000,
        xi.items.SCROLL_OF_BANISH_III,       78260,
        xi.items.SCROLL_OF_CURA,             20092,
        xi.items.SCROLL_OF_CURA_II,          88389,
        xi.items.SCROLL_OF_SACRIFICE,        62192,
        xi.items.SCROLL_OF_ESUNA,            64584,
        xi.items.SCROLL_OF_AUSPICE,          30967,
        xi.items.SCROLL_OF_CURE_VI,         141137,
        xi.items.SCROLL_OF_PROTECT_V,       103882,
        xi.items.SCROLL_OF_SHELL_V,         125069,
        xi.items.SCROLL_OF_CRUSADE,         140332,
    }

    player:showText(npc, ID.text.BRAVEOX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
