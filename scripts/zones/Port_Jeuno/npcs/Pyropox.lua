-----------------------------------
-- Area: Port Jeuno
--  NPC: Pyropox
-- Standard Merchant NPC
-- !pos -17.580 4.000 24.600 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

local stock =
{
    xi.items.FESTIVE_FAN,                 25,
    xi.items.SUMMER_FAN,                  25,
    xi.items.OUKA_RANMAN,                 25,
    xi.items.KONGOU_INAHO,                50,
    xi.items.MEIFU_GOMA,                  50,
    xi.items.SPIRIT_MASQUE,               50,
    xi.items.SHISAI_KABOKU,               50,
    xi.items.KONRON_HASSEN,              100,
    xi.items.MUTEPPO,                    100,
    xi.items.DATECHOCHIN,                100,
    xi.items.KOMANEZUMI,                 150,
    xi.items.RENGEDAMA,                  250,
    xi.items.ICHININTOUSEN_KOMA,         250,
    xi.items.GOSHIKITENGE,               300,
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCharVar("spokePyropox") == 1 then
        player:startEvent(349)
    else
        player:showText(npc, ID.text.PYROPOX_SHOP_DIALOG)
        xi.shop.general(player, stock)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 349 and option == 0 then
        xi.shop.general(player, stock)
        player:setCharVar("spokePyropox", 0)
    end
end

return entity
