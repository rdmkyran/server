-----------------------------------
-- Area: Rabao
--  NPC: Generoit
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BUNCH_OF_GYSAHL_GREENS,       61,
        xi.items.CHOCOBO_FEATHER,                7,
        xi.items.PET_FOOD_ALPHA_BISCUIT,      10,
        xi.items.PET_FOOD_BETA_BISCUIT,       81,
        xi.items.JUG_OF_CARROT_BROTH,         81,
        xi.items.JUG_OF_BUG_BROTH,           687,
        xi.items.JUG_OF_HERBAL_BROTH,        125,
        xi.items.JUG_OF_CARRION_BROTH,       687,
        xi.items.SCROLL_OF_CHOCOBO_MAZURKA, 50784,
    }

    player:showText(npc, ID.text.GENEROIT_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
