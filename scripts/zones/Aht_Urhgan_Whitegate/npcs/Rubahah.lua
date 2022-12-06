-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Rubahah
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
        xi.items.EAR_OF_MILLIONCORN,          48,
        xi.items.BAG_OF_IMPERIAL_FLOUR,      60,
        xi.items.BAG_OF_IMPERIAL_RICE,       68,
        xi.items.BAG_OF_COFFEE_BEANS,       316
    }

    player:showText(npc, ID.text.RUBAHAH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
