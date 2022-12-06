-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Silke
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ANIMUS_AUGEO_SCHEMA,       29925,
        xi.items.ANIMUS_MINUO_SCHEMA,       29925,
        xi.items.ADLOQUIUM_SCHEMA,          36300
    }

    player:showText(npc, ID.text.SILKE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
