-----------------------------------
-- Area: Bibiki Bay
--  NPC: Pohka Chichiyowahl
-- Type: Standard Merchant NPC
-- !pos -415 -2 -430 4
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FASTWATER_FISHING_ROD,      1238, 3,
        xi.items.SINGLE_HOOK_FISHING_ROD,   11845, 3,
        -- 4148,    290, 3,    -- Antidote (2018)
    }

    player:showText(npc, ID.text.POHKA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
