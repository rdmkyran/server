-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Kulh Amariyo
-- Standard Merchant NPC
-- TODO: Stock needs to be modified based on
--       status of Astral Candescence
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
        xi.items.CRAYFISH,                    38,
        xi.items.YILANBALIGI,               1200,
        xi.items.SAZANBALIGI,               1800,
        xi.items.KAYABALIGI,                4650,
        xi.items.ALABALIGI,                  130
    }

    player:showText(npc, ID.text.KULHAMARIYO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
