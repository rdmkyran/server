-----------------------------------
-- Area: Kazham
--  NPC: Ghemi Senterilo
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Kazham/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BUNCH_OF_PAMAMAS,            72,
        xi.items.KAZHAM_PINEAPPLE,            54,
        xi.items.MITHRAN_TOMATO,              36,
        xi.items.BUNCH_OF_KAZHAM_PEPPERS,      54,
        xi.items.STICK_OF_CINNAMON,           236,
        xi.items.KUKURU_BEAN,                 109,
        xi.items.ELSHIMO_COCONUT,            156,
        xi.items.ELSHIMO_PACHIRA_FRUIT,      154,
        -- 2869, 9100,    -- Kazham Waystone (SOA)
        xi.items.AQUILARIA_LOG,              2877,
    }

    player:showText(npc, ID.text.GHEMISENTERILO_SHOP_DIALOG)
    if player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
