-----------------------------------
-- Area: Kazham
--  NPC: Tahn Posbei
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Kazham/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LAUAN_SHIELD,                110,
        xi.items.MAHOGANY_SHIELD,            4531,
        xi.items.ROUND_SHIELD,              59607,
        xi.items.BEETLE_MASK,                7026,
        xi.items.BEETLE_HARNESS,            10833,
        xi.items.BEETLE_MITTENS,             5707,
        xi.items.BEETLE_SUBLIGAR,            8666,
        xi.items.BEETLE_LEGGINGS,            5332,
        xi.items.LEATHER_BANDANA,             404,
        xi.items.LEATHER_VEST,                618,
        xi.items.LEATHER_GLOVES,              331,
        xi.items.LEATHER_HIGHBOOTS,           309,
        xi.items.COEURL_GORGET,             28777,
    }

    player:showText(npc, ID.text.TAHNPOSBEI_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
