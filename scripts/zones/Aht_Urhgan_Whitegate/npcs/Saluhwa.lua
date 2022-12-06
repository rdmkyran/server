-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Saluhwa
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
        xi.items.MAPLE_SHIELD,                605,
        xi.items.ELM_SHIELD,                 1815,
        xi.items.MAHOGANY_SHIELD,            4980,
        xi.items.OAK_SHIELD,                15600,
        xi.items.ROUND_SHIELD,              64791
    }

    player:showText(npc, ID.text.SALUHWA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
