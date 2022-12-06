-----------------------------------
-- Area: Western Adoulin
--  NPC: Ansegusele
-- Type: Shop NPC
-- !pos 74 4 -126 256
-----------------------------------
require("scripts/globals/shop")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Standard shop
    player:showText(npc, ID.text.ANSEGUSELE_SHOP_TEXT)
    local stock =
    {
        xi.items.FAERIE_APPLE,              44,
        xi.items.EGGPLANT,                  44,
        xi.items.RARAB_TAIL,                24,
        xi.items.POPOTO,                    48,
        xi.items.BUNCH_OF_PAMAMAS,          80,
        xi.items.SAN_DORIAN_CARROT,         32,
        xi.items.OGRE_PUMPKIN,              96,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
