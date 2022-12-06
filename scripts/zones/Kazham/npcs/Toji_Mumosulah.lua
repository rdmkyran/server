-----------------------------------
-- Area: Kazham
--  NPC: Toji Mumosulah
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Kazham/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.YELLOW_JAR,                   456,
        xi.items.BLOOD_STONE,                 95,
        xi.items.FANG_NECKLACE,             3510,
        xi.items.BONE_EARRING,              1667,
        xi.items.GEMSHORN,                  4747,
        xi.items.PEELED_CRAYFISH,             69,
        xi.items.BALL_OF_INSECT_PASTE,        36,
        xi.items.JUG_OF_FISH_BROTH,          165,
        xi.items.JUG_OF_SEEDBED_SOIL,        695,
        xi.items.HATCHET,                     450,
        xi.items.SCROLL_OF_ARMYS_PAEON_II,    328,
        xi.items.SCROLL_OF_FOE_LULLABY_II,  64528,
        xi.items.SCROLL_OF_ARMYS_PAEON_III,  3312,
        xi.items.SCROLL_OF_MONOMI_ICHI,      8726,
    }

    player:showText(npc, ID.text.TOJIMUMOSULAH_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
