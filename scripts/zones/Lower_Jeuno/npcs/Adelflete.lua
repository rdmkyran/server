-----------------------------------
-- Area: Lower Jeuno
--  NPC: Adelflete
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.TOURMALINE,                  1863,
        xi.items.SARDONYX,                    1863,
        xi.items.AMETHYST,                    1863,
        xi.items.AMBER_STONE,                 1863,
        xi.items.LAPIS_LAZULI,                1863,
        xi.items.CLEAR_TOPAZ,                 1863,
        xi.items.ONYX,                        1863,
        xi.items.LIGHT_OPAL,                  1863,
        xi.items.SILVER_EARRING,            1250,
        xi.items.SILVER_RING,               1250,
    }

    player:showText(npc, ID.text.GEMS_BY_KSHAMA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
