-----------------------------------
-- Area: Norg
--  NPC: Solby-Maholby
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LUGWORM,                       9,
        xi.items.EARTH_SPIRIT_PACT,            450,
        xi.items.NORG_WAYSTONE,               9000,
        xi.items.SCROLL_OF_AISHA_ICHI,       79380,
        xi.items.SCROLL_OF_MYOSHU_ICHI,      93243,
        xi.items.SCROLL_OF_YURIN_ICHI,       90283,
        xi.items.SCROLL_OF_KAKKA_ICHI,      133000,
        xi.items.SCROLL_OF_GEKKA_ICHI,      140319,
        xi.items.SCROLL_OF_YAIN_ICHI,       140319,
        xi.items.SCROLL_OF_KATON_SAN,       119250,
        xi.items.SCROLL_OF_HYOTON_SAN,      119250,
        xi.items.SCROLL_OF_HUTON_SAN,       119250,
        xi.items.SCROLL_OF_DOTON_SAN,       119250,
        xi.items.SCROLL_OF_RAITON_SAN,      119250,
        xi.items.SCROLL_OF_SUITON_SAN,      119250,
    }

    player:showText(npc, ID.text.SOLBYMAHOLBY_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
