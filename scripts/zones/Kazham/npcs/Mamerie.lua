-----------------------------------
-- Area: Kazham
--  NPC: Mamerie
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
        xi.items.BUNCH_OF_GYSAHL_GREENS,       62,
        xi.items.CHOCOBO_FEATHER,                7,
        xi.items.PET_FOOD_ALPHA_BISCUIT,      11,
        xi.items.PET_FOOD_BETA_BISCUIT,       82,
        xi.items.JUG_OF_CARROT_BROTH,         82,
        xi.items.JUG_OF_BUG_BROTH,           695,
        xi.items.JUG_OF_HERBAL_BROTH,        126,
        xi.items.JUG_OF_CARRION_BROTH,       695,
        xi.items.SCROLL_OF_CHOCOBO_MAZURKA, 50784,
    }

    player:showText(npc, ID.text.MAMERIE_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
