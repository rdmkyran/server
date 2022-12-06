-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Bajahb
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
        xi.items.IRON_MASK,                 10260,
        xi.items.CHAINMAIL,                 15840,
        xi.items.CHAIN_MITTENS,              8460,
        xi.items.CHAIN_HOSE,                12600,
        xi.items.GREAVES,                    7740
    }

    player:showText(npc, ID.text.BAJAHB_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
