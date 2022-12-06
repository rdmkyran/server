-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hagakoff
-- Standard Merchant NPC
-- TODO: Stock needs to be modified based on
--       status of Astral Candescence
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.KATARS,                     15448,
        xi.items.DARKSTEEL_KATARS,           67760,
        xi.items.PATAS,                      45760,
        xi.items.BRONZE_DAGGER,                156,
        xi.items.DAGGER,                      2030,
        xi.items.SAPARA,                       776,
        xi.items.SCIMITAR,                    4525,
        xi.items.TULWAR,                     38800,
        xi.items.TABAR,                       6600,
        xi.items.DARKSTEEL_TABAR,           124305,
        xi.items.BUTTERFLY_AXE,                672,
        xi.items.GREATAXE,                    4550,
        xi.items.BRONZE_ZAGHNAL,               344,
        xi.items.ZAGHNAL,                    12540,
        xi.items.ASH_CLUB,                      72,
        xi.items.CHESTNUT_CLUB,               1740,
        xi.items.ANGON,                        238
    }

    player:showText(npc, ID.text.HAGAKOFF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
