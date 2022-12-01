-----------------------------------
-- Area: Horlais Peak
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/items")
require("scripts/globals/bcnm")
-----------------------------------
local entity = {}

local loot =
{
    -- BCNM Tails of Woe
    [1] =
    {
        {
            { itemid = xi.items.BLITZ_RING, droprate = 150 },
            { itemid =     xi.items.NONE, droprate = 850 },
        },

        {
            { itemid = xi.items.AEGIS_RING, droprate = 300 },
            { itemid = xi.items.TUNDRA_MANTLE, droprate = 200 },
            { itemid = xi.items.DRUIDS_ROPE, droprate = 200 },
            { itemid =     xi.items.NONE, droprate = 300 },
        },

        {
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 145 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 165 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 140 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 123 },
            { itemid =  xi.items.PERIDOT, droprate =  94 },
            { itemid =  xi.items.PEARL, droprate =  94 },
            { itemid =  xi.items.GREEN_ROCK, droprate =  13 },
            { itemid =  xi.items.AMETRINE, droprate =  53 },
            { itemid =  xi.items.GOLD_BEASTCOIN, droprate =  70 },
            { itemid =  xi.items.MYTHRIL_BEASTCOIN, droprate =  50 },
            { itemid =  xi.items.YELLOW_ROCK, droprate =  53 },
            { itemid =    xi.items.NONE, droprate =   0 },
        },

        {
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 110 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 104 },
            { itemid =  xi.items.PERIDOT, droprate =  94 },
            { itemid =  xi.items.PEARL, droprate =  94 },
            { itemid =  xi.items.GREEN_ROCK, droprate =  53 },
            { itemid =  xi.items.AMETRINE, droprate =  73 },
            { itemid =  xi.items.GOLD_BEASTCOIN, droprate =  70 },
            { itemid =  xi.items.MYTHRIL_BEASTCOIN, droprate =  70 },
            { itemid =  xi.items.YELLOW_ROCK, droprate =  73 },
            { itemid =    xi.items.NONE, droprate =  94 },
        },

        {
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 174 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  16 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 114 },
            { itemid = xi.items.SCROLL_OF_REFRESH, droprate = 174 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 138 },
            { itemid = xi.items.GREEN_ROCK,  droprate =  18 },
            { itemid = xi.items.BLACK_ROCK,  droprate =  18 },
            { itemid = xi.items.BLUE_ROCK,  droprate =  17 },
            { itemid = xi.items.RED_ROCK,  droprate =  16 },
            { itemid = xi.items.PURPLE_ROCK,  droprate =  16 },
            { itemid = xi.items.WHITE_ROCK,  droprate =  16 },
            { itemid = xi.items.YELLOW_ROCK,  droprate =  17 },
            { itemid = xi.items.TRANSLUCENT_ROCK,  droprate =  17 },
            { itemid = xi.items.RERAISER, droprate =  21 },
            { itemid = xi.items.OAK_LOG,  droprate =  22 },
            { itemid = xi.items.ROSEWOOD_LOG,  droprate =  18 },
            { itemid = xi.items.GOLD_BEASTCOIN,  droprate = 120 },
            { itemid = xi.items.MYTHRIL_BEASTCOIN,  droprate = 102 },
            { itemid = xi.items.PEARL,  droprate =  21 },
            { itemid = xi.items.TURQUOISE,  droprate =  23 },
            { itemid = xi.items.GOSHENITE,  droprate =  19 },
            { itemid = xi.items.BLACK_PEARL,  droprate =  18 },
            { itemid = xi.items.SPHENE,  droprate =  17 },
            { itemid = xi.items.GARNET,  droprate =  20 },
            { itemid = xi.items.AMETRINE,  droprate =  18 },
            { itemid = xi.items.NONE,    droprate =   0 },
        },

        {
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 87 },
            { itemid = xi.items.SCROLL_OF_REFRESH, droprate = 75 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 75 },
            { itemid =  xi.items.OAK_LOG, droprate = 80 },
            { itemid =  xi.items.ROSEWOOD_LOG, droprate = 97 },
            { itemid =  xi.items.PEARL, droprate = 86 },
            { itemid =  xi.items.TURQUOISE, droprate = 88 },
            { itemid =  xi.items.GOSHENITE, droprate = 79 },
            { itemid =  xi.items.BLACK_PEARL, droprate = 93 },
            { itemid =  xi.items.SPHENE, droprate = 79 },
            { itemid =  xi.items.GARNET, droprate = 71 },
            { itemid =  xi.items.AMETRINE, droprate = 90 },
            { itemid =    xi.items.NONE, droprate =  0 },
        },
    },

    -- BCNM Dismemberment Brigade
    [2] =
    {
        {
            { itemid = xi.items.KABRAKANS_AXE, droprate = 250 },
            { itemid = xi.items.SARNGA, droprate = 250 },
            { itemid = xi.items.DRAGVANDIL, droprate = 250 },
            { itemid = xi.items.HAMELIN_FLUTE, droprate = 250 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 400 },
            { itemid = xi.items.SPECTACLES, droprate = 200 },
            { itemid = xi.items.ASSAULT_EARRING, droprate = 200 },
            { itemid = xi.items.PEACE_RING, droprate = 200 },
        },

        {
            { itemid =   xi.items.NONE, droprate = 200 },
            { itemid = xi.items.TRANSLUCENT_ROCK, droprate = 200 },
            { itemid = xi.items.GREEN_ROCK, droprate = 200 },
            { itemid = xi.items.YELLOW_ROCK, droprate = 200 },
            { itemid = xi.items.PURPLE_ROCK, droprate = 200 },
        },

        {
            { itemid = xi.items.PAINITE, droprate = 100 },
            { itemid = xi.items.JADEITE, droprate = 100 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate = 100 },
            { itemid = xi.items.STEEL_INGOT, droprate = 100 },
            { itemid = xi.items.FLUORITE, droprate = 100 },
            { itemid = xi.items.GOLD_INGOT, droprate = 100 },
            { itemid = xi.items.ZIRCON, droprate = 100 },
            { itemid = xi.items.CHRYSOBERYL, droprate = 100 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 100 },
            { itemid = xi.items.MOONSTONE, droprate = 100 },
        },

        {
            { itemid =    xi.items.NONE, droprate =  900 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  100 },
        },
    },

    -- BCNM Hostile Herbivores
    [4] =
    {
        {
            { itemid =     xi.items.NONE, droprate = 50 },
            { itemid = xi.items.OCEAN_BELT, droprate = 95 },
            { itemid = xi.items.JUNGLE_BELT, droprate = 95 },
            { itemid = xi.items.STEPPE_BELT, droprate = 95 },
            { itemid = xi.items.DESERT_BELT, droprate = 95 },
            { itemid = xi.items.FOREST_BELT, droprate = 95 },
            { itemid = xi.items.OCEAN_STONE, droprate = 95 },
            { itemid = xi.items.JUNGLE_STONE, droprate = 95 },
            { itemid = xi.items.STEPPE_STONE, droprate = 95 },
            { itemid = xi.items.DESERT_STONE, droprate = 95 },
            { itemid = xi.items.FOREST_STONE, droprate = 95 },
        },

        {
            { itemid = xi.items.GUARDIANS_RING, droprate = 64 },
            { itemid = xi.items.KAMPFER_RING, droprate = 65 },
            { itemid = xi.items.CONJURERS_RING, droprate = 65 },
            { itemid = xi.items.SHINOBI_RING, droprate = 65 },
            { itemid = xi.items.SLAYERS_RING, droprate = 65 },
            { itemid = xi.items.SORCERERS_RING, droprate = 65 },
            { itemid = xi.items.SOLDIERS_RING, droprate = 64 },
            { itemid = xi.items.TAMERS_RING, droprate = 65 },
            { itemid = xi.items.TRACKERS_RING, droprate = 64 },
            { itemid = xi.items.DRAKE_RING, droprate = 65 },
            { itemid = xi.items.FENCERS_RING, droprate = 65 },
            { itemid = xi.items.MINSTRELS_RING, droprate = 65 },
            { itemid = xi.items.MEDICINE_RING, droprate = 64 },
            { itemid = xi.items.ROGUES_RING, droprate = 65 },
            { itemid = xi.items.RONIN_RING, droprate = 64 },
            { itemid = xi.items.PLATINUM_RING, droprate = 30 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_QUAKE, droprate = 176 },
            { itemid = xi.items.LIGHT_SPIRIT_PACT, droprate =  10 },
            { itemid = xi.items.SCROLL_OF_FREEZE, droprate = 176 },
            { itemid = xi.items.SCROLL_OF_REGEN_III, droprate = 176 },
            { itemid = xi.items.RERAISER, droprate =  60 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  60 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 176 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_QUAKE, droprate = 176 },
            { itemid = xi.items.LIGHT_SPIRIT_PACT, droprate =  10 },
            { itemid = xi.items.SCROLL_OF_FREEZE, droprate = 176 },
            { itemid = xi.items.SCROLL_OF_REGEN_III, droprate = 176 },
            { itemid = xi.items.RERAISER, droprate =  60 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  60 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 176 },
        },

        {
            { itemid =  xi.items.RAM_HORN, droprate =  59 },
            { itemid =  xi.items.MAHOGANY_LOG, droprate =  59 },
            { itemid =  xi.items.MYTHRIL_INGOT, droprate = 200 },
            { itemid = xi.items.MANTICORE_HIDE, droprate =  59 },
            { itemid =  xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  90 },
            { itemid = xi.items.WYVERN_SKIN, droprate =  90 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate = 176 },
            { itemid =  xi.items.DARKSTEEL_INGOT, droprate =  59 },
            { itemid =  xi.items.RAM_SKIN, droprate =  59 },
            { itemid =  xi.items.PLATINUM_INGOT, droprate =  90 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid =  xi.items.RAM_HORN, droprate =  59 },
            { itemid =  xi.items.MAHOGANY_LOG, droprate =  59 },
            { itemid =  xi.items.MYTHRIL_INGOT, droprate = 200 },
            { itemid = xi.items.MANTICORE_HIDE, droprate =  59 },
            { itemid =  xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  90 },
            { itemid = xi.items.WYVERN_SKIN, droprate =  90 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate = 176 },
            { itemid =  xi.items.DARKSTEEL_INGOT, droprate =  59 },
            { itemid =  xi.items.RAM_SKIN, droprate =  59 },
            { itemid =  xi.items.PLATINUM_INGOT, droprate =  90 },
        },
    },

    -- BCNM Carapace Combatants
    [8] =
    {
        {
            { itemid = xi.items.BEETLE_JAW, droprate = 1000 },
        },

        {
            { itemid = xi.items.BEETLE_SHELL, droprate = 1000 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 250 },
            { itemid = xi.items.KATANA_OBI, droprate = 150 },
            { itemid = xi.items.STAFF_BELT, droprate = 150 },
            { itemid = xi.items.SONG_BELT, droprate = 150 },
            { itemid = xi.items.CESTUS_BELT, droprate = 150 },
            { itemid = xi.items.PICK_BELT, droprate = 150 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 125 },
            { itemid = xi.items.ASHIGARU_EARRING, droprate = 125 },
            { itemid = xi.items.MAGICIANS_EARRING, droprate = 125 },
            { itemid = xi.items.PILFERERS_EARRING, droprate = 125 },
            { itemid = xi.items.WARLOCKS_EARRING, droprate = 125 },
            { itemid = xi.items.WRESTLERS_EARRING, droprate = 125 },
            { itemid = xi.items.WYVERN_EARRING, droprate = 125 },
            { itemid = xi.items.KILLER_EARRING, droprate = 125 },
        },

        {
            { itemid =   xi.items.NONE, droprate = 160 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate = 140 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate = 140 },
            { itemid = xi.items.SILVER_INGOT, droprate = 140 },
            { itemid = xi.items.STEEL_INGOT, droprate = 140 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate = 140 },
            { itemid = xi.items.SARDONYX, droprate = 140 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 250 },
            { itemid = xi.items.SCROLL_OF_DISPEL, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_FIRE_II, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_MAGIC_FINALE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ABSORB_AGI, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ABSORB_INT, droprate = 125 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 500 },
            { itemid = xi.items.JUG_OF_SCARLET_SAP, droprate = 500 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 750 },
            { itemid = xi.items.JUG_OF_SCARLET_SAP, droprate = 250 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 900 },
            { itemid = xi.items.HI_ETHER, droprate = 100 },
        },
    },

    -- BCNM Shooting Fish
    [9] =
    {
        {
            { itemid = xi.items.MANNEQUIN_HEAD, droprate = 1000 },
        },

        {
            { itemid = xi.items.SHALL_SHELL, droprate = 1000 },
        },

        {
            { itemid =   xi.items.MYTHRIL_BEASTCOIN, droprate = 300 },
            { itemid =   xi.items.BLACK_ROCK, droprate =  70 },
            { itemid =   xi.items.PURPLE_ROCK, droprate =  30 },
            { itemid =   xi.items.WHITE_ROCK, droprate = 100 },
            { itemid = xi.items.PLATOON_BOW, droprate = 100 },
            { itemid = xi.items.PLATOON_MACE, droprate = 100 },
            { itemid = xi.items.PLATOON_DISC, droprate = 150 },
            { itemid = xi.items.PLATOON_GUN, droprate = 150 },
        },

        {
            { itemid =   xi.items.MYTHRIL_BEASTCOIN, droprate = 310 },
            { itemid =   xi.items.GREEN_ROCK, droprate =  50 },
            { itemid =   xi.items.YELLOW_ROCK, droprate =  40 },
            { itemid =   xi.items.BLUE_ROCK, droprate =  40 },
            { itemid =   xi.items.RED_ROCK, droprate =  40 },
            { itemid =   xi.items.TRANSLUCENT_ROCK, droprate = 110 },
            { itemid = xi.items.PLATOON_CESTI, droprate = 130 },
            { itemid = xi.items.PLATOON_CUTTER, droprate = 100 },
            { itemid = xi.items.PLATOON_SPATHA, droprate =  80 },
            { itemid = xi.items.PLATOON_ZAGHNAL, droprate = 100 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 670 },
            { itemid =  xi.items.HANDFUL_OF_PUGIL_SCALES, droprate = 190 },
            { itemid = xi.items.SHALL_SHELL, droprate = 140 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 930 },
            { itemid = xi.items.MANNEQUIN_BODY, droprate =  70 },
        },

        {
            { itemid = xi.items.SCROLL_OF_BLAZE_SPIKES, droprate = 180 },
            { itemid = xi.items.SCROLL_OF_HORDE_LULLABY, droprate = 510 },
            { itemid = xi.items.THUNDER_SPIRIT_PACT, droprate = 280 },
            { itemid = xi.items.SCROLL_OF_WARP, droprate =  30 },
        },
    },

    -- BCNM Dropping Like Flies
    [10] =
    {
        {
            { itemid = xi.items.GIL, droprate = 1000, amount = 4000 },
        },

        {
            { itemid = xi.items.INSECT_WING, droprate = 1000 },
        },

        {
            { itemid = xi.items.MANNEQUIN_HEAD, droprate = 1000 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 636 },
            { itemid = xi.items.EMPEROR_HAIRPIN, droprate = 364 },
        },

        {
            { itemid = xi.items.ASHIGARU_TARGE, droprate = 175 },
            { itemid = xi.items.BEATERS_SHIELD, droprate = 175 },
            { itemid = xi.items.VARLETS_SHIELD, droprate = 175 },
            { itemid = xi.items.WRESTLERS_SHIELD, droprate = 175 },
            { itemid =   xi.items.CLEAR_TOPAZ, droprate = 100 },
            { itemid =   xi.items.LAPIS_LAZULI, droprate = 100 },
            { itemid =   xi.items.LIGHT_OPAL, droprate = 100 },
        },

        {
            { itemid = xi.items.MERCENARY_MANTLE, droprate = 250 },
            { itemid = xi.items.SINGERS_MANTLE, droprate = 250 },
            { itemid = xi.items.WIZARDS_MANTLE, droprate = 250 },
            { itemid = xi.items.WYVERN_MANTLE, droprate = 250 },
        },

        {
            { itemid =  xi.items.SCROLL_OF_UTSUSEMI_NI, droprate =  70 },
            { itemid =  xi.items.SCROLL_OF_MAGIC_FINALE, droprate =  70 },
            { itemid = xi.items.JUG_OF_QUADAV_BUG_BROTH, droprate = 150 },
            { itemid =   xi.items.ONYX, droprate = 100 },
            { itemid =   xi.items.LAPIS_LAZULI, droprate = 100 },
            { itemid =   xi.items.LIGHT_OPAL, droprate = 100 },
            { itemid =  xi.items.SCROLL_OF_DISPEL, droprate = 150 },
            { itemid =  xi.items.SCROLL_OF_ERASE, droprate = 100 },
            { itemid =   xi.items.ELM_LOG, droprate =  90 },
            { itemid =  xi.items.MANNEQUIN_BODY, droprate =  70 },
        },
    },

    -- KSNM Horns of War
    [11] =
    {
        {
            { itemid =  xi.items.LIBATION_ABJURATION, droprate = 158 },
            { itemid = xi.items.KRIEGSBEIL, droprate = 263 },
            { itemid = xi.items.SHINSOKU, droprate =  92 },
            { itemid = xi.items.NOKIZARU_SHURIKEN, droprate =  79 },
            { itemid = xi.items.GUESPIERE, droprate =  66 },
            { itemid = xi.items.PURGATORY_MACE, droprate = 105 },
            { itemid = xi.items.METEOR_CESTI, droprate = 237 },
        },

        {
            { itemid =  xi.items.OBLATION_ABJURATION, droprate = 169 },
            { itemid = xi.items.UNSHO, droprate =  12 },
            { itemid = xi.items.HARLEQUINS_HORN, droprate = 235 },
            { itemid = xi.items.DREIZACK, droprate =  77 },
            { itemid = xi.items.GAWAINS_AXE, droprate = 248 },
            { itemid = xi.items.ZEN_POLE, droprate = 195 },
            { itemid = xi.items.BAYARDS_SWORD, droprate =  64 },

        },

        {
            { itemid =  xi.items.PETRIFIED_LOG, droprate = 556 },
            { itemid = xi.items.LACQUER_TREE_LOG, droprate = 289 },
            { itemid =  xi.items.SQUARE_OF_SHINING_CLOTH, droprate =  25 },
            { itemid =  xi.items.DIVINE_LOG, droprate = 130 },
        },

        {
            { itemid =   xi.items.BEHEMOTH_HIDE, droprate = 572 },
            { itemid =   xi.items.BEHEMOTH_HORN, droprate = 428 },
            { itemid = xi.items.HEALING_STAFF, droprate =  53 },
        },

        {
            { itemid =  xi.items.DEMON_HORN, droprate =  86 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate =  47 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate =  47 },
            { itemid =  xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate =   7 },
            { itemid = xi.items.HI_RERAISER, droprate =  99 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate = 179 },
            { itemid =  xi.items.PHILOSOPHERS_STONE, droprate = 113 },
            { itemid =  xi.items.CHUNK_OF_GOLD_ORE, droprate =  47 },
            { itemid =  xi.items.CHUNK_OF_MYTHRIL_ORE, droprate =  60 },
            { itemid =  xi.items.CORAL_FRAGMENT, droprate =  47 },
            { itemid =  xi.items.MAHOGANY_LOG, droprate =  60 },
            { itemid =  xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  20 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  20 },
            { itemid =  xi.items.RAM_HORN, droprate =  47 },
            { itemid =  xi.items.EBONY_LOG, droprate =  73 },
            { itemid = xi.items.RERAISER, droprate =   7 },
            { itemid =  xi.items.CHUNK_OF_PLATINUM_ORE, droprate =  20 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  20 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =   1 },
        },

        {
            { itemid = xi.items.BEHEMOTH_TONGUE, droprate = 199 },
            { itemid =  xi.items.BEHEMOTH_HORN, droprate = 318 },
            { itemid = xi.items.STRENGTH_POTION, droprate = 147 },
            { itemid = xi.items.DEXTERITY_POTION, droprate =  68 },
            { itemid = xi.items.AGILITY_POTION, droprate = 134 },
            { itemid = xi.items.VITALITY_POTION, droprate = 134 },
        },

        {
            { itemid =  xi.items.MIND_POTION, droprate = 172 },
            { itemid =  xi.items.INTELLIGENCE_POTION, droprate =  80 },
            { itemid =  xi.items.CHARISMA_POTION, droprate = 106 },
            { itemid =  xi.items.ICARUS_WING, droprate = 172 },
            { itemid = xi.items.ANGEL_LYRE, droprate = 239 },
            { itemid =   xi.items.EMERALD, droprate = 107 },
            { itemid =   xi.items.SPINEL, droprate =  41 },
            { itemid =   xi.items.RUBY, droprate =  55 },
            { itemid =   xi.items.DIAMOND, droprate =  28 },
        },

        {
            { itemid = xi.items.HI_ETHER_P3, droprate = 289 },
            { itemid = xi.items.HI_POTION_P3, droprate = 237 },
            { itemid = xi.items.HI_RERAISER, droprate = 198 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate = 276 },
        },

        {
            { itemid =  xi.items.CORAL_FRAGMENT, droprate = 123 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate =   5 },
            { itemid =  xi.items.DEMON_HORN, droprate =  98 },
            { itemid =  xi.items.CHUNK_OF_GOLD_ORE, droprate =  18 },
            { itemid =  xi.items.CHUNK_OF_MYTHRIL_ORE, droprate =  71 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  44 },
            { itemid =  xi.items.RAM_HORN, droprate =  19 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate = 280 },
            { itemid =  xi.items.CHUNK_OF_PLATINUM_ORE, droprate =   5 },
            { itemid =  xi.items.MAHOGANY_LOG, droprate =  45 },
            { itemid =  xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  58 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  31 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  30 },
            { itemid =  xi.items.EBONY_LOG, droprate =  30 },
            { itemid = xi.items.HI_RERAISER, droprate =  30 },
            { itemid =  xi.items.SPOOL_OF_GOLD_THREAD, droprate =  96 },
            { itemid =  xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate =  17 },
        },

        {
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 114 },
            { itemid =  xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  50 },
            { itemid =  xi.items.PHILOSOPHERS_STONE, droprate = 220 },
            { itemid =  xi.items.PHOENIX_FEATHER, droprate = 404 },
            { itemid =  xi.items.SQUARE_OF_DAMASCENE_CLOTH, droprate =  62 },
            { itemid =  xi.items.DAMASCUS_INGOT, droprate =  49 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate = 101 },
        },
    },

    -- BCNM Under Observation
    [12] =
    {
        {
            { itemid =     xi.items.NONE, droprate = 910 },
            { itemid = xi.items.PEACOCK_CHARM, droprate =  90 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 467 },
            { itemid = xi.items.BEHOURD_LANCE, droprate =  48 },
            { itemid = xi.items.MUTILATOR, droprate =  61 },
            { itemid = xi.items.RAIFU, droprate =  46 },
            { itemid = xi.items.TILT_BELT, droprate = 302 },
            { itemid = xi.items.TOURNEY_PATAS, droprate =  76 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 413 },
            { itemid = xi.items.BUZZARD_TUCK, droprate =  42 },
            { itemid = xi.items.DE_SAINTRES_AXE, droprate =  77 },
            { itemid = xi.items.GRUDGE_SWORD, droprate =  73 },
            { itemid = xi.items.MANTRA_BELT, droprate = 258 },
            { itemid =  xi.items.SCROLL_OF_REFRESH, droprate =  68 },
            { itemid =  xi.items.SCROLL_OF_UTSUSEMI_NI, droprate =  55 },
            { itemid =  xi.items.SCROLL_OF_ICE_SPIKES, droprate =  14 },
        },

        {
            { itemid = xi.items.SCROLL_OF_ICE_SPIKES, droprate = 114 },
            { itemid = xi.items.SCROLL_OF_REFRESH, droprate = 174 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI, droprate = 138 },
            { itemid =  xi.items.RED_ROCK, droprate =  16 },
            { itemid =  xi.items.BLUE_ROCK, droprate =  17 },
            { itemid =  xi.items.YELLOW_ROCK, droprate =  17 },
            { itemid =  xi.items.GREEN_ROCK, droprate =  18 },
            { itemid =  xi.items.TRANSLUCENT_ROCK, droprate =  17 },
            { itemid =  xi.items.PURPLE_ROCK, droprate =  16 },
            { itemid =  xi.items.BLACK_ROCK, droprate =  18 },
            { itemid =  xi.items.WHITE_ROCK, droprate =  16 },
            { itemid =  xi.items.MYTHRIL_BEASTCOIN, droprate = 102 },
            { itemid =  xi.items.GOLD_BEASTCOIN, droprate = 120 },
            { itemid =  xi.items.OAK_LOG, droprate =  22 },
            { itemid =  xi.items.AMETRINE, droprate =  18 },
            { itemid =  xi.items.BLACK_PEARL, droprate =  18 },
            { itemid =  xi.items.GARNET, droprate =  20 },
            { itemid =  xi.items.GOSHENITE, droprate =  19 },
            { itemid =  xi.items.PEARL, droprate =  21 },
            { itemid =  xi.items.PERIDOT, droprate =  35 },
            { itemid =  xi.items.SPHENE, droprate =  17 },
            { itemid =  xi.items.TURQUOISE, droprate =  23 },
            { itemid = xi.items.RERAISER, droprate =  21 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  16 },
        },

        {
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 116 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 113 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 137 },
            { itemid = xi.items.SCROLL_OF_ICE_SPIKES, droprate =  67 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate =  99 },
            { itemid =  xi.items.AMETRINE, droprate =  58 },
            { itemid =  xi.items.BLACK_PEARL, droprate =  52 },
            { itemid =  xi.items.GARNET, droprate =  51 },
            { itemid =  xi.items.GOSHENITE, droprate =  65 },
            { itemid =  xi.items.PEARL, droprate =  61 },
            { itemid =  xi.items.PERIDOT, droprate =  63 },
            { itemid =  xi.items.SPHENE, droprate =  55 },
            { itemid =  xi.items.TURQUOISE, droprate =  62 },
        },

        {
            { itemid = xi.items.HECTEYES_EYE, droprate = 1000 },
        },

        {
            { itemid = xi.items.VIAL_OF_MERCURY, droprate = 1000 },
        },
    },

    -- BCNM Eye of the Tiger
    [13] =
    {
        {
            { itemid = xi.items.BLACK_TIGER_FANG, droprate = 1000 },
        },

        {
            { itemid = xi.items.BLACK_TIGER_FANG, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 700 },
            { itemid = xi.items.NUE_FANG, droprate = 300 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 125 },
            { itemid = xi.items.IVORY_MITTS, droprate = 125 },
            { itemid = xi.items.SUPER_RIBBON, droprate = 125 },
            { itemid = xi.items.MANA_CIRCLET, droprate = 125 },
            { itemid = xi.items.RIVAL_RIBBON, droprate = 125 },
            { itemid = xi.items.SLY_GAUNTLETS, droprate = 125 },
            { itemid = xi.items.SHOCK_MASK, droprate = 125 },
            { itemid = xi.items.SPIKED_FINGER_GAUNTLETS, droprate = 125 },
        },

        {
            { itemid = xi.items.INTELLECT_TORQUE, droprate = 125 },
            { itemid = xi.items.ESOTERIC_MANTLE, droprate = 125 },
            { itemid = xi.items.TEMPLARS_MANTLE, droprate = 125 },
            { itemid = xi.items.SNIPERS_MANTLE, droprate = 125 },
            { itemid = xi.items.HATEFUL_COLLAR, droprate = 125 },
            { itemid = xi.items.STORM_GORGET, droprate = 125 },
            { itemid = xi.items.HEAVY_MANTLE, droprate = 125 },
            { itemid = xi.items.BENIGN_NECKLACE, droprate = 125 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 125 },
            { itemid =  xi.items.GOLD_INGOT, droprate = 125 },
            { itemid =  xi.items.RAM_HORN, droprate = 125 },
            { itemid = xi.items.WYVERN_SKIN, droprate = 125 },
            { itemid =  xi.items.EBONY_LOG, droprate = 125 },
            { itemid =  xi.items.MYTHRIL_INGOT, droprate = 125 },
            { itemid =  xi.items.RAM_SKIN, droprate = 125 },
            { itemid =  xi.items.CORAL_FRAGMENT, droprate = 125 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 400 },
            { itemid = xi.items.SLICE_OF_BUFFALO_MEAT, droprate = 200 },
            { itemid = xi.items.SLICE_OF_DRAGON_MEAT, droprate = 200 },
            { itemid = xi.items.SLICE_OF_COEURL_MEAT, droprate = 200 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 625 },
            { itemid = xi.items.SCROLL_OF_FREEZE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_QUAKE, droprate = 125 },
        },
    },

    -- BCNM Shots in the Dark
    [14] =
    {
        {
            { itemid = xi.items.GOLD_BEASTCOIN, droprate = 500 },
            { itemid = xi.items.MYTHRIL_BEASTCOIN, droprate = 500 },
        },

        {
            { itemid = xi.items.STEEL_INGOT, droprate = 500 },
            { itemid = xi.items.AQUAMARINE, droprate = 500 },
        },

        {
            { itemid =     xi.items.NONE, droprate =  200 },
            { itemid = xi.items.TELEPORT_RING_HOLLA, droprate =  400 },
            { itemid = xi.items.TELEPORT_RING_VAHZL, droprate =  400 },
        },

        {
            { itemid = xi.items.SAPIENT_CAPE, droprate =  250 },
            { itemid = xi.items.TRAINERS_WRISTBANDS, droprate =  250 },
            { itemid =  xi.items.DEMON_QUIVER, droprate =  500 },
        },
    },

    -- KSNM Double Dragonian
    [15] =
    {
        {
            { itemid = xi.items.SUBDUER, droprate = 222 },
            { itemid = xi.items.DISSECTOR, droprate = 302 },
            { itemid = xi.items.DESTROYERS, droprate = 245 },
            { itemid = xi.items.HEART_SNATCHER, droprate = 208 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 638 },
            { itemid = xi.items.VIAL_OF_DRAGON_BLOOD, droprate =  10 },
            { itemid = xi.items.DRAGON_HEART, droprate = 176 },
            { itemid = xi.items.SLICE_OF_DRAGON_MEAT, droprate = 176 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 638 },
            { itemid = xi.items.VIAL_OF_DRAGON_BLOOD, droprate =  10 },
            { itemid = xi.items.DRAGON_HEART, droprate = 176 },
            { itemid = xi.items.SLICE_OF_DRAGON_MEAT, droprate = 176 },
        },

        {
            { itemid =     xi.items.NONE, droprate = 392 },
            { itemid = xi.items.SPEAR_STRAP, droprate = 354 },
            { itemid = xi.items.SWORD_STRAP, droprate = 165 },
            { itemid = xi.items.POLE_GRIP,   droprate =  89 },
        },

        {
            { itemid = xi.items.MINUET_EARRING, droprate = 586 },
            { itemid =   xi.items.ADAMAN_INGOT, droprate = 184 },
            { itemid =   xi.items.ORICHALCUM_INGOT, droprate = 207 },
        },

        {
            { itemid = xi.items.SORROWFUL_HARP, droprate = 238 },
            { itemid = xi.items.ATTILAS_EARRING, droprate = 250 },
            { itemid = xi.items.DURANDAL, droprate = 225 },
            { itemid = xi.items.HOPLITES_HARP, droprate = 275 },
        },

        {
            { itemid =  xi.items.CHUNK_OF_GOLD_ORE, droprate = 122 },
            { itemid = xi.items.RERAISER, droprate =  54 },
            { itemid =  xi.items.CHUNK_OF_MYTHRIL_ORE, droprate =  41 },
            { itemid =  xi.items.DEMON_HORN, droprate =  81 },
            { itemid =  xi.items.EBONY_LOG, droprate = 149 },
            { itemid =  xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  54 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  27 },
            { itemid =  xi.items.MAHOGANY_LOG, droprate =  41 },
            { itemid =  xi.items.CORAL_FRAGMENT, droprate =  95 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate = 108 },
            { itemid =  xi.items.PHOENIX_FEATHER, droprate = 135 },
            { itemid =  xi.items.CHUNK_OF_PLATINUM_ORE, droprate =  54 },
            { itemid =  xi.items.RAM_HORN, droprate =  14 },
            { itemid =  xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate =  14 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  68 },
            { itemid = xi.items.HI_RERAISER, droprate =  14 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 135 },
        },

        {
            { itemid =  xi.items.SQUARE_OF_DAMASCENE_CLOTH, droprate =  96 },
            { itemid =  xi.items.DAMASCUS_INGOT, droprate =  27 },
            { itemid =  xi.items.PHILOSOPHERS_STONE, droprate = 164 },
            { itemid =  xi.items.PHOENIX_FEATHER, droprate = 260 },
            { itemid =  xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  96 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 288 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  41 },
        },
    },

    -- KSNM Today's Horoscope
    [16] =
    {
        {
            { itemid = xi.items.GIL, droprate = 1000, amount = 24000 },
        },
        {
            { itemid = xi.items.GRAVEDIGGER, droprate = 222 },
            { itemid = xi.items.GONDO_SHIZUNORI, droprate = 302 },
            { itemid = xi.items.RAMPAGER, droprate = 245 },
            { itemid = xi.items.RETRIBUTOR, droprate = 231 },
        },
        {
            { itemid = xi.items.HIERARCH_BELT, droprate = 250 },
            { itemid = xi.items.WARWOLF_BELT, droprate = 338 },
            { itemid = xi.items.PALMERINS_SHIELD, droprate = 206 },
            { itemid = xi.items.TRAINERS_GLOVES, droprate = 206 },
        },
        {
            { itemid = xi.items.NONE, droprate = 342 },
            { itemid = xi.items.ARIES_MANTLE, droprate = 250 },
            { itemid = xi.items.ADAMAN_INGOT, droprate = 230 },
            { itemid = xi.items.ORICHALCUM_INGOT, droprate = 178 },
        },
        {
            { itemid = xi.items.RAMPAGING_HORN, droprate = 292 },
            { itemid = xi.items.LUMBERING_HORN, droprate = 265 },
            { itemid = xi.items.SWORD_STRAP, droprate = 354 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate = 89 },
        },
        {
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate = 109 },
            { itemid = xi.items.RERAISER, droprate = 34 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate = 41 },
            { itemid = xi.items.DEMON_HORN, droprate = 61 },
            { itemid = xi.items.EBONY_LOG, droprate = 121 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES, droprate = 44 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate = 27 },
            { itemid = xi.items.MAHOGANY_LOG, droprate = 41 },
            { itemid = xi.items.CORAL_FRAGMENT, droprate = 80 },
            { itemid = xi.items.PETRIFIED_LOG, droprate = 72 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 111 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate = 44 },
            { itemid = xi.items.RAM_HORN, droprate = 14 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate = 14 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate = 68 },
            { itemid = xi.items.HI_RERAISER, droprate = 14 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 105 },
        },
        {
            { itemid = xi.items.NONE, droprate = 150 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH, droprate = 90 },
            { itemid = xi.items.DAMASCUS_INGOT, droprate = 29 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate = 148 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 234 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER, droprate = 76 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 232 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate = 41 },
        },
    },

    -- KSNM Contaminated Colosseum
    [17] =
    {
        {
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER, droprate = 1000 },
        },

        {
            { itemid = xi.items.MICHISHIBA_NO_TSUYU, droprate = 217 },
            { itemid = xi.items.MORGENSTERN, droprate = 174 },
            { itemid = xi.items.SENJUINRIKIO, droprate = 333 },
            { itemid = xi.items.THURSUSSTAB, droprate = 174 },
        },

        {
            { itemid = xi.items.CASSIE_EARRING, droprate = 101 },
            { itemid =   xi.items.MALBORO_VINE, droprate = 275 },
            { itemid =  xi.items.MORBOLGER_VINE, droprate = 275 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate =  43 },
            { itemid = xi.items.POLE_GRIP,     droprate = 203 },
            { itemid = xi.items.SPEAR_STRAP,   droprate = 116 },
        },

        {
            { itemid =   xi.items.ADAMAN_INGOT, droprate = 159 },
            { itemid =   xi.items.ORICHALCUM_INGOT, droprate = 290 },
            { itemid = xi.items.OSCAR_SCARF, droprate = 406 },
        },

        {
            { itemid = xi.items.EVOKERS_BOOTS, droprate = 159 },
            { itemid = xi.items.OSTREGER_MITTS, droprate = 217 },
            { itemid = xi.items.PINEAL_HAT, droprate = 145 },
            { itemid = xi.items.TRACKERS_KECKS, droprate = 159 },
        },

        {
            { itemid =  xi.items.CORAL_FRAGMENT, droprate = 101 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  29 },
            { itemid =  xi.items.DEMON_HORN, droprate =  29 },
            { itemid =  xi.items.EBONY_LOG, droprate =  29 },
            { itemid =  xi.items.CHUNK_OF_GOLD_ORE, droprate = 101 },
            { itemid =  xi.items.SPOOL_OF_GOLD_THREAD, droprate =  29 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  29 },
            { itemid =  xi.items.MAHOGANY_LOG, droprate =  43 },
            { itemid =  xi.items.CHUNK_OF_MYTHRIL_ORE, droprate =  29 },
            { itemid =  xi.items.PETRIFIED_LOG, droprate =  58 },
            { itemid =  xi.items.CHUNK_OF_PLATINUM_ORE, droprate =  14 },
            { itemid =  xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate =  58 },
            { itemid =  xi.items.RAM_HORN, droprate =  14 },
            { itemid = xi.items.VILE_ELIXIR, droprate =  58 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  29 },
            { itemid =  xi.items.HANDFUL_OF_WYVERN_SCALES, droprate =  72 },
        },

        {
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  87 },
            { itemid =  xi.items.DAMASCUS_INGOT, droprate =  14 },
            { itemid =  xi.items.SQUARE_OF_DAMASCENE_CLOTH, droprate =  29 },
            { itemid =  xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  43 },
            { itemid =  xi.items.PHILOSOPHERS_STONE, droprate = 174 },
            { itemid =  xi.items.PHOENIX_FEATHER, droprate = 246 },
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
