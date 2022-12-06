-----------------------------------
-- Area: Fort Karugo-Narugo
--  NPC: Spondulix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.HI_POTION,                  4500,
        xi.items.HI_ETHER,                  28000,
        xi.items.LUMP_OF_KARUGO_NARUGO_CLAY,  3035,
    }

    player:showText(npc, ID.text.SPONDULIX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
