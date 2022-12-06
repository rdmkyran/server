-----------------------------------
-- Area: Selbina
--  NPC: Herminia
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.HACHIMAKI,                  552,
        xi.items.KENPOGI,                    833,
        xi.items.TUNIC,                     1274,
        xi.items.TEKKO,                      458,
        xi.items.MITTS,                      596,
        xi.items.SITABAKI,                   666,
        xi.items.KYAHAN,                     424,
        xi.items.SOLEA,                      544,
    }

    player:showText(npc, ID.text.HERMINIA_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
