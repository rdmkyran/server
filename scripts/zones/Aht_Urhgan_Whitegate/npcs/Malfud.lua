-----------------------------------
-- Area: Aht Urhfan Whitegate
--  NPC: Malfud
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CHUNK_OF_ROCK_SALT,         16,
        xi.items.PINCH_OF_BLACK_PEPPER,     255,
        xi.items.FLASK_OF_OLIVE_OIL,         16,
        xi.items.EGGPLANT,                  44,
        xi.items.MITHRAN_TOMATO,            40,
        xi.items.HANDFUL_OF_PINE_NUTS,      12
    }

    player:showText(npc, ID.text.MALFUD_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
