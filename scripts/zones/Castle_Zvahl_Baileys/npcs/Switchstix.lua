-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Switchstix
-- Type: Standard NPC
-- !pos 386.091 -13 -17.399 161
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/items")
require("scripts/globals/status")
-----------------------------------
local entity = {}

local requiredItems = 1
local currencyType = 2
local currencyAmount = 3
local stageNumber = 4
local csParam = 5

local relics =
{
    -- Spharai
    [xi.items.RELIC_KNUCKLES] = { { xi.items.KOH_I_NOOR, xi.items.SQUARE_OF_GRIFFON_LEATHER, xi.items.ADAMAN_SHEET }, xi.items.ONE_HUNDRED_BYNE_BILL, 4, 1, 1 },
    [xi.items.MILITANT_KNUCKLES] = { { xi.items.BRONZE_KNUCKLES, xi.items.METAL_KNUCKLES, xi.items.KOENIGS_KNUCKLES }, xi.items.MONTIONT_SILVERPIECE, 14, 2, 2 },
    [xi.items.DYNAMIS_KNUCKLES] = { { xi.items.ATTESTATION_OF_MIGHT }, xi.items.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.items.CAESTUS] = { { xi.items.MYSTIC_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Mandau
    [xi.items.RELIC_DAGGER] = { { xi.items.BOTTLE_OF_CANTARELLA, xi.items.ORICHALCUM_INGOT, xi.items.FLASK_OF_DEODORIZER }, xi.items.ONE_HUNDRED_BYNE_BILL, 4, 1, 1 },
    [xi.items.MALEFIC_DAGGER] = { { xi.items.BRASS_DAGGER, xi.items.POISON_DAGGER, xi.items.MISERICORDE }, xi.items.MONTIONT_SILVERPIECE, 14, 2, 2 },
    [xi.items.DYNAMIS_DAGGER] = { { xi.items.ATTESTATION_OF_CELERITY }, xi.items.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.items.BATARDEAU] = { { xi.items.ORNATE_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Excalibur
    [xi.items.RELIC_SWORD] = { { xi.items.KOH_I_NOOR, xi.items.ORICHALCUM_CHAIN, xi.items.CERMET_CHUNK }, xi.items.MONTIONT_SILVERPIECE, 4, 1, 1 },
    [xi.items.GLYPTIC_SWORD] = { { xi.items.BRONZE_SWORD, xi.items.MYTHRIL_SWORD, xi.items.WING_SWORD }, xi.items.ONE_HUNDRED_BYNE_BILL, 14, 2, 2 },
    [xi.items.DYNAMIS_SWORD] = { { xi.items.ATTESTATION_OF_GLORY }, xi.items.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.items.CALIBURN] = { { xi.items.HOLY_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Ragnarok
    [xi.items.RELIC_BLADE] = { { xi.items.SQUARE_OF_GRIFFON_LEATHER, xi.items.ADAMAN_INGOT, xi.items.PLATINUM_INGOT }, xi.items.MONTIONT_SILVERPIECE, 4, 1, 1 },
    [xi.items.GILDED_BLADE] = { { xi.items.CLAYMORE, xi.items.MYTHRIL_CLAYMORE, xi.items.DARKSTEEL_CLAYMORE }, xi.items.LUNGO_NANGO_JADESHELL, 14, 2, 2 },
    [xi.items.DYNAMIS_BLADE] = { { xi.items.ATTESTATION_OF_RIGHTEOUSNESS }, xi.items.ONE_HUNDRED_BYNE_BILL, 61, 3, 3 },
    [xi.items.VALHALLA] = { { xi.items.INTRICATE_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Guttler
    [xi.items.RELIC_AXE] = { { xi.items.PIECE_OF_ANGEL_SKIN, xi.items.CHRONOS_TOOTH, xi.items.FEATHER_COLLAR_P1 }, xi.items.LUNGO_NANGO_JADESHELL, 3, 1, 1 },
    [xi.items.LEONINE_AXE] = { { xi.items.TABAR, xi.items.DARKSTEEL_TABAR, xi.items.TABARZIN }, xi.items.MONTIONT_SILVERPIECE, 14, 2, 2 },
    [xi.items.DYNAMIS_AXE] = { { xi.items.ATTESTATION_OF_BRAVERY }, xi.items.ONE_HUNDRED_BYNE_BILL, 60, 3, 3 },
    [xi.items.OGRE_KILLER] = { { xi.items.RUNAEIC_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Bravura
    [xi.items.RELIC_BHUJ] = { { xi.items.WOOTZ_INGOT, xi.items.DAMASCUS_INGOT, xi.items.PIECE_OF_ANCIENT_LUMBER }, xi.items.ONE_HUNDRED_BYNE_BILL, 3, 1, 1 },
    [xi.items.AGONAL_BHUJ] = { { xi.items.BUTTERFLY_AXE, xi.items.GREATAXE, xi.items.HEAVY_DARKSTEEL_AXE }, xi.items.LUNGO_NANGO_JADESHELL, 16, 2, 2 },
    [xi.items.DYNAMIS_BHUJ] = { { xi.items.ATTESTATION_OF_FORCE }, xi.items.MONTIONT_SILVERPIECE, 60, 3, 3 },
    [xi.items.ABADDON_KILLER] = { { xi.items.SERAPHIC_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Gungnir
    [xi.items.RELIC_LANCE] = { { xi.items.PIECE_OF_LANCEWOOD_LUMBER, xi.items.ORICHALCUM_INGOT, xi.items.SPOOL_OF_ARACHNE_THREAD }, xi.items.LUNGO_NANGO_JADESHELL, 4, 1, 1 },
    [xi.items.HOTSPUR_LANCE] = { { xi.items.BRASS_SPEAR, xi.items.HALBERD, xi.items.WYVERN_SPEAR }, xi.items.ONE_HUNDRED_BYNE_BILL, 16, 2, 2 },
    [xi.items.DYNAMIS_LANCE] = { { xi.items.ATTESTATION_OF_FORTITUDE }, xi.items.MONTIONT_SILVERPIECE, 61, 3, 3 },
    [xi.items.GAE_ASSAIL] = { { xi.items.STELLAR_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Apocalypse
    [xi.items.RELIC_SCYTHE] = { { xi.items.MAMMOTH_TUSK, xi.items.SQUARE_OF_MANTICORE_LEATHER, xi.items.RAINBOW_OBI }, xi.items.LUNGO_NANGO_JADESHELL, 5, 1, 1 },
    [xi.items.MEMENTO_SCYTHE] = { { xi.items.SCYTHE, xi.items.BONE_SCYTHE, xi.items.DEATH_SCYTHE }, xi.items.MONTIONT_SILVERPIECE, 16, 2, 2 },
    [xi.items.DYNAMIS_SCYTHE] = { { xi.items.ATTESTATION_OF_VIGOR }, xi.items.ONE_HUNDRED_BYNE_BILL, 62, 3, 3 },
    [xi.items.BEC_DE_FAUCON] = { { xi.items.TENEBROUS_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Kikoku
    [xi.items.IHINTANTO] = { { xi.items.CHUNK_OF_RELIC_STEEL, xi.items.TARASQUE_SKIN, xi.items.SPOOL_OF_TWINTHREAD }, xi.items.ONE_HUNDRED_BYNE_BILL, 4, 1, 1 },
    [xi.items.MIMIZUKU] = { { xi.items.WAKIZASHI, xi.items.KABUTOWARI, xi.items.SAKURAFUBUKI }, xi.items.LUNGO_NANGO_JADESHELL, 16, 2, 2 },
    [xi.items.ROGETSU] = { { xi.items.ATTESTATION_OF_LEGERITY }, xi.items.MONTIONT_SILVERPIECE, 61, 3, 3 },
    [xi.items.YOSHIMITSU] = { { xi.items.DEMONIAC_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Amanomurakumo
    [xi.items.ITO] = { { xi.items.CHUNK_OF_RELIC_STEEL, xi.items.SPOOL_OF_SIRENS_MACRAME, xi.items.LUMP_OF_TAMA_HAGANE }, xi.items.MONTIONT_SILVERPIECE, 3, 1, 1 },
    [xi.items.HAYATEMARU] = { { xi.items.TACHI, xi.items.MIKAZUKI, xi.items.KAZARIDACHI }, xi.items.LUNGO_NANGO_JADESHELL, 15, 2, 2 },
    [xi.items.OBOROMARU] = { { xi.items.ATTESTATION_OF_DECISIVENESS }, xi.items.ONE_HUNDRED_BYNE_BILL, 60, 3, 3 },
    [xi.items.TOTSUKANOTSURUGI] = { { xi.items.DIVINE_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Mjollnir
    [xi.items.RELIC_MAUL] = { { xi.items.WOOTZ_INGOT, xi.items.PLATINUM_INGOT, xi.items.SQUARE_OF_RAINBOW_CLOTH }, xi.items.MONTIONT_SILVERPIECE, 5, 1, 1 },
    [xi.items.BATTERING_MAUL] = { { xi.items.WARHAMMER, xi.items.HOLY_MAUL, xi.items.BRASS_HAMMER }, xi.items.ONE_HUNDRED_BYNE_BILL, 16, 2, 2 },
    [xi.items.DYNAMIS_MAUL] = { { xi.items.ATTESTATION_OF_SACRIFICE }, xi.items.LUNGO_NANGO_JADESHELL, 62, 3, 3 },
    [xi.items.GULLINTANI] = { { xi.items.HEAVENLY_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Claustrum
    [xi.items.RELIC_STAFF] = { { xi.items.PIECE_OF_LANCEWOOD_LUMBER, xi.items.PIGEONS_BLOOD_RUBY, xi.items.POT_OF_URUSHI }, xi.items.LUNGO_NANGO_JADESHELL, 5, 1, 1 },
    [xi.items.SAGES_STAFF] = { { xi.items.ASH_STAFF, xi.items.ELM_STAFF, xi.items.MAHOGANY_STAFF }, xi.items.ONE_HUNDRED_BYNE_BILL, 16, 2, 2 },
    [xi.items.DYNAMIS_STAFF] = { { xi.items.ATTESTATION_OF_VIRTUE }, xi.items.MONTIONT_SILVERPIECE, 62, 3, 3 },
    [xi.items.THYRUS] = { { xi.items.CELESTIAL_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Annihilator
    [xi.items.RELIC_GUN] = { { xi.items.FLASK_OF_MARKSMANS_OIL, xi.items.SQUARE_OF_RAINBOW_CLOTH, xi.items.DARKSTEEL_INGOT }, xi.items.ONE_HUNDRED_BYNE_BILL, 5, 1, 1 },
    [xi.items.MARKSMAN_GUN] = { { xi.items.ARQUEBUS, xi.items.HELLFIRE, xi.items.PIRATES_GUN }, xi.items.LUNGO_NANGO_JADESHELL, 15, 2, 2 },
    [xi.items.DYNAMIS_GUN] = { { xi.items.ATTESTATION_OF_ACCURACY }, xi.items.MONTIONT_SILVERPIECE, 62, 3, 3 },
    [xi.items.FERDINAND] = { { xi.items.ETHEREAL_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Gjallarhorn
    [xi.items.RELIC_HORN] = { { xi.items.MAMMOTH_TUSK, xi.items.CHRONOS_TOOTH, xi.items.SWORDBELT_P1 }, xi.items.LUNGO_NANGO_JADESHELL, 3, 1, 1 },
    [xi.items.PYRRHIC_HORN] = { { xi.items.HORN, xi.items.GEMSHORN, xi.items.SHOFAR }, xi.items.ONE_HUNDRED_BYNE_BILL, 14, 2, 2 },
    [xi.items.DYNAMIS_HORN] = { { xi.items.ATTESTATION_OF_HARMONY }, xi.items.MONTIONT_SILVERPIECE, 60, 3, 3 },
    [xi.items.MILLENNIUM_HORN] = { { xi.items.MYSTERIAL_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Yoichinoyumi
    [xi.items.RELIC_BOW] = { { xi.items.BEHEMOTH_HORN, xi.items.PIECE_OF_LANCEWOOD_LUMBER, xi.items.LOOP_OF_CARBON_FIBER }, xi.items.MONTIONT_SILVERPIECE, 4, 1, 1 },
    [xi.items.WOLVER_BOW] = { { xi.items.POWER_BOW, xi.items.WAR_BOW, xi.items.SHIGETO_BOW }, xi.items.MONTIONT_SILVERPIECE, 15, 2, 2 },
    [xi.items.DYNAMIS_BOW] = { { xi.items.ATTESTATION_OF_TRANSCENDENCE }, xi.items.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.items.FUTATOKOROTO] = { { xi.items.SNARLED_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Aegis
    [xi.items.RELIC_SHIELD] = { { xi.items.SQUARE_OF_AMALTHEIA_LEATHER, xi.items.ORICHALCUM_SHEET, xi.items.PIECE_OF_ANCIENT_LUMBER }, 0, 1, 1, 4 },
    [xi.items.BULWARK_SHIELD] = { { xi.items.BUCKLER, xi.items.ROUND_SHIELD, xi.items.KOENIG_SHIELD }, 0, 4, 2, 5 },
    [xi.items.DYNAMIS_SHIELD] = { { xi.items.ATTESTATION_OF_INVULNERABILITY }, 0, 20, 3, 6 },
    [xi.items.ANCILE] = { { xi.items.SUPERNAL_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE }, xi.items.RANPERRE_GOLDPIECE, 1, 4, 6 },
}

local function hasRelic(player, isTrade)
    if isTrade then
        for key, value in pairs(relics) do
            if player:hasItemQty(key, 1) then
                return key
            end
        end

        return nil
    else
        for key, value in pairs(relics) do
            if player:hasItem(key, xi.inv.INVENTORY) then
                return key
            end
        end

        return nil
    end
end

local function tradeHasRequiredCurrency(trade, currentRelic)
    local relic = relics[currentRelic]

    if currentRelic == xi.items.RELIC_SHIELD or currentRelic == xi.items.BULWARK_SHIELD or currentRelic == xi.items.DYNAMIS_SHIELD then
        if currentRelic == xi.items.RELIC_SHIELD and trade:getItemCount() == 3 then
            return trade:hasItemQty(xi.items.ONE_HUNDRED_BYNE_BILL, 1) and trade:hasItemQty(xi.items.MONTIONT_SILVERPIECE, 1) and trade:hasItemQty(xi.items.LUNGO_NANGO_JADESHELL, 1)
        elseif currentRelic == xi.items.BULWARK_SHIELD and trade:getItemCount() == 12 then
            return trade:hasItemQty(xi.items.ONE_HUNDRED_BYNE_BILL, 4) and trade:hasItemQty(xi.items.MONTIONT_SILVERPIECE, 4) and trade:hasItemQty(xi.items.LUNGO_NANGO_JADESHELL, 4)
        elseif currentRelic == xi.items.DYNAMIS_SHIELD and trade:getItemCount() == 60 then
            return trade:hasItemQty(xi.items.ONE_HUNDRED_BYNE_BILL, 20) and trade:hasItemQty(xi.items.MONTIONT_SILVERPIECE, 20) and trade:hasItemQty(xi.items.LUNGO_NANGO_JADESHELL, 20)
        else
            return false
        end
    else
        if trade:getItemCount() ~= relic[currencyAmount] then
            return false
        else
            return trade:hasItemQty(relic[currencyType], relic[currencyAmount])
        end
    end
end

local function tradeHasRequiredMaterials(trade, relicId, reqItems)
    if trade:getItemCount() ~= (#reqItems + 1) then
        return false
    else
        if not trade:hasItemQty(relicId, 1) then
            return false
        end

        for i = 1, #reqItems, 1 do
            if not trade:hasItemQty(reqItems[i], 1) then
                return false
            end
        end

        return true
    end
end

entity.onTrade = function(player, npc, trade)
    local relicId = hasRelic(trade, true)
    local currentRelic = player:getCharVar("RELIC_IN_PROGRESS")
    local gil = trade:getGil()

    if gil ~= 0 then
        return
    elseif relicId ~= nil then
        local relic = relics[relicId]
        local relicDupe = player:getCharVar("RELIC_MAKE_ANOTHER")

        if player:hasItem(relicId + 1) and not relicDupe == 1 then
            player:startEvent(20, relicId)
        elseif currentRelic == 0 then
            if
                relic[stageNumber] ~= 4 and
                tradeHasRequiredMaterials(trade, relicId, relic[requiredItems])
            then
                local requiredItem1 = relic[requiredItems][1] ~= nil and relic[requiredItems][1] or 0
                local requiredItem2 = relic[requiredItems][2] ~= nil and relic[requiredItems][2] or 0
                local requiredItem3 = relic[requiredItems][3] ~= nil and relic[requiredItems][3] or 0
                player:setCharVar("RELIC_IN_PROGRESS", relicId)
                player:tradeComplete()
                player:startEvent(11, relicId, requiredItem1, requiredItem2, requiredItem3, relic[currencyType], relic[currencyAmount], 0, relic[csParam])
            end
        elseif currentRelic ~= 0 and relicId ~= currentRelic then
            player:startEvent(87)
        end
    elseif currentRelic ~= 0 then
        local relic = relics[currentRelic]
        local currentStage = relic[stageNumber]

        if currentStage ~= 4 and tradeHasRequiredCurrency(trade, currentRelic) then
            if currentStage == 1 then
                player:setCharVar("RELIC_DUE_AT", getVanaMidnight())
            elseif currentStage == 2 then
                player:setCharVar("RELIC_DUE_AT", os.time() + xi.settings.main.RELIC_2ND_UPGRADE_WAIT_TIME)
            elseif currentStage == 3 then
                player:setCharVar("RELIC_DUE_AT", os.time() + xi.settings.main.RELIC_3RD_UPGRADE_WAIT_TIME)
            end

            player:tradeComplete()
            player:startEvent(13, currentRelic, relic[currencyType], relic[currencyAmount], 0, 0, 0, 0, relic[csParam])
        end
    end
end

entity.onTrigger = function(player, npc)
    local relicId = hasRelic(player, false)
    local currentRelic = player:getCharVar("RELIC_IN_PROGRESS")
    local relicWait = player:getCharVar("RELIC_DUE_AT")
    local relicConquest = player:getCharVar("RELIC_CONQUEST_WAIT")

    if
        currentRelic ~= 0 and
        relicWait ~= 0 and
        relics[currentRelic][stageNumber] ~= 4
    then
        local relic = relics[currentRelic]
        local currentStage = relic[stageNumber]

        if relicWait > os.time() then
            -- Not enough time has passed
            if currentStage == 1 then
                player:startEvent(15, 0, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 2 then
                player:startEvent(18, 0, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 3 then
                player:startEvent(51, 0, 0, 0, 0, 0, 0, 0, relic[csParam])
            end
        elseif relicWait <= os.time() then
            -- Enough time has passed
            if currentStage == 1 then
                player:startEvent(16, currentRelic, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 2 then
                player:startEvent(19, currentRelic, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 3 then
                player:startEvent(52, currentRelic, 0, 0, 0, 0, 0, 0, relic[csParam])
            end
        end
    elseif
        currentRelic ~= 0 and
        relicWait == 0 and
        relics[currentRelic][stageNumber] ~= 4
    then
        -- Need currency to start timer
        local relic = relics[currentRelic]
        player:startEvent(12, currentRelic, relic[currencyType], relic[currencyAmount], 0, 0, 0, 0, relic[csParam])
    elseif relicId == nil or relicConquest > os.time() then
        -- Player doesn't have a relevant item and hasn't started one
        player:startEvent(10)
    elseif relicId ~= nil and relicConquest <= os.time() then
        -- Player has a relevant item and conquest tally has passed
        local relic = relics[relicId]
        local currentStage = relic[stageNumber]
        local requiredItem1 = relic[requiredItems][1] ~= nil and relic[requiredItems][1] or 0
        local requiredItem2 = relic[requiredItems][2] ~= nil and relic[requiredItems][2] or 0
        local requiredItem3 = relic[requiredItems][3] ~= nil and relic[requiredItems][3] or 0

        if currentStage == 1 then
            player:startEvent(14, relicId, requiredItem1, requiredItem2, requiredItem3, 0, 0, 0, relic[csParam])
        elseif currentStage == 2 then
            player:startEvent(17, relicId, requiredItem1, requiredItem2, requiredItem3, 0, 0, 0, relic[csParam])
        elseif currentStage == 3 then
            player:startEvent(50, relicId, requiredItem1, requiredItem2, requiredItem3, 0, 0, 0, relic[csParam])
        elseif currentStage == 4 then
            local itemToEventId =
            {
                [xi.items.CAESTUS]          = 68,
                [xi.items.BATARDEAU]        = 69,
                [xi.items.CALIBURN]         = 70,
                [xi.items.VALHALLA]         = 71,
                [xi.items.OGRE_KILLER]      = 72,
                [xi.items.ABADDON_KILLER]   = 73,
                [xi.items.GAE_ASSAIL]       = 75,
                [xi.items.BEC_DE_FAUCON]    = 74,
                [xi.items.YOSHIMITSU]       = 76,
                [xi.items.TOTSUKANOTSURUGI] = 77,
                [xi.items.GULLINTANI]       = 78,
                [xi.items.THYRUS]           = 79,
                [xi.items.FERDINAND]        = 81,
                [xi.items.MILLENNIUM_HORN]  = 82,
                [xi.items.FUTATOKOROTO]     = 80,
                [xi.items.ANCILE]           = 86,
            }

            player:startEvent(itemToEventId[relicId], requiredItem1, requiredItem2, relic[currencyType], relic[currencyAmount], relicId)
        end
    else
        player:startEvent(10)
    end
end

entity.onEventUpdate = function(player, csid, option)
    -- Handles the displayed currency types and amounts for Aegis Stage 1->2, 2->3, and 3->4 based on option.
    if (csid == 11 or csid == 12 or csid == 13) and option ~= 0 then
        if option == 1 then
            player:updateEvent(xi.items.RELIC_SHIELD, xi.items.MONTIONT_SILVERPIECE, 1, xi.items.ONE_HUNDRED_BYNE_BILL, 1, xi.items.LUNGO_NANGO_JADESHELL, 1)
        elseif option == 2 then
            player:updateEvent(xi.items.BULWARK_SHIELD, xi.items.MONTIONT_SILVERPIECE, 4, xi.items.ONE_HUNDRED_BYNE_BILL, 4, xi.items.LUNGO_NANGO_JADESHELL, 4)
        elseif option == 3 then
            player:updateEvent(xi.items.DYNAMIS_SHIELD, xi.items.MONTIONT_SILVERPIECE, 20, xi.items.ONE_HUNDRED_BYNE_BILL, 20, xi.items.LUNGO_NANGO_JADESHELL, 20)
        end
    end
end

entity.onEventFinish = function(player, csid, option)
    local reward = player:getCharVar("RELIC_IN_PROGRESS")

    -- User is cancelling a relic.  Null everything out, it never happened.
    if csid == 87 and option == xi.items.STEEL_SHEET then
        player:setCharVar("RELIC_IN_PROGRESS", 0)
        player:setCharVar("RELIC_DUE_AT", 0)
        player:setCharVar("RELIC_MAKE_ANOTHER", 0)
        player:setCharVar("RELIC_CONQUEST_WAIT", 0)

        -- User is okay with making a relic they cannot possibly accept
    elseif csid == 20 and option == 1 then
        player:setCharVar("RELIC_MAKE_ANOTHER", 1)

        -- Picking up a finished relic stage 1>2 and 2>3.
    elseif (csid == 16 or csid == 19) and reward ~= 0 then
        if player:getFreeSlotsCount() < 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward + 1)
        else
            player:addItem(reward + 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, reward + 1)
            player:setCharVar("RELIC_IN_PROGRESS", 0)
            player:setCharVar("RELIC_DUE_AT", 0)
            player:setCharVar("RELIC_MAKE_ANOTHER", 0)
            player:setCharVar("RELIC_CONQUEST_WAIT", getConquestTally())
        end

        -- Picking up a finished relic stage 3>4.
    elseif csid == 52 and reward ~= 0 then
        if player:getFreeSlotsCount() < 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward + 1)
        else
            player:addItem(reward + 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, reward + 1)
            player:setCharVar("RELIC_IN_PROGRESS", 0)
            player:setCharVar("RELIC_DUE_AT", 0)
            player:setCharVar("RELIC_MAKE_ANOTHER", 0)
            player:setCharVar("RELIC_CONQUEST_WAIT", 0)
        end

        -- Stage 4 cutscenes
    elseif (csid >= 68 and csid <= 82) or csid == 86 then
        local eventToItemId =
        {
                [68] = xi.items.CAESTUS, -- Spharai
                [69] = xi.items.BATARDEAU, -- Mandau
                [70] = xi.items.CALIBURN, -- Excalibur
                [71] = xi.items.VALHALLA, -- Ragnarok
                [72] = xi.items.OGRE_KILLER, -- Guttler
                [73] = xi.items.ABADDON_KILLER, -- Bravura
                [75] = xi.items.GAE_ASSAIL, -- Gungnir
                [74] = xi.items.BEC_DE_FAUCON, -- Apocalypse
                [76] = xi.items.YOSHIMITSU, -- Kikoku
                [77] = xi.items.TOTSUKANOTSURUGI, -- Amanomurakumo
                [78] = xi.items.GULLINTANI, -- Mjollnir
                [79] = xi.items.THYRUS, -- Claustrum
                [81] = xi.items.FERDINAND, -- Annihilator
                [82] = xi.items.MILLENNIUM_HORN, -- Gjallarhorn
                [80] = xi.items.FUTATOKOROTO, -- Yoichinoyumi
                [86] = xi.items.ANCILE, -- Aegis
        }

        player:setCharVar("RELIC_CONQUEST_WAIT", 0)
        player:setCharVar("RELIC_IN_PROGRESS", eventToItemId[csid])
    end
end

return entity
