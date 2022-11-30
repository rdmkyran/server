-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Splintery Chest
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs")
require("scripts/globals/settings")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if xi.settings.main.ENABLE_MAGIAN_TRIALS ~= 1 then
        return
    end

    player:startEvent(10133)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    local itemId = 0
    local optionTable =
    {
        [0] = xi.items.PUGILISTS,
        [4] = xi.items.PEELER,
        [8] = xi.items.SIDE_SWORD,
        [12] = xi.items.BREAK_BLADE,
        [16] = xi.items.CHOPPER,
        [20] = xi.items.LUMBERJACK,
        [24] = xi.items.FARMHAND,
        [28] = xi.items.RANSEUR,
        [32] = xi.items.KIBASHIRI,
        [36] = xi.items.DONTO,
        [40] = xi.items.STENZ,
        [44] = xi.items.CROOK,
        [48] = xi.items.SPARROW,
        [52] = xi.items.THUNDERSTICK,
    -----------------------------------
        -- Page 2
    -----------------------------------
        [64] = xi.items.BARRACUDAS,
        [68] = xi.items.FUSETTO,
        [72] = xi.items.MACHAERA,
        [76] = xi.items.KALAVEJS,
        [80] = xi.items.RENAUDS_AXE,
        [84] = xi.items.SUMERU,
        [88] = xi.items.RECKONING,
        [92] = xi.items.STINGRAY,
        [96] = xi.items.UZURA,
        [100] = xi.items.KEITONOTACHI,
        [104] = xi.items.MAKHILA,
        [108] = xi.items.SEDIKUTCHI,
        [112] = xi.items.SPARROWHAWK,
        [116] = xi.items.ANARCHY,
    -----------------------------------
        -- Page 3
    -----------------------------------
        [128] = xi.items.DUMUZIS_M1,
        [132] = xi.items.KHANDROMA_M1,
        [140] = xi.items.BRUNELLO_M1,
        [144] = xi.items.XIPHIAS_M1,
        [148] = xi.items.SACRIPANTE_M1,
        [152] = xi.items.SHAMASH_M1,
        [156] = xi.items.UMILIATI_M1,
        [160] = xi.items.DABOYA_M1,
        [164] = xi.items.KASASAGI_M1,
        [168] = xi.items.TORIGASHIRANOTACHI_M1,
        [172] = xi.items.ROSE_COUVERTE_M1,
        [176] = xi.items.CIRCINAE_M1,
        [180] = xi.items.MOLLFRITH_M1,
    }

    itemId = optionTable[option]

    if option ~= 1073741824 then
        if not itemId then
            -- How did you get here??
            player:PrintToPlayer("itemId or OptionID related script error!")
        elseif player:getFreeSlotsCount() >= 1 then
            player:addItem(itemId, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, itemId)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemId)
        end
    end
end

return entity
