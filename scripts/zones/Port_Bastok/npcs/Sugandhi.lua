-----------------------------------
-- Area: Port Bastok
--  NPC: Sugandhi
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.KUKRI,                      5589, 1,
        xi.items.BROADSWORD,                21067, 1,
        xi.items.TUCK,                      11588, 1,
        xi.items.FALCHION,                  61200, 1,
        xi.items.KNIFE,                      2182, 2,
        xi.items.MYTHRIL_SWORD,             30960, 2,
        xi.items.SCIMITAR,                   4072, 2,
        xi.items.BRONZE_KNIFE,                147, 3,
        xi.items.CAT_BAGHNAKHS,               104, 3,
        xi.items.BRONZE_SWORD,                241, 3,
        xi.items.IRON_SWORD,                 7128, 3,
        xi.items.DEGEN,                      9201, 3,
        xi.items.SAPARA,                      698, 3,
    }

    player:showText(npc, ID.text.SUGANDHI_SHOP_DIALOG)
    if player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
        xi.shop.nation(player, stock, xi.nation.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
