-----------------------------------
-- Area: Al Zahbi
--  NPC: Zafif
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_CURE_IV,         23400,
        xi.items.SCROLL_OF_CURAGA_II,       11200,
        xi.items.SCROLL_OF_CURAGA_III,      19932,
        xi.items.SCROLL_OF_PROTECT_III,     32000,
        xi.items.SCROLL_OF_PROTECT_IV,      91116,
        xi.items.SCROLL_OF_PROTECTRA_IV,    85500,
        xi.items.SCROLL_OF_HOLY,            35000,
        xi.items.SCROLL_OF_BANISHGA_II,     20000,
        xi.items.SCROLL_OF_SILENA,           2330,
        xi.items.SCROLL_OF_STONA,           19200,
        xi.items.SCROLL_OF_VIRUNA,          13300,
        xi.items.SCROLL_OF_CURSNA,           8586,
        xi.items.SCROLL_OF_DISPEL,          77600,
        xi.items.SCROLL_OF_FLASH,           27000,
        xi.items.SCROLL_OF_RERAISE_III,     99375,
        xi.items.SCROLL_OF_REPRISAL,        28500
    }

    player:showText(npc, ID.text.ZAFIF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
