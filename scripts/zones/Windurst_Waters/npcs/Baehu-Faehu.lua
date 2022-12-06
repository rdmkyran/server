-----------------------------------
-- Area: Windurst Waters
--  NPC: Baehu-Faehu
-- Only sells when Windurst has control of Sarutabaruta
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/items")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.SARUTABARUTA)
    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.BAEHUFAEHU_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.BAEHUFAEHU_OPEN_DIALOG)

        local stock =
        {
            xi.items.RARAB_TAIL,                 22,
            xi.items.LAUAN_LOG,                   33,
            xi.items.POPOTO,                      43,
            xi.items.SARUTA_ORANGE,              29,
            xi.items.CLUMP_OF_WINDURSTIAN_TEA_LEAVES,   18
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)

    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
