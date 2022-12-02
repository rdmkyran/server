-----------------------------------
-- Chocobo Digging
-- http://ffxiclopedia.wikia.com/wiki/Chocobo_Digging
-- https://www.bg-wiki.com/bg/Category:Chocobo_Digging
-----------------------------------
require("scripts/globals/roe")
require("scripts/globals/items")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/zone")
require("scripts/missions/amk/helpers")
-----------------------------------

xi = xi or {}
xi.chocoboDig = xi.chocoboDig or {}

local DIG_RATE = xi.settings.main.DIG_RATE
local DIG_FATIGUE = xi.settings.main.DIG_FATIGUE
local DIG_ZONE_LIMIT = xi.settings.main.DIG_ZONE_LIMIT
local DIG_GRANT_BURROW = xi.settings.main.DIG_GRANT_BURROW
local DIG_GRANT_BORE = xi.settings.main.DIG_GRANT_BORE
local DIG_DISTANCE_REQ = xi.settings.main.DIG_DISTANCE_REQ

local find_nothing = "You dig and you dig, but you find nothing."

local digReq =
{
    NONE     = 0,
    BURROW   = 1,
    BORE     = 2,
    MODIFIER = 4,
    NIGHT    = 8,
    WEATHER  = 16,
    ORE      = 32,
}

local crystalMap =
{
    [xi.weather.HOT_SPELL    ] = 4096, -- fire crystal
    [xi.weather.HEAT_WAVE    ] = 4104, -- fire cluster
    [xi.weather.RAIN         ] = 4101, -- water crystal
    [xi.weather.SQUALL       ] = 4109, -- water cluster
    [xi.weather.DUST_STORM   ] = 4099, -- earth crystal
    [xi.weather.SAND_STORM   ] = 4107, -- earth cluster
    [xi.weather.WIND         ] = 4098, -- wind crystal
    [xi.weather.GALES        ] = 4106, -- wind cluster
    [xi.weather.SNOW         ] = 4097, -- ice crystal
    [xi.weather.BLIZZARDS    ] = 4105, -- ice cluster
    [xi.weather.THUNDER      ] = 4100, -- lightning crystal
    [xi.weather.THUNDERSTORMS] = 4108, -- lightning cluster
    [xi.weather.AURORAS      ] = 4102, -- light crystal
    [xi.weather.STELLAR_GLARE] = 4110, -- light cluster
    [xi.weather.GLOOM        ] = 4103, -- dark crystal
    [xi.weather.DARKNESS     ] = 4111, -- dark cluster
}

local oreMap =
{
    [xi.day.FIRESDAY    ] = 1255, -- fire ore
    [xi.day.EARTHSDAY   ] = 1258, -- earth ore
    [xi.day.WATERSDAY   ] = 1260, -- water ore
    [xi.day.WINDSDAY    ] = 1257, -- wind ore
    [xi.day.ICEDAY      ] = 1256, -- ice ore
    [xi.day.LIGHTNINGDAY] = 1259, -- lightning ore
    [xi.day.LIGHTSDAY   ] = 1261, -- light ore
    [xi.day.DARKSDAY    ] = 1262, -- dark ore
}

-----------------------------------
-- { itemId, weight, dig requirements }
-----------------------------------
local digInfo =
{
    [xi.zone.CARPENTERS_LANDING] = -- 2
    {
        { xi.items.ACORN                    , 152, digReq.NONE     },
        { xi.items.ARROWWOOD_LOG            , 182, digReq.NONE     },
        { xi.items.HOLLY_LOG                ,  83, digReq.NONE     },
        { xi.items.KING_TRUFFLE             ,   3, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 129, digReq.NONE     },
        { xi.items.MAPLE_LOG                , 144, digReq.NONE     },
        { xi.items.SPRIG_OF_MISTLETOE       ,   8, digReq.NONE     },
        { xi.items.OAK_LOG                  ,  76, digReq.NONE     },
        { xi.items.SCREAM_FUNGUS            ,  38, digReq.NONE     },
        { xi.items.WILLOW_LOG               ,  45, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.LIGHTNING_CRYSTAL        ,  59, digReq.BURROW   },
        { xi.items.WATER_CRYSTAL            ,  59, digReq.BURROW   },
        { xi.items.ELM_LOG                  ,  15, digReq.BORE     },
        { xi.items.LACQUER_TREE_LOG         ,   8, digReq.BORE     },
        { xi.items.MAHOGANY_LOG             ,  23, digReq.BORE     },
        { xi.items.ROSEWOOD_LOG             ,   8, digReq.BORE     },
        { xi.items.YEW_LOG                  ,  30, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.BIBIKI_BAY] = -- 4
    {
        { xi.items.BIRD_FEATHER             ,  70, digReq.NONE     },
        { xi.items.CORAL_FRAGMENT           ,  10, digReq.NONE     },
        { xi.items.GIANT_FEMUR              ,  55, digReq.NONE     },
        { xi.items.LUGWORM                  , 110, digReq.NONE     },
        { xi.items.CHUNK_OF_PLATINUM_ORE    ,   5, digReq.NONE     },
        { xi.items.SEASHELL                 , 160, digReq.NONE     },
        { xi.items.SHALL_SHELL              ,  60, digReq.NONE     },
        { xi.items.SHELL_BUG                , 110, digReq.NONE     },
        { xi.items.CHUNK_OF_TIN_ORE         , 130, digReq.NONE     },
        { xi.items.TURTLE_SHELL             ,  30, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BLACK_CHOCOBO_FEATHER    , 150, digReq.BURROW   },
        { xi.items.GIANT_BIRD_PLUME         ,  10, digReq.BURROW   },
        { xi.items.PHOENIX_FEATHER          ,  90, digReq.BURROW   },
        { xi.items.CLUMP_OF_RED_MOKO_GRASS  ,  10, digReq.BURROW   },
        { xi.items.SPIDER_WEB               ,  10, digReq.BURROW   },
        { xi.items.BONE_CHIP                ,  70, digReq.BORE     },
        { xi.items.DEMON_HORN               ,  20, digReq.BORE     },
        { xi.items.DEMON_SKULL              ,  30, digReq.BORE     },
        { xi.items.HANDFUL_OF_DRAGON_SCALES ,  10, digReq.BORE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  40, digReq.BORE     },
        { xi.items.HANDFUL_OF_HIGH_QUALITY_PUGIL_SCALES,  50, digReq.BORE     },
        { xi.items.TITANICTUS_SHELL         ,  30, digReq.BORE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.WAJAOM_WOODLANDS] = -- 51
    {
        { xi.items.CHUNK_OF_ADAMAN_ORE      ,   3, digReq.NONE     },
        { xi.items.BLACK_CHOCOBO_FEATHER    ,  75, digReq.NONE     },
        { xi.items.BLUE_ROCK                ,  31, digReq.NONE     },
        { xi.items.EBONY_LOG                ,  52, digReq.NONE     },
        { xi.items.CLUMP_OF_MOKO_GRASS      , 190, digReq.NONE     },
        { xi.items.PEBBLE                   , 147, digReq.NONE     },
        { xi.items.PEPHREDO_HIVE_CHIP       ,  17, digReq.NONE     },
        { xi.items.HANDFUL_OF_PINE_NUTS     , 152, digReq.NONE     },
        { xi.items.SPIDER_WEB               ,   4, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.ARROWWOOD_LOG            , 137, digReq.BURROW   },
        { xi.items.ELM_LOG                  ,  10, digReq.BURROW   },
        { xi.items.LACQUER_TREE_LOG         ,   1, digReq.BURROW   },
        { xi.items.MAHOGANY_LOG             ,   4, digReq.BURROW   },
        { xi.items.OAK_LOG                  ,  31, digReq.BURROW   },
        { xi.items.ROSEWOOD_LOG             ,   4, digReq.BURROW   },
        { xi.items.YEW_LOG                  ,  35, digReq.BURROW   },
        { xi.items.CHUNK_OF_ALUMINUM_ORE    ,   1, digReq.BORE     },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,   1, digReq.BORE     },
        { xi.items.FLINT_STONE              ,  98, digReq.BORE     },
        { xi.items.CHUNK_OF_GOLD_ORE        ,  22, digReq.BORE     },
        { xi.items.CHUNK_OF_KAOLIN          ,   3, digReq.BORE     },
        { xi.items.CHUNK_OF_ORICHALCUM_ORE  ,   1, digReq.BORE     },
        { xi.items.CHUNK_OF_PLATINUM_ORE    ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.BHAFLAU_THICKETS] = -- 52
    {
        { xi.items.BLUE_ROCK                ,  50, digReq.NONE     },
        { xi.items.COLIBRI_FEATHER          ,  60, digReq.NONE     },
        { xi.items.PINCH_OF_DRIED_MARJORAM  , 197, digReq.NONE     },
        { xi.items.LESSER_CHIGOE            ,  23, digReq.NONE     },
        { xi.items.CHUNK_OF_ORICHALCUM_ORE  ,   5, digReq.NONE     },
        { xi.items.PEBBLE                   , 133, digReq.NONE     },
        { xi.items.PETRIFIED_LOG            ,  69, digReq.NONE     },
        { xi.items.HANDFUL_OF_PINE_NUTS     , 135, digReq.NONE     },
        { xi.items.SPIDER_WEB               ,  21, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.ARROWWOOD_LOG            , 144, digReq.BURROW   },
        { xi.items.EBONY_LOG                ,  14, digReq.BURROW   },
        { xi.items.ELM_LOG                  ,  23, digReq.BURROW   },
        { xi.items.LACQUER_TREE_LOG         ,   3, digReq.BURROW   },
        { xi.items.MAHOGANY_LOG             ,  14, digReq.BURROW   },
        { xi.items.OAK_LOG                  ,  37, digReq.BURROW   },
        { xi.items.ROSEWOOD_LOG             ,  28, digReq.BURROW   },
        { xi.items.YEW_LOG                  ,  23, digReq.BURROW   },
        { xi.items.CHUNK_OF_ALUMINUM_ORE    ,   9, digReq.BORE     },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,   3, digReq.BORE     },
        { xi.items.FLINT_STONE              , 193, digReq.BORE     },
        { xi.items.CHUNK_OF_GOLD_ORE        ,  22, digReq.BORE     },
        { xi.items.CHUNK_OF_KAOLIN          ,   3, digReq.BORE     },
        { xi.items.CHUNK_OF_PLATINUM_ORE    ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.WEST_RONFAURE] = -- 100
    {
        { xi.items.ACORN                    , 120, digReq.NONE     },
        { xi.items.ARROWWOOD_LOG            , 111, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 148, digReq.NONE     },
        { xi.items.ASH_LOG                  ,  28, digReq.NONE     },
        { xi.items.CHOCOBO_FEATHER          ,  74, digReq.NONE     },
        { xi.items.MAPLE_LOG                ,  46, digReq.NONE     },
        { xi.items.CLUMP_OF_MOKO_GRASS      ,  56, digReq.NONE     },
        { xi.items.RONFAURE_CHESTNUT        ,  10, digReq.NONE     },
        { xi.items.CHESTNUT_LOG             ,  63, digReq.NONE     },
        { xi.items.SPRIG_OF_MISTLETOE       ,  12, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BUNCH_OF_GYSAHL_GREENS   ,   5, digReq.BURROW   },
        { xi.items.CHAMOMILE                ,  63, digReq.BURROW   },
        { xi.items.GINGER_ROOT              ,  63, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.BAG_OF_VEGETABLE_SEEDS   ,  23, digReq.NIGHT    },
    },

    [xi.zone.EAST_RONFAURE] = -- 101
    {
        { xi.items.ACORN                    , 224, digReq.NONE     },
        { xi.items.ARROWWOOD_LOG            , 184, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 276, digReq.NONE     },
        { xi.items.ASH_LOG                  ,  69, digReq.NONE     },
        { xi.items.CHOCOBO_FEATHER          ,  63, digReq.NONE     },
        { xi.items.MAPLE_LOG                , 144, digReq.NONE     },
        { xi.items.RONFAURE_CHESTNUT        ,  29, digReq.NONE     },
        { xi.items.CHESTNUT_LOG             ,  10, digReq.NONE     },
        { xi.items.KING_TRUFFLE             ,  11, digReq.NONE     },
        { xi.items.SPRIG_OF_MISTLETOE       ,  10, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BUNCH_OF_GYSAHL_GREENS   ,  12, digReq.BURROW   },
        { xi.items.CHAMOMILE                ,  29, digReq.BURROW   },
        { xi.items.GINGER_ROOT              ,  12, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  11, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  12, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  10, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  12, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  11, digReq.MODIFIER },
        { xi.items.BAG_OF_FRUIT_SEEDS       ,  37, digReq.NIGHT    },
    },

    [xi.zone.LA_THEINE_PLATEAU] = -- 102
    {
        { xi.items.ARROWWOOD_LOG            , 153, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 155, digReq.NONE     },
        { xi.items.PEBBLE                   , 134, digReq.NONE     },
        { xi.items.CHUNK_OF_TIN_ORE         , 103, digReq.NONE     },
        { xi.items.CHOCOBO_FEATHER          ,  56, digReq.NONE     },
        { xi.items.CHUNK_OF_ZINC_ORE        ,  49, digReq.NONE     },
        { xi.items.YEW_LOG                  ,  57, digReq.NONE     },
        { xi.items.CHESTNUT_LOG             ,  40, digReq.NONE     },
        { xi.items.PINCH_OF_DRIED_MARJORAM  ,  28, digReq.NONE     },
        { xi.items.MAHOGANY_LOG             ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BUNCH_OF_GYSAHL_GREENS   ,  34, digReq.BURROW   },
        { xi.items.CHAMOMILE                ,  20, digReq.BURROW   },
        { xi.items.PIECE_OF_PIE_DOUGH       ,   8, digReq.BURROW   },
        { xi.items.HEAD_OF_NAPA             ,   2, digReq.BURROW   },
        { xi.items.PIECE_OF_YELLOW_GINSENG  , 139, digReq.BORE     },
        { xi.items.BAG_OF_WILDGRASS_SEEDS   ,  44, digReq.BORE     },
        { xi.items.GINGER_ROOT              ,   6, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.BAG_OF_TREE_CUTTINGS     ,  12, digReq.MODIFIER },
    },

    [xi.zone.VALKURM_DUNES] = -- 103
    {
        { xi.items.BLUE_ROCK                ,   1, digReq.NONE     },
        { xi.items.BONE_CHIP                , 166, digReq.NONE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  96, digReq.NONE     },
        { xi.items.GIANT_FEMUR              ,  26, digReq.NONE     },
        { xi.items.LIZARD_MOLT              , 110, digReq.NONE     },
        { xi.items.LUGWORM                  , 111, digReq.NONE     },
        { xi.items.SEASHELL                 , 215, digReq.NONE     },
        { xi.items.SHALL_SHELL              ,  32, digReq.NONE     },
        { xi.items.SHELL_BUG                ,  21, digReq.NONE     },
        { xi.items.TURTLE_SHELL             ,  10, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BLACK_CHOCOBO_FEATHER    , 125, digReq.BURROW   },
        { xi.items.GIANT_BIRD_PLUME         ,  10, digReq.BURROW   },
        { xi.items.PHOENIX_FEATHER          ,  40, digReq.BURROW   },
        { xi.items.CLUMP_OF_RED_MOKO_GRASS  ,  24, digReq.BURROW   },
        { xi.items.SPIDER_WEB               ,   4, digReq.BURROW   },
        { xi.items.DEMON_HORN               ,   6, digReq.BORE     },
        { xi.items.DEMON_SKULL              ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_DRAGON_SCALES ,   1, digReq.BORE     },
        { xi.items.HANDFUL_OF_HIGH_QUALITY_PUGIL_SCALES,  11, digReq.BORE     },
        { xi.items.TITANICTUS_SHELL         ,   4, digReq.BORE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,   1, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.JUGNER_FOREST] = -- 104
    {
        { xi.items.ACORN                    , 145, digReq.NONE     },
        { xi.items.ARROWWOOD_LOG            , 110, digReq.NONE     },
        { xi.items.HOLLY_LOG                ,  93, digReq.NONE     },
        { xi.items.KING_TRUFFLE             ,   3, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 152, digReq.NONE     },
        { xi.items.MAPLE_LOG                , 138, digReq.NONE     },
        { xi.items.SPRIG_OF_MISTLETOE       ,  17, digReq.NONE     },
        { xi.items.OAK_LOG                  ,  59, digReq.NONE     },
        { xi.items.SCREAM_FUNGUS            ,  28, digReq.NONE     },
        { xi.items.WILLOW_LOG               ,   9, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.ELM_LOG                  ,  15, digReq.BORE     },
        { xi.items.LACQUER_TREE_LOG         ,   8, digReq.BORE     },
        { xi.items.EBONY_LOG                ,  23, digReq.BORE     },
        { xi.items.ROSEWOOD_LOG             ,   8, digReq.BORE     },
        { xi.items.YEW_LOG                  ,  30, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.BATALLIA_DOWNS] = -- 105
    {
        { xi.items.BIRD_FEATHER             ,  69, digReq.NONE     },
        { xi.items.BONE_CHIP                , 137, digReq.NONE     },
        { xi.items.BLACK_CHOCOBO_FEATHER    ,   4, digReq.NONE     },
        { xi.items.CHUNK_OF_COPPER_ORE      ,  82, digReq.NONE     },
        { xi.items.FLINT_STONE              , 133, digReq.NONE     },
        { xi.items.CHUNK_OF_IRON_ORE        ,  82, digReq.NONE     },
        { xi.items.PEBBLE                   , 137, digReq.NONE     },
        { xi.items.PURPLE_ROCK              ,  26, digReq.NONE     },
        { xi.items.RED_JAR                  ,  69, digReq.NONE     },
        { xi.items.REISHI_MUSHROOM          ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BEASTCOIN                , 106, digReq.BURROW   },
        { xi.items.GOLD_BEASTCOIN           ,   8, digReq.BURROW   },
        { xi.items.MYTHRIL_BEASTCOIN        ,  30, digReq.BURROW   },
        { xi.items.SILVER_BEASTCOIN         , 136, digReq.BURROW   },
        { xi.items.BAG_OF_TREE_CUTTINGS     ,  30, digReq.BORE     },
        { xi.items.BAG_OF_WILDGRASS_SEEDS   ,  60, digReq.BORE     },
        { xi.items.PIECE_OF_YELLOW_GINSENG  , 150, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.NORTH_GUSTABERG] = -- 106
    {
        { xi.items.BONE_CHIP                , 176, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 297, digReq.NONE     },
        { xi.items.PEBBLE                   , 202, digReq.NONE     },
        { xi.items.BIRD_FEATHER             ,  75, digReq.NONE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  45, digReq.NONE     },
        { xi.items.INSECT_WING              , 108, digReq.NONE     },
        { xi.items.LIZARD_MOLT              , 149, digReq.NONE     },
        { xi.items.HANDFUL_OF_PUGIL_SCALES  ,  83, digReq.NONE     },
        { xi.items.MYTHRIL_BEASTCOIN        ,  63, digReq.NONE     },
        { xi.items.CHUNK_OF_MYTHRIL_ORE     ,  60, digReq.NONE     },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BUNCH_OF_GYSAHL_GREENS   , 150, digReq.BURROW   },
        { xi.items.CHAMOMILE                ,  50, digReq.BURROW   },
        { xi.items.GINGER_ROOT              , 100, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.BAG_OF_CACTUS_STEMS      ,   3, digReq.NIGHT    },
    },

    [xi.zone.SOUTH_GUSTABERG] = -- 107
    {
        { xi.items.PEBBLE                   , 252, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 227, digReq.NONE     },
        { xi.items.INSECT_WING              , 156, digReq.NONE     },
        { xi.items.BONE_CHIP                , 133, digReq.NONE     },
        { xi.items.CHUNK_OF_ROCK_SALT       ,  83, digReq.NONE     },
        { xi.items.LIZARD_MOLT              ,  80, digReq.NONE     },
        { xi.items.MYTHRIL_BEASTCOIN        ,  32, digReq.NONE     },
        { xi.items.BIRD_FEATHER             ,  23, digReq.NONE     },
        { xi.items.CHUNK_OF_MYTHRIL_ORE     ,   5, digReq.NONE     },
        { xi.items.WHITE_ROCK               ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BUNCH_OF_GYSAHL_GREENS   ,   5, digReq.BURROW   },
        { xi.items.CHAMOMILE                ,  63, digReq.BURROW   },
        { xi.items.GINGER_ROOT              ,  63, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.BAG_OF_GRAIN_SEEDS       ,  14, digReq.NIGHT    },
    },

    [xi.zone.KONSCHTAT_HIGHLANDS] = -- 108
    {
        { xi.items.BIRD_FEATHER             ,  13, digReq.NONE     },
        { xi.items.BONE_CHIP                , 165, digReq.NONE     },
        { xi.items.ELM_LOG                  ,  68, digReq.NONE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  80, digReq.NONE     },
        { xi.items.FLINT_STONE              ,  90, digReq.NONE     },
        { xi.items.LIZARD_MOLT              ,  63, digReq.NONE     },
        { xi.items.MYTHRIL_BEASTCOIN        ,  14, digReq.NONE     },
        { xi.items.PEBBLE                   , 214, digReq.NONE     },
        { xi.items.PHOENIX_FEATHER          ,  14, digReq.NONE     },
        { xi.items.HANDFUL_OF_PUGIL_SCALES  ,  45, digReq.NONE     },
        { xi.items.CHUNK_OF_ZINC_ORE        ,  71, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BLACK_CHOCOBO_FEATHER    ,  28, digReq.BORE     },
        { xi.items.GIANT_BIRD_FEATHER       ,  27, digReq.BORE     },
        { xi.items.GIANT_BIRD_PLUME         ,  23, digReq.BORE     },
        { xi.items.CLUMP_OF_RED_MOKO_GRASS  ,  22, digReq.BORE     },
        { xi.items.SPIDER_WEB               ,  19, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.PASHHOW_MARSHLANDS] = -- 109
    {
        { xi.items.INSECT_WING              , 216, digReq.NONE     },
        { xi.items.PEBBLE                   , 210, digReq.NONE     },
        { xi.items.LIZARD_MOLT              , 188, digReq.NONE     },
        { xi.items.CHUNK_OF_SILVER_ORE      ,  72, digReq.NONE     },
        { xi.items.WILLOW_LOG               , 102, digReq.NONE     },
        { xi.items.PUFFBALL                 ,  48, digReq.NONE     },
        { xi.items.BLACK_ROCK               ,  36, digReq.NONE     },
        { xi.items.MYTHRIL_BEASTCOIN        ,  18, digReq.NONE     },
        { xi.items.PETRIFIED_LOG            ,   6, digReq.NONE     },
        { xi.items.TURTLE_SHELL             ,   9, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.PIECE_OF_YELLOW_GINSENG  , 120, digReq.BURROW   },
        { xi.items.BAG_OF_WILDGRASS_SEEDS   ,  42, digReq.BURROW   },
        { xi.items.BAG_OF_TREE_CUTTINGS     ,  24, digReq.BURROW   },
        { xi.items.BAG_OF_CACTUS_STEMS      ,  12, digReq.BURROW   },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.ROLANBERRY_FIELDS] = -- 110
    {
        { xi.items.CORAL_FUNGUS             ,  30, digReq.NONE     },
        { xi.items.DEATHBALL                ,   7, digReq.NONE     },
        { xi.items.FLINT_STONE              , 164, digReq.NONE     },
        { xi.items.GOLD_BEASTCOIN           ,  15, digReq.NONE     },
        { xi.items.INSECT_WING              ,  97, digReq.NONE     },
        { xi.items.LITTLE_WORM              ,  75, digReq.NONE     },
        { xi.items.MYTHRIL_BEASTCOIN        ,  45, digReq.NONE     },
        { xi.items.CHUNK_OF_ORICHALCUM_ORE  ,   3, digReq.NONE     },
        { xi.items.PEBBLE                   , 216, digReq.NONE     },
        { xi.items.PUFFBALL                 ,  15, digReq.NONE     },
        { xi.items.SPRIG_OF_SAGE            ,  82, digReq.NONE     },
        { xi.items.RED_JAR                  ,  37, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BEASTCOIN                , 200, digReq.BURROW   },
        { xi.items.SILVER_BEASTCOIN         , 100, digReq.BURROW   },
        { xi.items.DANCESHROOM              ,  60, digReq.BORE     },
        { xi.items.REISHI_MUSHROOM          ,  15, digReq.BORE     },
        { xi.items.SLEEPSHROOM              ,  52, digReq.BORE     },
        { xi.items.WOOZYSHROOM              ,  10, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.EASTERN_ALTEPA_DESERT] = -- 114
    {
        { xi.items.BONE_CHIP                , 176, digReq.NONE     },
        { xi.items.GIANT_FEMUR              ,  88, digReq.NONE     },
        { xi.items.PEBBLE                   , 135, digReq.NONE     },
        { xi.items.CHUNK_OF_SILVER_ORE      ,  52, digReq.NONE     },
        { xi.items.CHUNK_OF_MYTHRIL_ORE     ,  22, digReq.NONE     },
        { xi.items.PHILOSOPHERS_STONE       ,   4, digReq.NONE     },
        { xi.items.CHUNK_OF_PLATINUM_ORE    ,  12, digReq.NONE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,  36, digReq.NONE     },
        { xi.items.CHUNK_OF_ZINC_ORE        ,  58, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.BAG_OF_FRUIT_SEEDS       ,  33, digReq.BURROW   },
        { xi.items.BAG_OF_GRAIN_SEEDS       ,  74, digReq.BURROW   },
        { xi.items.BAG_OF_HERB_SEEDS        ,  59, digReq.BURROW   },
        { xi.items.BAG_OF_TREE_CUTTINGS     ,  19, digReq.BURROW   },
        { xi.items.BAG_OF_VEGETABLE_SEEDS   ,  44, digReq.BURROW   },
        { xi.items.BAG_OF_WILDGRASS_SEEDS   ,  41, digReq.BURROW   },
        { xi.items.CHUNK_OF_ADAMAN_ORE      ,   3, digReq.BORE     },
        { xi.items.CHUNK_OF_ALUMINUM_ORE    ,  18, digReq.BORE     },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,   9, digReq.BORE     },
        { xi.items.FLINT_STONE              , 129, digReq.BORE     },
        { xi.items.CHUNK_OF_GOLD_ORE        ,   3, digReq.BORE     },
        { xi.items.CHUNK_OF_ORICHALCUM_ORE  ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.WEST_SARUTABARUTA] = -- 115
    {
        { xi.items.LAUAN_LOG                , 205, digReq.NONE     },
        { xi.items.LITTLE_WORM              , 295, digReq.NONE     },
        { xi.items.PEBBLE                   , 341, digReq.NONE     },
        { xi.items.BUNCH_OF_GYSAHL_GREENS   ,  50, digReq.NONE     },
        { xi.items.BIRD_FEATHER             ,  50, digReq.NONE     },
        { xi.items.INSECT_WING              ,  68, digReq.NONE     },
        { xi.items.CLUMP_OF_MOKO_GRASS      ,  68, digReq.NONE     },
        { xi.items.YAGUDO_FEATHER           ,  23, digReq.NONE     },
        { xi.items.BALL_OF_SARUTA_COTTON    ,  50, digReq.NONE     },
        { xi.items.ROSEWOOD_LOG             ,  50, digReq.NONE     },
        { xi.items.EBONY_LOG                ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.GINGER_ROOT              ,  50, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.BAG_OF_TREE_CUTTINGS     ,  10, digReq.NIGHT    },
    },

    [xi.zone.EAST_SARUTABARUTA] = -- 116
    {
        { xi.items.LAUAN_LOG                , 236, digReq.NONE     },
        { xi.items.PAPAKA_GRASS             , 125, digReq.NONE     },
        { xi.items.PEBBLE                   , 181, digReq.NONE     },
        { xi.items.BIRD_FEATHER             ,  14, digReq.NONE     },
        { xi.items.INSECT_WING              ,  69, digReq.NONE     },
        { xi.items.CLUMP_OF_MOKO_GRASS      ,   8, digReq.NONE     },
        { xi.items.YAGUDO_FEATHER           ,  69, digReq.NONE     },
        { xi.items.BALL_OF_SARUTA_COTTON    ,  14, digReq.NONE     },
        { xi.items.GREEN_ROCK               ,  14, digReq.NONE     },
        { xi.items.ROSEWOOD_LOG             ,   8, digReq.NONE     },
        { xi.items.EBONY_LOG                ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BUNCH_OF_GYSAHL_GREENS   , 200, digReq.BURROW   },
        { xi.items.CHAMOMILE                ,  50, digReq.BURROW   },
        { xi.items.HEAD_OF_NAPA             ,  10, digReq.BURROW   },
        { xi.items.GINGER_ROOT              ,  50, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.BAG_OF_HERB_SEEDS        , 100, digReq.NIGHT    },
    },

    [xi.zone.TAHRONGI_CANYON] = -- 117
    {
        { xi.items.BONE_CHIP                , 118, digReq.NONE     },
        { xi.items.GIANT_FEMUR              , 121, digReq.NONE     },
        { xi.items.GOLD_BEASTCOIN           ,   5, digReq.NONE     },
        { xi.items.CHUNK_OF_GOLD_ORE        ,   2, digReq.NONE     },
        { xi.items.INSECT_WING              ,  45, digReq.NONE     },
        { xi.items.PEBBLE                   , 134, digReq.NONE     },
        { xi.items.RED_ROCK                 ,  10, digReq.NONE     },
        { xi.items.SEASHELL                 , 175, digReq.NONE     },
        { xi.items.CHUNK_OF_TIN_ORE         , 100, digReq.NONE     },
        { xi.items.YAGUDO_FEATHER           ,  45, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BEASTCOIN                , 148, digReq.BURROW   },
        { xi.items.MYTHRIL_BEASTCOIN        ,  25, digReq.BURROW   },
        { xi.items.PLATINUM_BEASTCOIN       ,   1, digReq.BURROW   },
        { xi.items.SILVER_BEASTCOIN         ,  86, digReq.BURROW   },
        { xi.items.DEMON_HORN               ,   2, digReq.BORE     },
        { xi.items.DEMON_SKULL              ,   1, digReq.BORE     },
        { xi.items.HANDFUL_OF_DRAGON_SCALES ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_HIGH_QUALITY_PUGIL_SCALES,   8, digReq.BORE     },
        { xi.items.TITANICTUS_SHELL         ,   2, digReq.BORE     },
        { xi.items.TURTLE_SHELL             ,   8, digReq.BORE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.BUBURIMU_PENINSULA] = -- 118
    {
        { xi.items.BIRD_FEATHER             ,  45, digReq.NONE     },
        { xi.items.CORAL_FRAGMENT           ,   1, digReq.NONE     },
        { xi.items.GIANT_FEMUR              ,  53, digReq.NONE     },
        { xi.items.LUGWORM                  ,  98, digReq.NONE     },
        { xi.items.CHUNK_OF_PLATINUM_ORE    ,   3, digReq.NONE     },
        { xi.items.SEASHELL                 , 195, digReq.NONE     },
        { xi.items.SHALL_SHELL              ,  47, digReq.NONE     },
        { xi.items.SHELL_BUG                ,  66, digReq.NONE     },
        { xi.items.CHUNK_OF_TIN_ORE         , 134, digReq.NONE     },
        { xi.items.TURTLE_SHELL             ,  12, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BLACK_CHOCOBO_FEATHER    , 125, digReq.BURROW   },
        { xi.items.GIANT_BIRD_PLUME         ,   1, digReq.BURROW   },
        { xi.items.PHOENIX_FEATHER          ,  64, digReq.BURROW   },
        { xi.items.CLUMP_OF_RED_MOKO_GRASS  ,  34, digReq.BURROW   },
        { xi.items.SPIDER_WEB               ,   7, digReq.BURROW   },
        { xi.items.BONE_CHIP                ,  34, digReq.BORE     },
        { xi.items.DEMON_HORN               ,   5, digReq.BORE     },
        { xi.items.DEMON_SKULL              ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_DRAGON_SCALES ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  21, digReq.BORE     },
        { xi.items.HANDFUL_OF_HIGH_QUALITY_PUGIL_SCALES,  19, digReq.BORE     },
        { xi.items.TITANICTUS_SHELL         ,   9, digReq.BORE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,   2, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.MERIPHATAUD_MOUNTAINS] = -- 119
    {
        { xi.items.CHUNK_OF_ADAMAN_ORE      ,   4, digReq.NONE     },
        { xi.items.BLACK_CHOCOBO_FEATHER    ,  12, digReq.NONE     },
        { xi.items.CHUNK_OF_COPPER_ORE      , 112, digReq.NONE     },
        { xi.items.FLINT_STONE              , 237, digReq.NONE     },
        { xi.items.GIANT_FEMUR              ,  41, digReq.NONE     },
        { xi.items.GOLD_BEASTCOIN           ,  33, digReq.NONE     },
        { xi.items.INSECT_WING              , 145, digReq.NONE     },
        { xi.items.LIZARD_MOLT              , 100, digReq.NONE     },
        { xi.items.PEBBLE                   , 162, digReq.NONE     },
        { xi.items.YELLOW_ROCK              ,  21, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.CHUNK_OF_ALUMINUM_ORE    ,   5, digReq.BURROW   },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,   9, digReq.BURROW   },
        { xi.items.CHUNK_OF_GOLD_ORE        ,   5, digReq.BURROW   },
        { xi.items.CHUNK_OF_IRON_ORE        ,  69, digReq.BURROW   },
        { xi.items.CHUNK_OF_KOPPARNICKEL_ORE,  62, digReq.BURROW   },
        { xi.items.CHUNK_OF_MYTHRIL_ORE     ,  31, digReq.BURROW   },
        { xi.items.CHUNK_OF_SILVER_ORE      ,  62, digReq.BURROW   },
        { xi.items.CHUNK_OF_ORICHALCUM_ORE  ,   5, digReq.BURROW   },
        { xi.items.CHUNK_OF_ALUMINUM_ORE    ,   5, digReq.BORE     },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,   9, digReq.BORE     },
        { xi.items.CHUNK_OF_GOLD_ORE        ,   5, digReq.BORE     },
        { xi.items.CHUNK_OF_PLATINUM_ORE    ,   8, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.SAUROMUGUE_CHAMPAIGN] = -- 120
    {
        { xi.items.BLACK_CHOCOBO_FEATHER    ,   8, digReq.NONE     },
        { xi.items.BONE_CHIP                , 126, digReq.NONE     },
        { xi.items.FLINT_STONE              , 130, digReq.NONE     },
        { xi.items.GOLD_BEASTCOIN           ,  55, digReq.NONE     },
        { xi.items.INSECT_WING              ,  91, digReq.NONE     },
        { xi.items.CHUNK_OF_IRON_ORE        ,  75, digReq.NONE     },
        { xi.items.LIZARD_MOLT              ,  87, digReq.NONE     },
        { xi.items.PEBBLE                   , 168, digReq.NONE     },
        { xi.items.RED_JAR                  ,  32, digReq.NONE     },
        { xi.items.TRANSLUCENT_ROCK         ,  50, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BEASTCOIN                ,  95, digReq.BURROW   },
        { xi.items.MYTHRIL_BEASTCOIN        ,  26, digReq.BURROW   },
        { xi.items.PLATINUM_BEASTCOIN       ,  33, digReq.BURROW   },
        { xi.items.SILVER_BEASTCOIN         ,  89, digReq.BURROW   },
        { xi.items.DEMON_HORN               ,  27, digReq.BORE     },
        { xi.items.DEMON_SKULL              ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  41, digReq.BORE     },
        { xi.items.HANDFUL_OF_HIGH_QUALITY_PUGIL_SCALES,  54, digReq.BORE     },
        { xi.items.SEASHELL                 ,  68, digReq.BORE     },
        { xi.items.TITANICTUS_SHELL         ,  14, digReq.BORE     },
        { xi.items.TURTLE_SHELL             ,  14, digReq.BORE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,  14, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.THE_SANCTUARY_OF_ZITAH] = -- 121
    {
        { xi.items.ARROWWOOD_LOG            , 117, digReq.NONE     },
        { xi.items.PEBBLE                   , 150, digReq.NONE     },
        { xi.items.BONE_CHIP                , 100, digReq.NONE     },
        { xi.items.CLUMP_OF_MOKO_GRASS      ,  83, digReq.NONE     },
        { xi.items.YEW_LOG                  , 100, digReq.NONE     },
        { xi.items.ELM_LOG                  ,  33, digReq.NONE     },
        { xi.items.GREEN_ROCK               ,  17, digReq.NONE     },
        { xi.items.TRANSLUCENT_ROCK         ,  33, digReq.NONE     },
        { xi.items.KING_TRUFFLE             ,   9, digReq.NONE     },
        { xi.items.PETRIFIED_LOG            ,   7, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.CHUNK_OF_FIRE_ORE        ,  10, digReq.ORE      }, -- all ores
        { xi.items.BEASTCOIN                , 117, digReq.BURROW   },
        { xi.items.SILVER_BEASTCOIN         , 133, digReq.BURROW   },
        { xi.items.MYTHRIL_BEASTCOIN        , 117, digReq.BURROW   },
        { xi.items.GOLD_BEASTCOIN           ,   8, digReq.BURROW   },
        { xi.items.PLATINUM_BEASTCOIN       ,  14, digReq.BURROW   },
        { xi.items.PIECE_OF_ANCIENT_LUMBER  ,   1, digReq.BURROW   },
        { xi.items.OAK_LOG                  ,   9, digReq.BORE     },
        { xi.items.PIECE_OF_ANCIENT_LUMBER  ,   1, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.YUHTUNGA_JUNGLE] = -- 123
    {
        { xi.items.BONE_CHIP                , 185, digReq.NONE     },
        { xi.items.STICK_OF_CINNAMON        ,  72, digReq.NONE     },
        { xi.items.PIECE_OF_RATTAN_LUMBER   ,  91, digReq.NONE     },
        { xi.items.DANCESHROOM              ,  40, digReq.NONE     },
        { xi.items.EBONY_LOG                ,   4, digReq.NONE     },
        { xi.items.MUSHROOM_LOCUST          ,  10, digReq.NONE     },
        { xi.items.ROSEWOOD_LOG             ,  29, digReq.NONE     },
        { xi.items.KING_TRUFFLE             ,   4, digReq.NONE     },
        { xi.items.PETRIFIED_LOG            ,   9, digReq.NONE     },
        { xi.items.PUFFBALL                 ,   7, digReq.NONE     },
        { xi.items.PIECE_OF_ANCIENT_LUMBER  ,   3, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.SLEEPSHROOM              ,  17, digReq.BURROW   },
        { xi.items.WOOZYSHROOM              ,  41, digReq.BURROW   },
        { xi.items.DANCESHROOM              ,  15, digReq.BURROW   },
        { xi.items.DEATHBALL                ,   3, digReq.BURROW   },
        { xi.items.ARROWWOOD_LOG            ,  23, digReq.BORE     },
        { xi.items.YEW_LOG                  ,  17, digReq.BORE     },
        { xi.items.ELM_LOG                  ,   3, digReq.BORE     },
        { xi.items.OAK_LOG                  ,  12, digReq.BORE     },
        { xi.items.ROSEWOOD_LOG             ,   9, digReq.BORE     },
        { xi.items.LACQUER_TREE_LOG         ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.YHOATOR_JUNGLE] = -- 124
    {
        { xi.items.BONE_CHIP                , 282, digReq.NONE     },
        { xi.items.LAUAN_LOG                , 177, digReq.NONE     },
        { xi.items.KAZHAM_PINEAPPLE         , 140, digReq.NONE     },
        { xi.items.DRYAD_ROOT               ,  90, digReq.NONE     },
        { xi.items.EBONY_LOG                ,  41, digReq.NONE     },
        { xi.items.MAHOGANY_LOG             ,  44, digReq.NONE     },
        { xi.items.CORAL_FUNGUS             ,  47, digReq.NONE     },
        { xi.items.PETRIFIED_LOG            ,  26, digReq.NONE     },
        { xi.items.REISHI_MUSHROOM          ,  12, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.SLEEPSHROOM              ,  17, digReq.BURROW   },
        { xi.items.WOOZYSHROOM              ,  41, digReq.BURROW   },
        { xi.items.DANCESHROOM              ,  15, digReq.BURROW   },
        { xi.items.DEATHBALL                ,   3, digReq.BURROW   },
        { xi.items.ARROWWOOD_LOG            ,  23, digReq.BORE     },
        { xi.items.YEW_LOG                  ,  17, digReq.BORE     },
        { xi.items.ELM_LOG                  ,   3, digReq.BORE     },
        { xi.items.OAK_LOG                  ,  12, digReq.BORE     },
        { xi.items.ROSEWOOD_LOG             ,   9, digReq.BORE     },
        { xi.items.LACQUER_TREE_LOG         ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },

    [xi.zone.WESTERN_ALTEPA_DESERT] = -- 125
    {
        { xi.items.BONE_CHIP                , 224, digReq.NONE     },
        { xi.items.CORAL_FRAGMENT           ,  39, digReq.NONE     },
        { xi.items.CHUNK_OF_DARKSTEEL_ORE   ,  14, digReq.NONE     },
        { xi.items.GIANT_FEMUR              , 105, digReq.NONE     },
        { xi.items.CHUNK_OF_GOLD_ORE        ,  17, digReq.NONE     },
        { xi.items.CHUNK_OF_IRON_ORE        ,  64, digReq.NONE     },
        { xi.items.PEBBLE                   , 122, digReq.NONE     },
        { xi.items.PHILOSOPHERS_STONE       ,   6, digReq.NONE     },
        { xi.items.CHUNK_OF_ZINC_ORE        ,  58, digReq.NONE     },
        { xi.items.HANDFUL_OF_FISH_SCALES   ,  22, digReq.NONE     },
        { xi.items.GIANT_BIRD_PLUME         ,   4, digReq.NONE     },
        { xi.items.FIRE_CRYSTAL             , 100, digReq.WEATHER  }, -- all crystals
        { xi.items.BLACK_CHOCOBO_FEATHER    , 122, digReq.BURROW   },
        { xi.items.PHOENIX_FEATHER          ,  71, digReq.BURROW   },
        { xi.items.CLUMP_OF_RED_MOKO_GRASS  ,  33, digReq.BURROW   },
        { xi.items.SPIDER_WEB               ,  11, digReq.BURROW   },
        { xi.items.DEMON_HORN               ,   6, digReq.BORE     },
        { xi.items.DEMON_SKULL              ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_DRAGON_SCALES ,   3, digReq.BORE     },
        { xi.items.HANDFUL_OF_HIGH_QUALITY_PUGIL_SCALES,  19, digReq.BORE     },
        { xi.items.SEASHELL                 ,  25, digReq.BORE     },
        { xi.items.TITANICTUS_SHELL         ,   8, digReq.BORE     },
        { xi.items.TURTLE_SHELL             ,  10, digReq.BORE     },
        { xi.items.HANDFUL_OF_WYVERN_SCALES ,   3, digReq.BORE     },
        { xi.items.BIRD_EGG                 ,  10, digReq.MODIFIER },
        { xi.items.COLORED_EGG              ,  11, digReq.MODIFIER },
        { xi.items.HARD_BOILED_EGG          ,  12, digReq.MODIFIER },
        { xi.items.SAIRUI_RAN               ,  10, digReq.MODIFIER },
        { xi.items.SOFT_BOILED_EGG          ,  12, digReq.MODIFIER },
    },
}

local function updatePlayerDigCount(player, increment)
    if increment == 0 then
        player:setCharVar('[DIG]DigCount', 0)
    else
        player:setCharVar('[DIG]DigCount', player:getCharVar('[DIG]DigCount') + increment)
    end

    player:setCharVar('[DIG]LastDigTime', os.time())
end

local function canDig(player)
    local digCount        = player:getCharVar('[DIG]DigCount')
    local lastDigTime     = player:getCharVar('[DIG]LastDigTime')
    local lastDigX        = player:getCharVar('[DIG]LastDigX')
    local lastDigY        = player:getCharVar('[DIG]LastDigY')
    local lastDigZ        = player:getCharVar('[DIG]LastDigZ')
    local posTable        = player:getPos()
    local currX           = math.floor(posTable.x)
    local currY           = math.floor(posTable.y)
    local currZ           = math.floor(posTable.z)
    local distanceSquared = (lastDigX - currX) * (lastDigX - currX) + (lastDigY - currY) * (lastDigY - currY) + (lastDigZ - currZ) * (lastDigZ - currZ)
    local zoneInTime      = player:getLocalVar('ZoneInTime')
    local currentTime     = os.time()
    local skillRank       = player:getSkillRank(xi.skill.DIG)
    -- personal dig caps
    local digCap          = DIG_FATIGUE + (skillRank * 10)
    -- base delay -5 for each rank
    local digDelay        = 16 - (skillRank * 5)
    local areaDigDelay    = 60 - (skillRank * 5)
    digDelay = utils.clamp(digDelay, 4, 16)

    if player:hasItem(4545, 0) then
        -- Minimum delay to cover the animation time

        local prevMidnight = getMidnight() - 86400

        -- Last dig was before today, so reset player fatigue
        if lastDigTime < prevMidnight then
            updatePlayerDigCount(player, 0)
            digCount = 0
        end

        -- neither player nor zone have reached their dig limit
        if
            (digCount < digCap)
        then
            -- pesky delays
            if
                (zoneInTime + areaDigDelay) <= currentTime and
                (lastDigTime + digDelay) <= currentTime and
                distanceSquared > DIG_DISTANCE_REQ
            then
                player:setCharVar('[DIG]LastDigX', currX)
                player:setCharVar('[DIG]LastDigY', currY)
                player:setCharVar('[DIG]LastDigZ', currZ)

                return true
            end
        end
    end

    return false
end

--[[
per wiki, avg. digs needed per rank
taken from wiki, took the average of top/bottom
and then x12 to convert from "stacks" to singles
Amateur    1650 (chopped the 50 so we dont have to math.floor later)
Recruit    3600
Initiate    6000
Novice         9000
Apprentice    12600
Journeyman  16200
Craftsman    21000
Artisan    27000
Adept         33000
Veteran    39000
Expert         ----
]]

local function calculateSkillUp(player)
    local skillRank  = player:getSkillRank(xi.skill.DIG)
    local realSkill  = player:getCharSkillLevel(xi.skill.DIG)

    local digsTable = -- Era Dig Table
    {
        [0] = {  1600 },
        [1] = {  3600 },
        [2] = {  6000 },
        [3] = {  9000 },
        [4] = { 12600 },
        [5] = { 16200 },
        [6] = { 21000 },
        [7] = { 27000 },
        [8] = { 33000 },
        [9] = { 39000 },
    }

    -- local digsTable = -- Limit Break Dig Table
    -- {
        -- [0] = {  2000 },
        -- [1] = {  2500 },
        -- [2] = {  3300 },
        -- [3] = {  5000 },
        -- [4] = { 10000 },
        -- [5] = { 11100 },
        -- [6] = { 12500 },
        -- [7] = { 14300 },
        -- [8] = { 16700 },
        -- [9] = { 20000 },
    -- }

    if math.random(1, math.floor(digsTable[skillRank][1] / 100)) == 1 then
        if realSkill < 1000 then -- Safety check.
            player:setSkillLevel(xi.skill.DIG, realSkill + 1)

            -- Digging does not have test items, so increment rank once player hits 10.0, 20.0, .. 100.0
            if (realSkill + 1) >= (skillRank * 100) + 100 then
                player:setSkillRank(xi.skill.DIG, skillRank + 1)
            end
        end
    end
end

-- TODO: Reduce complexity
-- Disable cyclomatic complexity check for this function:
-- luacheck: ignore 561
local function getChocoboDiggingItem(player)
    local allItems        = digInfo[player:getZoneID()]
    local burrowAbility = (DIG_GRANT_BURROW == 1) and 1 or 0
    local boreAbility   = (DIG_GRANT_BORE == 1) and 1 or 0
    local modifier               = player:getMod(xi.mod.EGGHELM)
    local totd                   = VanadielTOTD()
    -- Zone Weather
    local zone                   = player:getZone()
    local weather                = zone:getWeather()
    -- Waxing 7% - 24%
    local moon                   = VanadielMoonPhase()
    local moonDirection          = VanadielMoonDirection()
    local DigRank                = player:getSkillRank(xi.skill.DIG)
    -- Filter allItems to possibleItems and sum weights
    local possibleItems          = {}
    local itemWeight             = 0
    local sum                    = 0

    -- Generate a table with items the player can actually dig up based on weather, time, moon, skills, etc...
    for i = 1, #allItems do
        local item    = allItems[i]
        local itemReq = item[3]

        if
            (itemReq == digReq.NONE) or
            (itemReq == digReq.BURROW and burrowAbility == 1) or
            (itemReq == digReq.BORE and boreAbility == 1) or
            (itemReq == digReq.MODIFIER and modifier == 1) or
            (itemReq == digReq.NIGHT and totd == xi.time.NIGHT) or
            (itemReq == digReq.WEATHER and weather > xi.weather.FOG) or
            (itemReq == digReq.ORE and weather >= xi.weather.FOG and moonDirection == 2 and moon >= 7 and moon <= 24 and DigRank >= 6)
        then
            -- skill up weight variation and ore moon variation
            itemWeight = item[2]

            local weights =
            {
                { 150, 0.95 },
                { 125, 0.97 },
                { 100, 0.99 },
                {  50, 1.03 },
                {   1, 1.05 },
            }

            for _, v in pairs(weights) do
                if DigRank > 0 then
                    if itemWeight >= v[1] then
                        itemWeight = itemWeight * (v[2]^DigRank)
                    end
                end
            end

            local moonPhases =
            {
                {  7,  9, 0.7 },
                { 15, 21, 0.9 },
                { 21, 24, 0.5 },
            }

            for _, v in pairs(moonPhases) do
                if item[1] == 1255 then
                    if moon >= v[1] and moon <= v[2] then
                        itemWeight = itemWeight * v[3]
                    end
                end
            end

            sum = sum + itemWeight
            table.insert(possibleItems, item)
        end
    end

    -- Pick weighted result.
    local itemId = 0
    local pick   = math.random(math.floor(sum))
    sum          = 0

    for i = 1, #possibleItems do
        itemWeight = possibleItems[i][2]

        local weights =
        {
            { 150, 0.95 },
            { 125, 0.97 },
            { 100, 0.99 },
            {  50, 1.03 },
            {   1, 1.05 },
        }

        -- skill up weight variation and ore moon variation
        for _, v in pairs(weights) do
            if DigRank > 0 then
                if itemWeight >= v[1] then
                    itemWeight = itemWeight * (v[2]^DigRank)
                end
            end
        end

        local moonPhases =
        {
            {  7,  9, 0.7 },
            { 15, 21, 0.9 },
            { 21, 24, 0.5 },
        }

        for _, v in pairs(moonPhases) do
            if possibleItems[i][1] == 1255 then
                if moon >= v[1] and moon <= v[2] then
                    itemWeight = itemWeight * v[3]
                end
            end
        end

        sum = sum + itemWeight

        if sum >= pick then
            itemId = possibleItems[i][1]
            break
        end
    end

    -- Item is a crystal or ore
    if itemId == 4096 then
        itemId = crystalMap[weather]
    elseif itemId == 1255 then
        itemId = oreMap[VanadielDayOfTheWeek()]
    end

    return itemId
end

-- Main function.
xi.chocoboDig.start = function(player, precheck)
    local zoneId      = player:getZoneID()
    local text        = zones[zoneId].text
    local skillRank   = player:getSkillRank(xi.skill.DIG)
    local lastDigTime = player:getCharVar('[DIG]LastDigTime')

    -- make sure the player can dig before going any further
    -- (and also cause i need a return before core can go any further with this)
    if canDig(player) == true then
    local roll           = math.random(0, 100)
    local moon           = VanadielMoonPhase()
    local moonmodifier   = 1
    local skillmodifier  = 0.5 + (skillRank / 20) -- 50% at amateur, 55% at recruit, 60% at initiate, and so on, to 100% at exper
    local zonedug        = '[DIG]ZONE'..player:getZoneID()..'_ITEMS'
    local zoneDugCurrent = GetServerVariable(zonedug)

        if moon < 50 then
            moon = 100 - moon -- This converts moon phase percent to a number that represents how FAR the moon phase is from 50
        end

        moonmodifier = 1 - (100 - moon) / 100 -- the more the moon phase is from 50, the closer we get to 100% on this modifier.

        if lastDigTime < (getMidnight() - 86400) then
            player:setCharVar('[DIG]DigCount', 0) -- Reset player dig count/fatigue.
        end

        if zoneDugCurrent + 1 > DIG_ZONE_LIMIT then
            if skillRank < 10 and xi.settings.main.DIG_FATIGUE_SKILL_UP then -- Safety check. Let's not try to skill-up if at max skill.
                calculateSkillUp(player)
            end

            player:PrintToPlayer(find_nothing, 13)
            player:setCharVar('[DIG]LastDigTime', os.time())

            return true
        end

        -- dig chance failure
        if roll > (DIG_RATE * moonmodifier * skillmodifier) then -- base digging rate is 85% and it is multiplied by the moon and skill modifiers
            player:PrintToPlayer(find_nothing, 13)
            player:setCharVar('[DIG]LastDigTime', os.time())
        -- dig chance success
        else
            local itemId = getChocoboDiggingItem(player)
            -- success!
            if itemId ~= 0 then
                -- make sure we have enough room for the item
                if player:addItem(itemId) then
                    player:messageSpecial(text.ITEM_OBTAINED, itemId)
                    SetServerVariable(zonedug, zoneDugCurrent + 1)
                    updatePlayerDigCount(player, 1)
                else
                    player:messageSpecial(text.DIG_THROW_AWAY, itemId)
                    updatePlayerDigCount(player, 1)
                end

                player:triggerRoeEvent(xi.roe.triggers.chocoboDigSuccess)

            -- got a crystal ore, but lacked weather or skill to dig it up
            else
                player:PrintToPlayer(find_nothing, 13)
                player:setCharVar('[DIG]LastDigTime', os.time())
            end
        end

        if skillRank < 10 then -- Safety check. Let's not try to skill-up if at max skill.
            calculateSkillUp(player)
        end

        return true
    end
end
