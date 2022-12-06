-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ostalie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ETHER,                      4445, 1,
        xi.items.POTION,                      837, 1,
        xi.items.FLASK_OF_ECHO_DROPS,         736, 2,
        xi.items.ANTIDOTE,                    290, 3,
        xi.items.CIRCLET,                    144, 3,
        xi.items.CUFFS,                      118, 3,
        xi.items.FLASK_OF_EYE_DROPS,         2387, 3,
        xi.items.HATCHET,                     450, 3,
        xi.items.LEATHER_BELT,               382, 3,
        xi.items.LIZARD_BELT,               2430, 3,
        xi.items.PICKAXE,                      180, 3,
        xi.items.ROBE,                       216, 3,
        xi.items.SLOPS,                      172, 3,
    }

    local rank = GetNationRank(xi.nation.SANDORIA)

    if rank ~= 1 then
        table.insert(stock, 1022)    -- Thief's Tools
        table.insert(stock, 3643)
        table.insert(stock, 3)
    elseif rank == 3 then
        table.insert(stock, 1023)    -- Living Key
        table.insert(stock, 5520)
        table.insert(stock, 3)
    end

    player:showText(npc, ID.text.OSTALIE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
