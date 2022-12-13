-- This file is called by login_campaign.lua and require()'s no file, it should not be require()'d by any
-- other lua scripts, which should instead require() login_campaign.lua directly.

-- TODO: Move this table somewhere untracked so it can be freely modified without polluting the
--       git workspace

-- TODO: Fill in with _commented out entries_ for all the things seen in each category
-- https://www.bg-wiki.com/ffxi/Repeat_Login_Campaign/Past_Login_Campaign_Rewards
local prizes =
{
    [1] =
    {
        ["price"] = 10,
        ["items"] =
        {
            xi.items.BEASTMENS_SEAL,
            xi.items.KINDREDS_SEAL,
            xi.items.KINDREDS_CREST,
            xi.items.HIGH_KINDREDS_CREST,
            xi.items.SACRED_KINDREDS_CREST,
            -- xi.items.CORDIAL_INVITE,
            -- xi.items.MARTIAL_BALL_INVITE,
            -- xi.items.TRAINING_GROUNDS_KEY,
            -- xi.items.MERCENARY_CAMP_ENTRY_SLIP,
            -- xi.items.FLASK_OF_PEST_REPELLENT,
            -- xi.items.ATHENA_ORB,
            -- xi.items.CRACKED_NUT,
            -- xi.items.SEASONING_STONE,
            -- xi.items.FOSSILIZED_FANG,
            -- xi.items.FOSSILIZED_BONE,
            -- xi.items.PINCH_OF_PUNGENT_POWDER,
            -- xi.items.PINCH_OF_PUNGENT_POWDER_II,
            -- xi.items.TARAZACUM_ORB,
        },
    },

    [5] =
    {
        ["price"] = 100,
        ["items"] =
        {
            xi.items.MOG_KUPON_I_S1,
            xi.items.EUDAEMON_BLADE,
            xi.items.EUDAEMON_CAPE,
            xi.items.EUDAEMON_RING,
            xi.items.EUDAEMON_SASH,
            xi.items.EUDAEMON_SHIELD,
            xi.items.DRILL_CALAMARY,
            xi.items.DWARF_PUGIL,
            xi.items.ASTRAL_CUBE,
            -- xi.items.ZINNIA_ORB,
            -- xi.items.CIPHER_OF_ZEIDS_ALTER_EGO,
            -- xi.items.CIPHER_OF_LIONS_ALTER_EGO,
            xi.items.CIPHER_OF_NAJAS_ALTER_EGO,
            xi.items.CIPHER_OF_LEHKOS_ALTER_EGO,
            -- xi.items.CIPHER_OF_LUZAFS_ALTER_EGO,
            -- xi.items.CIPHER_OF_NAJELITHS_ALTER_EGO,
            -- xi.items.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO,
            -- xi.items.CIPHER_OF_STAR_SIBYLS_ALTER_EGO,
            -- xi.items.CIPHER_OF_KARAHAS_ALTER_EGO,
            -- xi.items.CIPHER_OF_AREUHATS_ALTER_EGO,
        },
    },

    [9] =
    {
        ["price"] = 100,
        ["items"] =
        {
            -- xi.items.CIPHER_OF_UKAS_ALTER_EGO,
            -- xi.items.CIPHER_OF_KUYINS_ALTER_EGO,
            -- xi.items.CIPHER_OF_ABENZIOS_ALTER_EGO,
            -- xi.items.CIPHER_OF_RUGHADJEENS_ALTER_EGO,
            -- xi.items.CIPHER_OF_LHES_ALTER_EGO,
            -- xi.items.CIPHER_OF_MAYAKOVS_ALTER_EGO,
            -- xi.items.CIPHER_OF_BRYGIDS_ALTER_EGO,
            -- xi.items.CIPHER_OF_MILDAURIONS_ALTER_EGO,
            -- xi.items.CIPHER_OF_RONGELOUTSS_ALTER_EGO,
            -- xi.items.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO,
            -- xi.items.CIPHER_OF_ULLEGORES_ALTER_EGO,
            -- xi.items.CIPHER_OF_TEODORS_ALTER_EGO,
            -- xi.items.CIPHER_OF_DARRCUILNS_ALTER_EGO,
            xi.items.EXCALIPOOR,
            xi.items.PIECE_OF_COPSE_CANDY,
        },
    },

    [13] =
    {
        ["price"] = 300,
        ["items"] =
        {
            -- xi.items.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II,
            xi.items.GOBBUE,
            xi.items.CRAB,
            xi.items.BEETLE,
            -- TODO: The other mounts
            xi.items.CUMULUS_MASQUE,
            xi.items.BLIZZARD_BRAND,
            -- xi.items.WYRMKING_MASQUE_P1,
            -- xi.items.WYRMKING_SUIT_P1,
            -- xi.items.FRAYED_POUCH_OF_BIRTH,
            -- xi.items.FRAYED_POUCH_OF_ADVANCEMENT,
            -- xi.items.FRAYED_POUCH_OF_GLORY,
            -- xi.items.FRAYED_POUCH_OF_DECAY,
            -- xi.items.FRAYED_POUCH_OF_RUIN,
            -- xi.items.FRAYED_SACK_OF_DEVIOUSNESS,
            -- xi.items.FRAYED_SACK_OF_LIMINALITY,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_1,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_2,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_3,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_4,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_5,
        },
    },

    [17] =
    {
        ["price"] = 500,
        ["items"] =
        {
            -- TODO: Special month-to-month things
            xi.items.DHALMEL,
        },

    },

    [21] =
    {
        ["price"] = 750,
        ["items"] =
        {
            xi.items.COPY_OF_MELODIOUS_PLANS,
            xi.items.TIMBRE_CASE_KIT,
            xi.items.MUSICHINERY_KIT,
            -- xi.items.KITCHEN_BRICK,
            -- xi.items.KITCHEN_STOVE,
            -- xi.items.KITCHEN_PLATE,
            xi.items.HONEY_WINE,
            xi.items.BEASTLY_SHANK,
            xi.items.BLUE_PONDWEED,
            -- xi.items.BRIGANDS_CHART,
            -- xi.items.PIRATES_CHART,
            -- xi.items.FISHERMANS_FEAST,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_6,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_7,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_8,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_9,
            -- xi.items.COPY_OF_REMS_TALE_CHAPTER_10,
        },
    },

    [25] =
    {
        ["price"] = 1000,
        ["items"] =
        {
            -- xi.items.PATIO_DESIGN_PLAN_DOCUMENT,
            xi.items.FACILITY_RING,
            xi.items.CALIBER_RING,
            -- xi.items.FRAYED_SACK_OF_FECUNDITY,
            -- xi.items.FRAYED_SACK_OF_PLENTY,
            -- xi.items.FRAYED_SACK_OF_OPULENCE,
        },
    },

    [29] =
    {
        ["price"] = 1500,
        ["items"] =
        {
            xi.items.SWEET_TEA,
            xi.items.SAVORY_SHANK,
            xi.items.RED_PONDWOOD,
            -- xi.items.MALIYAKALEYA_ORB,
            -- xi.items.HEPATIZON_INGOT,
            -- xi.items.BERYLLIUM_INGOT,
            -- xi.items.PIECE_OF_EXALTED_LUMBER,
            -- xi.items.SPOOL_OF_SIFS_MACRAME,
        },
    },
}
return prizes
