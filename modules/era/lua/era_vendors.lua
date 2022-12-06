-----------------------------------
-- 75 Era Vendor Shops
-----------------------------------
require("scripts/globals/shop")
require("modules/module_utils")
require("scripts/globals/keyitems")

local m = Module:new("era_vendors")

xi = xi or {}
xi.eraShops = xi.eraShops or {}

-- --------------------------------
-- Bastok
-- --------------------------------
--Bastok Markets
xi.eraShops.Mjoll =
{
    xi.items.SILVER_ARROW,                 16, 1,
    xi.items.WOODEN_ARROW,                  3, 2,
    xi.items.IRON_ARROW,                    7, 3,
    xi.items.SCROLL_OF_DARK_THRENODY,      199, 3,
    xi.items.SCROLL_OF_ICE_THRENODY,      1000, 3,
}

xi.eraShops.Charging_Chocobo =
{
    xi.items.MYTHRIL_CUISSES,           58738, 1,
    xi.items.MYTHRIL_LEGGINGS,          36735, 1,
    xi.items.BRASS_CUISSES,             14131, 2,
    xi.items.CUISSES,                   34776, 2,
    xi.items.BRASS_GREAVES,              8419, 2,
    xi.items.PLATE_LEGGINGS,            21859, 2,
    xi.items.GORGET,                    16891, 2,
    xi.items.BRONZE_SUBLIGAR,             191, 3,
    xi.items.SCALE_CUISSES,              1646, 3,
    xi.items.BRONZE_LEGGINGS,             117, 3,
    xi.items.SCALE_GREAVES,               998, 3,
}

xi.eraShops.Zhikkom =
{
    xi.items.KUKRI,                      5713, 1,
    xi.items.MYTHRIL_SWORD,             31648, 1,
    xi.items.BROADSWORD,                21535, 1,
    xi.items.TUCK,                      11845, 1,
    xi.items.FALCHION,                  62560, 1,
    xi.items.IRON_SWORD,                 7286, 2,
    xi.items.SCIMITAR,                   4163, 2,
    xi.items.KNIFE,                      2231, 2,
    xi.items.BRONZE_KNIFE,                150, 3,
    xi.items.CAT_BAGHNAKHS,               106, 3,
    xi.items.BRONZE_SWORD,                246, 3,
    xi.items.DEGEN,                      9406, 3,
    xi.items.SAPARA,                      713, 3,
}

xi.eraShops.Peritrage =
{
    xi.items.ZAMBURAK,                  14158, 1,
    xi.items.TATHLUM,                     294, 1,
    xi.items.CROSSBOW,                   2166, 2,
    xi.items.MYTHRIL_BOLT,                 22, 2,
    xi.items.LIGHT_CROSSBOW,              165, 3,
    xi.items.CROSSBOW_BOLT,                 5, 3,
}

xi.eraShops.Ciqala =
{
    xi.items.METAL_KNUCKLES,             4818, 1,
    xi.items.WARHAMMER,                  6033, 1,
    xi.items.BATTLEAXE,                 11285, 1,
    xi.items.GREATAXE,                   4186, 1,
    xi.items.BRASS_KNUCKLES,              828, 2,
    xi.items.BRASS_HAMMER,               2083, 2,
    xi.items.BRASS_AXE,                  1435, 2,
    xi.items.BUTTERFLY_AXE,               618, 2,
    xi.items.BRONZE_KNUCKLES,             224, 3,
    xi.items.BRONZE_HAMMER,               312, 3,
    xi.items.BRONZE_AXE,                  290, 3,
    xi.items.MAPLE_WAND,                   47, 3,
    xi.items.ASH_STAFF,                    58, 3,
}

xi.eraShops.Hortense =
{
    xi.items.SCROLL_OF_FOE_REQUIEM,        64, 3,
    xi.items.SCROLL_OF_FOE_REQUIEM_II,    441, 3,
    xi.items.SCROLL_OF_FOE_REQUIEM_III,  3960, 3,
    xi.items.SCROLL_OF_FOE_REQUIEM_IV,   6912, 3,
    xi.items.SCROLL_OF_ARMYS_PAEON,        37, 3,
    xi.items.SCROLL_OF_ARMYS_PAEON_II,    321, 3,
    xi.items.SCROLL_OF_ARMYS_PAEON_III,  3240, 3,
    xi.items.SCROLL_OF_ARMYS_PAEON_IV,   5940, 3,
    xi.items.SCROLL_OF_VALOR_MINUET,       21, 3,
    xi.items.SCROLL_OF_VALOR_MINUET_II,  1101, 3,
    xi.items.SCROLL_OF_VALOR_MINUET_III,  5544, 3,
}

xi.eraShops.Sororo =
{
    xi.items.SCROLL_OF_DIAGA,            1165, 1,
    xi.items.SCROLL_OF_STONESKIN,        7025, 1,
    xi.items.SCROLL_OF_SLOW,              837, 1,
    xi.items.SCROLL_OF_CURE_II,           585, 2,
    xi.items.SCROLL_OF_BANISH,            140, 2,
    xi.items.SCROLL_OF_BANISHGA,         1165, 2,
    xi.items.SCROLL_OF_BLINK,            2097, 2,
    xi.items.SCROLL_OF_CURE,               61, 3,
    xi.items.SCROLL_OF_CURAGA,           1363, 3,
    xi.items.SCROLL_OF_POISONA,           180, 3,
    xi.items.SCROLL_OF_PARALYNA,          324, 3,
    xi.items.SCROLL_OF_BLINDNA,           990, 3,
    xi.items.SCROLL_OF_DIA,                82, 3,
    xi.items.SCROLL_OF_PROTECT,           219, 3,
    xi.items.SCROLL_OF_SHELL,            1584, 3,
    -- xi.items.SCROLL_OF_REPOSE,          29700, 3,
    xi.items.SCROLL_OF_AQUAVEIL,          368, 3,
}

-- Port Bastok
xi.eraShops.Valeriano =
{
    4394,     10, -- Ginger Cookie
    17345,    43, -- Flute
    17347,   990, -- Piccolo
    5017,    585, -- Scroll of Scop's Operetta
    5018,  16920, -- Scroll of Puppet's Operetta
    5013,   2916, -- Scroll of Fowl Aubade
    5027,   2059, -- Scroll of Advancing March
    5072,  90000, -- Scroll of Goddess's Hymnus
}

xi.eraShops.Numa =
{
    xi.items.COTTON_HACHIMAKI,          5079, 1,
    xi.items.COTTON_DOGI,               7654, 1,
    xi.items.COTTON_TEKKO,              4212, 1,
    xi.items.COTTON_SITABAKI,           6133, 1,
    xi.items.COTTON_KYAHAN,             3924, 1,
    xi.items.SILVER_OBI,                3825, 1,
    xi.items.HACHIMAKI,                  759, 2,
    xi.items.KENPOGI,                   1145, 2,
    xi.items.TEKKO,                      630, 2,
    xi.items.SITABAKI,                   915, 2,
    xi.items.KYAHAN,                     584, 2,
    xi.items.BAMBOO_STICK,                 132, 2,
    xi.items.PICKAXE,                      180, 3,
}

-- Metalworks
xi.eraShops.Nogga =
{
    xi.items.BOMB_ARM,                   675, 2,
    xi.items.GRENADE,                   1083, 3,
}


-- Sandoria --
-- Northern Sandy
xi.eraShops.Arlenne =
{
    xi.items.YEW_WAND,                   1409, 1,
    xi.items.ELM_STAFF,                  3245, 1,
    xi.items.ELM_POLE,                  16416, 1,
    xi.items.SPEAR,                     15876, 1,
    xi.items.LANCE,                     16578, 1,
    xi.items.ZAGHNAL,                   11286, 1,
    xi.items.WILLOW_WAND,                 333, 2,
    xi.items.HOLLY_STAFF,                 571, 2,
    xi.items.HOLLY_POLE,                 4568, 2,
    xi.items.BRASS_SPEAR,                4680, 2,
    xi.items.BRASS_ZAGHNAL,              2542, 2,
    xi.items.MAPLE_WAND,                   46, 3,
    xi.items.ASH_STAFF,                    57, 3,
    xi.items.BRONZE_SPEAR,                792, 3,
    xi.items.BRONZE_ZAGHNAL,              309, 3,
}

xi.eraShops.Tavourine =
{
    xi.items.MYTHRIL_CLAYMORE,          37800, 1,
    xi.items.KNIFE,                      2182, 1,
    xi.items.ROD,                        2386, 1,
    xi.items.BRONZE_AXE,                  284, 2,
    xi.items.BRONZE_KNIFE,                147, 2,
    xi.items.BRONZE_ROD,                   91, 2,
    xi.items.CLAYMORE,                   2448, 2,
    xi.items.MACE,                       4363, 2,
    xi.items.BRASS_ROD,                   627, 3,
    xi.items.BRONZE_MACE,                 169, 3,
}

xi.eraShops.Pirvidiauce =
{
    xi.items.CHESTNUT_SABOTS,           9180, 1,
    xi.items.ETHER,                      4445, 1,
    xi.items.POTION,                      837, 1,
    xi.items.CROSSBOW_BOLT,                6, 2,
    xi.items.FLASK_OF_ECHO_DROPS,         720, 2,
    xi.items.HOLLY_CLOGS,               1462, 2,
    xi.items.ANTIDOTE,                    284, 3,
    xi.items.ASH_CLOGS,                  111, 3,
    xi.items.CERAMIC_FLOWERPOT,            900, 3,
    xi.items.FLASK_OF_EYE_DROPS,         2335, 3,
    xi.items.PILE_OF_RED_GRAVEL,         1984, 3,
    xi.items.WOODEN_ARROW,                 3, 3,
}

xi.eraShops.Coullave =
{
    xi.items.ETHER,                      4445, 1,
    xi.items.GRENADE,                   1107, 1,
    xi.items.HACHIMAKI,                  552, 1,
    xi.items.KENPOGI,                    833, 1,
    xi.items.KYAHAN,                     424, 1,
    xi.items.POTION,                      837, 1,
    xi.items.TEKKO,                      458, 1,
    xi.items.SITABAKI,                   666, 1,
    xi.items.BAMBOO_STICK,                  96, 2,
    xi.items.FLASK_OF_ECHO_DROPS,         736, 2,
    xi.items.ANTIDOTE,                    290, 3,
    xi.items.FLASK_OF_EYE_DROPS,         2387, 3,
    xi.items.LEATHER_RING,              1150, 3,
}

-- Southern Sandoria
xi.eraShops.Ashene =
{
    xi.items.BASELARD,                   4309, 1,
    xi.items.GLADIUS,                   16934, 1,
    xi.items.BROADSWORD,                21067, 1,
    xi.items.HUNTING_SWORD,             35769, 1,
    xi.items.FLEURET,                   13406, 1,
    xi.items.DAGGER,                     1827, 2,
    xi.items.IRON_SWORD,                 7128, 2,
    xi.items.LONGSWORD,                  8294, 2,
    xi.items.CESTI,                       129, 3,
    xi.items.BRONZE_DAGGER,               140, 3,
    xi.items.BRASS_DAGGER,                837, 3,
    xi.items.BRASS_XIPHOS,               3523, 3,
    xi.items.BRONZE_SWORD,                241, 3,
    xi.items.SPATHA,                     1674, 3,
}

xi.eraShops.Carautia =
{
    xi.items.CHAIN_HOSE,                11340, 1,
    xi.items.GREAVES,                    6966, 1,
    xi.items.KITE_SHIELD,               10281, 1,
    xi.items.MAHOGANY_SHIELD,            4482, 2,
    xi.items.STUDDED_TROUSERS,          16552, 2,
    xi.items.STUDDED_BOOTS,             10054, 2,
    xi.items.MAPLE_SHIELD,                544, 3,
    xi.items.BRONZE_SUBLIGAR,             187, 3,
    xi.items.BRASS_SUBLIGAR,             1800, 3,
    xi.items.LEATHER_TROUSERS,            482, 3,
    xi.items.BRONZE_LEGGINGS,             115, 3,
    xi.items.BRASS_LEGGINGS,             1116, 3,
    xi.items.LEATHER_HIGHBOOTS,           302, 3,
}

xi.eraShops.Ferdoulemiont =
{
    xi.items.BLACK_CHOCOBO_FEATHER,       1125, 1,
    xi.items.DART,                         9, 2,
    xi.items.JUG_OF_BUG_BROTH,           680, 3,
    xi.items.JUG_OF_CARRION_BROTH,       680, 3,
    xi.items.JUG_OF_CARROT_BROTH,         81, 3,
    xi.items.JUG_OF_HERBAL_BROTH,        124, 3,
    xi.items.CHOCOBO_FEATHER,                7, 3,
    xi.items.BUNCH_OF_GYSAHL_GREENS,       61, 3,
    xi.items.PET_FOOD_ALPHA_BISCUIT,      10, 3,
    xi.items.PET_FOOD_BETA_BISCUIT,       81, 3,
    xi.items.SCROLL_OF_CHOCOBO_MAZURKA, 49680, 3,
    xi.items.SCROLL_OF_KNIGHTS_MINNE,      16, 3,
    xi.items.SCROLL_OF_KNIGHTS_MINNE_II,   864, 3,
    xi.items.SCROLL_OF_KNIGHTS_MINNE_III,  5148, 3,
    xi.items.LA_THEINE_MILLET,           1984, 3,
}

xi.eraShops.Benaige =
{
    xi.items.STICK_OF_CINNAMON,           234, 1,
    xi.items.EAR_OF_MILLIONCORN,           43, 1,
    xi.items.PINCH_OF_DRIED_MARJORAM,      43, 2,
    xi.items.BAG_OF_SAN_DORIAN_FLOUR,      54, 2,
    xi.items.BAG_OF_SEMOLINA,           1800, 2,
    xi.items.POT_OF_MAPLE_SUGAR,           36, 2,
    xi.items.POT_OF_CRYING_MUSTARD,        25, 3,
    xi.items.BAG_OF_RYE_FLOUR,             36, 3,
    xi.items.CHUNK_OF_ROCK_SALT,           14, 3,
    xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
    xi.items.SPRIG_OF_CIBOL,             198, 3,
}

xi.eraShops.Ostalie =
{
    xi.items.ETHER,                      4445, 1,
    xi.items.POTION,                      837, 1,
    xi.items.FLASK_OF_ECHO_DROPS,         736, 2,
    xi.items.ANTIDOTE,                    290, 3,
    xi.items.CIRCLET,                    144, 3,
    xi.items.CUFFS,                      118, 3,
    xi.items.FLASK_OF_EYE_DROPS,         2387, 3,
    xi.items.HATCHET,                     450, 3,
    xi.items.LEATHER_BELT,               382, 3,
    xi.items.LIZARD_BELT,               2430, 3,
    xi.items.PICKAXE,                      180, 3,
    xi.items.ROBE,                       216, 3,
    xi.items.SLOPS,                      172, 3,
}

-- Windurst
xi.eraShops.HohbibaMubiba =
{
    xi.items.YEW_WAND,                   1440, 1,
    xi.items.ELM_STAFF,                  3642, 1,
    xi.items.ELM_POLE,                  18422, 1,
    xi.items.BRONZE_ROD,                   91, 1,
    xi.items.WILLOW_WAND,                 340, 2,
    xi.items.BONE_CUDGEL,                4945, 2,
    xi.items.HOLLY_STAFF,                 584, 2,
    xi.items.HOLLY_POLE,                 4669, 2,
    xi.items.MAPLE_WAND,                   47, 3,
    xi.items.ASH_CLUB,                     66, 3,
    xi.items.CHESTNUT_CLUB,              1600, 3,
    xi.items.ASH_STAFF,                    58, 3,
    xi.items.ASH_POLE,                    386, 3,
    xi.items.BRONZE_DAGGER,               140, 3,
}

xi.eraShops.TanikoManiko =
{
    xi.items.BRASS_ZAGHNAL,             2542, 1,
    xi.items.WRAPPED_BOW,               7999, 1,
    xi.items.ICE_ARROW,                  141, 1,
    xi.items.LIGHTNING_ARROW,            141, 1,
    xi.items.CAT_BAGHNAKHS,              104, 2,
    xi.items.CESTI,                      129, 2,
    xi.items.BONE_PICK,                 5864, 2,
    xi.items.SELF_BOW,                   493, 2,
    xi.items.WOODEN_ARROW,                 3, 2,
    xi.items.HAWKEYE,                     55, 2,
    xi.items.BOOMERANG,                 1610, 2,
    xi.items.BONE_AXE,                  4198, 3,
    xi.items.BRONZE_ZAGHNAL,             309, 3,
    xi.items.HARPOON,                     97, 3,
    xi.items.SHORTBOW,                    40, 3,
    xi.items.BONE_ARROW,                   4, 3,
}

xi.eraShops.GurunaMaguruna =
{
    xi.items.BEETLE_GORGET,              4714, 1,
    xi.items.LINEN_ROBE,                 2776, 1,
    xi.items.LINEN_CUFFS,                1570, 1,
    xi.items.TUNIC,                      1260, 2,
    xi.items.COTTON_DOUBLET,            12355, 2,
    xi.items.LEATHER_GLOVES,              324, 2,
    xi.items.MITTS,                       589, 2,
    xi.items.COTTON_GLOVES,              6696, 2,
    xi.items.HEMP_GORGET,                 972, 3,
    xi.items.DOUBLET,                    2470, 3,
    xi.items.ROBE,                        216, 3,
    xi.items.LEATHER_VEST,                604, 3,
    xi.items.GLOVES,                     1363, 3,
    xi.items.CUFFS,                       118, 3,
}

xi.eraShops.Kumama =
{
    xi.items.LINEN_SLOPS,               2268, 1,
    xi.items.HOLLY_CLOGS,               1462, 1,
    xi.items.MAHOGANY_SHIELD,           4481, 1,
    xi.items.LEATHER_TROUSERS,           482, 2,
    xi.items.COTTON_BRAIS,              9936, 2,
    xi.items.LEATHER_HIGHBOOTS,          309, 2,
    xi.items.SOLEA,                      544, 2,
    xi.items.COTTON_GAITERS,            6633, 2,
    xi.items.MAPLE_SHIELD,               556, 2,
    xi.items.BRAIS,                     1899, 3,
    xi.items.SLOPS,                      172, 3,
    xi.items.GAITERS,                   1269, 3,
    xi.items.ASH_CLOGS,                  111, 3,
    xi.items.LAUAN_SHIELD,               110, 3,
}

-- Windurst Woods
xi.eraShops.WijeTiren =
{
    4148,   290,       --Antidote
    4509,    10,       --Distilled Water
    4151,   728,       --Echo Drops
    4128,  4445,       --Ether
    4150,  2387,       --Eye Drops
    4112,   837,       --Potion
    5014,    98,       --Scroll of Herb Pastoral
}

xi.eraShops.Creepstix =
{
    5023,   8160, -- Scroll of Goblin Gavotte
    4734,   7074, -- Scroll of Protectra II
    4738,   1700, -- Scroll of Shellra
}

xi.eraShops.Hasim =
{
    4668,   1760, -- Scroll of Barfire
    4669,   3624, -- Scroll of Barblizzard
    4670,    930, -- Scroll of Baraero
    4671,    156, -- Scroll of Barstone
    4672,   5754, -- Scroll of Barthunder
    4673,    360, -- Scroll of Barwater
    4674,   1760, -- Scroll of Barfira
    4675,   3624, -- Scroll of Barblizzara
    4676,    930, -- Scroll of Baraera
    4677,    156, -- Scroll of Barstonra
    4678,   5754, -- Scroll of Barthundra
    4679,    360, -- Scroll of Barwatera
    4680,    244, -- Scroll of Barsleep
    4612,  23400, -- Scroll of Cure IV
    4616,  11200, -- Scroll of Curaga II
    4617,  19932, -- Scroll of Curaga III
    4653,  32000, -- Scroll of Protect III
}

xi.eraShops.Stinknix =
{
    943,    294, -- Poison Dust
    944,   1035, -- Venom Dust
    945,   2000, -- Paralysis Dust
    17320,    7, -- Iron Arrow
    17336,    5, -- Crossbow Bolt
    17313, 1107, -- Grenade
}

xi.eraShops.Susu =
{
    4647, 20000, -- Scroll of Banishga II
    4683,  2030, -- Scroll of Barblind
    4697,  2030, -- Scroll of Barblindra
    4682,   780, -- Scroll of Barparalyze
    4696,   780, -- Scroll of Barparalyzra
    4681,   400, -- Scroll of Barpoison
    4695,   400, -- Scroll of Barpoisonra
    4684,  4608, -- Scroll of Barsilence
    4698,  4608, -- Scroll of Barsilencera
    4680,   244, -- Scroll of Barsleep
    4694,   244, -- Scroll of Barsleepra
    4628,  8586, -- Scroll of Cursna
    4629, 35000, -- Scroll of Holy
    4625,  2330, -- Scroll of Silena
    4626, 19200, -- Scroll of Stona
    4627, 13300, -- Scroll of Viruna
}

xi.eraShops.Taza =
{
    4881, 10304, -- Scroll of Sleepga
    4658, 26244, -- Scroll of Shell III
    4735, 19200, -- Scroll of Protectra III
    4739, 14080, -- Scroll of Shellra II
    4740, 26244, -- Scroll of Shellra III
    4685, 15120, -- Scroll of Barpetrify
    4686,  9600, -- Scroll of Barvirus
    4699, 15120, -- Scroll of Barpetra
    4700,  9600, -- Scroll of Barvira
    4867, 18720, -- Scroll of Sleep II
    4769, 19932, -- Scroll of Stone III
    4779, 22682, -- Scroll of Water III
    4764, 27744, -- Scroll of Aero III
    4754, 33306, -- Scroll of Fire III
    4759, 39368, -- Scroll of Blizzard III
    4774, 45930, -- Scroll of Thunder III
}

-- Upper Jeuno
xi.eraShops.Coumuna =
{
    16705,  4550, -- Greataxe
    16518, 31000, -- Mythril Degen
    16460, 12096, -- Kris
    16467, 14560, -- Mythril Knife
    16399, 15488, -- Katars
    16589, 13962, -- Two-Handed Sword
    16412, 29760, -- Mythril Claws
    16567, 85250, -- Knight's Sword
}

xi.eraShops.Areebah =
{
    636,  119, -- Chamomile
    951,  110, -- Wijnruit
    948,   60, -- Carnation
    941,   80, -- Red Rose
    949,   96, -- Rain Lily
    956,  120, -- Lilac
    957,  120, -- Amaryllis
    958,  120, -- Marguerite
}

--Kazham
xi.eraShops.TojiMumosulah =
{
    112,    456, -- Yellow Jar
    13199,   95, -- Blood Stone
    13076, 3510, -- Fang Necklace
    13321, 1667, -- Bone Earring
    17351, 4747, -- Gemshorn
    16993,   69, -- Peeled Crayfish
    16998,   36, -- Insect Paste
    17876,  165, -- Fish Broth
    17880,  695, -- Seedbed Soil
    1021,   450, -- Hatchet
    4987,   328, -- Scroll of Army's Paeon II
    4988,  3312, -- Scroll of Army's Paeon III
}

-- Rulude Gardens
xi.eraShops.DabihJajalioh =
{
    957,     120, -- Amaryllis
    948,      60, -- Carnation
    636,     119, -- Chamomile
    956,     120, -- Lilac
    958,     120, -- Marguerite
    949,      96, -- Rain Lily
    941,      80, -- Red Rose
    951,     110, -- Wijnruit
}

-- Mhaura
xi.eraShops.PikiniMikini =
{
    4150, 2335,    -- Eye Drops
    4148,  284,    -- Antidote
    4151,  720,    -- Echo Drops
    4112,  819,    -- Potion
    4509,   10,    -- Distilled Water
    917,  1821,    -- Parchment
    17395,   9,    -- Lugworm
    1021,  450,    -- Hatchet
    4376,  108,    -- Meat Jerky
    5299,  133,    -- Salsa
}

-- Selbina
xi.eraShops.Dohdjuma =
{
    611,    36,    -- Rye Flour
    5011,  233,    -- Scroll of Sheepfoe Mambo
    4150, 2335,    -- Eye Drops
    4148,  284,    -- Antidote
    4509,   10,    -- Distilled Water
    4112,  819,    -- Potion
    17395,  10,    -- Lugworm
    4378,   54,    -- Selbina Milk
    4490,  432,    -- Pickled Herring
    4559, 4485,    -- Herb Quus
}

--Nashmau
xi.eraShops.Mamaroon =
{
    4860,  27000, -- Scroll of Stun
    4708,   5160, -- Scroll of Enfire
    4709,   4098, -- Scroll of Enblizzard
    4710,   2500, -- Scroll of Enaero
    4711,   2030, -- Scroll of Entone
    4712,   1515, -- Scroll of Enthunder
    4713,   7074, -- Scroll of Enwater
    4859,   9000, -- Scroll of Shock Spikes
    2502,  29950, -- White Puppet Turban
    2501,  29950, -- Black Puppet Turban
}

xi.eraShops.Yoyoroon =
{
    2239,  4940, -- Tension Spring
    2243,  4940, -- Loudspeaker
    2246,  4940, -- Accelerator
    2251,  4940, -- Armor Plate
    2254,  4940, -- Stabilizer
    2258,  4940, -- Mana Jammer
    2262,  4940, -- Auto-Repair Kit
    2266,  4940, -- Mana Tank
    2240,  9925, -- Inhibitor
    2242,  9925, -- Mana Booster
    2247,  9925, -- Scope
    2250,  9925, -- Shock Absorber
    2255,  9925, -- Volt Gun
    2260,  9925, -- Stealth Screen
    2264,  9925, -- Damage Gauge
    2268,  9925, -- Mana Conserver
}

-- Norg
xi.eraShops.SolbyMaholby =
{
    17395,     9, -- Lugworm
    4899,    450, -- Earth Spirit Pact
}


-- Port Jeuno
xi.eraShops.Gekko =
{
    4150,  2387, -- Eye Drops
    4148,   290, -- Antidote
    4151,   720, -- Echo Drops
    4112,   837, -- Potion
    4128,  4445, -- Ether
    4365,   120, -- Rolanberry
    189,  36000, -- Autumn's End
    188,  31224, -- Acolyte's Grief
}

-- Rabao
xi.eraShops.Brave_Ox =
{
    4654,  77350, -- Protect IV
    4736,  73710, -- Protectra IV
    4868,  63700, -- Dispel
    4860,  31850, -- Stun
    4720,  31850, -- Flash
    4750, 546000, -- Reraise III
    4638,  78260, -- Banish III
    -- 4701, 20092, -- Cura
    -- 4702, 62192, -- Sacrifice
    -- 4703, 64584, -- Esuna
    -- 4704, 30967, -- Auspice
}

-- Upper Jeuno
xi.eraShops.Antonia =
{
    17061,  6256, -- Mythril Rod
    17027, 11232, -- Oak Cudgel
    17036, 18048, -- Mythril Mace
    17044,  6033, -- Warhammer
    17098, 37440, -- Oak Pole
    16836, 44550, -- Halberd
    16774, 10596, -- Scythe
    17320,     7, -- Iron Arrow
}

-- Windurst Waters
xi.eraShops.OrezEbrez =
{
    12466, 20000,1, --Red Cap
    12458,  8972,1, --Soil Hachimaki
    12455,  7026,1, --Beetle Mask
    12472,   144,2, --Circlet
    12465,  8024,2, --Cotton Headgear
    12440,   396,2, --Leather Bandana
    12473,  1863,2, --Poet's Circlet
    12499, 14400,2, --Flax Headband
    12457,  3272,2, --Cotton Hachimaki
    12454,  3520,2, --Bone Mask
    12474, 10924,2, --Wool Hat
    12464,  1742,3, --Headgear
    12456,   552,3, --Hachimaki
    12498,  1800,3, --Cotton Headband
    12448,   151,3, --Bronze Cap
    12449,  1471,3, --Brass Cap
}

-- Windurst Woods
xi.eraShops.Mono_Nchaa =
{
    xi.items.WOODEN_ARROW,                 3, 2,
    xi.items.HAWKEYE,                     55, 2,
    xi.items.LIGHT_CROSSBOW,             165, 2,
    xi.items.BONE_ARROW,                   4, 3,
    xi.items.CROSSBOW_BOLT,                5, 3,
    xi.items.SCROLL_OF_HUNTERS_PRELUDE,  2649, 3,
}


local lookupTable =
--[[
    Nation: {"nation",Zone,NPCName,customShopTable,nation,DIALOG_NAME}
    No Fame: {"nofame",Zone,NPCName,customShopTable,DIALOG_NAME}
    No Shop: {"none",Zone,NPCName}
    Standard: {"standard",Zone,NPCName,customShopTable,fameArea,DIALOG_NAME}
    Tenshodo: {"tenshodo",Zone,NPCName,customShopTable,fameArea,DIALOG_NAME}
--]]

{
    -- Bastok
    {"nation", "Bastok_Markets", "Mjoll", xi.eraShops.Mjoll, xi.nation.BASTOK, "MJOLL_SHOP_DIALOG", 1},
    {"nation", "Bastok_Markets", "Charging_Chocobo", xi.eraShops.Charging_Chocobo, xi.nation.BASTOK, "CHARGINGCHOCOBO_SHOP_DIALOG", 1},
    {"nation", "Bastok_Markets", "Zhikkom", xi.eraShops.Zhikkom, xi.nation.BASTOK, "ZHIKKOM_SHOP_DIALOG", 1},
    {"nation", "Bastok_Markets", "Peritrage", xi.eraShops.Peritrage, xi.nation.BASTOK, "PERITRAGE_SHOP_DIALOG", 1},
    {"nation", "Bastok_Markets", "Ciqala", xi.eraShops.Ciqala, xi.nation.BASTOK, "CIQALA_SHOP_DIALOG", 1},
    {"nation", "Bastok_Markets", "Hortense", xi.eraShops.Hortense, xi.nation.BASTOK, "HORTENSE_SHOP_DIALOG", 1},
    {"nation", "Bastok_Markets", "Sororo", xi.eraShops.Sororo, xi.nation.BASTOK, "SORORO_SHOP_DIALOG", 1},
    {"standard", "Port_Bastok", "Valeriano", xi.eraShops.Valeriano, xi.quest.fame_area.BASTOK, "VALERIANO_SHOP_DIALOG", 1},
    {"nation", "Port_Bastok", "Numa", xi.eraShops.Numa, xi.nation.BASTOK, "NUMA_SHOP_DIALOG", 1},
    {"nation", "Metalworks", "Nogga", xi.eraShops.Nogga, xi.nation.BASTOK, "NOGGA_SHOP_DIALOG", 1},

    -- Sandoria
    {"nation", "Northern_San_dOria", "Arlenne", xi.eraShops.Arlenne, xi.nation.SANDORIA, "ARLENNE_SHOP_DIALOG", 1},
    {"nation", "Northern_San_dOria", "Tavourine", xi.eraShops.Tavourine, xi.nation.SANDORIA, "TAVOURINE_SHOP_DIALOG", 1},
    {"nation", "Northern_San_dOria", "Pirvidiauce", xi.eraShops.Pirvidiauce, xi.nation.SANDORIA, "PIRVIDIAUCE_SHOP_DIALOG", 1},
    {"nation", "Port_San_dOria", "Coullave", xi.eraShops.Coullave, xi.nation.SANDORIA, "COULLAVE_SHOP_DIALOG", 1},
    {"nation", "Southern_San_dOria", "Ashene", xi.eraShops.Ashene, xi.nation.SANDORIA, "ASH_THADI_ENE_SHOP_DIALOG", 1},
    {"nation", "Southern_San_dOria", "Carautia", xi.eraShops.Carautia, xi.nation.SANDORIA, "CARAUTIA_SHOP_DIALOG", 1},
    {"nation", "Southern_San_dOria", "Ferdoulemiont", xi.eraShops.Ferdoulemiont, xi.nation.SANDORIA, "FERDOULEMIONT_SHOP_DIALOG", 1},
    {"nation", "Southern_San_dOria", "Benaige", xi.eraShops.Benaige, xi.nation.SANDORIA, "BENAIGE_SHOP_DIALOG", 1},
    {"nation", "Southern_San_dOria", "Ostalie", xi.eraShops.Ostalie, xi.nation.SANDORIA, "OSTALIE_SHOP_DIALOG", 1},

    -- Windurst
    {"nation", "Port_Windurst", "Hohbiba-Mubiba", xi.eraShops.HohbibaMubiba, xi.nation.WINDURST, "HOHBIBAMUBIBA_SHOP_DIALOG", 1},
    {"nation", "Port_Windurst", "Taniko-Maniko", xi.eraShops.TanikoManiko, xi.nation.WINDURST, "TANIKOMANIKO_SHOP_DIALOG", 1},
    {"nation", "Port_Windurst", "Guruna-Maguruna", xi.eraShops.GurunaMaguruna, xi.nation.WINDURST, "GURUNAMAGURUNA_SHOP_DIALOG", 1},
    {"nation", "Port_Windurst", "Kumama", xi.eraShops.Kumama, xi.nation.WINDURST, "KUMAMA_SHOP_DIALOG", 1},
    {"nation", "Windurst_Waters", "Orez-Ebrez", xi.eraShops.OrezEbrez, xi.nation.WINDURST, "OREZEBREZ_SHOP_DIALOG", 1},
    {"nation", "Windurst_Woods", "Mono_Nchaa", xi.eraShops.Mono_Nchaa, xi.nation.WINDURST, "MONONCHAA_SHOP_DIALOG", 1},
    {"standard", "Windurst_Woods", "Wije_Tiren", xi.eraShops.WijeTiren, xi.quest.fame_area.WINDURST, "WIJETIREN_SHOP_DIALOG", 1},
    {"standard", "Windurst_Woods", "Valeriano", xi.eraShops.Valeriano, xi.quest.fame_area.WINDURST, "VALERIANO_SHOP_DIALOG", 1},

    -- Jeuno
    {"standard", "Lower_Jeuno", "Creepstix", xi.eraShops.Creepstix, NULL, "JUNK_SHOP_DIALOG", 1},
    {"standard", "Lower_Jeuno", "Hasim", xi.eraShops.Hasim, NULL, "WAAG_DEEG_SHOP_DIALOG", 1},
    {"standard", "Lower_Jeuno", "Susu", xi.eraShops.Susu, NULL, "WAAG_DEEG_SHOP_DIALOG", 1},
    {"standard", "Lower_Jeuno", "Stinknix", xi.eraShops.Stinknix, NULL, "JUNK_SHOP_DIALOG", 1},
    {"standard", "Lower_Jeuno", "Taza", xi.eraShops.Taza, NULL, "WAAG_DEEG_SHOP_DIALOG", 1},
    {"standard", "Upper_Jeuno", "Antonia", xi.eraShops.Antonia, NULL, "VIETTES_SHOP_DIALOG", 1},
    {"standard", "Upper_Jeuno", "Coumuna", xi.eraShops.Coumuna, NULL, "VIETTES_SHOP_DIALOG", 1},
    {"standard", "Upper_Jeuno", "Areebah", xi.eraShops.Areebah, xi.quest.fame_area.JEUNO, "MP_SHOP_DIALOG", 1},
    {"standard", "RuLude_Gardens", "Dabih_Jajalioh", xi.eraShops.DabihJajalioh, xi.quest.fame_area.JEUNO, "DABIHJAJALIOH_SHOP_DIALOG", 1},
    {"standard", "Port_Jeuno", "Gekko", xi.eraShops.Gekko, xi.quest.fame_area.JEUNO, "DUTY_FREE_SHOP_DIALOG", 1},
    -- Mhaura
    {"standard", "Mhaura", "Pikini-Mikini", xi.eraShops.PikiniMikini, xi.quest.fame_area.WINDURST, "PIKINIMIKINI_SHOP_DIALOG", 1},
    -- Selbina
    {"standard", "Selbina", "Dohdjuma", xi.eraShops.Dohdjuma, xi.quest.fame_area.SELBINA_RABAO, "DOHDJUMA_SHOP_DIALOG", 1},
    -- Kazham
    {"standard", "Kazham", "Toji_Mumosulah", xi.eraShops.TojiMumosulah, xi.quest.fame_area.WINDURST, "TOJIMUMOSULAH_SHOP_DIALOG", 1},
    -- Norg
    {"standard", "Norg", "Solby-Maholby", xi.eraShops.SolbyMaholby, xi.quest.fame_area.NORG, "SOLBYMAHOLBY_SHOP_DIALOG", 1},
    -- Rabao
    {"standard", "Rabao", "Brave_Ox", xi.eraShops.Brave_Ox, NULL, "BRAVEOX_SHOP_DIALOG", 1},
    -- Nashmau
    {"nofame", "Nashmau", "Mamaroon", xi.eraShops.Mamaroon, "MAMAROON_SHOP_DIALOG", xi.settings.main.ENABLE_TOAU},
    {"nofame", "Nashmau", "Yoyoroon", xi.eraShops.Yoyoroon, "YOYOROON_SHOP_DIALOG", xi.settings.main.ENABLE_TOAU},
}

for _, shop in pairs(lookupTable) do
    local ID = require(string.format("scripts/zones/%s/IDs", shop[2]))
    local onTrigger = string.format("xi.zones.%s.npcs.%s.onTrigger", shop[2], shop[3])
    if
    shop[1] == 'nation' and
    shop[7] == 1
    then
        m:addOverride(onTrigger,
        function(player, npc)
            player:showText(npc, ID.text[shop[6]])
            xi.shop.nation(player, shop[4], shop[5])
        end)
    elseif
        shop[1] =='nofame' and
        shop[7] == 1
    then
        m:addOverride(onTrigger,
        function(player, npc)
            player:showText(npc, ID.text[shop[5]])
            xi.shop.general(player, shop[4])
        end)
    elseif
        shop[1] == 'none' and
        shop[4] == 1
    then
        m:addOverride(onTrigger,
        function(player, npc)
        end)
    elseif
        shop[1] == 'standard' and
        shop[7] == 1
    then
        m:addOverride(onTrigger,
        function(player, npc)
            player:showText(npc, ID.text[shop[6]])
            xi.shop.general(player, shop[4], shop[5])
        end)
    elseif
        shop[1] == 'tenshodo' and
        shop[7] == 1
    then
        m:addOverride(onTrigger,
        function(player, npc)
            if player:hasKeyItem(xi.ki.TENSHODO_MEMBERS_CARD) then
                player:showText(npc, ID.text[shop[6]])
                xi.shop.general(player, shop[4], shop[5])
            end
        end)
    end
end

return m