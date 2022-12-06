-----------------------------------
-- Area: Lower Jeuno
--  NPC: Hasim
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_CURE_IV,          23400,
        xi.items.SCROLL_OF_CURAGA_II,        11200,
        xi.items.SCROLL_OF_CURAGA_III,       19932,
        xi.items.SCROLL_OF_SILENA,            2330,
        xi.items.SCROLL_OF_STONA,            19200,
        xi.items.SCROLL_OF_VIRUNA,           13300,
        xi.items.SCROLL_OF_CURSNA,            8586,
        xi.items.SCROLL_OF_PROTECT_III,      32000,
        xi.items.SCROLL_OF_PROTECTRA_II,      7074,
        xi.items.SCROLL_OF_PROTECTRA_III,    19200,
        xi.items.SCROLL_OF_SHELL_III,        26244,
        xi.items.SCROLL_OF_SHELLRA,           1760,
        xi.items.SCROLL_OF_SHELLRA_II,       14080,
        xi.items.SCROLL_OF_SHELLRA_III,      26244,
        xi.items.SCROLL_OF_BARFIRE,           1760,
        xi.items.SCROLL_OF_BARBLIZZARD,       3624,
        xi.items.SCROLL_OF_BARAERO,            930,
        xi.items.SCROLL_OF_BARSTONE,           156,
        xi.items.SCROLL_OF_BARTHUNDER,        5754,
        xi.items.SCROLL_OF_BARWATER,           360,
        xi.items.SCROLL_OF_BARFIRA,           1760,
        xi.items.SCROLL_OF_BARBLIZZARA,       3624,
        xi.items.SCROLL_OF_BARAERA,            930,
        xi.items.SCROLL_OF_BARSTONRA,          156,
        xi.items.SCROLL_OF_BARTHUNDRA,        5754,
        xi.items.SCROLL_OF_BARWATERA,          360,
        xi.items.SCROLL_OF_BARSLEEP,           244,
        xi.items.SCROLL_OF_BARPOISON,          400,
        xi.items.SCROLL_OF_BARPARALYZE,        780,
        xi.items.SCROLL_OF_BARBLIND,          2030,
        xi.items.SCROLL_OF_BARSILENCE,        4608,
        xi.items.SCROLL_OF_BARSLEEPRA,         244,
        xi.items.SCROLL_OF_BARPOISONRA,        400,
        xi.items.SCROLL_OF_BARPARALYZRA,       780,
        xi.items.SCROLL_OF_BARBLINDRA,        2030,
        xi.items.SCROLL_OF_BARSILENCERA,      4608,
        xi.items.SCROLL_OF_BARPETRIFY,       15120,
        xi.items.SCROLL_OF_BARVIRUS,          9600,
        xi.items.SCROLL_OF_BARPETRA,         15120,
        xi.items.SCROLL_OF_BARVIRA,           9600,
        xi.items.SCROLL_OF_GAIN_VIT,         73740,
        xi.items.SCROLL_OF_GAIN_MND,         77500,
        xi.items.SCROLL_OF_GAIN_AGI,         85680,
        xi.items.SCROLL_OF_GAIN_CHR,         81900,
        xi.items.SCROLL_OF_GAIN_STR,         89804,
        xi.items.SCROLL_OF_GAIN_INT,         94461,
        xi.items.SCROLL_OF_GAIN_DEX,         99613,
        xi.items.SCROLL_OF_BOOST_VIT,        73740,
        xi.items.SCROLL_OF_BOOST_MND,        77500,
        xi.items.SCROLL_OF_BOOST_AGI,        85680,
        xi.items.SCROLL_OF_BOOST_CHR,        81900,
        xi.items.SCROLL_OF_BOOST_STR,        89804,
        xi.items.SCROLL_OF_BOOST_INT,        94461,
        xi.items.SCROLL_OF_BOOST_DEX,        99613,
        xi.items.SCROLL_OF_INUNDATION,       73500,
        xi.items.SCROLL_OF_ADDLE,           130378,
        xi.items.SCROLL_OF_HOLY,             35000,
        xi.items.SCROLL_OF_BANISHGA_II,      20000,
        xi.items.SCROLL_OF_PROTECTRA_V,     119240,
        xi.items.SCROLL_OF_SHELLRA_IV,      124540,
        xi.items.SCROLL_OF_DIA_III,         139135,
        xi.items.SCROLL_OF_SLOW_II,         139135,
        xi.items.SCROLL_OF_PARALYZE_II,     139135,
        xi.items.SCROLL_OF_PHALANX_II,      139135,
    }

    player:showText(npc, ID.text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
