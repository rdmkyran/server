-----------------------------------
--
--  Armor Storage
--
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/items")
-----------------------------------

xi = xi or {}
xi.armorStorage = xi.armorStorage or {}

-- { SetId, SetGroup, SetMask, SetCount, Head, Body, Hands, Legs, Feet, StorageCost, KeyItem }
local armorSets =
{
    1,  4, 0x000001, 5, xi.items.FIGHTERS_MASK              , xi.items.FIGHTERS_LORICA           , xi.items.FIGHTERS_MUFFLERS          , xi.items.FIGHTERS_CUISSES          , xi.items.FIGHTERS_CALLIGAE           , 500,  xi.ki.FIGHTERS_ARMOR_CLAIM_SLIP,
    2,  4, 0x000002, 5, xi.items.TEMPLE_CROWN               , xi.items.TEMPLE_CYCLAS             , xi.items.TEMPLE_GLOVES              , xi.items.TEMPLE_HOSE               , xi.items.TEMPLE_GAITERS              , 500,  xi.ki.TEMPLE_ATTIRE_CLAIM_SLIP,
    3,  4, 0x000004, 5, xi.items.HEALERS_CAP                , xi.items.HEALERS_BRIAULT           , xi.items.HEALERS_MITTS              , xi.items.HEALERS_PANTALOONS        , xi.items.HEALERS_DUCKBILLS           , 500,  xi.ki.HEALERS_ATTIRE_CLAIM_SLIP,
    4,  4, 0x000008, 5, xi.items.WIZARDS_PETASOS            , xi.items.WIZARDS_COAT              , xi.items.WIZARDS_GLOVES             , xi.items.WIZARDS_TONBAN            , xi.items.WIZARDS_SABOTS              , 500,  xi.ki.WIZARDS_ATTIRE_CLAIM_SLIP,
    5,  4, 0x000010, 5, xi.items.WARLOCKS_CHAPEAU           , xi.items.WARLOCKS_TABARD           , xi.items.WARLOCKS_GLOVES            , xi.items.WARLOCKS_TIGHTS           , xi.items.WARLOCKS_BOOTS              , 500,  xi.ki.WARLOCKS_ARMOR_CLAIM_SLIP,
    6,  4, 0x000020, 5, xi.items.ROGUES_BONNET              , xi.items.ROGUES_VEST               , xi.items.ROGUES_ARMLETS             , xi.items.ROGUES_CULOTTES           , xi.items.ROGUES_POULAINES            , 500,  xi.ki.ROGUES_ATTIRE_CLAIM_SLIP,
    7,  4, 0x000040, 5, xi.items.GALLANT_CORONET            , xi.items.GALLANT_SURCOAT           , xi.items.GALLANT_GAUNTLETS          , xi.items.GALLANT_BREECHES          , xi.items.GALLANT_LEGGINGS            , 500,  xi.ki.GALLANT_ARMOR_CLAIM_SLIP,
    8,  4, 0x000080, 5, xi.items.CHAOS_BURGEONET            , xi.items.CHAOS_CUIRASS             , xi.items.CHAOS_GAUNTLETS            , xi.items.CHAOS_FLANCHARD           , xi.items.CHAOS_SOLLERETS             , 500,  xi.ki.CHAOS_ARMOR_CLAIM_SLIP,
    9,  4, 0x000100, 5, xi.items.BEAST_HELM                 , xi.items.BEAST_JACKCOAT            , xi.items.BEAST_GLOVES               , xi.items.BEAST_TROUSERS            , xi.items.BEAST_GAITERS               , 500,  xi.ki.BEAST_ARMOR_CLAIM_SLIP,
    10, 4, 0x000200, 5, xi.items.CHORAL_ROUNDLET            , xi.items.CHORAL_JUSTAUCORPS        , xi.items.CHORAL_CUFFS               , xi.items.CHORAL_CANNIONS           , xi.items.CHORAL_SLIPPERS             , 500,  xi.ki.CHORAL_ATTIRE_CLAIM_SLIP,
    11, 4, 0x000400, 5, xi.items.HUNTERS_BERET              , xi.items.HUNTERS_JERKIN            , xi.items.HUNTERS_BRACERS            , xi.items.HUNTERS_BRACCAE           , xi.items.HUNTERS_SOCKS               , 500,  xi.ki.HUNTERS_ATTIRE_CLAIM_SLIP,
    12, 4, 0x000800, 5, xi.items.MYOCHIN_KABUTO             , xi.items.MYOCHIN_DOMARU            , xi.items.MYOCHIN_KOTE               , xi.items.MYOCHIN_HAIDATE           , xi.items.MYOCHIN_SUNE_ATE            , 500,  xi.ki.MYOCHIN_ARMOR_CLAIM_SLIP,
    13, 4, 0x001000, 5, xi.items.NINJA_HATSUBURI            , xi.items.NINJA_CHAINMAIL           , xi.items.NINJA_TEKKO                , xi.items.NINJA_HAKAMA              , xi.items.NINJA_KYAHAN                , 500,  xi.ki.NINJAS_GARB_CLAIM_SLIP,
    14, 4, 0x002000, 5, xi.items.DRACHEN_ARMET              , xi.items.DRACHEN_MAIL              , xi.items.DRACHEN_FINGER_GAUNTLETS   , xi.items.DRACHEN_BRAIS             , xi.items.DRACHEN_GREAVES             , 500,  xi.ki.DRACHEN_ARMOR_CLAIM_SLIP,
    15, 4, 0x004000, 5, xi.items.EVOKERS_HORN               , xi.items.EVOKERS_DOUBLET           , xi.items.EVOKERS_BRACERS            , xi.items.EVOKERS_SPATS             , xi.items.EVOKERS_PIGACHES            , 500,  xi.ki.EVOKERS_ATTIRE_CLAIM_SLIP,
    16, 1, 0x000001, 5, xi.items.IRON_VISOR                 , xi.items.IRON_SCALE_MAIL           , xi.items.IRON_FINGER_GAUNTLETS      , xi.items.IRON_CUISSES              , xi.items.IRON_GREAVES                , 600,  xi.ki.IRON_SCALE_ARMOR_CLAIM_SLIP,
    17, 1, 0x000002, 5, xi.items.SHADE_TIARA                , xi.items.SHADE_HARNESS             , xi.items.SHADE_MITTENS              , xi.items.SHADE_TIGHTS              , xi.items.SHADE_LEGGINGS              , 300,  xi.ki.SHADE_HARNESS_CLAIM_SLIP,
    18, 1, 0x000004, 5, xi.items.BRASS_MASK                 , xi.items.BRASS_SCALE_MAIL          , xi.items.BRASS_FINGER_GAUNTLETS     , xi.items.BRASS_CUISSES             , xi.items.BRASS_GREAVES               , 400,  xi.ki.BRASS_SCALE_MAIL_CLAIM_SLIP,
    19, 1, 0x000008, 5, xi.items.WOOL_HAT                   , xi.items.WOOL_ROBE                 , xi.items.WOOL_CUFFS                 , xi.items.WOOL_SLOPS                , xi.items.CHESTNUT_SABOTS             , 400,  xi.ki.WOOL_ROBE_CLAIM_SLIP,
    20, 1, 0x000010, 5, xi.items.EISENSCHALLER              , xi.items.EISENBRUST                , xi.items.EISENHENTZES               , xi.items.EISENDIECHLINGS           , xi.items.EISENSCHUHS                 , 200,  xi.ki.EISENPLATTE_ARMOR_CLAIM_SLIP,
    21, 1, 0x000020, 5, xi.items.SOIL_HACHIMAKI             , xi.items.SOIL_GI                   , xi.items.SOIL_TEKKO                 , xi.items.SOIL_SITABAKI             , xi.items.SOIL_KYAHAN                 , 400,  xi.ki.SOIL_GI_CLAIM_SLIP,
    22, 1, 0x000040, 5, xi.items.SEERS_CROWN                , xi.items.SEERS_TUNIC               , xi.items.SEERS_MITTS                , xi.items.SEERS_SLACKS              , xi.items.SEERS_PUMPS                 , 200,  xi.ki.SEERS_TUNIC_CLAIM_SLIP,
    23, 1, 0x000080, 5, xi.items.STUDDED_BANDANA            , xi.items.STUDDED_VEST              , xi.items.STUDDED_GLOVES             , xi.items.STUDDED_TROUSERS          , xi.items.STUDDED_BOOTS               , 400,  xi.ki.STUDDED_ARMOR_CLAIM_SLIP,
    24, 1, 0x000100, 5, xi.items.CENTURIONS_VISOR           , xi.items.CENTURIONS_SCALE_MAIL     , xi.items.CENTURIONS_FINGER_GAUNTLETS, xi.items.CENTURIONS_CUISSES        , xi.items.CENTURIONS_GREAVES          , 200,  xi.ki.CENTURIONS_SCALE_MAIL_CLAIM_SLIP,
    25, 1, 0x000200, 5, xi.items.MERCENARY_CAPTAINS_HEADGEAR, xi.items.MERCENARY_CAPTAINS_DOUBLET, xi.items.MERCENARY_CAPTAINS_GLOVES  , xi.items.MERCENARY_CAPTAINS_HOSE   , xi.items.MERCENARY_CAPTAINS_GAITERS  , 200,  xi.ki.MRCCPT_DOUBLET_CLAIM_SLIP,
    26, 1, 0x000400, 5, xi.items.GARISH_CROWN               , xi.items.GARISH_TUNIC              , xi.items.GARISH_MITTS               , xi.items.GARISH_SLACKS             , xi.items.GARISH_PUMPS                , 400,  xi.ki.GARISH_TUNIC_CLAIM_SLIP,
    27, 1, 0x000800, 5, xi.items.NOCT_BERET                 , xi.items.NOCT_DOUBLET              , xi.items.NOCT_GLOVES                , xi.items.NOCT_BRAIS                , xi.items.NOCT_GAITERS                , 200,  xi.ki.NOCT_DOUBLET_CLAIM_SLIP,
    28, 2, 0x000001, 4, xi.items.NONE                       , xi.items.CUSTOM_TUNIC              , xi.items.CUSTOM_M_GLOVES            , xi.items.CUSTOM_SLACKS             , xi.items.CUSTOM_M_BOOTS              , 250,  xi.ki.CUSTOM_ARMOR_MALE_CLAIM_SLIP,
    29, 2, 0x000002, 4, xi.items.NONE                       , xi.items.CUSTOM_VEST               , xi.items.CUSTOM_F_GLOVES            , xi.items.CUSTOM_PANTS              , xi.items.CUSTOM_F_BOOTS              , 250,  xi.ki.CUSTOM_ARMOR_FEMALE_CLAIM_SLIP,
    30, 2, 0x000004, 4, xi.items.NONE                       , xi.items.MAGNA_JERKIN              , xi.items.MAGNA_GAUNTLETS            , xi.items.MAGNA_M_CHAUSSES          , xi.items.MAGNA_M_LEDELSENS           , 250,  xi.ki.MAGNA_ARMOR_MALE_CLAIM_SLIP,
    31, 2, 0x000008, 4, xi.items.NONE                       , xi.items.MAGNA_BODICE              , xi.items.MAGNA_GLOVES               , xi.items.MAGNA_F_CHAUSSES          , xi.items.MAGNA_F_LEDELSENS           , 250,  xi.ki.MAGNA_ARMOR_FEMALE_CLAIM_SLIP,
    32, 2, 0x000010, 4, xi.items.NONE                       , xi.items.WONDER_KAFTAN             , xi.items.WONDER_MITTS               , xi.items.WONDER_BRACCAE            , xi.items.WONDER_CLOMPS               , 250,  xi.ki.WONDER_ARMOR_CLAIM_SLIP,
    33, 2, 0x000020, 4, xi.items.NONE                       , xi.items.SAVAGE_SEPARATES          , xi.items.SAVAGE_GAUNTLETS           , xi.items.SAVAGE_LOINCLOTH          , xi.items.SAVAGE_GAITERS              , 250,  xi.ki.SAVAGE_ARMOR_CLAIM_SLIP,
    34, 2, 0x000040, 4, xi.items.NONE                       , xi.items.ELDERS_SURCOAT            , xi.items.ELDERS_BRACERS             , xi.items.ELDERS_BRAGUETTE          , xi.items.ELDERS_SANDALS              , 250,  xi.ki.ELDER_ARMOR_CLAIM_SLIP,
    35, 2, 0x000080, 4, xi.items.NONE                       , xi.items.CLOAK                     , xi.items.LINEN_MITTS                , xi.items.LINEN_SLACKS              , xi.items.SHOES                       , 500,  xi.ki.LINEN_CLOAK_CLAIM_SLIP,
    36, 2, 0x000100, 5, xi.items.PADDED_CAP                 , xi.items.PADDED_ARMOR              , xi.items.IRON_MITTENS               , xi.items.IRON_SUBLIGAR             , xi.items.LEGGINGS                    , 500,  xi.ki.PADDED_ARMOR_CLAIM_SLIP,
    37, 2, 0x000200, 5, xi.items.SILVER_MASK                , xi.items.SILVER_MAIL               , xi.items.SILVER_MITTENS             , xi.items.SILVER_HOSE               , xi.items.SILVER_GREAVES              , 500,  xi.ki.SILVER_CHAINMAIL_CLAIM_SLIP,
    38, 2, 0x000400, 5, xi.items.RED_CAP                    , xi.items.GAMBISON                  , xi.items.BRACERS                    , xi.items.HOSE                      , xi.items.SOCKS                       , 600,  xi.ki.GAMBISON_CLAIM_SLIP,
    39, 2, 0x000800, 5, xi.items.IRON_MASK                  , xi.items.CHAINMAIL                 , xi.items.CHAIN_MITTENS              , xi.items.CHAIN_HOSE                , xi.items.GREAVES                     , 150,  xi.ki.IRON_CHAINMAIL_CLAIM_SLIP,
    40, 2, 0x001000, 5, xi.items.CUIR_BANDANA               , xi.items.CUIR_BOUILLI              , xi.items.CUIR_GLOVES                , xi.items.CUIR_TROUSERS             , xi.items.CUIR_HIGHBOOTS              , 600,  xi.ki.CUIR_ARMOR_CLAIM_SLIP,
    41, 2, 0x002000, 5, xi.items.VELVET_HAT                 , xi.items.VELVET_ROBE               , xi.items.VELVET_CUFFS               , xi.items.VELVET_SLOPS              , xi.items.EBONY_SABOTS                , 600,  xi.ki.VELVET_ROBE_CLAIM_SLIP,
    42, 2, 0x004000, 4, xi.items.LILAC_CORSAGE              , xi.items.OPALINE_DRESS             , xi.items.NONE                       , xi.items.OPALINE_HOSE              , xi.items.OPALINE_BOOTS               , 600,  xi.ki.OPALINE_DRESS_CLAIM_SLIP,
    43, 2, 0x008000, 5, xi.items.ROYAL_SQUIRES_HELM         , xi.items.ROYAL_SQUIRES_CHAINMAIL   , xi.items.ROYAL_SQUIRES_MUFFLERS     , xi.items.ROYAL_SQUIRES_BREECHES    , xi.items.ROYAL_SQUIRES_SOLLERETS     , 300,  xi.ki.RYLSQR_CHAINMAIL_CLAIM_SLIP,
    44, 2, 0x010000, 5, xi.items.SALLET                     , xi.items.BREASTPLATE               , xi.items.GAUNTLETS                  , xi.items.CUISSES                   , xi.items.PLATE_LEGGINGS              , 600,  xi.ki.PLATE_ARMOR_CLAIM_SLIP,
    45, 2, 0x020000, 4, xi.items.NONE                       , xi.items.COMBAT_CASTERS_CLOAK      , xi.items.COMBAT_CASTERS_MITTS       , xi.items.COMBAT_CASTERS_SLACKS     , xi.items.COMBAT_CASTERS_SHOES        , 600,  xi.ki.COMBAT_CASTERS_CLOAK_CLAIM_SLIP,
    46, 3, 0x000001, 5, xi.items.ALUMINE_SALADE             , xi.items.ALUMINE_HAUBERT           , xi.items.ALUMINE_MOUFLES            , xi.items.ALUMINE_BRAYETTES         , xi.items.ALUMINE_SOLLERETS           , 700,  xi.ki.ALUMINE_HAUBERT_CLAIM_SLIP,
    47, 3, 0x000002, 5, xi.items.CARAPACE_MASK              , xi.items.CARAPACE_HARNESS          , xi.items.CARAPACE_MITTENS           , xi.items.CARAPACE_SUBLIGAR         , xi.items.CARAPACE_LEGGINGS           , 700,  xi.ki.CARAPACE_HARNESS_CLAIM_SLIP,
    48, 3, 0x000004, 5, xi.items.BANDED_HELM                , xi.items.BANDED_MAIL               , xi.items.MUFFLERS                   , xi.items.BREECHES                  , xi.items.SOLLERETS                   , 800,  xi.ki.BANDED_MAIL_CLAIM_SLIP,
    49, 3, 0x000008, 5, xi.items.ZUNARI_KABUTO              , xi.items.HARA_ATE                  , xi.items.KOTE                       , xi.items.HAIDATE                   , xi.items.SUNE_ATE                    , 800,  xi.ki.HARA_ATE_CLAIM_SLIP,
    50, 3, 0x000010, 5, xi.items.RAPTOR_HELM                , xi.items.RAPTOR_JERKIN             , xi.items.RAPTOR_GLOVES              , xi.items.RAPTOR_TROUSERS           , xi.items.RAPTOR_LEDELSENS            , 800,  xi.ki.RAPTOR_ARMOR_CLAIM_SLIP,
    51, 3, 0x000020, 5, xi.items.STEEL_VISOR                , xi.items.STEEL_SCALE_MAIL          , xi.items.STEEL_FINGER_GAUNTLETS     , xi.items.STEEL_CUISSES             , xi.items.STEEL_GREAVES               , 800,  xi.ki.STEEL_SCALE_ARMOR_CLAIM_SLIP,
    52, 3, 0x000040, 5, xi.items.WOOL_CAP                   , xi.items.WOOL_GAMBISON             , xi.items.WOOL_BRACERS               , xi.items.WOOL_HOSE                 , xi.items.WOOL_SOCKS                  , 800,  xi.ki.WOOL_GAMBISON_CLAIM_SLIP,
    53, 3, 0x000080, 5, xi.items.SHINOBI_HACHIGANE          , xi.items.SHINOBI_GI                , xi.items.SHINOBI_TEKKO              , xi.items.SHINOBI_HAKAMA            , xi.items.SHINOBI_KYAHAN              , 800,  xi.ki.SHINOBI_GI_CLAIM_SLIP,
    54, 3, 0x000200, 5, xi.items.IRON_MUSKETEERS_ARMET      , xi.items.IRON_MUSKETEERS_CUIRASS   , xi.items.IRON_MUSKETEERS_GAUNTLETS  , xi.items.IRON_MUSKETEERS_CUISSES   , xi.items.IRON_MUSKETEERS_SABATONS    , 800,  xi.ki.IRNMSK_CUIRASS_CLAIM_SLIP,
    55, 3, 0x000400, 5, xi.items.TACTICIAN_MAGICIANS_HAT    , xi.items.TACTICIAN_MAGICIANS_COAT  , xi.items.TACTICIAN_MAGICIANS_CUFFS  , xi.items.TACTICIAN_MAGICIANS_SLOPS , xi.items.TACTICIAN_MAGICIANS_PIGACHES, 800,  xi.ki.TCTMGC_CLOAK_CLAIM_SLIP,
    56, 3, 0x000800, 4, xi.items.NONE                       , xi.items.WHITE_CLOAK               , xi.items.BLACK_MITTS                , xi.items.WHITE_SLACKS              , xi.items.MOCCASINS                   , 800,  xi.ki.WHITE_CLOAK_CLAIM_SLIP,
    57, 3, 0x001000, 5, xi.items.AUSTERE_HAT                , xi.items.AUSTERE_ROBE              , xi.items.AUSTERE_CUFFS              , xi.items.AUSTERE_SLOPS             , xi.items.AUSTERE_SABOTS              , 800,  xi.ki.AUSTERE_ROBE_CLAIM_SLIP,
    58, 3, 0x000100, 5, xi.items.MYTHRIL_SALLET             , xi.items.MYTHRIL_BREASTPLATE       , xi.items.MYTHRIL_GAUNTLETS          , xi.items.MYTHRIL_CUISSES           , xi.items.MYTHRIL_LEGGINGS            , 800,  xi.ki.MYTHRIL_PLATE_ARMOR_CLAIM_SLIP,
    59, 3, 0x002000, 5, xi.items.CROW_BERET                 , xi.items.CROW_JUPON                , xi.items.CROW_BRACERS               , xi.items.CROW_HOSE                 , xi.items.CROW_GAITERS                , 800,  xi.ki.CROW_JUPON_CLAIM_SLIP,
    60, 4, 0x008000, 5, xi.items.MAGUS_KEFFIYEH             , xi.items.MAGUS_JUBBAH              , xi.items.MAGUS_BAZUBANDS            , xi.items.MAGUS_SHALWAR             , xi.items.MAGUS_CHARUQS               , 500,  xi.ki.MAGUS_ATTIRE_CLAIM_SLIP,
    61, 4, 0x010000, 5, xi.items.CORSAIRS_TRICORNE          , xi.items.CORSAIRS_FRAC             , xi.items.CORSAIRS_GANTS             , xi.items.CORSAIRS_CULOTTES         , xi.items.CORSAIRS_BOTTES             , 500,  xi.ki.CORSAIRS_ATTIRE_CLAIM_SLIP,
    62, 4, 0x020000, 5, xi.items.PUPPETRY_TAJ               , xi.items.PUPPETRY_TOBE             , xi.items.PUPPETRY_DASTANAS          , xi.items.PUPPETRY_CHURIDARS        , xi.items.PUPPETRY_BABOUCHES          , 500,  xi.ki.PUPPETRY_ATTIRE_CLAIM_SLIP,
    63, 6, 0x000001, 5, xi.items.WARRIORS_MASK              , xi.items.WARRIORS_LORICA           , xi.items.WARRIORS_MUFFLERS          , xi.items.WARRIORS_CUISSES          , xi.items.WARRIORS_CALLIGAE           , 1000, xi.ki.WARRIORS_ARMOR_CLAIM_SLIP,
    64, 6, 0x000002, 5, xi.items.MELEE_CROWN                , xi.items.MELEE_CYCLAS              , xi.items.MELEE_GLOVES               , xi.items.MELEE_HOSE                , xi.items.MELEE_GAITERS               , 1000, xi.ki.MELEE_ATTIRE_CLAIM_SLIP,
    65, 6, 0x000004, 5, xi.items.CLERICS_CAP                , xi.items.CLERICS_BRIAULT           , xi.items.CLERICS_MITTS              , xi.items.CLERICS_PANTALOONS        , xi.items.CLERICS_DUCKBILLS           , 1000, xi.ki.CLERICS_ATTIRE_CLAIM_SLIP,
    66, 6, 0x000008, 5, xi.items.SORCERERS_PETASOS          , xi.items.SORCERERS_COAT            , xi.items.SORCERERS_GLOVES           , xi.items.SORCERERS_TONBAN          , xi.items.SORCERERS_SABOTS            , 1000, xi.ki.SORCERERS_ATTIRE_CLAIM_SLIP,
    67, 6, 0x000010, 5, xi.items.DUELISTS_CHAPEAU           , xi.items.DUELISTS_TABARD           , xi.items.DUELISTS_GLOVES            , xi.items.DUELISTS_TIGHTS           , xi.items.DUELISTS_BOOTS              , 1000, xi.ki.DUELISTS_ARMOR_CLAIM_SLIP,
    68, 6, 0x000020, 5, xi.items.ASSASSINS_BONNET           , xi.items.ASSASSINS_VEST            , xi.items.ASSASSINS_ARMLETS          , xi.items.ASSASSINS_CULOTTES        , xi.items.ASSASSINS_POULAINES         , 1000, xi.ki.ASSASSINS_ATTIRE_CLAIM_SLIP,
    69, 6, 0x000040, 5, xi.items.VALOR_CORONET              , xi.items.VALOR_SURCOAT             , xi.items.VALOR_GAUNTLETS            , xi.items.VALOR_BREECHES            , xi.items.VALOR_LEGGINGS              , 1000, xi.ki.VALOR_ARMOR_CLAIM_SLIP,
    70, 6, 0x000080, 5, xi.items.ABYSS_BURGEONET            , xi.items.ABYSS_CUIRASS             , xi.items.ABYSS_GAUNTLETS            , xi.items.ABYSS_FLANCHARD           , xi.items.ABYSS_SOLLERETS             , 1000, xi.ki.ABYSS_ARMOR_CLAIM_SLIP,
    71, 6, 0x000100, 5, xi.items.MONSTER_HELM               , xi.items.MONSTER_JACKCOAT          , xi.items.MONSTER_GLOVES             , xi.items.MONSTER_TROUSERS          , xi.items.MONSTER_GAITERS             , 1000, xi.ki.MONSTER_ARMOR_CLAIM_SLIP,
    72, 6, 0x000200, 5, xi.items.BARDS_ROUNDLET             , xi.items.BARDS_JUSTAUCORPS         , xi.items.BARDS_CUFFS                , xi.items.BARDS_CANNIONS            , xi.items.BARDS_SLIPPERS              , 1000, xi.ki.BARDS_ATTIRE_CLAIM_SLIP,
    73, 6, 0x000400, 5, xi.items.SCOUTS_BERET               , xi.items.SCOUTS_JERKIN             , xi.items.SCOUTS_BRACERS             , xi.items.SCOUTS_BRACCAE            , xi.items.SCOUTS_SOCKS                , 1000, xi.ki.SCOUTS_ATTIRE_CLAIM_SLIP,
    74, 6, 0x000800, 5, xi.items.SAOTOME_KABUTO             , xi.items.SAOTOME_DOMARU            , xi.items.SAOTOME_KOTE               , xi.items.SAOTOME_HAIDATE           , xi.items.SAOTOME_SUNE_ATE            , 1000, xi.ki.SAOTOME_ARMOR_CLAIM_SLIP,
    75, 6, 0x001000, 5, xi.items.KOGA_HATSUBURI             , xi.items.KOGA_CHAINMAIL            , xi.items.KOGA_TEKKO                 , xi.items.KOGA_HAKAMA               , xi.items.KOGA_KYAHAN                 , 1000, xi.ki.KOGA_GARB_CLAIM_SLIP,
    76, 6, 0x002000, 5, xi.items.WYRM_ARMET                 , xi.items.WYRM_MAIL                 , xi.items.WYRM_FINGER_GAUNTLETS      , xi.items.WYRM_BRAIS                , xi.items.WYRM_GREAVES                , 1000, xi.ki.WYRM_ARMOR_CLAIM_SLIP,
    77, 6, 0x004000, 5, xi.items.SUMMONERS_HORN             , xi.items.SUMMONERS_DOUBLET         , xi.items.SUMMONERS_BRACERS          , xi.items.SUMMONERS_SPATS           , xi.items.SUMMONERS_PIGACHES          , 1000, xi.ki.SUMMONERS_ATTIRE_CLAIM_SLIP,
    78, 4, 0x040000, 5, xi.items.DANCERS_TIARA_M            , xi.items.DANCERS_CASAQUE_M         , xi.items.DANCERS_BANGLES_M          , xi.items.DANCERS_TIGHTS_M          , xi.items.DANCERS_TOE_SHOES_M         , 500,  xi.ki.DANCERS_ATTIRE_CLAIM_SLIP_M,
    79, 4, 0x080000, 5, xi.items.DANCERS_TIARA_F            , xi.items.DANCERS_CASAQUE_F         , xi.items.DANCERS_BANGLES_F          , xi.items.DANCERS_TIGHTS_F          , xi.items.DANCERS_TOE_SHOES_F         , 500,  xi.ki.DANCERS_ATTIRE_CLAIM_SLIP_F,
    80, 4, 0x100000, 5, xi.items.SCHOLARS_MORTARBOARD       , xi.items.SCHOLARS_GOWN             , xi.items.SCHOLARS_BRACERS           , xi.items.SCHOLARS_PANTS            , xi.items.SCHOLARS_LOAFERS            , 500,  xi.ki.SCHOLARS_ATTIRE_CLAIM_SLIP,
    81, 4, 0x200000, 5, xi.items.AMIR_PUGGAREE              , xi.items.AMIR_KORAZIN              , xi.items.AMIR_KOLLUKS               , xi.items.AMIR_DIRS                 , xi.items.AMIR_BOOTS                  , 1000, xi.ki.AMIR_ARMOR_CLAIM_SLIP,
    82, 4, 0x400000, 5, xi.items.PAHLUWAN_QALANSUWA         , xi.items.PAHLUWAN_KHAZAGAND        , xi.items.PAHLUWAN_DASTANAS          , xi.items.PAHLUWAN_SERAWEELS        , xi.items.PAHLUWAN_CRACKOWS           , 1000, xi.ki.PAHLUWAN_ARMOR_CLAIM_SLIP,
    83, 4, 0x800000, 5, xi.items.YIGIT_TURBAN               , xi.items.YIGIT_GOMLEK              , xi.items.YIGIT_GAGES                , xi.items.YIGIT_SERAWEELS           , xi.items.YIGIT_CRACKOWS              , 1000, xi.ki.YIGIT_ARMOR_CLAIM_SLIP,
    84, 6, 0x008000, 5, xi.items.MIRAGE_KEFFIYEH            , xi.items.MIRAGE_JUBBAH             , xi.items.MIRAGE_BAZUBANDS           , xi.items.MIRAGE_SHALWAR            , xi.items.MIRAGE_CHARUQS              , 1000, xi.ki.MIRAGE_ATTIRE_CLAIM_SLIP,
    85, 6, 0x010000, 5, xi.items.COMMODORE_TRICORNE         , xi.items.COMMODORE_FRAC            , xi.items.COMMODORE_GANTS            , xi.items.COMMODORE_TREWS           , xi.items.COMMODORE_BOTTES            , 1000, xi.ki.COMMODORE_ATTIRE_CLAIM_SLIP,
    86, 6, 0x020000, 5, xi.items.PANTIN_TAJ                 , xi.items.PANTIN_TOBE               , xi.items.PANTIN_DASTANAS            , xi.items.PANTIN_CHURIDARS          , xi.items.PANTIN_BABOUCHES            , 1000, xi.ki.PANTIN_ATTIRE_CLAIM_SLIP,
    87, 6, 0x040000, 5, xi.items.ETOILE_TIARA               , xi.items.ETOILE_CASAQUE            , xi.items.ETOILE_BANGLES             , xi.items.ETOILE_TIGHTS             , xi.items.ETOILE_TOE_SHOES            , 1000, xi.ki.ETOILE_ATTIRE_CLAIM_SLIP,
    88, 6, 0x080000, 5, xi.items.ARGUTE_MORTARBOARD         , xi.items.ARGUTE_GOWN               , xi.items.ARGUTE_BRACERS             , xi.items.ARGUTE_PANTS              , xi.items.ARGUTE_LOAFERS              , 1000, xi.ki.ARGUTE_ATTIRE_CLAIM_SLIP,
    89, 2, 0x040000, 2, xi.items.NONE                       , xi.items.ARGENT_COAT               , xi.items.NONE                       , xi.items.ARGENT_HOSE               , xi.items.NONE                        , 600,  xi.ki.ARGENT_ATTIRE_CLAIM_SLIP,
}

xi.armorStorage.onTrade = function(player, trade, deposit)
    local returnValue = false

    for i = 1, #armorSets, 11 do
        local t1 = trade:hasItemQty(armorSets[i + 5], 1)

        if t1 then
            if not player:hasKeyItem(armorSets[i + 10]) then
                if trade:getItemCount() == armorSets[i + 3] then
                    local t2 = trade:hasItemQty(armorSets[i + 4], 1) or armorSets[i + 4] == 0
                    local t3 = trade:hasItemQty(armorSets[i + 6], 1) or armorSets[i + 6] == 0
                    local t4 = trade:hasItemQty(armorSets[i + 7], 1) or armorSets[i + 7] == 0
                    local t5 = trade:hasItemQty(armorSets[i + 8], 1) or armorSets[i + 8] == 0

                    if t2 and t3 and t4 and t5 then
                        player:startEvent(deposit, 0, 0, 0, 0, 0, armorSets[i + 9])
                        player:addKeyItem(armorSets[i + 10])
                        player:messageSpecial(zones[player:getZoneID()].text.KEYITEM_OBTAINED, armorSets[i + 10])
                        returnValue = true
                        break
                    end
                end
            end
        end
    end

    return returnValue
end

xi.armorStorage.onTrigger = function(player, withdrawal)
    local g1 = 0
    local g2 = 0
    local g3 = 0
    local g4 = 0
    local g5 = 0

    for i = 11, #armorSets, 11 do
        if player:hasKeyItem(armorSets[i]) then
            local group = armorSets[i - 9]
            local mask  = armorSets[i - 8]

            if group == 1 then
                g1 = g1 + mask
            elseif group == 2 then
                g2 = g2 + mask
            elseif group == 3 then
                g3 = g3 + mask
            elseif group == 4 then
                g4 = g4 + mask
            elseif group == 6 then
                g5 = g5 + mask
            end
        end
    end

    player:startEvent(withdrawal, g1, g2, g3, g4, player:getGil(), g5)
end

xi.armorStorage.onEventUpdate = function(player, csid, option, withdrawal)
    if csid == withdrawal then
        player:updateEvent(
            armorSets[option * 11 - 6],
            armorSets[option * 11 - 5],
            armorSets[option * 11 - 4],
            armorSets[option * 11 - 3],
            armorSets[option * 11 - 2],
            armorSets[option * 11 - 1]
        )
    end
end

xi.armorStorage.onEventFinish = function(player, csid, option, deposit, withdrawal)
    if csid == deposit then
        player:tradeComplete()

    elseif csid == withdrawal then
        if option > 0 and option <= armorSets[#armorSets] - 10 then
            local idx   = (option * 11) - 10
            local count = armorSets[idx + 3]
            local cost  = armorSets[idx + 9]
            local ki    = armorSets[idx + 10]

            if
                player:hasKeyItem(ki) and
                player:getFreeSlotsCount() >= count and
                player:getGil() >= cost
            then
                for i = 4, 8 do
                    local itemId = armorSets[idx + i]
                    if itemId > 0 then
                        player:addItem(itemId, 1)
                        player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, itemId)
                    end
                end

                player:delKeyItem(ki)
                player:setGil(player:getGil() - cost)
            else
                for i = 4, 8 do
                    local itemId = armorSets[idx + i]
                    if itemId > 0 then
                        player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, itemId)
                    end
                end
            end
        end
    end
end
