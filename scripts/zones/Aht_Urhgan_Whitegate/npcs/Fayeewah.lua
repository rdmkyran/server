-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Fayeewah
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
        xi.items.CUP_OF_CHAI,                 68,
        xi.items.IRMIK_HELVASI,             2075
    }

    player:showText(npc, ID.text.FAYEEWAH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
