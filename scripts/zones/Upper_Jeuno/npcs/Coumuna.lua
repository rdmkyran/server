-----------------------------------
-- Area: Upper Jeuno
--  NPC: Coumuna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.GREATAXE,                   4550,
        xi.items.MYTHRIL_DEGEN,             31000,
        xi.items.KRIS,                      12096,
        xi.items.MYTHRIL_KNIFE,             14560,
        xi.items.KATARS,                    15488,
        xi.items.TWO_HANDED_SWORD,          13962,
        xi.items.MYTHRIL_CLAWS,             29760,
        xi.items.KNIGHTS_SWORD,             85250,
        xi.items.MYTHRIL_AXE,               48600,
        xi.items.MYTHRIL_ROD,                6256,
        xi.items.OAK_CUDGEL,                11232,
        xi.items.MYTHRIL_MACE,              18048,
        xi.items.WARHAMMER,                  6558,
        xi.items.OAK_POLE,                  37440,
        xi.items.HALBERD,                   44550,
        xi.items.SCYTHE,                    10596,
        xi.items.IRON_ARROW,                    8,
    }

    player:showText(npc, ID.text.VIETTES_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
