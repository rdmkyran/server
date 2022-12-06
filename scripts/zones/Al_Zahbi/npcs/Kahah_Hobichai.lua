-----------------------------------
-- Area: Al Zahbi
--  NPC: Kahah Hobichai
-- Standard Merchant NPC
-- TODO: Stock needs to be modified based on
--       status of Astral Candescence
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.RUSTY_BUCKET,                  200,
        xi.items.PICKAXE,                      200,
        xi.items.SICKLE,                      300,
        xi.items.HATCHET,                     500,
        xi.items.BRONZE_KNIFE,               164,
        xi.items.KNIFE,                     2425
    }

    player:showText(npc, ID.text.KAHAHHOBICHAI_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
