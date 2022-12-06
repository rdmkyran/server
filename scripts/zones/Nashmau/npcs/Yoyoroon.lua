-----------------------------------
-- Area: Nashmau
--  NPC: Yoyoroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.TENSION_SPRING,             4940,
        xi.items.LOUDSPEAKER,                4940,
        xi.items.ACCELERATOR,                4940,
        xi.items.ARMOR_PLATE,                4940,
        xi.items.STABILIZER,                 4940,
        xi.items.MANA_JAMMER,                4940,
        xi.items.AUTO_REPAIR_KIT,            4940,
        xi.items.MANA_TANK,                  4940,
        xi.items.INHIBITOR,                  9925,
        xi.items.SPEEDLOADER,                9925,
        xi.items.MANA_BOOSTER,               9925,
        xi.items.SCOPE,                      9925,
        xi.items.SHOCK_ABSORBER,             9925,
        xi.items.VOLT_GUN,                   9925,
        xi.items.STEALTH_SCREEN,             9925,
        xi.items.DAMAGE_GAUGE,               9925,
        xi.items.MANA_CONSERVER,             9925,
        xi.items.STROBE,                    19890,
        xi.items.FLAME_HOLDER,              19890,
        xi.items.ICE_MAKER,                 19890,
        xi.items.PATTERN_READER,            19890,
        xi.items.REPLICATOR,                19890,
        xi.items.ANALYZER,                  19890,
        xi.items.HEAT_SEEKER,               19890,
        xi.items.HEATSINK,                  19890,
        xi.items.FLASHBULB,                 19890,
        xi.items.MANA_CONVERTER,            19890,
        xi.items.TENSION_SPRING_II,         29640,
        xi.items.SCANNER,                   29640,
        xi.items.LOUDSPEAKER_II,            29640,
        xi.items.ACCELERATOR_II,            29640,
        xi.items.ARMOR_PLATE_II,            29640,
        xi.items.STABILIZER_II,             29640,
        xi.items.MANA_JAMMER_II,            29640,
        xi.items.HAMMERMILL,                41496,
        xi.items.BARRIER_MODULE,            41496,
        xi.items.RESISTER,                  41496,
        xi.items.AUTO_REPAIR_KIT_II,        41496,
        xi.items.ARCANIC_CELL,              41496,
        xi.items.MANA_TANK_II,              41496,
        xi.items.STROBE_II,                 53352,
        xi.items.TENSION_SPRING_III,        65208,
        xi.items.LOUDSPEAKER_III,           65208,
        xi.items.AMPLIFIER,                 65208,
        xi.items.ACCELERATOR_III,           65208,
        xi.items.SCOPE_II,                  65208,
        xi.items.ARMOR_PLATE_III,           65208,
        xi.items.STABILIZER_III,            65208,
        xi.items.MANA_JAMMER_III,           65208,
        xi.items.INHIBITOR_II,              82992,
        xi.items.SPEEDLOADER_II,            82992,
        xi.items.REPEATER,                  82992,
        xi.items.STEALTH_SCREEN_II,         82992,
        xi.items.ATTUNER,                   118560,
        xi.items.HEAT_CAPACITOR,            118560,
        xi.items.TACTICAL_PROCESSOR,        118560,
        xi.items.POWER_COOLER,              118560,
        xi.items.DRUM_MAGAZINE,             118560,
        xi.items.BARRAGE_TURBINE,           118560,
        xi.items.EQUALIZER,                 118560,
        xi.items.BARRIER_MODULE_II,         118560,
        xi.items.TARGET_MAKER,              118560,
        xi.items.GALVANIZER,                118560,
        xi.items.MANA_CHANNELER,            118560,
        xi.items.PERCOLATOR,                118560,
        xi.items.ERASER,                    118560,
        xi.items.VIVI_VALVE,                118560,
        xi.items.SMOKER_SCREEN,             118560,
        xi.items.DISRUPTOR,                 118560,
    }

    player:showText(npc, ID.text.YOYOROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
