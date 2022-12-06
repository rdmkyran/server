-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mulnith
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
        xi.items.ROAST_MUSHROOM,             344,
        xi.items.SIS_KEBABI,                2000,
        xi.items.BALIK_SIS,                 3000
    }

    player:showText(npc, ID.text.MULNITH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
