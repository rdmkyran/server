-----------------------------------
-- Area: Waughroon Shrine
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/items")
require("scripts/globals/bcnm")
-----------------------------------
local entity = {}

local loot =
{
    -- BCNM The Worm's Turn
    [65] =
    {
        {
            { itemid = xi.items.NONE, droprate = 125 },
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ICE_SPIKES, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_REFRESH, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 125 },
            { itemid = xi.items.ENHANCING_EARRING, droprate = 125 },
            { itemid = xi.items.SPIRIT_TORQUE, droprate = 125 },
            { itemid = xi.items.GUARDING_GORGET, droprate = 125 },
            { itemid = xi.items.NEMESIS_EARRING, droprate = 125 },
            { itemid = xi.items.EARTH_MANTLE, droprate = 125 },
            { itemid = xi.items.STRIKE_SHIELD, droprate = 125 },
            { itemid = xi.items.SHIKAR_BOW, droprate = 125 },
        },

        {
            { itemid = xi.items.OAK_LOG, droprate = 500 },
            { itemid = xi.items.ROSEWOOD_LOG, droprate = 500 },
        },

        {
            { itemid = xi.items.GOLD_BEASTCOIN, droprate = 500 },
            { itemid = xi.items.MYTHRIL_BEASTCOIN, droprate = 500 },
        },

        {
            { itemid = xi.items.BLACK_PEARL, droprate = 200 },
            { itemid = xi.items.AMETRINE, droprate = 200 },
            { itemid = xi.items.YELLOW_ROCK, droprate = 200 },
            { itemid = xi.items.PERIDOT, droprate = 200 },
            { itemid = xi.items.TURQUOISE, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 800 },
            { itemid = xi.items.RERAISER, droprate = 200 },
        },
    },

    -- BCNM Grimshell Shocktroopers
    [66] =
    {
        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.ASSAULT_EARRING, droprate = 125 },
            { itemid = xi.items.VASSAGOS_SCYTHE, droprate = 125 },
            { itemid = xi.items.CHICKEN_KNIFE, droprate = 125 },
            { itemid = xi.items.FEY_WAND, droprate = 125 },
            { itemid = xi.items.ASTRAL_SHIELD, droprate = 125 },
            { itemid = xi.items.ENHANCING_MANTLE, droprate = 125 },
        },

        {
            { itemid = xi.items.MYTHRIL_INGOT, droprate = 250 },
            { itemid = xi.items.STEEL_INGOT, droprate = 250 },
            { itemid = xi.items.GOLD_INGOT, droprate = 250 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 250 },
        },

        {
            { itemid = xi.items.EBONY_LOG, droprate = 250 },
            { itemid = xi.items.CHRYSOBERYL, droprate = 250 },
            { itemid = xi.items.FLUORITE, droprate = 250 },
            { itemid = xi.items.JADEITE, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 875 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 800 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 200 },
        },
    },

    -- BCNM 3, 2, 1...
    [69] =
    {
        {
            { itemid = xi.items.KAGEBOSHI, droprate = 500 },
            { itemid = xi.items.ODENTA, droprate = 500 },
        },

        {
            { itemid = xi.items.OCEAN_BELT, droprate = 200 },
            { itemid = xi.items.FOREST_BELT, droprate = 200 },
            { itemid = xi.items.STEPPE_BELT, droprate = 200 },
            { itemid = xi.items.JUNGLE_BELT, droprate = 200 },
            { itemid = xi.items.DESERT_BELT, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.SCROLL_OF_FREEZE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_QUAKE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_REGEN_III, droprate = 125 },
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 125 },
            { itemid = xi.items.LIGHT_SPIRIT_PACT, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 800 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 200 },
        },
    },

    -- BCNM Birds of a Feather
    [73] =
    {
        {
            { itemid = xi.items.BIRD_FEATHER, droprate = 1000 },
        },

        {
            { itemid = xi.items.ASHIGARU_EARRING, droprate = 125 },
            { itemid = xi.items.TRIMMERS_EARRING, droprate = 125 },
            { itemid = xi.items.BEATERS_EARRING, droprate = 125 },
            { itemid = xi.items.HEALERS_EARRING, droprate = 125 },
            { itemid = xi.items.MERCENARYS_EARRING, droprate = 125 },
            { itemid = xi.items.SINGERS_EARRING, droprate = 125 },
            { itemid = xi.items.WIZARDS_EARRING, droprate = 125 },
            { itemid = xi.items.WRESTLERS_EARRING, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 125 },
            { itemid = xi.items.AVATAR_BELT, droprate = 125 },
            { itemid = xi.items.DAGGER_BELT, droprate = 125 },
            { itemid = xi.items.LANCE_BELT, droprate = 125 },
            { itemid = xi.items.RAPIER_BELT, droprate = 125 },
            { itemid = xi.items.SARASHI, droprate = 125 },
            { itemid = xi.items.SCYTHE_BELT, droprate = 125 },
            { itemid = xi.items.SHIELD_BELT, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.SCROLL_OF_DISPEL, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_MAGIC_FINALE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 136 },
            { itemid = xi.items.BIRD_EGG, droprate = 125 },
            { itemid = xi.items.BIRD_FEATHER, droprate =  50 },
            { itemid = xi.items.CHESTNUT_LOG, droprate = 125 },
            { itemid = xi.items.ELM_LOG, droprate = 188 },
            { itemid = xi.items.HI_ETHER, droprate =  63 },
            { itemid = xi.items.HORN_QUIVER, droprate = 313 },
        },

        {
            { itemid = xi.items.NONE, droprate = 123 },
            { itemid = xi.items.IRON_INGOT, droprate =  63 },
            { itemid = xi.items.LAPIS_LAZULI, droprate = 125 },
            { itemid = xi.items.LIGHT_OPAL, droprate = 125 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate =  63 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate =  63 },
            { itemid = xi.items.ONYX, droprate = 250 },
            { itemid = xi.items.CHUNK_OF_SILVER_ORE, droprate =  63 },
            { itemid = xi.items.SILVER_INGOT, droprate = 125 },
        },

    },

    -- BCNM Crustacean Conundrum
    [74] =
    {
        {
            { itemid = xi.items.LAND_CRAB_MEAT, droprate = 1000 },
        },

        {
            { itemid = xi.items.MANNEQUIN_BODY, droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE, droprate = 334 },
            { itemid = xi.items.CRAB_SHELL, droprate = 666 },
        },

        {
            { itemid = xi.items.BEETLE_QUIVER, droprate = 444 },
            { itemid = xi.items.JUG_OF_FISH_OIL_BROTH, droprate = 556 },
        },

        {
            { itemid = xi.items.NONE, droprate = 450 },
            { itemid = xi.items.BRASS_INGOT, droprate = 100 },
            { itemid = xi.items.BRONZE_SHEET, droprate = 150 },
            { itemid = xi.items.BRONZE_INGOT, droprate = 300 },
        },

        {
            { itemid = xi.items.NONE, droprate = 300 },
            { itemid = xi.items.MYTHRIL_BEASTCOIN, droprate = 500 },
            { itemid = xi.items.MANNEQUIN_HANDS, droprate = 100 },
            { itemid = xi.items.MANNEQUIN_HEAD, droprate = 100 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.PLATOON_CESTI, droprate = 100 },
            { itemid = xi.items.PLATOON_DAGGE, droprate = 100 },
            { itemid = xi.items.PLATOON_AXE, droprate = 100 },
            { itemid = xi.items.PLATOON_BOW, droprate = 100 },
            { itemid = xi.items.PLATOON_LANCE, droprate = 100 },
            { itemid = xi.items.PLATOON_SWORD, droprate = 100 },
            { itemid = xi.items.PLATOON_MACE, droprate = 100 },
            { itemid = xi.items.PLATOON_ZAGHNAL, droprate = 100 },
        },
    },

    -- BCNM Grove Guardians
    [75] =
    {
        {
            { itemid = xi.items.MANNEQUIN_BODY, droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE, droprate = 800 },
            { itemid = xi.items.MANNEQUIN_HANDS, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.WRESTLERS_MANTLE, droprate = 250 },
            { itemid = xi.items.MAGICIANS_MANTLE, droprate = 250 },
            { itemid = xi.items.PILFERERS_MANTLE, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.HEALERS_SHIELD, droprate = 200 },
            { itemid = xi.items.GENIN_ASPIS, droprate = 200 },
            { itemid = xi.items.KILLER_TARGE, droprate = 200 },
            { itemid = xi.items.STAFF_BELT, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.BAG_OF_HERB_SEEDS, droprate = 250 },
            { itemid = xi.items.BAG_OF_VEGETABLE_SEEDS, droprate = 250 },
            { itemid = xi.items.BAG_OF_GRAIN_SEEDS, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.SCROLL_OF_DISPEL, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_MAGIC_FINALE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 800 },
            { itemid = xi.items.SCORPION_QUIVER, droprate = 200 },
        },
    },

    -- KSNM The Hills are Alive
    [76] =
    {
        {
            { itemid = xi.items.BLUE_PONDWEED, droprate = 1000 },
        },

        {
            { itemid = xi.items.HAVOC_SCYTHE, droprate = 188 },
            { itemid = xi.items.KRIEGSBEIL, droprate =  27 },
            { itemid = xi.items.LEOPARD_AXE, droprate = 170 },
            { itemid = xi.items.LIBATION_ABJURATION, droprate = 295 },
            { itemid = xi.items.METEOR_CESTI, droprate =  27 },
            { itemid = xi.items.PURGATORY_MACE, droprate =  71 },
            { itemid = xi.items.SOMNUS_SIGNA, droprate = 196 },
        },

        {
            { itemid = xi.items.GAWAINS_AXE, droprate =  45 },
            { itemid = xi.items.GRIM_STAFF, droprate = 259 },
            { itemid = xi.items.GROSVENEURS_BOW, droprate = 241 },
            { itemid = xi.items.HARLEQUINS_HORN, droprate = 143 },
            { itemid = xi.items.OBLATION_ABJURATION, droprate = 161 },
            { itemid = xi.items.STYLET, droprate = 143 },
            { itemid = xi.items.ZEN_POLE, droprate =  36 },
        },

        {
            { itemid = xi.items.ADAMAN_CHAIN, droprate = 446 },
            { itemid = xi.items.ADAMANTOISE_SHELL, droprate = 420 },
            { itemid = xi.items.PIECE_OF_ANGEL_SKIN, droprate =  71 },
            { itemid = xi.items.STRIDER_BOOTS, droprate =  26 },
        },

        {
            { itemid = xi.items.CORAL_FRAGMENT, droprate = 116 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  89 },
            { itemid = xi.items.DEMON_HORN, droprate =  71 },
            { itemid = xi.items.EBONY_LOG, droprate = 152 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate = 107 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD, droprate =  89 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  45 },
            { itemid = xi.items.HI_RERAISER, droprate =  71 },
            { itemid = xi.items.MAHOGANY_LOG, droprate = 107 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 223 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate = 116 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate =  54 },
            { itemid = xi.items.RAM_HORN, droprate =  54 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate =  71 },
            { itemid = xi.items.RERAISER, droprate =  45 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  54 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  63 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  45 },
        },

        {
            { itemid = xi.items.ADAMAN_CHAIN, droprate = 268 },
            { itemid = xi.items.ADAMANTOISE_EGG, droprate = 121 },
            { itemid = xi.items.AGILITY_POTION, droprate =  80 },
            { itemid = xi.items.DEXTERITY_POTION, droprate = 143 },
            { itemid = xi.items.STRENGTH_POTION, droprate = 214 },
            { itemid = xi.items.VITALITY_POTION, droprate = 196 },
        },

        {
            { itemid = xi.items.CHUNK_OF_ADAMAN_ORE, droprate = 107 },
            { itemid = xi.items.CHARISMA_POTION, droprate =  89 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate = 179 },
            { itemid = xi.items.ICARUS_WING, droprate = 134 },
            { itemid = xi.items.INTELLIGENCE_POTION, droprate = 152 },
            { itemid = xi.items.MIND_POTION, droprate =  80 },
            { itemid = xi.items.CHUNK_OF_ORICHALCUM_ORE, droprate =  80 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate = 107 },
            { itemid = xi.items.PRINCELY_SWORD, droprate = 152 },
        },

        {
            { itemid = xi.items.HI_ETHER_P3, droprate = 295 },
            { itemid = xi.items.HI_POTION_P3, droprate = 250 },
            { itemid = xi.items.HI_RERAISER, droprate = 196 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate = 214 },
        },

        {
            { itemid = xi.items.CORAL_FRAGMENT, droprate = 139 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  59 },
            { itemid = xi.items.DEMON_HORN, droprate =  50 },
            { itemid = xi.items.EBONY_LOG, droprate = 109 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate =  69 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  99 },
            { itemid = xi.items.HI_RERAISER, droprate =  79 },
            { itemid = xi.items.MAHOGANY_LOG, droprate = 129 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate = 119 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate =  69 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 168 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate = 129 },
            { itemid = xi.items.RAM_HORN, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate =  79 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  69 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  79 },
            { itemid = xi.items.RERAISER, droprate =  50 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD, droprate =  89 },
        },

        {
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH, droprate =  89 },
            { itemid = xi.items.DAMASCUS_INGOT, droprate =  79 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  99 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate = 188 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 238 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 109 },
        },

        {
            { itemid = xi.items.DIVINE_LOG, droprate =  79 },
            { itemid = xi.items.LACQUER_TREE_LOG, droprate = 257 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 337 },
            { itemid = xi.items.SQUARE_OF_SHINING_CLOTH, droprate = 149 },
        },
    },

    -- BCNM Royal Jelly
    [77] =
    {
        {
            { itemid = xi.items.VIAL_OF_SLIME_OIL, droprate = 1000 },
        },
        {
            { itemid = xi.items.VIAL_OF_SLIME_OIL, droprate = 1000 },
        },
        {
            { itemid = xi.items.ARCHERS_RING, droprate = 91 },
        },
        {
            { itemid = xi.items.MANA_RING, droprate = 469 },
            { itemid = xi.items.GRUDGE_SWORD, droprate = 152 },
            { itemid = xi.items.DE_SAINTRES_AXE, droprate = 120 },
            { itemid = xi.items.BUZZARD_TUCK, droprate = 118 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate  = 106 },
        },
        {
            { itemid = xi.items.MARKSMANS_RING, droprate = 258 },
            { itemid = xi.items.DUSKY_STAFF, droprate = 152 },
            { itemid = xi.items.HIMMEL_STOCK, droprate = 101 },
            { itemid = xi.items.SEALED_MACE, droprate  = 98 },
            { itemid = xi.items.SHIKAR_BOW, droprate  = 98 },
        },
        {
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 123 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 165 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 140 },
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 145 },
            { itemid = xi.items.STEEL_SHEET,  droprate = 229 },
            { itemid = xi.items.STEEL_INGOT,  droprate = 238 },
        },
        {
            { itemid = xi.items.SCROLL_OF_REFRESH, droprate = 263 },
            { itemid = xi.items.SCROLL_OF_ICE_SPIKES, droprate = 246 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 177 },
            { itemid = xi.items.GOLD_BEASTCOIN,  droprate = 182 },
            { itemid = xi.items.MYTHRIL_BEASTCOIN,  droprate = 133 },
            { itemid = xi.items.PERIDOT,  droprate =  27 },
            { itemid = xi.items.TURQUOISE,  droprate =  20 },
            { itemid = xi.items.BLACK_PEARL,  droprate =  15 },
            { itemid = xi.items.GOSHENITE,  droprate =  15 },
            { itemid = xi.items.SPHENE,  droprate =  15 },
            { itemid = xi.items.AMETRINE,  droprate =  10 },
            { itemid = xi.items.GARNET,  droprate =   7 },
            { itemid = xi.items.BLACK_ROCK,  droprate =  12 },
            { itemid = xi.items.GREEN_ROCK,  droprate =   7 },
            { itemid = xi.items.WHITE_ROCK,  droprate =   7 },
            { itemid = xi.items.BLUE_ROCK,  droprate =   2 },
            { itemid = xi.items.TRANSLUCENT_ROCK,  droprate =   2 },
            { itemid = xi.items.OAK_LOG,  droprate =   5 },
            { itemid = xi.items.ROSEWOOD_LOG,  droprate =   5 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  10 },
            { itemid = xi.items.RERAISER, droprate =   2 },
        },
    },

    -- BCNM The Final Bout
    [78] =
    {
        {
            { itemid = xi.items.BAG_OF_TREE_CUTTINGS, droprate = 1000 },
        },

        {
            { itemid = xi.items.BAG_OF_TREE_CUTTINGS, droprate = 1000 },
        },

        {
            { itemid = xi.items.CLUMP_OF_BOYAHDA_MOSS, droprate = 1000 },
        },

        {
            { itemid = xi.items.SCROLL_OF_QUAKE, droprate = 100 },
            { itemid = xi.items.PIECE_OF_WISTERIA_LUMBER, droprate = 100 },
            { itemid = xi.items.MAHOGANY_LOG, droprate = 100 },
            { itemid = xi.items.EBONY_LOG, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_FREEZE, droprate = 100 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 100 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 100 },
            { itemid = xi.items.GOLD_INGOT, droprate = 100 },
            { itemid = xi.items.CORAL_FRAGMENT, droprate = 100 },
        },

        {
            { itemid = xi.items.SHOCK_MASK, droprate = 62 },
            { itemid = xi.items.SUPER_RIBBON, droprate = 62 },
            { itemid = xi.items.RIVAL_RIBBON, droprate = 62 },
            { itemid = xi.items.IVORY_MITTS, droprate = 62 },
            { itemid = xi.items.SPIKED_FINGER_GAUNTLETS, droprate = 70 },
            { itemid = xi.items.SLY_GAUNTLETS, droprate = 62 },
            { itemid = xi.items.RUSH_GLOVES, droprate = 62 },
            { itemid = xi.items.MANA_CIRCLET, droprate = 62 },
            { itemid = xi.items.HATEFUL_COLLAR, droprate = 62 },
            { itemid = xi.items.ESOTERIC_MANTLE, droprate = 62 },
            { itemid = xi.items.TEMPLARS_MANTLE, droprate = 62 },
            { itemid = xi.items.HEAVY_MANTLE, droprate = 62 },
            { itemid = xi.items.INTELLECT_TORQUE, droprate = 62 },
            { itemid = xi.items.STORM_GORGET, droprate = 62 },
            { itemid = xi.items.BENIGN_NECKLACE, droprate = 62 },
            { itemid = xi.items.SNIPERS_MANTLE, droprate = 62 },
        },
    },

    -- BCNM Up In Arms
    [79] =
    {
        {
            { itemid = xi.items.GIL, droprate = 1000, amount = 15000 },
        },

        {
            { itemid = xi.items.BLACK_PEARL, droprate = 1000 },
        },

        {
            { itemid = xi.items.PEARL, droprate = 1000 },
        },

        {
            { itemid = xi.items.PEARL, droprate = 1000 },
        },

        {
            { itemid = xi.items.OXBLOOD, droprate = 1000 },
        },

        {
            { itemid = xi.items.OXBLOOD, droprate = 1000 },
        },

        {
            { itemid = xi.items.OXBLOOD, droprate = 1000 },
        },

        {
            { itemid = xi.items.TELEPORT_RING_ALTEP, droprate = 447 },
            { itemid = xi.items.TELEPORT_RING_DEM, droprate = 487 },
        },

        {
            { itemid = xi.items.AJARI_BEAD_NECKLACE, droprate = 494 },
            { itemid = xi.items.PHILOMATH_STOLE, droprate = 449 },
        },

        {
            { itemid = xi.items.AQUAMARINE, droprate =  51 },
            { itemid = xi.items.CHRYSOBERYL, droprate =  32 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate =  39 },
            { itemid = xi.items.EBONY_LOG, droprate =  21 },
            { itemid = xi.items.HI_RERAISER, droprate =  32 },
            { itemid = xi.items.GOLD_INGOT, droprate =  55 },
            { itemid = xi.items.JADEITE, droprate =  62 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate =  81 },
            { itemid = xi.items.MOONSTONE, droprate =  56 },
            { itemid = xi.items.PAINITE, droprate = 195 },
            { itemid = xi.items.STEEL_INGOT, droprate =  58 },
            { itemid = xi.items.SUNSTONE, droprate =  38 },
            { itemid = xi.items.TRANSLUCENT_ROCK, droprate =  11 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  21 },
            { itemid = xi.items.YELLOW_ROCK, droprate =  15 },
            { itemid = xi.items.ZIRCON, droprate =  26 },
            { itemid = xi.items.RED_ROCK, droprate =  21 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  17 },
            { itemid = xi.items.BLUE_ROCK, droprate =   9 },
            { itemid = xi.items.FLUORITE, droprate =  62 },
            { itemid = xi.items.PURPLE_ROCK, droprate =  11 },
            { itemid = xi.items.BLACK_ROCK, droprate =  11 },
            { itemid = xi.items.GREEN_ROCK, droprate =  11 },
            { itemid = xi.items.WHITE_ROCK, droprate =   9 },
        },

        {
            { itemid = xi.items.NONE, droprate =  932 },
            { itemid = xi.items.KRAKEN_CLUB, droprate =   13 },
            { itemid = xi.items.WALKURE_MASK, droprate =   55 },
        },
    },

    -- KSNM Copycat
    [80] =
    {
        {
            { itemid = xi.items.ADAMAN_INGOT, droprate = 1000 },
        },
        {
            { itemid = xi.items.AHRIMAN_LENS, droprate = 250 },
            { itemid = xi.items.AHRIMAN_WING, droprate = 250 },
            { itemid = xi.items.POLE_GRIP,    droprate =  50 },
            { itemid = xi.items.SWORD_STRAP,  droprate =  15 },
            { itemid = xi.items.SPEAR_STRAP,  droprate = 250 },
        },
        {
            { itemid = xi.items.COFFINMAKER,  droprate = 250 },
            { itemid = xi.items.DESTROYERS,   droprate = 250 },
            { itemid = xi.items.EXPUNGER,     droprate = 250 },
            { itemid = xi.items.RETRIBUTOR,   droprate = 250 },
        },
        {
            { itemid = xi.items.ATTILAS_EARRING, droprate = 250 },
            { itemid = xi.items.DURANDAL,        droprate = 250 },
            { itemid = xi.items.HOPLITES_HARP,   droprate = 250 },
            { itemid = xi.items.SORROWFUL_HARP,  droprate = 250 },
        },
        {
            { itemid = xi.items.FUMA_SUNE_ATE,       droprate = 550 },
            { itemid = xi.items.CHUNK_OF_ADAMAN_ORE, droprate = 200 },
            { itemid = xi.items.ORICHALCUM_INGOT,    droprate = 250 },
        },
        {
            { itemid = xi.items.CORAL_FRAGMENT,           droprate = 50 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,   droprate = 50 },
            { itemid = xi.items.DEMON_HORN,               droprate = 50 },
            { itemid = xi.items.EBONY_LOG,                droprate = 50 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE,        droprate = 50 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD,     droprate = 50 },
            { itemid = xi.items.HI_RERAISER,              droprate = 50 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE,    droprate = 50 },
            { itemid = xi.items.MAHOGANY_LOG,             droprate = 50 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,   droprate = 50 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,     droprate = 50 },
            { itemid = xi.items.PETRIFIED_LOG,            droprate = 50 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate = 50 },
            { itemid = xi.items.RAM_HORN,                 droprate = 50 },
            { itemid = xi.items.SQUARE_OF_RAXA,           droprate = 50 },
            { itemid = xi.items.RERAISER,                 droprate = 50 },
            { itemid = xi.items.VILE_ELIXIR,              droprate = 50 },
            { itemid = xi.items.VILE_ELIXIR_P1,           droprate = 50 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES, droprate = 50 },
            { itemid = xi.items.PHILOSOPHERS_STONE,       droprate = 50 },
        },
        {
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  50 },
            { itemid = xi.items.DAMASCUS_INGOT,             droprate =  50 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,     droprate =  50 },
            { itemid = xi.items.PHILOSOPHERS_STONE,         droprate = 300 },
            { itemid = xi.items.PHOENIX_FEATHER,            droprate = 300 },
            { itemid = xi.items.SQUARE_OF_RAXA,             droprate = 200 },
        },
    },

    -- KSNM Operation Desert Swarm
    [81] =
    {
        {
            { itemid = xi.items.HIGH_QUALITY_SCORPION_SHELL,  droprate = 813 },
            { itemid = xi.items.SERKET_RING, droprate =  55 },
            { itemid = xi.items.VENOMOUS_CLAW,   droprate = 123 },
            { itemid = xi.items.HIGH_QUALITY_SCORPION_SHELL,  droprate = 813 },
            { itemid = xi.items.SERKET_RING, droprate =  55 },
            { itemid = xi.items.VENOMOUS_CLAW,   droprate = 123 },
        },

        {
            { itemid = xi.items.EXPUNGER, droprate = 216 },
            { itemid = xi.items.HEART_SNATCHER, droprate = 295 },
            { itemid = xi.items.RAMPAGER, droprate = 239 },
            { itemid = xi.items.SENJUINRIKIO, droprate = 231 },
        },

        {
            { itemid = xi.items.ANUBISS_KNIFE, droprate = 504 },
            { itemid = xi.items.ORICHALCUM_INGOT,   droprate =  22 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate =  86 },
            { itemid = xi.items.POLE_GRIP,     droprate = 146 },
            { itemid = xi.items.SWORD_STRAP,   droprate = 220 },
        },

        {
            { itemid = xi.items.HIERARCH_BELT, droprate = 287 },
            { itemid = xi.items.PALMERINS_SHIELD, droprate = 216 },
            { itemid = xi.items.TRAINERS_GLOVES, droprate = 198 },
            { itemid = xi.items.WARWOLF_BELT, droprate = 287 },
        },

        {
            { itemid = xi.items.CORAL_FRAGMENT,  droprate =  52 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,  droprate =  56 },
            { itemid = xi.items.DEMON_HORN,  droprate =  41 },
            { itemid = xi.items.EBONY_LOG,  droprate =  63 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE,  droprate =  52 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD,  droprate =  26 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  11 },
            { itemid = xi.items.HI_RERAISER, droprate =  37 },
            { itemid = xi.items.MAHOGANY_LOG,  droprate = 101 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,  droprate =  52 },
            { itemid = xi.items.PETRIFIED_LOG,  droprate = 116 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate =  15 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate =  56 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE,  droprate =  45 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate =  22 },
            { itemid = xi.items.RAM_HORN,  droprate =  67 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 119 },
            { itemid = xi.items.RERAISER, droprate =  45 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  19 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  41 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES,  droprate =  34 },
        },

        {
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  78 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  56 },
            { itemid = xi.items.DAMASCUS_INGOT,  droprate =  93 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,  droprate =  56 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate = 157 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate = 276 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 209 },
        },
    },

    -- KSNM Prehistoric Pigeons
    [82] =
    {
        {
            { itemid = xi.items.MICHISHIBA_NO_TSUYU, droprate = 217 },
            { itemid = xi.items.DISSECTOR, droprate = 174 },
            { itemid = xi.items.COFFINMAKER, droprate = 333 },
            { itemid = xi.items.GRAVEDIGGER, droprate = 174 },
        },

        {
            { itemid = xi.items.DAMASCUS_INGOT, droprate = 275 },
            { itemid = xi.items.GIANT_BIRD_PLUME, droprate = 275 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate = 144 },
            { itemid = xi.items.POLE_GRIP,     droprate = 203 },
            { itemid = xi.items.SPEAR_STRAP,   droprate = 116 },
        },

        {
            { itemid = xi.items.ADAMAN_INGOT, droprate = 159 },
            { itemid = xi.items.ORICHALCUM_INGOT, droprate = 290 },
            { itemid = xi.items.TITANIS_EARRING, droprate = 406 },
        },

        {
            { itemid = xi.items.EVOKERS_BOOTS, droprate = 159 },
            { itemid = xi.items.OSTREGER_MITTS, droprate = 217 },
            { itemid = xi.items.PINEAL_HAT, droprate = 145 },
            { itemid = xi.items.TRACKERS_KECKS, droprate = 159 },
        },

        {
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,  droprate =  29 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,  droprate =  29 },
            { itemid = xi.items.EBONY_LOG,  droprate =  29 },
            { itemid = xi.items.PETRIFIED_LOG,  droprate =  58 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE,  droprate =  14 },
            { itemid = xi.items.GOLD_INGOT,  droprate = 101 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD,  droprate =  29 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,  droprate =  72 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate =  58 },
            { itemid = xi.items.CORAL_FRAGMENT,  droprate = 101 },
            { itemid = xi.items.RAM_HORN,  droprate =  14 },
            { itemid = xi.items.DEMON_HORN,  droprate =  29 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 159 },
        },

        {
            { itemid = xi.items.DAMASCUS_INGOT,  droprate =  14 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  29 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate = 246 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate = 174 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  87 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 159 },
        },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        xi.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
