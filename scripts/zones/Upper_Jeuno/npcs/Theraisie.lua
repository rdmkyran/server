-----------------------------------
-- Area: Upper Jeuno
--  NPC: Theraisie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.JUG_OF_LIVID_BROTH,         200,
        xi.items.JUG_OF_LYRICAL_BROTH,       344,
        xi.items.JUG_OF_AIRY_BROTH,          519,
        xi.items.HANDFUL_OF_CRUMBLY_SOIL,   1016,
        xi.items.JUG_OF_BLACKWATER_BROTH,   1484,
        xi.items.JUG_OF_PALE_SAP,           1747,
        xi.items.JUG_OF_CRACKLING_BROTH,    1747,
        xi.items.JUG_OF_MEATY_BROTH,        2195,
        xi.items.JUG_OF_RAPID_BROTH,        2371,
        xi.items.JUG_OF_CREEPY_BROTH,       2425,
        xi.items.JUG_OF_MUDDY_BROTH,        2853,
        xi.items.JUG_OF_DIRE_BROTH,         3004,
        xi.items.PET_FOOD_ALPHA_BISCUIT,     100,
        xi.items.PET_FOOD_BETA_BISCUIT,      200,
        xi.items.PET_FOOD_GAMMA_BISCUIT,     350,
        xi.items.PET_FOOD_DELTA_BISCUIT,     500,
        xi.items.PET_FOOD_EPSILON_BISCUIT,   750,
        xi.items.PET_FOOD_ZETA_BISCUIT,     1000,
        xi.items.PET_FOOD_ETA_BISCUIT,      1500,
        xi.items.PET_FOOD_THETA_BISCUIT,    2000,
        xi.items.PET_ROBORANT,               300,
        xi.items.PET_POULTICE,               250,
    }

    player:showText(npc, ID.text.MP_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
