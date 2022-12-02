require("scripts/globals/status")

xi.equipment = xi.equipment or {}

xi.equipment.baseNyzulWeapons =
{
    xi.items.STURDY_AXE                    , -- (WAR) Sturdy Axe
    xi.items.BURNING_FISTS                 , -- (MNK) Burning Fists
    xi.items.WEREBUSTER                    , -- (WHM) Werebuster
    xi.items.MAGES_STAFF                   , -- (BLM) Mage's Staff
    xi.items.VORPAL_SWORD                  , -- (RDM) Vorpal Sword
    xi.items.SWORDBREAKER                  , -- (THF) Swordbreaker
    xi.items.BRAVE_BLADE                   , -- (PLD) Brave Blade
    xi.items.DEATH_SICKLE                  , -- (DRK) Death Sickle
    xi.items.DOUBLE_AXE                    , -- (BST) Double Axe
    xi.items.DANCING_DAGGER                , -- (BRD) Dancing Dagger
    xi.items.KILLER_BOW                    , -- (RNG) Killer Bow
    xi.items.WINDSLICER                    , -- (SAM) Windslicer
    xi.items.SASUKE_KATANA                 , -- (NIN) Sasuke Katana
    xi.items.RADIANT_LANCE                 , -- (DRG) Radiant Lance
    xi.items.SCEPTER_STAFF                 , -- (SMN) Scepter Staff
    xi.items.WIGHTSLAYER                   , -- (BLU) Wightslayer
    xi.items.QUICKSILVER                   , -- (COR) Quicksilver
    xi.items.INFERNO_CLAWS                 , -- (PUP) Inferno Claws
    xi.items.MAIN_GAUCHE                   , -- (DNC) Main Gauche
    xi.items.ELDER_STAFF                     -- (SCH) Elder Staff
}

-----------------------------------
-- Relic/Mythic/Empyrean tables
-----------------------------------

xi.equipment.relic =
{
    SPHARAI       = 0,
    MANDAU        = 1,
    EXCALIBUR     = 2,
    RAGNAROK      = 3,
    GUTTLER       = 4,
    BRAVURA       = 5,
    APOCALYPSE    = 6,
    GUNGNIR       = 7,
    KIKOKU        = 8,
    AMANOMURAKUMO = 9,
    MJOLLNIR      = 10,
    CLAUSTRUM     = 11,
    YOICHINOYUMI  = 12,
    ANNIHILATOR   = 13,
    GJALLARHORN   = 14,
    AEGIS         = 15
}

xi.equipment.relicIDs =
{
    [xi.equipment.relic.SPHARAI] =
    {
        xi.items.SPHARAI, xi.items.SPHARAI_T2, xi.items.SPHARAI_T3, xi.items.SPHARAI_T4, xi.items.SPHARAI_T5, xi.items.SPHARAI_T6, xi.items.SPHARAI_T7, xi.items.SPHARAI_T8, xi.items.SPHARAI_T9, xi.items.SPHARAI_T10
    },
    [xi.equipment.relic.MANDAU] =
    {
        xi.items.MANDAU, xi.items.MANDAU_T2, xi.items.MANDAU_T3, xi.items.MANDAU_T4, xi.items.MANDAU_T5, xi.items.MANDAU_T6, xi.items.MANDAU_T7, xi.items.MANDAU_T8, xi.items.MANDAU_T9, xi.items.MANDAU_T10
    },
    [xi.equipment.relic.EXCALIBUR] =
    {
        xi.items.EXCALIBUR, xi.items.EXCALIBUR_T2, xi.items.EXCALIBUR_T3, xi.items.EXCALIBUR_T4, xi.items.EXCALIBUR_T5, xi.items.EXCALIBUR_T6, xi.items.EXCALIBUR_T7, xi.items.EXCALIBUR_T8, xi.items.EXCALIBUR_T9, xi.items.EXCALIBUR_T10
    },
    [xi.equipment.relic.RAGNAROK] =
    {
        xi.items.RAGNAROK, xi.items.RAGNAROK_T2, xi.items.RAGNAROK_T3, xi.items.RAGNAROK_T4, xi.items.RAGNAROK_T5, xi.items.RAGNAROK_T6, xi.items.RAGNAROK_T7, xi.items.RAGNAROK_T8, xi.items.RAGNAROK_T9, xi.items.RAGNAROK_T10
    },
    [xi.equipment.relic.GUTTLER] =
    {
        xi.items.GUTTLER, xi.items.GUTTLER_T2, xi.items.GUTTLER_T3, xi.items.GUTTLER_T4, xi.items.GUTTLER_T5, xi.items.GUTTLER_T6, xi.items.GUTTLER_T7, xi.items.GUTTLER_T8, xi.items.GUTTLER_T9, xi.items.GUTTLER_T10
    },
    [xi.equipment.relic.BRAVURA] =
    {
        xi.items.BRAVURA, xi.items.BRAVURA_T2, xi.items.BRAVURA_T3, xi.items.BRAVURA_T4, xi.items.BRAVURA_T5, xi.items.BRAVURA_T6, xi.items.BRAVURA_T7, xi.items.BRAVURA_T8, xi.items.BRAVURA_T9, xi.items.BRAVURA_T10
    },
    [xi.equipment.relic.APOCALYPSE] =
    {
        xi.items.APOCALYPSE, xi.items.APOCALYPSE_T2, xi.items.APOCALYPSE_T3, xi.items.APOCALYPSE_T4, xi.items.APOCALYPSE_T5, xi.items.APOCALYPSE_T6, xi.items.APOCALYPSE_T7, xi.items.APOCALYPSE_T8, xi.items.APOCALYPSE_T9, xi.items.APOCALYPSE_T10
    },
    [xi.equipment.relic.GUNGNIR] =
    {
        xi.items.GUNGNIR, xi.items.GUNGNIR_T2, xi.items.GUNGNIR_T3, xi.items.GUNGNIR_T4, xi.items.GUNGNIR_T5, xi.items.GUNGNIR_T6, xi.items.GUNGNIR_T7, xi.items.GUNGNIR_T8, xi.items.GUNGNIR_T9, xi.items.GUNGNIR_T10
    },
    [xi.equipment.relic.KIKOKU] =
    {
        xi.items.KIKOKU, xi.items.KIKOKU_T2, xi.items.KIKOKU_T3, xi.items.KIKOKU_T4, xi.items.KIKOKU_T5, xi.items.KIKOKU_T6, xi.items.KIKOKU_T7, xi.items.KIKOKU_T8, xi.items.KIKOKU_T9, xi.items.KIKOKU_T10
    },
    [xi.equipment.relic.AMANOMURAKUMO] =
    {
        xi.items.AMANOMURAKUMO, xi.items.AMANOMURAKUMO_T2, xi.items.AMANOMURAKUMO_T3, xi.items.AMANOMURAKUMO_T4, xi.items.AMANOMURAKUMO_T5, xi.items.AMANOMURAKUMO_T6, xi.items.AMANOMURAKUMO_T7, xi.items.AMANOMURAKUMO_T8, xi.items.AMANOMURAKUMO_T9, xi.items.AMANOMURAKUMO_T10
    },
    [xi.equipment.relic.MJOLLNIR] =
    {
        xi.items.MJOLLNIR, xi.items.MJOLLNIR_T2, xi.items.MJOLLNIR_T3, xi.items.MJOLLNIR_T4, xi.items.MJOLLNIR_T5, xi.items.MJOLLNIR_T6, xi.items.MJOLLNIR_T7, xi.items.MJOLLNIR_T8, xi.items.MJOLLNIR_T9, xi.items.MJOLLNIR_T10
    },
    [xi.equipment.relic.CLAUSTRUM] =
    {
        xi.items.CLAUSTRUM, xi.items.CLAUSTRUM_T2, xi.items.CLAUSTRUM_T3, xi.items.CLAUSTRUM_T4, xi.items.CLAUSTRUM_T5, xi.items.CLAUSTRUM_T6, xi.items.CLAUSTRUM_T7, xi.items.CLAUSTRUM_T8, xi.items.CLAUSTRUM_T9, xi.items.CLAUSTRUM_T10
    },
    [xi.equipment.relic.YOICHINOYUMI] =
    {
        xi.items.YOICHINOYUMI, xi.items.YOICHINOYUMI_T2, xi.items.YOICHINOYUMI_T3, xi.items.YOICHINOYUMI_T4, xi.items.YOICHINOYUMI_T5, xi.items.YOICHINOYUMI_T6, xi.items.YOICHINOYUMI_T7, xi.items.YOICHINOYUMI_T8, xi.items.YOICHINOYUMI_T9, xi.items.YOICHINOYUMI_T10, xi.items.YOICHINOYUMI_T11
    },
    [xi.equipment.relic.ANNIHILATOR] =
    {
        xi.items.ANNIHILATOR, xi.items.ANNIHILATOR_T2, xi.items.ANNIHILATOR_T3, xi.items.ANNIHILATOR_T4, xi.items.ANNIHILATOR_T5, xi.items.ANNIHILATOR_T6, xi.items.ANNIHILATOR_T7, xi.items.ANNIHILATOR_T8, xi.items.ANNIHILATOR_T9, xi.items.ANNIHILATOR_T10, xi.items.ANNIHILATOR_T11
    },
    [xi.equipment.relic.GJALLARHORN] =
    {
        xi.items.GJALLARHORN, xi.items.GJALLARHORN_T2, xi.items.GJALLARHORN_T3, xi.items.GJALLARHORN_T4, xi.items.GJALLARHORN_T5, xi.items.GJALLARHORN_T6, xi.items.GJALLARHORN_T6
    },
    [xi.equipment.relic.AEGIS] =
    {
        xi.items.AEGIS, xi.items.AEGIS_T2, xi.items.AEGIS_T3, xi.items.AEGIS_T4, xi.items.AEGIS_T5, xi.items.AEGIS_T6, xi.items.AEGIS_T7
    },
}

-----------------------------------
-- Place convenience functions
-- related to equipment here
-----------------------------------
-- TODO: Should Adoulin exist here as well?
local artifactArmorRanges =
{
--      Min,   Max
    { xi.items.FIGHTERS_MASK                 , xi.items.EVOKERS_HORN                   }, -- Original Head
    { xi.items.HEALERS_CAP                   , xi.items.CHORAL_ROUNDLET                },
    { xi.items.MYOCHIN_KABUTO                , xi.items.NINJA_HATSUBURI                },
    { xi.items.FIGHTERS_LORICA               , xi.items.EVOKERS_DOUBLET                }, -- Original Body
    { xi.items.MYOCHIN_DOMARU                , xi.items.NINJA_CHAINMAIL                },
    { xi.items.FIGHTERS_MUFFLERS             , xi.items.EVOKERS_BRACERS                }, -- Original Hand
    { xi.items.FIGHTERS_CALLIGAE             , xi.items.EVOKERS_PIGACHES               }, -- Original Feet
    { xi.items.FIGHTERS_CUISSES              , xi.items.EVOKERS_SPATS                  }, -- Original Legs
    { xi.items.MAGUS_KEFFIYEH                , xi.items.PUPPETRY_TAJ                   }, -- ToAU Head
    { xi.items.MAGUS_JUBBAH                  , xi.items.PUPPETRY_TOBE                  }, -- ToAU Body
    { xi.items.MAGUS_BAZUBANDS               , xi.items.PUPPETRY_DASTANAS              }, -- ToAU Hand
    { xi.items.MAGUS_CHARUQS                 , xi.items.PUPPETRY_BABOUCHES             }, -- ToAU Feet
    { xi.items.MAGUS_SHALWAR                 , xi.items.PUPPETRY_CHURIDARS             }, -- ToAU Legs
    { xi.items.DANCERS_TIARA_M               , xi.items.SCHOLARS_MORTARBOARD           }, -- WotG Head
    { xi.items.DANCERS_CASAQUE_M             , xi.items.SCHOLARS_GOWN                  }, -- WotG Body
    { xi.items.DANCERS_BANGLES_M             , xi.items.SCHOLARS_BRACERS               }, -- WotG Hand
    { xi.items.DANCERS_TOE_SHOES_M           , xi.items.SCHOLARS_LOAFERS               }, -- WotG Feet
    { xi.items.DANCERS_TIGHTS_M              , xi.items.HOMAM_GAMBIERAS                }, -- WotG Legs
}

xi.equipment.isArtifactArmor = function(itemId)
    for _, v in ipairs(artifactArmorRanges) do
        if itemId >= v[1] and itemId <= v[2] then
            return true
        end
    end

    return false
end

xi.equipment.isBaseNyzulWeapon = function(itemId)
    for i, wepId in pairs(xi.equipment.baseNyzulWeapons) do
        if itemId == wepId then
            return true
        end
    end

    return false
end

-----------------------------------
-- Returns true if player has any tier of given relic,
--  if tier is specified, returns true only if player
--  has that tier
-- Tier:
-- 1  = 75
-- 2  = 80
-- 3  = 85
-- 4  = 90
-- 5  = 95
-- 6  = 99 I
-- 7  = 99 II
-- 8  = 119 I
-- 9  = 119 II
-- 10 = 119 III
-- 11 = 119 III (ranged only)
-----------------------------------
xi.equipment.hasRelic = function(player, relic, tier)
    if tier ~= nil then
        return player:hasItem(xi.equipment.relicIDs[relic][tier])
    end

    for i, itemID in pairs(xi.equipment.relicIDs[relic]) do
        if player:hasItem(itemID) then
            return true
        end
    end

    return false
end

xi.equip = xi.equipment
