-----------------------------------
-- Area: Nashmau
--  NPC: Chichiroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BOLTERS_DIE,                99224,
        xi.items.CASTERS_DIE,                85500,
        xi.items.COURSERS_DIE,               97350,
        xi.items.BLITZERS_DIE,              100650,
        xi.items.TACTICIANS_DIE,            109440,
        xi.items.ALLIES_DIE,                116568,
        xi.items.MISERS_DIE,                 96250,
        xi.items.COMPANIONS_DIE,             95800,
        xi.items.AVENGERS_DIE,              123744,
        xi.items.GEOMANCER_DIE,              69288,
        xi.items.RUNE_FENCER_DIE,            73920,
    }

    player:showText(npc, ID.text.CHICHIROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
