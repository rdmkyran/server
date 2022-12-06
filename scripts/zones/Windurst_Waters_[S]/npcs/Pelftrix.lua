-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Pelftrix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.HI_POTION,                 4500,
        xi.items.HI_ETHER,                  28000,
        xi.items.SICKLE,                    300,
        xi.items.HATCHET,                   500,
    }

    player:showText(npc, ID.text.PELFTRIX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
