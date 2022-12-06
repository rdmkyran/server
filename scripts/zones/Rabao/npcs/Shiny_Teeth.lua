-----------------------------------
-- Area: Rabao
--  NPC: Shiny Teeth
-- Standard Merchant NPC
-- !pos -30 8 99 247
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
        xi.items.DAGGER,                      1867,
        xi.items.KRIS,                       11128,
        xi.items.KNIFE,                       2231,
        xi.items.SCIMITAR,                    4163,
        xi.items.TULWAR,                     35308,
        xi.items.FALCHION,                   62560,
        xi.items.ROD,                         2439,
        xi.items.JAMADHARS,                 103803,
        xi.items.COMPOSITE_BOW,              23887,
        xi.items.TATHLUM,                      294,
        xi.items.IRON_ARROW,                     7,
        xi.items.BULLET,                        92,
        xi.items.RIOT_GRENADE,                5460,
        xi.items.CHAKRAM,                     8996,
    }

    player:showText(npc, ID.text.SHINY_TEETH_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
