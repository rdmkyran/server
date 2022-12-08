-----------------------------------
-- Area: Windurst Waters
--  NPC: Upih Khachla
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/items")
require("scripts/globals/shop")
require("scripts/globals/conquest")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.UPIHKHACHLA_SHOP_DIALOG)

    local stock =
    {
        xi.items.GRENADE,                   1107, 1,
        xi.items.POTION,                      837, 1,
        xi.items.WIJNRUIT,                     108, 1,
        xi.items.CHAMOMILE,                    119, 2,
        xi.items.FLASK_OF_ECHO_DROPS,         736, 2,
        xi.items.ETHER,                      4445, 2,
        xi.items.ANTIDOTE,                    290, 3,
        xi.items.ONZ_OF_DESALINATOR,         3960, 3,
        xi.items.PINCH_OF_DRIED_MARJORAM,       44, 3,
        xi.items.FLASK_OF_EYE_DROPS,         2387, 3,
        xi.items.PICKAXE,                      180, 3,
        xi.items.SALINATOR,                  3960, 3,
        xi.items.SICKLE,                      276, 3,
        xi.items.PINCH_OF_TWINKLE_POWDER,     354, 3,
    }

    local rank = GetNationRank(xi.nation.WINDURST)
    if rank ~= 1 then
        table.insert(stock, 1022) --Thief's Tools
        table.insert(stock, 3643)
        table.insert(stock, 3)
    end

    if rank == 3 then
        table.insert(stock, 1023) --Living Key
        table.insert(stock, 5520)
        table.insert(stock, 3)
    end

    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
