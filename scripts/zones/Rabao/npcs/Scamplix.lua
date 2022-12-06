-----------------------------------
-- Area: Rabao
--  NPC: Scamplix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FLASK_OF_DISTILLED_WATER,     10,
        xi.items.STRIP_OF_MEAT_JERKY,         108,
        xi.items.LOAF_OF_GOBLIN_BREAD,        270,
        xi.items.CACTUS_ARM,                  720,
        xi.items.ETHER,                      4348,
        xi.items.THUNDERMELON,                292,
        xi.items.WATERMELON,                  180,
        xi.items.POTION,                      819,
        xi.items.ANTIDOTE,                    284,
        xi.items.FLASK_OF_BLINDNESS_POTION,  1080,
        xi.items.MYTHRIL_EARRING,           4050,
        xi.items.WATER_JUG,                    180,
        -- 2868,  9000,    -- Rabao Waystone
    }

    player:showText(npc, ID.text.SCAMPLIX_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
