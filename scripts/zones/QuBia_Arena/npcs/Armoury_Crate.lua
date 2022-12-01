-----------------------------------
-- Area: Qu'Bia Arena
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- Come into my Parlor
    [513] =
    {
        {
            { itemid = xi.items.NONE,     droprate = 250 },
            { itemid = xi.items.OCEAN_ROPE, droprate = 150 },
            { itemid = xi.items.JUNGLE_ROPE, droprate = 150 },
            { itemid = xi.items.STEPPE_ROPE, droprate = 150 },
            { itemid = xi.items.DESERT_ROPE, droprate = 150 },
            { itemid = xi.items.FOREST_ROPE, droprate = 150 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 250 },
            { itemid = xi.items.SOLDIERS_RING, droprate =  50 },
            { itemid = xi.items.KAMPFER_RING, droprate =  50 },
            { itemid = xi.items.MEDICINE_RING, droprate =  50 },
            { itemid = xi.items.SORCERERS_RING, droprate =  50 },
            { itemid = xi.items.FENCERS_RING, droprate =  50 },
            { itemid = xi.items.ROGUES_RING, droprate =  50 },
            { itemid = xi.items.GUARDIANS_RING, droprate =  50 },
            { itemid = xi.items.SLAYERS_RING, droprate =  50 },
            { itemid = xi.items.TAMERS_RING, droprate =  50 },
            { itemid = xi.items.MINSTRELS_RING, droprate =  50 },
            { itemid = xi.items.TRACKERS_RING, droprate =  50 },
            { itemid = xi.items.RONIN_RING, droprate =  50 },
            { itemid = xi.items.SHINOBI_RING, droprate =  50 },
            { itemid = xi.items.DRAKE_RING, droprate =  50 },
            { itemid = xi.items.CONJURERS_RING, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 450 },
            { itemid = xi.items.SWORD_STRAP, droprate = 250 },
            { itemid = xi.items.POLE_GRIP,   droprate =  50 },
            { itemid = xi.items.SPEAR_STRAP, droprate = 250 },
        },
        {
            { itemid = xi.items.NONE,    droprate = 600 },
            { itemid = xi.items.SCROLL_OF_CURE_V, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_SHELL_IV, droprate = 100 },
            { itemid = xi.items.LIGHT_SPIRIT_PACT, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE, droprate = 90 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate = 70 },
            { itemid = xi.items.MAHOGANY_LOG, droprate = 70 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 70 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate = 70 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate = 70 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD, droprate = 70 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate = 70 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 70 },
            { itemid = xi.items.CORAL_FRAGMENT, droprate = 70 },
            { itemid = xi.items.RAM_HORN, droprate = 70 },
            { itemid = xi.items.DEMON_HORN, droprate = 70 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate = 70 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 70 },
        },
        {
            { itemid = xi.items.NONE,    droprate = 270 },
            { itemid = xi.items.DAMASCUS_INGOT,  droprate =  50 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  50 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,  droprate =  50 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate = 250 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 350 },
        },
    },

    --E-vase-ive Action
    [514] =
    {
        {
            { itemid = xi.items.NONE,     droprate = 250 },
            { itemid = xi.items.SOLDIERS_EARRING,  droprate =  50 }, -- Soldier's Earring
            { itemid = xi.items.KAMPFER_EARRING,   droprate =  50 }, -- Kampfer Earring
            { itemid = xi.items.MEDICINE_EARRING,  droprate =  50 }, -- Medicine Earring
            { itemid = xi.items.SORCERERS_EARRING, droprate =  50 }, -- Sorcerer's Earring
            { itemid = xi.items.FENCERS_EARRING,   droprate =  50 }, -- Fencer's Earring
            { itemid = xi.items.ROGUES_EARRING,    droprate =  50 }, -- Rogue's Earring
            { itemid = xi.items.GUARDIAN_EARRING,  droprate =  50 }, -- Guardian Earring
            { itemid = xi.items.SLAYERS_EARRING,   droprate =  50 }, -- Slayer's Earring
            { itemid = xi.items.TAMERS_EARRING,    droprate =  50 }, -- Tamer's Earring
            { itemid = xi.items.MINSTRELS_EARRING, droprate =  50 }, -- Minstrel's Earring
            { itemid = xi.items.TRACKERS_EARRING,  droprate =  50 }, -- Tracker's Earring
            { itemid = xi.items.RONINS_EARRING,    droprate =  50 }, -- Ronin's Earring
            { itemid = xi.items.SHINOBI_EARRING,   droprate =  50 }, -- Shinobi Earring
            { itemid = xi.items.DRAKE_EARRING,     droprate =  50 }, -- Drake Earring
            { itemid = xi.items.CONJURER_EARRING,  droprate =  50 }, -- Conjurer Earring
        },
        {
            { itemid = xi.items.MAHOGANY_LOG,  droprate =  50 },
            { itemid = xi.items.PETRIFIED_LOG,  droprate = 250 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate = 100 },
            { itemid = xi.items.SCROLL_OF_CURE_V, droprate =  50 },
            { itemid = xi.items.SCROLL_OF_SHELL_IV, droprate = 250 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate = 200 },
            { itemid = xi.items.SCROLL_OF_RAISE_III, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE,   droprate = 250 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD, droprate = 100 },
            { itemid = xi.items.RAM_HORN, droprate =  50 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  50 },
            { itemid = xi.items.EBONY_LOG, droprate = 100 },
            { itemid = xi.items.DEMON_HORN, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate = 100 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate = 300 },
        },
        {
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,  droprate = 100 },
            { itemid = xi.items.EBONY_LOG,  droprate =  50 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE,  droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate =  50 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate = 300 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate = 200 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  50 },
        },
        {
            { itemid = xi.items.CLAYMORE_GRIP,   droprate = 150 },
            { itemid = xi.items.CORAL_FRAGMENT,  droprate = 150 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 150 },
            { itemid = xi.items.SWORD_STRAP,     droprate = 350 },
            { itemid = xi.items.POLE_GRIP,       droprate = 200 },
        },
        {
            { itemid = xi.items.NONE,    droprate = 450 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate = 100 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 450 },
        },
        {
            { itemid = xi.items.NONE,    droprate = 450 },
            { itemid = xi.items.DAMASCUS_INGOT,  droprate =  50 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  50 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,  droprate =  50 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate = 100 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE,  droprate =  50 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,  droprate = 100 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  50 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES,  droprate =  50 },
            { itemid = xi.items.RERAISER, droprate =  50 },
        },
    },

    -- KSNM Infernal Swarm
    [515] =
    {
        {
            { itemid = xi.items.NONE, droprate = 350 },
            { itemid = xi.items.EBONY_LOG,       droprate = 150 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 500 },
        },
        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 500 },
        },
        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.SOLDIERS_EARRING,  droprate = 50 },
            { itemid = xi.items.KAMPFER_EARRING,   droprate = 50 },
            { itemid = xi.items.MEDICINE_EARRING,  droprate = 50 },
            { itemid = xi.items.SORCERERS_EARRING, droprate = 50 },
            { itemid = xi.items.FENCERS_EARRING,   droprate = 50 },
            { itemid = xi.items.ROGUES_EARRING,    droprate = 50 },
            { itemid = xi.items.GUARDIAN_EARRING,  droprate = 50 },
            { itemid = xi.items.SLAYERS_EARRING,   droprate = 50 },
            { itemid = xi.items.TAMERS_EARRING,    droprate = 50 },
            { itemid = xi.items.MINSTRELS_EARRING, droprate = 50 },
            { itemid = xi.items.TRACKERS_EARRING,  droprate = 50 },
            { itemid = xi.items.RONINS_EARRING,    droprate = 50 },
            { itemid = xi.items.SHINOBI_EARRING,   droprate = 50 },
            { itemid = xi.items.DRAKE_EARRING,     droprate = 50 },
            { itemid = xi.items.CONJURER_EARRING,  droprate = 50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.SOLDIERS_EARRING,  droprate = 50 },
            { itemid = xi.items.KAMPFER_EARRING,   droprate = 50 },
            { itemid = xi.items.MEDICINE_EARRING,  droprate = 50 },
            { itemid = xi.items.SORCERERS_EARRING, droprate = 50 },
            { itemid = xi.items.FENCERS_EARRING,   droprate = 50 },
            { itemid = xi.items.ROGUES_EARRING,    droprate = 50 },
            { itemid = xi.items.GUARDIAN_EARRING,  droprate = 50 },
            { itemid = xi.items.SLAYERS_EARRING,   droprate = 50 },
            { itemid = xi.items.TAMERS_EARRING,    droprate = 50 },
            { itemid = xi.items.MINSTRELS_EARRING, droprate = 50 },
            { itemid = xi.items.TRACKERS_EARRING,  droprate = 50 },
            { itemid = xi.items.RONINS_EARRING,    droprate = 50 },
            { itemid = xi.items.SHINOBI_EARRING,   droprate = 50 },
            { itemid = xi.items.DRAKE_EARRING,     droprate = 50 },
            { itemid = xi.items.CONJURER_EARRING,  droprate = 50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 400 },
            { itemid = xi.items.OCEAN_SASH,  droprate = 150 },
            { itemid = xi.items.FOREST_SASH, droprate = 150 },
            { itemid = xi.items.STEPPE_SASH, droprate = 150 },
            { itemid = xi.items.JUNGLE_SASH, droprate = 150 },
        },
        {
            { itemid = xi.items.NONE, droprate = 450 },
            { itemid = xi.items.STAFF_STRAP,   droprate =  50 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate =  50 },
            { itemid = xi.items.POLE_GRIP,     droprate = 300 },
            { itemid = xi.items.SPEAR_STRAP,   droprate = 150 },
        },
        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate = 400 },
            { itemid = xi.items.PHOENIX_FEATHER,    droprate = 500 },
        },
        {
            { itemid = xi.items.NONE, droprate = 840 },
            { itemid = xi.items.SCROLL_OF_CURE_V,      droprate =  10 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate =  10 },
            { itemid = xi.items.SCROLL_OF_SHELL_IV,    droprate =  10 },
            { itemid = xi.items.LIGHT_SPIRIT_PACT,     droprate = 130 },
        },

        {
            { itemid = xi.items.NONE, droprate = 640 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,   droprate = 150 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_ADAMAN_ORE,    droprate =  10 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE,  droprate = 100 },
            { itemid = xi.items.SLAB_OF_GRANITE,        droprate =  50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 350 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 500 },
            { itemid = xi.items.HI_RERAISER,     droprate = 150 },
        },
        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.RAINBOW_CLOTH,                 droprate =  50 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD, droprate = 100 },
            { itemid = xi.items.MAHOGANY_LOG,         droprate = 100 },
            { itemid = xi.items.PETRIFIED_LOG,        droprate = 150 },
            { itemid = xi.items.CORAL_FRAGMENT,       droprate = 100 },
            { itemid = xi.items.RAM_HORN,             droprate = 200 },
            { itemid = xi.items.DEMON_HORN,           droprate = 100 },
        },
        {
            { itemid = xi.items.NONE, droprate = 270 },
            { itemid = xi.items.DAMASCUS_INGOT,             droprate =  10 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  10 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,     droprate =  10 },
            { itemid = xi.items.PHILOSOPHERS_STONE,         droprate = 250 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAXA,             droprate = 400 },
        },
    },

    -- BCNM Demolition Squad
    [520] =
    {
        {
            { itemid = xi.items.MARINE_M_GLOVES, droprate = 125 },
            { itemid = xi.items.MARINE_F_GLOVES, droprate = 125 },
            { itemid = xi.items.WOOD_GAUNTLETS, droprate = 125 },
            { itemid = xi.items.WOOD_GLOVES, droprate = 125 },
            { itemid = xi.items.CREEK_M_MITTS, droprate = 125 },
            { itemid = xi.items.CREEK_F_MITTS, droprate = 125 },
            { itemid = xi.items.RIVER_GAUNTLETS, droprate = 125 },
            { itemid = xi.items.DUNE_BRACERS, droprate = 125 },
        },

        {
            { itemid = xi.items.RED_CHIP, droprate = 125 },
            { itemid = xi.items.BLUE_CHIP, droprate = 125 },
            { itemid = xi.items.YELLOW_CHIP, droprate = 125 },
            { itemid = xi.items.GREEN_CHIP, droprate = 125 },
            { itemid = xi.items.CLEAR_CHIP, droprate = 125 },
            { itemid = xi.items.PURPLE_CHIP, droprate = 125 },
            { itemid = xi.items.WHITE_CHIP, droprate = 125 },
            { itemid = xi.items.BLACK_CHIP, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 125 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate = 125 },
            { itemid = xi.items.EBONY_LOG, droprate = 125 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 125 },
            { itemid = xi.items.AQUAMARINE, droprate = 125 },
            { itemid = xi.items.PAINITE, droprate = 125 },
            { itemid = xi.items.CHRYSOBERYL, droprate = 125 },
            { itemid = xi.items.MOONSTONE, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 625 },
            { itemid = xi.items.SCROLL_OF_RERAISE_II, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_FLARE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_VALOR_MINUET_IV, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 700 },
            { itemid = xi.items.HI_POTION_P3, droprate =  75 },
            { itemid = xi.items.HI_RERAISER, droprate = 150 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  50 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  25 },
        },
    },

    -- BCNM Die by the Sword
    [521] =
    {
        {
            { itemid = xi.items.RUSTY_PICK, droprate = 1000 },
        },

        {
            { itemid = xi.items.ASHIGARU_EARRING, droprate = 71 },
            { itemid = xi.items.ESQUIRES_EARRING, droprate = 71 },
            { itemid = xi.items.MAGICIANS_EARRING, droprate = 72 },
            { itemid = xi.items.MERCENARYS_EARRING, droprate = 72 },
            { itemid = xi.items.PILFERERS_EARRING, droprate = 72 },
            { itemid = xi.items.SINGERS_EARRING, droprate = 71 },
            { itemid = xi.items.TRIMMERS_EARRING, droprate = 71 },
            { itemid = xi.items.WARLOCKS_EARRING, droprate = 72 },
            { itemid = xi.items.WIZARDS_EARRING, droprate = 72 },
            { itemid = xi.items.WRESTLERS_EARRING, droprate = 72 },
            { itemid = xi.items.WYVERN_EARRING, droprate = 71 },
            { itemid = xi.items.BEATERS_EARRING, droprate = 71 },
            { itemid = xi.items.ASHIGARU_EARRING, droprate = 71 },
            { itemid = xi.items.KILLER_EARRING, droprate = 71 },
        },

        {
            { itemid = xi.items.AVATAR_BELT, droprate = 71 },
            { itemid = xi.items.AXE_BELT, droprate = 71 },
            { itemid = xi.items.CESTUS_BELT, droprate = 72 },
            { itemid = xi.items.DAGGER_BELT, droprate = 72 },
            { itemid = xi.items.GUN_BELT, droprate = 72 },
            { itemid = xi.items.KATANA_OBI, droprate = 71 },
            { itemid = xi.items.LANCE_BELT, droprate = 71 },
            { itemid = xi.items.SARASHI, droprate = 72 },
            { itemid = xi.items.SCYTHE_BELT, droprate = 72 },
            { itemid = xi.items.SHIELD_BELT, droprate = 72 },
            { itemid = xi.items.SONG_BELT, droprate = 71 },
            { itemid = xi.items.STAFF_BELT, droprate = 71 },
            { itemid = xi.items.PICK_BELT, droprate = 71 },
            { itemid = xi.items.RAPIER_BELT, droprate = 71 },
        },

        {
            { itemid = xi.items.SCROLL_OF_ERASE, droprate =  200 },
            { itemid = xi.items.SCROLL_OF_DISPEL, droprate =  200 },
            { itemid = xi.items.SCROLL_OF_MAGIC_FINALE, droprate =  200 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate =  200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 775 },
            { itemid = xi.items.GOLD_INGOT, droprate =  50 },
            { itemid = xi.items.PLATINUM_INGOT, droprate =  50 },
            { itemid = xi.items.PETRIFIED_LOG, droprate =  50 },
            { itemid = xi.items.RUSTY_GREATSWORD, droprate =  75 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.MANNEQUIN_HEAD, droprate = 250 },
            { itemid = xi.items.MANNEQUIN_BODY, droprate = 250 },
            { itemid = xi.items.MANNEQUIN_HANDS, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 667 },
            { itemid = xi.items.HI_ETHER, droprate = 333 },
        },
    },

    -- BCNM Let Sleeping Dogs Die
    [522] =
    {
        {
            { itemid = xi.items.WOLF_HIDE, droprate = 1000 },
        },

        {
            { itemid = xi.items.REVIVAL_TREE_ROOT, droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.MANNEQUIN_HEAD, droprate = 300 },
            { itemid = xi.items.MANNEQUIN_BODY, droprate = 300 },
            { itemid = xi.items.MANNEQUIN_HANDS, droprate = 300 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.SCROLL_OF_ABSORB_AGI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ABSORB_INT, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ABSORB_VIT, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_DISPEL, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.SINGERS_SHIELD, droprate = 150 },
            { itemid = xi.items.WARLOCKS_SHIELD, droprate = 150 },
            { itemid = xi.items.MAGICIANS_SHIELD, droprate = 150 },
            { itemid = xi.items.ASHIGARU_MANTLE, droprate = 150 },
            { itemid = xi.items.WIZARDS_MANTLE, droprate = 150 },
            { itemid = xi.items.KILLER_MANTLE, droprate = 150 },
        },
    },

    -- BCNM Brothers D'Aurphe
    [523] =
    {
        {
            { itemid = xi.items.CREEK_M_CLOMPS, droprate = 125 },
            { itemid = xi.items.CREEK_F_CLOMPS, droprate = 125 },
            { itemid = xi.items.MARINE_M_BOOTS, droprate = 125 },
            { itemid = xi.items.MARINE_F_BOOTS, droprate = 125 },
            { itemid = xi.items.WOOD_M_LEDELSENS, droprate = 125 },
            { itemid = xi.items.WOOD_F_LEDELSENS, droprate = 125 },
            { itemid = xi.items.DUNE_SANDALS, droprate = 125 },
            { itemid = xi.items.RIVER_GAITERS, droprate = 125 },
        },

        {
            { itemid = xi.items.CROSS_COUNTERS, droprate =  43 },
            { itemid = xi.items.CHRYSOBERYL, droprate =  10 },
            { itemid = xi.items.JADEITE, droprate =  94 },
            { itemid = xi.items.SUNSTONE, droprate = 113 },
            { itemid = xi.items.ZIRCON, droprate =  75 },
            { itemid = xi.items.CLEAR_CHIP, droprate =  10 },
            { itemid = xi.items.RED_CHIP, droprate =  38 },
            { itemid = xi.items.YELLOW_CHIP, droprate =  38 },
            { itemid = xi.items.GOLD_INGOT, droprate = 151 },
            { itemid = xi.items.PURPLE_ROCK, droprate =  19 },
            { itemid = xi.items.WHITE_ROCK, droprate =  19 },
        },

        {
            { itemid = xi.items.STEEL_INGOT, droprate = 132 },
            { itemid = xi.items.TRANSLUCENT_ROCK, droprate = 113 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 113 },
            { itemid = xi.items.PAINITE, droprate =  50 },
            { itemid = xi.items.EBONY_LOG, droprate = 132 },
            { itemid = xi.items.WHITE_CHIP, droprate =  10 },
            { itemid = xi.items.MOONSTONE, droprate = 151 },
            { itemid = xi.items.ZIRCON, droprate =  75 },
            { itemid = xi.items.FLUORITE, droprate =  57 },
            { itemid = xi.items.CHRYSOBERYL, droprate =  57 },
            { itemid = xi.items.GREEN_ROCK, droprate =  38 },
            { itemid = xi.items.HI_RERAISER, droprate =  38 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  38 },
        },

        {
            { itemid = xi.items.SCROLL_OF_FLARE, droprate = 283 },
            { itemid = xi.items.SCROLL_OF_VALOR_MINUET_IV, droprate = 358 },
            { itemid = xi.items.SCROLL_OF_RERAISE_II, droprate = 264 },
        },

        {
            { itemid = xi.items.NONE, droprate = 957 },
            { itemid = xi.items.EURYTOS_BOW, droprate =  43 },
        },

        {
            { itemid = xi.items.NONE, droprate = 582 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate = 302 },
            { itemid = xi.items.BLUE_CHIP, droprate =  19 },
            { itemid = xi.items.BLACK_CHIP, droprate =  38 },
            { itemid = xi.items.PURPLE_CHIP, droprate =  10 },
            { itemid = xi.items.GREEN_CHIP, droprate =  19 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  10 },
            { itemid = xi.items.RED_ROCK, droprate =  10 },
            { itemid = xi.items.BLACK_ROCK, droprate =  10 },
        },

        {
            { itemid = xi.items.NONE, droprate = 887 },
            { itemid = xi.items.HI_POTION_P3, droprate = 113 },
        },
    },

    -- BCNM Undying Promise
    [524] =
    {
        {
            { itemid = xi.items.BONE_CHIP, droprate = 1000 },
        },

        {
            { itemid = xi.items.BONE_CHIP, droprate = 1000 },
        },

        {
            { itemid = xi.items.CALVELEYS_DAGGER, droprate = 175 },
            { itemid = xi.items.JENNET_SHIELD, droprate = 175 },
            { itemid = xi.items.JONGLEURS_DAGGER, droprate = 175 },
            { itemid = xi.items.KAGEHIDE, droprate = 175 },
            { itemid = xi.items.OHAGURO, droprate = 175 },
            { itemid = xi.items.EBONY_LOG, droprate = 125 },
        },

        {
            { itemid = xi.items.BEHOURD_LANCE, droprate = 200 },
            { itemid = xi.items.ELEGANT_SHIELD, droprate = 200 },
            { itemid = xi.items.MUTILATOR, droprate = 200 },
            { itemid = xi.items.RAIFU, droprate = 200 },
            { itemid = xi.items.TOURNEY_PATAS, droprate = 200 },
        },

        {
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  60 },
            { itemid = xi.items.GOLD_INGOT, droprate =  60 },
            { itemid = xi.items.GOLD_BEASTCOIN, droprate =  60 },
            { itemid = xi.items.MYTHRIL_BEASTCOIN, droprate =  60 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate =  60 },
            { itemid = xi.items.PLATINUM_INGOT, droprate =  60 },
            { itemid = xi.items.RAM_HORN, droprate =  60 },
            { itemid = xi.items.SCROLL_OF_REFRESH, droprate = 125 },
            { itemid = xi.items.RERAISER, droprate = 145 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ICE_SPIKES, droprate = 125 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  60 },
        },

        {
            { itemid = xi.items.CORAL_FRAGMENT, droprate =  78 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate =  78 },
            { itemid = xi.items.DEMON_HORN, droprate =  78 },
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate =  78 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate =  78 },
            { itemid = xi.items.PETRIFIED_LOG, droprate =  78 },
            { itemid = xi.items.RAM_HORN, droprate =  78 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 850 },
            { itemid = xi.items.RAM_SKIN, droprate =  50 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate =  50 },
        },
    },

    -- BCNM Factory Rejects
    [525] =
    {
        {
            { itemid = xi.items.DOLL_SHARD, droprate = 1000 },
        },

        {
            { itemid = xi.items.VIAL_OF_MERCURY, droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.GOLD_BEASTCOIN, droprate = 500 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.RAIFU, droprate = 250 },
            { itemid = xi.items.BUZZARD_TUCK, droprate = 250 },
            { itemid = xi.items.JONGLEURS_DAGGER, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.REARGUARD_MANTLE, droprate = 400 },
            { itemid = xi.items.AGILE_MANTLE, droprate = 400 },
        },

        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 125 },
        },
    },

    -- BCNM Idol Thoughts
    [526] =
    {
        {
            { itemid = xi.items.GOLEM_SHARD, droprate = 1000 },
        },

        {
            { itemid = xi.items.SLAB_OF_GRANITE, droprate = 1000 },
        },

        {
            { itemid = xi.items.LIBATION_ABJURATION, droprate = 500 },
            { itemid = xi.items.OBLATION_ABJURATION, droprate = 500 },
        },

        {
            { itemid = xi.items.NONE, droprate = 875 },
            { itemid = xi.items.LIBATION_ABJURATION, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.OPTICAL_NEEDLE, droprate = 200 },
            { itemid = xi.items.KAKANPU, droprate = 200 },
            { itemid = xi.items.MANTRA_COIN, droprate = 200 },
            { itemid = xi.items.NAZAR_BONJUK, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate = 300 },
            { itemid = xi.items.GOLD_INGOT, droprate = 300 },
            { itemid = xi.items.PLATINUM_INGOT, droprate = 300 },
        },
    },

    -- BCNM An Awful Autopsy
    [527] =
    {
        {
            { itemid = xi.items.UNDEAD_SKIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.RIVAL_RIBBON, droprate = 250 },
            { itemid = xi.items.SUPER_RIBBON, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.IVORY_MITTS, droprate = 250 },
            { itemid = xi.items.RUSH_GLOVES, droprate = 250 },
            { itemid = xi.items.SLY_GAUNTLETS, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.HEAVY_MANTLE, droprate = 200 },
            { itemid = xi.items.ESOTERIC_MANTLE, droprate = 200 },
            { itemid = xi.items.SNIPERS_MANTLE, droprate = 200 },
            { itemid = xi.items.TEMPLARS_MANTLE, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.HATEFUL_COLLAR, droprate = 200 },
            { itemid = xi.items.STORM_GORGET, droprate = 200 },
            { itemid = xi.items.INTELLECT_TORQUE, droprate = 200 },
            { itemid = xi.items.BENIGN_NECKLACE, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 200 },
            { itemid = xi.items.EBONY_LOG, droprate = 200 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 200 },
            { itemid = xi.items.GOLD_INGOT, droprate = 200 },
        },

        {
            { itemid = xi.items.NONE, droprate = 875 },
            { itemid = xi.items.SCROLL_OF_QUAKE, droprate = 125 },
        },
    },

    -- BCNM Celery
    [528] =
    {
        {
            { itemid = xi.items.LIBATION_ABJURATION, droprate = 1000 },
        },

        {
            { itemid = xi.items.OBLATION_ABJURATION, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_SILK_CLOTH, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_SILK_CLOTH, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_SILK_CLOTH, droprate = 1000 },
        },

        {
            { itemid = xi.items.TELEPORT_RING_DEM, droprate = 250 },
            { itemid = xi.items.TELEPORT_RING_MEA, droprate = 250 },
            { itemid = xi.items.NURSEMAIDS_HARP, droprate = 250 },
            { itemid = xi.items.TRAILERS_KUKRI, droprate = 250 },
        },

        {
            { itemid = xi.items.ELUSIVE_EARRING, droprate = 250 },
            { itemid = xi.items.KNIGHTLY_MANTLE, droprate = 250 },
            { itemid = xi.items.HI_ETHER_TANK, droprate = 250 },
            { itemid = xi.items.HI_POTION_TANK, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 950 },
            { itemid = xi.items.WALKURE_MASK, droprate =  50 },
        },

        {
            { itemid = xi.items.AQUAMARINE, droprate =  50 },
            { itemid = xi.items.CHRYSOBERYL, droprate =  50 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 100 },
            { itemid = xi.items.EBONY_LOG, droprate =  50 },
            { itemid = xi.items.FLUORITE, droprate =  50 },
            { itemid = xi.items.GOLD_INGOT, droprate =  50 },
            { itemid = xi.items.HI_RERAISER, droprate =  50 },
            { itemid = xi.items.JADEITE, droprate =  50 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  50 },
            { itemid = xi.items.MOONSTONE, droprate =  50 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate =  50 },
            { itemid = xi.items.PAINITE, droprate =  50 },
            { itemid = xi.items.RED_ROCK, droprate =  50 },
            { itemid = xi.items.STEEL_INGOT, droprate =  50 },
            { itemid = xi.items.SUNSTONE, droprate =  50 },
            { itemid = xi.items.TRANSLUCENT_ROCK, droprate =  50 },
            { itemid = xi.items.WHITE_ROCK, droprate =  50 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  50 },
            { itemid = xi.items.ZIRCON, droprate =  50 },
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
