-----------------------------------
-- Area: Port Jeuno
--  NPC: Sagheera
-- !pos -3 0.1 -9 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
require("scripts/globals/items")
-----------------------------------
local entity = {}

-----------------------------------
-- artifact armor upgrade data
-- [combinationId] = { trade = { afBase, temenosItem, apollyonItem, craftedItem }, abc = ABCsRequired, reward = afPlusOne },
-----------------------------------
local afArmorPlusOne =
{
    [  1] = { trade = { xi.items.FIGHTERS_MASK,xi.items.SQUARE_OF_ECARLATE_CLOTH, xi.items.ARGYRO_RIVET,xi.items.DARK_BRONZE_SHEET}, abc = 20, reward = xi.items.FIGHTERS_MASK_P1 },
    [  2] = { trade = { xi.items.FIGHTERS_LORICA,xi.items.SQUARE_OF_ECARLATE_CLOTH, xi.items.ARGYRO_RIVET,xi.items.DARK_BRONZE_SHEET}, abc = 35, reward = xi.items.FIGHTERS_LORICA_P1 },
    [  3] = { trade = { xi.items.FIGHTERS_MUFFLERS,xi.items.SQUARE_OF_ECARLATE_CLOTH, xi.items.ARGYRO_RIVET,xi.items.DARK_BRONZE_SHEET}, abc = 15, reward = xi.items.FIGHTERS_MUFFLERS_P1 },
    [  4] = { trade = { xi.items.FIGHTERS_CUISSES,xi.items.SQUARE_OF_ECARLATE_CLOTH, xi.items.ARGYRO_RIVET,xi.items.DARK_BRONZE_SHEET}, abc = 15, reward = xi.items.FIGHTERS_CUISSES_P1 },
    [  5] = { trade = { xi.items.FIGHTERS_CALLIGAE,xi.items.SQUARE_OF_ECARLATE_CLOTH, xi.items.ARGYRO_RIVET,xi.items.DARK_BRONZE_SHEET}, abc = 25, reward = xi.items.FIGHTERS_CALLIGAE_P1 },
    [  6] = { trade = { xi.items.TEMPLE_CROWN,xi.items.UTOPIAN_GOLD_THREAD, xi.items.ANCIENT_BRASS_INGOT,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 25, reward = xi.items.TEMPLE_CROWN_P1 },
    [  7] = { trade = { xi.items.TEMPLE_CYCLAS,xi.items.UTOPIAN_GOLD_THREAD, xi.items.ANCIENT_BRASS_INGOT,xi.items.SQUARE_OF_SILVER_BROCADE }, abc = 40, reward = xi.items.TEMPLE_CYCLAS_P1 },
    [  8] = { trade = { xi.items.TEMPLE_GLOVES,xi.items.UTOPIAN_GOLD_THREAD, xi.items.ANCIENT_BRASS_INGOT,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 20, reward = xi.items.TEMPLE_GLOVES_P1 },
    [  9] = { trade = { xi.items.TEMPLE_HOSE,xi.items.UTOPIAN_GOLD_THREAD, xi.items.ANCIENT_BRASS_INGOT,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 25, reward = xi.items.TEMPLE_HOSE_P1 },
    [ 10] = { trade = { xi.items.TEMPLE_GAITERS,xi.items.UTOPIAN_GOLD_THREAD, xi.items.ANCIENT_BRASS_INGOT, 855 }, abc = 20, reward = xi.items.TEMPLE_GAITERS_P1 },
    [ 11] = { trade = { xi.items.HEALERS_CAP,xi.items.SQUARE_OF_BENEDICT_SILK, xi.items.SPOOL_OF_BENEDICT_YARN,xi.items.SQUARE_OF_ETHER_COTTON}, abc = 30, reward = xi.items.HEALERS_CAP_P1 },
    [ 12] = { trade = { xi.items.HEALERS_BRIAULT,xi.items.SQUARE_OF_BENEDICT_SILK, xi.items.SPOOL_OF_BENEDICT_YARN,xi.items.SQUARE_OF_HOLY_LEATHER}, abc = 40, reward = xi.items.HEALERS_BRIAULT_P1 },
    [ 13] = { trade = { xi.items.HEALERS_MITTS,xi.items.SQUARE_OF_BENEDICT_SILK, xi.items.SPOOL_OF_BENEDICT_YARN,xi.items.SQUARE_OF_ETHER_LEATHER}, abc = 20, reward = xi.items.HEALERS_MITTS_P1 },
    [ 14] = { trade = { xi.items.HEALERS_PANTALOONS,xi.items.SQUARE_OF_BENEDICT_SILK, xi.items.SPOOL_OF_BENEDICT_YARN,xi.items.SQUARE_OF_RAINBOW_VELVET }, abc = 25, reward = xi.items.HEALERS_PANTALOONS_P1 },
    [ 15] = { trade = { xi.items.HEALERS_DUCKBILLS,xi.items.SQUARE_OF_BENEDICT_SILK, xi.items.SPOOL_OF_BENEDICT_YARN,xi.items.PIECE_OF_ETHER_HOLLY}, abc = 20, reward = xi.items.HEALERS_DUCKBILLS_P1 },
    [ 16] = { trade = { xi.items.WIZARDS_PETASOS,xi.items.SQUARE_OF_DIABOLIC_SILK, xi.items.SPOOL_OF_DIABOLIC_YARN,xi.items.SQUARE_OF_ETHER_LEATHER}, abc = 25, reward = xi.items.WIZARDS_PETASOS_P1 },
    [ 17] = { trade = { xi.items.WIZARDS_COAT,xi.items.SQUARE_OF_DIABOLIC_SILK, xi.items.SPOOL_OF_DIABOLIC_YARN,xi.items.SQUARE_OF_ETHER_LEATHER}, abc = 25, reward = xi.items.WIZARDS_COAT_P1 },
    [ 18] = { trade = { xi.items.WIZARDS_GLOVES,xi.items.SQUARE_OF_DIABOLIC_SILK, xi.items.SPOOL_OF_DIABOLIC_YARN,xi.items.SQUARE_OF_ETHER_LEATHER}, abc = 15, reward = xi.items.WIZARDS_GLOVES_P1 },
    [ 19] = { trade = { xi.items.WIZARDS_TONBAN,xi.items.SQUARE_OF_DIABOLIC_SILK, xi.items.SPOOL_OF_DIABOLIC_YARN,xi.items.SQUARE_OF_ETHER_COTTON}, abc = 30, reward = xi.items.WIZARDS_TONBAN_P1 },
    [ 20] = { trade = { xi.items.WIZARDS_SABOTS,xi.items.SQUARE_OF_DIABOLIC_SILK, xi.items.SPOOL_OF_DIABOLIC_YARN,xi.items.PIECE_OF_ETHER_HOLLY}, abc = 20, reward = xi.items.WIZARDS_SABOTS_P1 },
    [ 21] = { trade = { xi.items.WARLOCKS_CHAPEAU,xi.items.SPOOL_OF_RUBY_SILK_THREAD, xi.items.SQUARE_OF_CARDINAL_CLOTH,xi.items.SQUARE_OF_RAINBOW_VELVET }, abc = 20, reward = xi.items.WARLOCKS_CHAPEAU_P1 },
    [ 22] = { trade = { xi.items.WARLOCKS_TABARD,xi.items.SPOOL_OF_RUBY_SILK_THREAD, xi.items.SQUARE_OF_CARDINAL_CLOTH,xi.items.SQUARE_OF_RAINBOW_VELVET }, abc = 30, reward = xi.items.WARLOCKS_TABARD_P1 },
    [ 23] = { trade = { xi.items.WARLOCKS_GLOVES,xi.items.SPOOL_OF_RUBY_SILK_THREAD, xi.items.SQUARE_OF_CARDINAL_CLOTH,xi.items.SQUARE_OF_RAINBOW_VELVET }, abc = 15, reward = xi.items.WARLOCKS_GLOVES_P1 },
    [ 24] = { trade = { xi.items.WARLOCKS_TIGHTS,xi.items.SPOOL_OF_RUBY_SILK_THREAD, xi.items.SQUARE_OF_CARDINAL_CLOTH,xi.items.SQUARE_OF_RAINBOW_VELVET }, abc = 20, reward = xi.items.WARLOCKS_TIGHTS_P1 },
    [ 25] = { trade = { xi.items.WARLOCKS_BOOTS,xi.items.SPOOL_OF_RUBY_SILK_THREAD, xi.items.SQUARE_OF_CARDINAL_CLOTH, 855 }, abc = 25, reward = xi.items.WARLOCKS_BOOTS_P1 },
    [ 26] = { trade = { xi.items.ROGUES_BONNET,xi.items.SQUARE_OF_SUPPLE_SKIN, xi.items.SPOOL_OF_LIGHT_FILAMENT,xi.items.SQUARE_OF_SAILCLOTH}, abc = 30, reward = xi.items.ROGUES_BONNET_P1 },
    [ 27] = { trade = { xi.items.ROGUES_VEST,xi.items.SQUARE_OF_SUPPLE_SKIN, xi.items.SPOOL_OF_LIGHT_FILAMENT,xi.items.SQUARE_OF_SAILCLOTH}, abc = 40, reward = xi.items.ROGUES_VEST_P1 },
    [ 28] = { trade = { xi.items.ROGUES_ARMLETS,xi.items.SQUARE_OF_SUPPLE_SKIN, xi.items.SPOOL_OF_LIGHT_FILAMENT,xi.items.SQUARE_OF_SHEEP_CHAMMY}, abc = 20, reward = xi.items.ROGUES_ARMLETS_P1 },
    [ 29] = { trade = { xi.items.ROGUES_CULOTTES,xi.items.SQUARE_OF_SUPPLE_SKIN, xi.items.SPOOL_OF_LIGHT_FILAMENT,xi.items.SQUARE_OF_SAILCLOTH}, abc = 30, reward = xi.items.ROGUES_CULOTTES_P1 },
    [ 30] = { trade = { xi.items.ROGUES_POULAINES,xi.items.SQUARE_OF_SUPPLE_SKIN, xi.items.SPOOL_OF_LIGHT_FILAMENT,xi.items.SQUARE_OF_SHEEP_CHAMMY}, abc = 20, reward = xi.items.ROGUES_POULAINES_P1 },
    [ 31] = { trade = { xi.items.GALLANT_CORONET,xi.items.CHUNK_OF_SNOWY_CERMET, xi.items.WHITE_RIVET, 745 }, abc = 25, reward = xi.items.GALLANT_CORONET_P1 },
    [ 32] = { trade = { xi.items.GALLANT_SURCOAT,xi.items.CHUNK_OF_SNOWY_CERMET, xi.items.WHITE_RIVET,xi.items.SQUARE_OF_GOLD_BROCADE }, abc = 30, reward = xi.items.GALLANT_SURCOAT_P1 },
    [ 33] = { trade = { xi.items.GALLANT_GAUNTLETS,xi.items.CHUNK_OF_SNOWY_CERMET, xi.items.WHITE_RIVET, 667 }, abc = 20, reward = xi.items.GALLANT_GAUNTLETS_P1 },
    [ 34] = { trade = { xi.items.GALLANT_BREECHES,xi.items.CHUNK_OF_SNOWY_CERMET, xi.items.WHITE_RIVET, 667 }, abc = 20, reward = xi.items.GALLANT_BREECHES_P1 },
    [ 35] = { trade = { xi.items.GALLANT_LEGGINGS,xi.items.CHUNK_OF_SNOWY_CERMET, xi.items.WHITE_RIVET, 667 }, abc = 20, reward = xi.items.GALLANT_LEGGINGS_P1 },
    [ 36] = { trade = { xi.items.CHAOS_BURGEONET,xi.items.DARK_ORICHALCUM_INGOT, xi.items.BLACK_RIVET, 664 }, abc = 25, reward = xi.items.CHAOS_BURGEONET_P1 },
    [ 37] = { trade = { xi.items.CHAOS_CUIRASS,xi.items.DARK_ORICHALCUM_INGOT, xi.items.BLACK_RIVET,xi.items.SHEET_OF_DARK_ADAMAN}, abc = 30, reward = xi.items.CHAOS_CUIRASS_P1 },
    [ 38] = { trade = { xi.items.CHAOS_GAUNTLETS,xi.items.DARK_ORICHALCUM_INGOT, xi.items.BLACK_RIVET, 664 }, abc = 15, reward = xi.items.CHAOS_GAUNTLETS_P1 },
    [ 39] = { trade = { xi.items.CHAOS_FLANCHARD,xi.items.DARK_ORICHALCUM_INGOT, xi.items.BLACK_RIVET, 664 }, abc = 20, reward = xi.items.CHAOS_FLANCHARD_P1 },
    [ 40] = { trade = { xi.items.CHAOS_SOLLERETS,xi.items.DARK_ORICHALCUM_INGOT, xi.items.BLACK_RIVET, 664 }, abc = 20, reward = xi.items.CHAOS_SOLLERETS_P1 },
    [ 41] = { trade = { xi.items.BEAST_HELM,xi.items.SQUARE_OF_SMALT_LEATHER, xi.items.FETID_LANOLIN_CUBE,xi.items.BEAST_HORN}, abc = 30, reward = xi.items.BEAST_HELM_P1 },
    [ 42] = { trade = { xi.items.BEAST_JACKCOAT,xi.items.SQUARE_OF_SMALT_LEATHER, xi.items.FETID_LANOLIN_CUBE,xi.items.SQUARE_OF_WHITE_MOUTON}, abc = 40, reward = xi.items.BEAST_JACKCOAT_P1 },
    [ 43] = { trade = { xi.items.BEAST_GLOVES,xi.items.SQUARE_OF_SMALT_LEATHER, xi.items.FETID_LANOLIN_CUBE,xi.items.SQUARE_OF_WHITE_MOUTON}, abc = 20, reward = xi.items.BEAST_GLOVES_P1 },
    [ 44] = { trade = { xi.items.BEAST_TROUSERS,xi.items.SQUARE_OF_SMALT_LEATHER, xi.items.FETID_LANOLIN_CUBE, 848 }, abc = 30, reward = xi.items.BEAST_TROUSERS_P1 },
    [ 45] = { trade = { xi.items.BEAST_GAITERS,xi.items.SQUARE_OF_SMALT_LEATHER, xi.items.FETID_LANOLIN_CUBE, 848 }, abc = 20, reward = xi.items.BEAST_GAITERS_P1 },
    [ 46] = { trade = { xi.items.CHORAL_ROUNDLET,xi.items.SPOOL_OF_COILED_YARN, xi.items.SQUARE_OF_BROWN_DOESKIN, 823 }, abc = 15, reward = xi.items.CHORAL_ROUNDLET_P1 },
    [ 47] = { trade = { xi.items.CHORAL_JUSTAUCORPS,xi.items.SPOOL_OF_COILED_YARN, xi.items.SQUARE_OF_BROWN_DOESKIN,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 40, reward = xi.items.CHORAL_JUSTAUCORPS_P1 },
    [ 48] = { trade = { xi.items.CHORAL_CUFFS,xi.items.SPOOL_OF_COILED_YARN, xi.items.SQUARE_OF_BROWN_DOESKIN,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 25, reward = xi.items.CHORAL_CUFFS_P1 },
    [ 49] = { trade = { xi.items.CHORAL_CANNIONS,xi.items.SPOOL_OF_COILED_YARN, xi.items.SQUARE_OF_BROWN_DOESKIN,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 25, reward = xi.items.CHORAL_CANNIONS_P1 },
    [ 50] = { trade = { xi.items.CHORAL_SLIPPERS,xi.items.SPOOL_OF_COILED_YARN, xi.items.SQUARE_OF_BROWN_DOESKIN,xi.items.SQUARE_OF_MANTICORE_LEATHER }, abc = 25, reward = xi.items.CHORAL_SLIPPERS_P1 },
    [ 51] = { trade = { xi.items.HUNTERS_BERET,xi.items.SPOOL_OF_CHAMELEON_YARN, xi.items.SQUARE_OF_CHARCOAL_COTTON,xi.items.SQUARE_OF_HUNTERS_COTTON}, abc = 25, reward = xi.items.HUNTERS_BERET_P1 },
    [ 52] = { trade = { xi.items.HUNTERS_JERKIN,xi.items.SPOOL_OF_CHAMELEON_YARN, xi.items.SQUARE_OF_CHARCOAL_COTTON,xi.items.SQUARE_OF_HUNTERS_COTTON}, abc = 40, reward = xi.items.HUNTERS_JERKIN_P1 },
    [ 53] = { trade = { xi.items.HUNTERS_BRACERS,xi.items.SPOOL_OF_CHAMELEON_YARN, xi.items.SQUARE_OF_CHARCOAL_COTTON, 506 }, abc = 20, reward = xi.items.HUNTERS_BRACERS_P1 },
    [ 54] = { trade = { xi.items.HUNTERS_BRACCAE,xi.items.SPOOL_OF_CHAMELEON_YARN, xi.items.SQUARE_OF_CHARCOAL_COTTON, 506 }, abc = 25, reward = xi.items.HUNTERS_BRACCAE_P1 },
    [ 55] = { trade = { xi.items.HUNTERS_SOCKS,xi.items.SPOOL_OF_CHAMELEON_YARN, xi.items.SQUARE_OF_CHARCOAL_COTTON, 855 }, abc = 25, reward = xi.items.HUNTERS_SOCKS_P1 },
    [ 56] = { trade = { xi.items.MYOCHIN_KABUTO,xi.items.SPOOL_OF_SCARLET_ODOSHI, xi.items.SHEET_OF_KUROGANE, 752 }, abc = 15, reward = xi.items.MYOCHIN_KABUTO_P1 },
    [ 57] = { trade = { xi.items.MYOCHIN_DOMARU,xi.items.SPOOL_OF_SCARLET_ODOSHI, xi.items.SHEET_OF_KUROGANE,xi.items.IYO_SCALE}, abc = 25, reward = xi.items.MYOCHIN_DOMARU_P1 },
    [ 58] = { trade = { xi.items.MYOCHIN_KOTE,xi.items.SPOOL_OF_SCARLET_ODOSHI, xi.items.SHEET_OF_KUROGANE,xi.items.SQUARE_OF_LM_BUFFALO_LEATHER }, abc = 20, reward = xi.items.MYOCHIN_KOTE_P1 },
    [ 59] = { trade = { xi.items.MYOCHIN_HAIDATE,xi.items.SPOOL_OF_SCARLET_ODOSHI, xi.items.SHEET_OF_KUROGANE,xi.items.SQUARE_OF_LM_BUFFALO_LEATHER }, abc = 30, reward = xi.items.MYOCHIN_HAIDATE_P1 },
    [ 60] = { trade = { xi.items.MYOCHIN_SUNE_ATE,xi.items.SPOOL_OF_SCARLET_ODOSHI, xi.items.SHEET_OF_KUROGANE,xi.items.SQUARE_OF_LM_BUFFALO_LEATHER }, abc = 20, reward = xi.items.MYOCHIN_SUNE_ATE_P1 },
    [ 61] = { trade = { xi.items.NINJA_HATSUBURI,xi.items.PLAITED_CORD, xi.items.POT_OF_EBONY_LACQUER,xi.items.SHEET_OF_LIGHTWEIGHT_STEEL}, abc = 20, reward = xi.items.NINJA_HATSUBURI_P1 },
    [ 62] = { trade = { xi.items.NINJA_CHAINMAIL,xi.items.PLAITED_CORD, xi.items.POT_OF_EBONY_LACQUER,xi.items.SHEET_OF_LIGHTWEIGHT_STEEL}, abc = 30, reward = xi.items.NINJA_CHAINMAIL_P1 },
    [ 63] = { trade = { xi.items.NINJA_TEKKO,xi.items.PLAITED_CORD, xi.items.POT_OF_EBONY_LACQUER,xi.items.SHEET_OF_LIGHTWEIGHT_STEEL}, abc = 15, reward = xi.items.NINJA_TEKKO_P1 },
    [ 64] = { trade = { xi.items.NINJA_HAKAMA,xi.items.PLAITED_CORD, xi.items.POT_OF_EBONY_LACQUER,xi.items.SQUARE_OF_LM_BUFFALO_LEATHER }, abc = 30, reward = xi.items.NINJA_HAKAMA_P1 },
    [ 65] = { trade = { xi.items.NINJA_KYAHAN,xi.items.PLAITED_CORD, xi.items.POT_OF_EBONY_LACQUER,xi.items.SHEET_OF_LIGHTWEIGHT_STEEL}, abc = 15, reward = xi.items.NINJA_KYAHAN_P1 },
    [ 66] = { trade = { xi.items.DRACHEN_ARMET,xi.items.SHEET_OF_COBALT_MYTHRIL, xi.items.BLUE_RIVET,xi.items.SQUARE_OF_LAMINATED_RAM_LEATHER}, abc = 30, reward = xi.items.DRACHEN_ARMET_P1 },
    [ 67] = { trade = { xi.items.DRACHEN_MAIL,xi.items.SHEET_OF_COBALT_MYTHRIL, xi.items.BLUE_RIVET,xi.items.SQUARE_OF_LAMINATED_RAM_LEATHER}, abc = 40, reward = xi.items.DRACHEN_MAIL_P1 },
    [ 68] = { trade = { xi.items.DRACHEN_FINGER_GAUNTLETS,xi.items.SHEET_OF_COBALT_MYTHRIL, xi.items.BLUE_RIVET, 851 }, abc = 20, reward = xi.items.DRACHEN_FINGER_GAUNTLETS_P1 },
    [ 69] = { trade = { xi.items.DRACHEN_BRAIS,xi.items.SHEET_OF_COBALT_MYTHRIL, xi.items.BLUE_RIVET, 851 }, abc = 25, reward = xi.items.DRACHEN_BRAIS_P1 },
    [ 70] = { trade = { xi.items.DRACHEN_GREAVES,xi.items.SHEET_OF_COBALT_MYTHRIL, xi.items.BLUE_RIVET, 851 }, abc = 20, reward = xi.items.DRACHEN_GREAVES_P1 },
    [ 71] = { trade = { xi.items.EVOKERS_HORN,xi.items.SPOOL_OF_GLITTERING_YARN, xi.items.SQUARE_OF_ASTRAL_LEATHER,xi.items.CORAL_HORN}, abc = 25, reward = xi.items.EVOKERS_HORN_P1 },
    [ 72] = { trade = { xi.items.EVOKERS_DOUBLET,xi.items.SPOOL_OF_GLITTERING_YARN, xi.items.SQUARE_OF_ASTRAL_LEATHER,xi.items.SQUARE_OF_WOLF_FELT }, abc = 35, reward = xi.items.EVOKERS_DOUBLET_P1 },
    [ 73] = { trade = { xi.items.EVOKERS_BRACERS,xi.items.SPOOL_OF_GLITTERING_YARN, xi.items.SQUARE_OF_ASTRAL_LEATHER,xi.items.SQUARE_OF_WOLF_FELT }, abc = 20, reward = xi.items.EVOKERS_BRACERS_P1 },
    [ 74] = { trade = { xi.items.EVOKERS_SPATS,xi.items.SPOOL_OF_GLITTERING_YARN, xi.items.SQUARE_OF_ASTRAL_LEATHER,xi.items.SQUARE_OF_WOLF_FELT }, abc = 30, reward = xi.items.EVOKERS_SPATS_P1 },
    [ 75] = { trade = { xi.items.EVOKERS_PIGACHES,xi.items.SPOOL_OF_GLITTERING_YARN, xi.items.SQUARE_OF_ASTRAL_LEATHER, 720 }, abc = 15, reward = xi.items.EVOKERS_PIGACHES_P1 },
    [ 76] = { trade = { xi.items.MAGUS_KEFFIYEH,xi.items.SPOOL_OF_LUMINIAN_THREAD, xi.items.SQUARE_OF_FLAMESHUN_CLOTH,xi.items.SQUARE_OF_KHROMATED_LEATHER }, abc = 20, reward = xi.items.MAGUS_KEFFIYEH_P1 },
    [ 77] = { trade = { xi.items.MAGUS_JUBBAH,xi.items.SPOOL_OF_LUMINIAN_THREAD, xi.items.SQUARE_OF_FLAMESHUN_CLOTH,xi.items.SQUARE_OF_WAMOURA_CLOTH }, abc = 30, reward = xi.items.MAGUS_JUBBAH_P1 },
    [ 78] = { trade = { xi.items.MAGUS_BAZUBANDS,xi.items.SPOOL_OF_LUMINIAN_THREAD, xi.items.SQUARE_OF_FLAMESHUN_CLOTH,xi.items.SQUARE_OF_KHROMATED_LEATHER }, abc = 15, reward = xi.items.MAGUS_BAZUBANDS_P1 },
    [ 79] = { trade = { xi.items.MAGUS_SHALWAR,xi.items.SPOOL_OF_LUMINIAN_THREAD, xi.items.SQUARE_OF_FLAMESHUN_CLOTH,xi.items.SQUARE_OF_WAMOURA_CLOTH }, abc = 30, reward = xi.items.MAGUS_SHALWAR_P1 },
    [ 80] = { trade = { xi.items.MAGUS_CHARUQS,xi.items.SPOOL_OF_LUMINIAN_THREAD, xi.items.SQUARE_OF_FLAMESHUN_CLOTH,xi.items.SQUARE_OF_KHROMATED_LEATHER }, abc = 15, reward = xi.items.MAGUS_CHARUQS_P1 },
    [ 81] = { trade = { xi.items.CORSAIRS_TRICORNE,xi.items.SPOOL_OF_SILKWORM_THREAD, xi.items.SQUARE_OF_CANVAS_TOILE,xi.items.SQUARE_OF_LAMINATED_RAM_LEATHER}, abc = 30, reward = xi.items.CORSAIRS_TRICORNE_P1 },
    [ 82] = { trade = { xi.items.CORSAIRS_FRAC,xi.items.SPOOL_OF_SILKWORM_THREAD, xi.items.SQUARE_OF_CANVAS_TOILE,xi.items.SQUARE_OF_OIL_SOAKED_CLOTH }, abc = 30, reward = xi.items.CORSAIRS_FRAC_P1 },
    [ 83] = { trade = { xi.items.CORSAIRS_GANTS,xi.items.SPOOL_OF_SILKWORM_THREAD, xi.items.SQUARE_OF_CANVAS_TOILE,xi.items.SQUARE_OF_OIL_SOAKED_CLOTH }, abc = 20, reward = xi.items.CORSAIRS_GANTS_P1 },
    [ 84] = { trade = { xi.items.CORSAIRS_CULOTTES,xi.items.SPOOL_OF_SILKWORM_THREAD, xi.items.SQUARE_OF_CANVAS_TOILE,xi.items.SQUARE_OF_OIL_SOAKED_CLOTH }, abc = 30, reward = xi.items.CORSAIRS_CULOTTES_P1 },
    [ 85] = { trade = { xi.items.CORSAIRS_BOTTES,xi.items.SPOOL_OF_SILKWORM_THREAD, xi.items.SQUARE_OF_CANVAS_TOILE,xi.items.SQUARE_OF_MARID_LEATHER }, abc = 25, reward = xi.items.CORSAIRS_BOTTES_P1 },
    [ 86] = { trade = { xi.items.PUPPETRY_TAJ,xi.items.PANTIN_WIRE, xi.items.SQUARE_OF_CORDUROY_CLOTH,xi.items.SQUARE_OF_FOULARD }, abc = 20, reward = xi.items.PUPPETRY_TAJ_P1 },
    [ 87] = { trade = { xi.items.PUPPETRY_TOBE,xi.items.PANTIN_WIRE, xi.items.SQUARE_OF_CORDUROY_CLOTH,xi.items.SQUARE_OF_SCARLET_LINEN_CLOTH}, abc = 30, reward = xi.items.PUPPETRY_TOBE_P1 },
    [ 88] = { trade = { xi.items.PUPPETRY_DASTANAS,xi.items.PANTIN_WIRE, xi.items.SQUARE_OF_CORDUROY_CLOTH,xi.items.SQUARE_OF_FOULARD }, abc = 20, reward = xi.items.PUPPETRY_DASTANAS_P1 },
    [ 89] = { trade = { xi.items.PUPPETRY_CHURIDARS,xi.items.PANTIN_WIRE, xi.items.SQUARE_OF_CORDUROY_CLOTH,xi.items.SQUARE_OF_FOULARD }, abc = 20, reward = xi.items.PUPPETRY_CHURIDARS_P1 },
    [ 90] = { trade = { xi.items.PUPPETRY_BABOUCHES,xi.items.PANTIN_WIRE, xi.items.SQUARE_OF_CORDUROY_CLOTH,xi.items.SQUARE_OF_ETHER_LEATHER}, abc = 20, reward = xi.items.PUPPETRY_BABOUCHES_P1 },
    [ 91] = { trade = { xi.items.DANCERS_TIARA_M,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD, 745 }, abc = 30, reward = xi.items.DANCERS_TIARA_M_P1 },
    [ 92] = { trade = { xi.items.DANCERS_CASAQUE_M,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD,xi.items.SQUARE_OF_SCARLET_LINEN_CLOTH}, abc = 35, reward = xi.items.DANCERS_CASAQUE_M_P1 },
    [ 93] = { trade = { xi.items.DANCERS_BANGLES_M,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD, 745 }, abc = 25, reward = xi.items.DANCERS_BANGLES_M_P1 },
    [ 94] = { trade = { xi.items.DANCERS_TIGHTS_M,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD,xi.items.SQUARE_OF_SILKY_SUEDE}, abc = 25, reward = xi.items.DANCERS_TIGHTS_M_P1 },
    [ 95] = { trade = { xi.items.DANCERS_TOE_SHOES_M,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD,xi.items.SQUARE_OF_SILKY_SUEDE}, abc = 20, reward = xi.items.DANCERS_TOE_SHOES_M_P1 },
    [201] = { trade = { xi.items.DANCERS_TIARA_F,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD, 745 }, abc = 30, reward = xi.items.DANCERS_TIARA_F_P1 },
    [202] = { trade = { xi.items.DANCERS_CASAQUE_F,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD,xi.items.SQUARE_OF_SCARLET_LINEN_CLOTH}, abc = 35, reward = xi.items.DANCERS_CASAQUE_F_P1 },
    [203] = { trade = { xi.items.DANCERS_BANGLES_F,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD, 745 }, abc = 25, reward = xi.items.DANCERS_BANGLES_F_P1 },
    [204] = { trade = { xi.items.DANCERS_TIGHTS_F,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD,xi.items.SQUARE_OF_SILKY_SUEDE}, abc = 25, reward = xi.items.DANCERS_TIGHTS_F_P1 },
    [205] = { trade = { xi.items.DANCERS_TOE_SHOES_F,xi.items.SQUARE_OF_FILET_LACE, xi.items.GOLD_STUD,xi.items.SQUARE_OF_SILKY_SUEDE}, abc = 20, reward = xi.items.DANCERS_TOE_SHOES_F_P1 },
    [ 96] = { trade = { xi.items.SCHOLARS_MORTARBOARD,xi.items.SQUARE_OF_BRILLIANTINE, xi.items.ELECTRUM_STUD,xi.items.ELECTRUM_INGOT }, abc = 20, reward = xi.items.SCHOLARS_MORTARBOARD_P1 },
    [ 97] = { trade = { xi.items.SCHOLARS_GOWN,xi.items.SQUARE_OF_BRILLIANTINE, xi.items.ELECTRUM_STUD,xi.items.SQUARE_OF_LYNX_LEATHER }, abc = 40, reward = xi.items.SCHOLARS_GOWN_P1 },
    [ 98] = { trade = { xi.items.SCHOLARS_BRACERS,xi.items.SQUARE_OF_BRILLIANTINE, xi.items.ELECTRUM_STUD,xi.items.SQUARE_OF_LYNX_LEATHER }, abc = 25, reward = xi.items.SCHOLARS_BRACERS_P1 },
    [ 99] = { trade = { xi.items.SCHOLARS_PANTS,xi.items.SQUARE_OF_BRILLIANTINE, xi.items.ELECTRUM_STUD,xi.items.SQUARE_OF_ETHER_LEATHER}, abc = 25, reward = xi.items.SCHOLARS_PANTS_P1 },
    [100] = { trade = { xi.items.SCHOLARS_LOAFERS,xi.items.SQUARE_OF_BRILLIANTINE, xi.items.ELECTRUM_STUD,xi.items.SQUARE_OF_KARAKUL_CLOTH }, abc = 25, reward = xi.items.SCHOLARS_LOAFERS_P1 },
}

-----------------------------------
-- relic armor upgrade data
-- [combinationId] = { trade = { relicBase, relicMinusOne, ingredient, { currencyId, currencyAmt } }, reward = relicPlusOne },
-----------------------------------
local relicArmorPlusOne =
{
    [101] = { trade = { xi.items.WARRIORS_MASK,xi.items.WARRIORS_MASK_M1, xi.items.DARK_BRONZE_SHEET, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.WARRIORS_MASK_P1 },
    [102] = { trade = { xi.items.WARRIORS_LORICA,xi.items.WARRIORS_LORICA_M1, xi.items.DARK_BRONZE_SHEET, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.WARRIORS_LORICA_P1 },
    [103] = { trade = { xi.items.WARRIORS_MUFFLERS,xi.items.WARRIORS_MUFFLERS_M1, xi.items.DARK_BRONZE_SHEET, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.WARRIORS_MUFFLERS_P1 },
    [104] = { trade = { xi.items.WARRIORS_CUISSES,xi.items.WARRIORS_CUISSES_M1, xi.items.DARK_BRONZE_SHEET, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.WARRIORS_CUISSES_P1 },
    [105] = { trade = { xi.items.WARRIORS_CALLIGAE,xi.items.WARRIORS_CALLIGAE_M1, xi.items.DARK_BRONZE_SHEET, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.WARRIORS_CALLIGAE_P1 },
    [106] = { trade = { xi.items.MELEE_CROWN,xi.items.MELEE_CROWN_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.MELEE_CROWN_P1 },
    [107] = { trade = { xi.items.MELEE_CYCLAS,xi.items.MELEE_CYCLAS_M1, xi.items.SQUARE_OF_SILVER_BROCADE,{ xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.MELEE_CYCLAS_P1 },
    [108] = { trade = { xi.items.MELEE_GLOVES,xi.items.MELEE_GLOVES_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.MELEE_GLOVES_P1 },
    [109] = { trade = { xi.items.MELEE_HOSE,xi.items.MELEE_HOSE_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.MELEE_HOSE_P1 },
    [110] = { trade = { xi.items.MELEE_GAITERS,xi.items.MELEE_GAITERS_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.MELEE_GAITERS_P1 },
    [111] = { trade = { xi.items.CLERICS_CAP,xi.items.CLERICS_CAP_M1, xi.items.SQUARE_OF_ETHER_COTTON, { xi.items.ORDELLE_BRONZEPIECE, 28 } }, reward = xi.items.CLERICS_CAP_P1 },
    [112] = { trade = { xi.items.CLERICS_BRIAULT,xi.items.CLERICS_BRIAULT_M1, xi.items.SQUARE_OF_HOLY_LEATHER, { xi.items.ORDELLE_BRONZEPIECE, 28 } }, reward = xi.items.CLERICS_BRIAULT_P1 },
    [113] = { trade = { xi.items.CLERICS_MITTS,xi.items.CLERICS_MITTS_M1, xi.items.SQUARE_OF_ETHER_LEATHER, { xi.items.ORDELLE_BRONZEPIECE, 28 } }, reward = xi.items.CLERICS_MITTS_P1 },
    [114] = { trade = { xi.items.CLERICS_PANTALOONS,xi.items.CLERICS_PANTALOONS_M1, xi.items.SQUARE_OF_RAINBOW_VELVET,{ xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.CLERICS_PANTALOONS_P1 },
    [115] = { trade = { xi.items.CLERICS_DUCKBILLS,xi.items.CLERICS_DUCKBILLS_M1, xi.items.PIECE_OF_ETHER_HOLLY, { xi.items.ORDELLE_BRONZEPIECE, 28 } }, reward = xi.items.CLERICS_DUCKBILLS_P1 },
    [116] = { trade = { xi.items.SORCERERS_PETASOS,xi.items.SORCERERS_PETASOS_M1, xi.items.SQUARE_OF_ETHER_LEATHER, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.SORCERERS_PETASOS_P1 },
    [117] = { trade = { xi.items.SORCERERS_COAT,xi.items.SORCERERS_COAT_M1, xi.items.SQUARE_OF_ETHER_LEATHER, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.SORCERERS_COAT_P1 },
    [118] = { trade = { xi.items.SORCERERS_GLOVES,xi.items.SORCERERS_GLOVES_M1, xi.items.SQUARE_OF_ETHER_LEATHER, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.SORCERERS_GLOVES_P1 },
    [119] = { trade = { xi.items.SORCERERS_TONBAN,xi.items.SORCERERS_TONBAN_M1, xi.items.SQUARE_OF_ETHER_COTTON, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.SORCERERS_TONBAN_P1 },
    [120] = { trade = { xi.items.SORCERERS_SABOTS,xi.items.SORCERERS_SABOTS_M1, xi.items.PIECE_OF_ETHER_HOLLY, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.SORCERERS_SABOTS_P1 },
    [121] = { trade = { xi.items.DUELISTS_CHAPEAU,xi.items.DUELISTS_CHAPEAU_M1, xi.items.SQUARE_OF_RAINBOW_VELVET,{ xi.items.ORDELLE_BRONZEPIECE, 22 } }, reward = xi.items.DUELISTS_CHAPEAU_P1 },
    [122] = { trade = { xi.items.DUELISTS_TABARD,xi.items.DUELISTS_TABARD_M1, xi.items.SQUARE_OF_RAINBOW_VELVET,{ xi.items.ORDELLE_BRONZEPIECE, 22 } }, reward = xi.items.DUELISTS_TABARD_P1 },
    [123] = { trade = { xi.items.DUELISTS_GLOVES,xi.items.DUELISTS_GLOVES_M1, xi.items.SQUARE_OF_RAINBOW_VELVET,{ xi.items.ORDELLE_BRONZEPIECE, 22 } }, reward = xi.items.DUELISTS_GLOVES_P1 },
    [124] = { trade = { xi.items.DUELISTS_TIGHTS,xi.items.DUELISTS_TIGHTS_M1, xi.items.SQUARE_OF_RAINBOW_VELVET,{ xi.items.ORDELLE_BRONZEPIECE, 22 } }, reward = xi.items.DUELISTS_TIGHTS_P1 },
    [125] = { trade = { xi.items.DUELISTS_BOOTS,xi.items.DUELISTS_BOOTS_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.DUELISTS_BOOTS_P1 },
    [126] = { trade = { xi.items.ASSASSINS_BONNET,xi.items.ASSASSINS_BONNET_M1, xi.items.SQUARE_OF_SAILCLOTH, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.ASSASSINS_BONNET_P1 },
    [127] = { trade = { xi.items.ASSASSINS_VEST,xi.items.ASSASSINS_VEST_M1, xi.items.SQUARE_OF_SAILCLOTH, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.ASSASSINS_VEST_P1 },
    [128] = { trade = { xi.items.ASSASSINS_ARMLETS,xi.items.ASSASSINS_ARMLETS_M1, xi.items.SQUARE_OF_SHEEP_CHAMMY, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.ASSASSINS_ARMLETS_P1 },
    [129] = { trade = { xi.items.ASSASSINS_CULOTTES,xi.items.ASSASSINS_CULOTTE_M1, xi.items.SQUARE_OF_SAILCLOTH, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.ASSASSINS_CULOTTES_P1 },
    [130] = { trade = { xi.items.ASSASSINS_POULAINES,xi.items.ASSASSINS_POULAINES_M1, xi.items.SQUARE_OF_SHEEP_CHAMMY, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.ASSASSINS_POULAINES_P1 },
    [131] = { trade = { xi.items.VALOR_CORONET,xi.items.VALOR_CORONET_M1,  xi.items.GOLD_INGOT,{ xi.items.ORDELLE_BRONZEPIECE, 20 } }, reward = xi.items.VALOR_CORONET_P1 },
    [132] = { trade = { xi.items.VALOR_SURCOAT,xi.items.VALOR_SURCOAT_M1, xi.items.SQUARE_OF_GOLD_BROCADE,{ xi.items.ORDELLE_BRONZEPIECE, 20 } }, reward = xi.items.VALOR_SURCOAT_P1 },
    [133] = { trade = { xi.items.VALOR_GAUNTLETS,xi.items.VALOR_GAUNTLETS_M1,  667, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.VALOR_GAUNTLETS_P1 },
    [134] = { trade = { xi.items.VALOR_BREECHES,xi.items.VALOR_BREECHES_M1,  667, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.VALOR_BREECHES_P1 },
    [135] = { trade = { xi.items.VALOR_LEGGINGS,xi.items.VALOR_LEGGINGS_M1,  667, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.VALOR_LEGGINGS_P1 },
    [136] = { trade = { xi.items.ABYSS_BURGEONET,xi.items.ABYSS_BURGEONET_M1,  xi.items.DARKSTEEL_SHEET,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ABYSS_BURGEONET_P1 },
    [137] = { trade = { xi.items.ABYSS_CUIRASS,xi.items.ABYSS_CUIRASS_M1, xi.items.SHEET_OF_DARK_ADAMAN, { xi.items.ONE_BYNE_BILL, 20 } }, reward = xi.items.ABYSS_CUIRASS_P1 },
    [138] = { trade = { xi.items.ABYSS_GAUNTLETS,xi.items.ABYSS_GAUNTLETS_M1,  xi.items.DARKSTEEL_SHEET,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ABYSS_GAUNTLETS_P1 },
    [139] = { trade = { xi.items.ABYSS_FLANCHARD,xi.items.ABYSS_FLANCHARD_M1,  xi.items.DARKSTEEL_SHEET,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ABYSS_FLANCHARD_P1 },
    [140] = { trade = { xi.items.ABYSS_SOLLERETS,xi.items.ABYSS_SOLLERETS_M1,  xi.items.DARKSTEEL_SHEET,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ABYSS_SOLLERETS_P1 },
    [141] = { trade = { xi.items.MONSTER_HELM,xi.items.MONSTER_HELM_M1, xi.items.MAMMOTH_TUSK, { xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.MONSTER_HELM_P1 },
    [142] = { trade = { xi.items.MONSTER_JACKCOAT,xi.items.MONSTER_JACKCOAT_M1, xi.items.SQUARE_OF_YELLOW_MOUTON, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.MONSTER_JACKCOAT_P1 },
    [143] = { trade = { xi.items.MONSTER_GLOVES,xi.items.MONSTER_GLOVES_M1, xi.items.SQUARE_OF_YELLOW_MOUTON, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.MONSTER_GLOVES_P1 },
    [144] = { trade = { xi.items.MONSTER_TROUSERS,xi.items.MONSTER_TROUSERS_M1, xi.items.SQUARE_OF_CATOBLEPAS_LEATHER, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.MONSTER_TROUSERS_P1 },
    [145] = { trade = { xi.items.MONSTER_GAITERS,xi.items.MONSTER_GAITERS_M1, xi.items.SQUARE_OF_CATOBLEPAS_LEATHER, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.MONSTER_GAITERS_P1 },
    [146] = { trade = { xi.items.BARDS_ROUNDLET,xi.items.BARDS_ROUNDLET_M1,  xi.items.SPOOL_OF_GOLD_THREAD,{ xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.BARDS_ROUNDLET_P1 },
    [147] = { trade = { xi.items.BARDS_JUSTAUCORPS,xi.items.BARDS_JUSTAUCORPS_M1, xi.items.SQUARE_OF_GRIFFON_LEATHER,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.BARDS_JUSTAUCORPS_P1 },
    [148] = { trade = { xi.items.BARDS_CUFFS,xi.items.BARDS_CUFFS_M1, xi.items.SQUARE_OF_GRIFFON_LEATHER,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.BARDS_CUFFS_P1 },
    [149] = { trade = { xi.items.BARDS_CANNIONS,xi.items.BARDS_CANNIONS_M1, xi.items.SQUARE_OF_GRIFFON_LEATHER,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.BARDS_CANNIONS_P1 },
    [150] = { trade = { xi.items.BARDS_SLIPPERS,xi.items.BARDS_SLIPPERS_M1, xi.items.SQUARE_OF_GRIFFON_LEATHER,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.BARDS_SLIPPERS_P1 },
    [151] = { trade = { xi.items.SCOUTS_BERET,xi.items.SCOUTS_BERET_M1, xi.items.SQUARE_OF_HUNTERS_COTTON, { xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SCOUTS_BERET_P1 },
    [152] = { trade = { xi.items.SCOUTS_JERKIN,xi.items.SCOUTS_JERKIN_M1, xi.items.SQUARE_OF_HUNTERS_COTTON, { xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SCOUTS_JERKIN_P1 },
    [153] = { trade = { xi.items.SCOUTS_BRACERS,xi.items.SCOUTS_BRACERS_M1,  506, { xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SCOUTS_BRACERS_P1 },
    [154] = { trade = { xi.items.SCOUTS_BRACCAE,xi.items.SCOUTS_BRACCAE_M1,  506, { xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SCOUTS_BRACCAE_P1 },
    [155] = { trade = { xi.items.SCOUTS_SOCKS,xi.items.SCOUTS_SOCKS_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.SCOUTS_SOCKS_P1 },
    [156] = { trade = { xi.items.SAOTOME_KABUTO,xi.items.SAOTOME_KABUTO_M1,  752, { xi.items.ONE_BYNE_BILL, 24 } }, reward = xi.items.SAOTOME_KABUTO_P1 },
    [157] = { trade = { xi.items.SAOTOME_DOMARU,xi.items.SAOTOME_DOMARU_M1, xi.items.IYO_SCALE, { xi.items.ONE_BYNE_BILL, 22 } }, reward = xi.items.SAOTOME_DOMARU_P1 },
    [158] = { trade = { xi.items.SAOTOME_KOTE,xi.items.SAOTOME_KOTE_M1, xi.items.SQUARE_OF_LM_BUFFALO_LEATHER,{ xi.items.ONE_BYNE_BILL, 20 } }, reward = xi.items.SAOTOME_KOTE_P1 },
    [159] = { trade = { xi.items.SAOTOME_HAIDATE,xi.items.SAOTOME_HAIDATE_M1, xi.items.SQUARE_OF_LM_BUFFALO_LEATHER,{ xi.items.ONE_BYNE_BILL, 20 } }, reward = xi.items.SAOTOME_HAIDATE_P1 },
    [160] = { trade = { xi.items.SAOTOME_SUNE_ATE,xi.items.SAOTOME_SUNE_ATE_M1, xi.items.SQUARE_OF_LM_BUFFALO_LEATHER,{ xi.items.ONE_BYNE_BILL, 20 } }, reward = xi.items.SAOTOME_SUNE_ATE_P1 },
    [161] = { trade = { xi.items.KOGA_HATSUBURI,xi.items.KOGA_HATSUBURI_M1, xi.items.SHEET_OF_LIGHTWEIGHT_STEEL, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.KOGA_HATSUBURI_P1 },
    [162] = { trade = { xi.items.KOGA_CHAINMAIL,xi.items.KOGA_CHAINMAIL_M1, xi.items.SHEET_OF_LIGHTWEIGHT_STEEL, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.KOGA_CHAINMAIL_P1 },
    [163] = { trade = { xi.items.KOGA_TEKKO,xi.items.KOGA_TEKKO_M1, xi.items.SHEET_OF_LIGHTWEIGHT_STEEL, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.KOGA_TEKKO_P1 },
    [164] = { trade = { xi.items.KOGA_HAKAMA,xi.items.KOGA_HAKAMA_M1, xi.items.SQUARE_OF_LM_BUFFALO_LEATHER,{ xi.items.ONE_BYNE_BILL, 20 } }, reward = xi.items.KOGA_HAKAMA_P1 },
    [165] = { trade = { xi.items.KOGA_KYAHAN,xi.items.KOGA_KYAHAN_M1, xi.items.SHEET_OF_LIGHTWEIGHT_STEEL, { xi.items.ONE_BYNE_BILL, 26 } }, reward = xi.items.KOGA_KYAHAN_P1 },
    [166] = { trade = { xi.items.WYRM_ARMET,xi.items.WYRM_ARMET_M1, xi.items.SQUARE_OF_LAMINATED_RAM_LEATHER, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.WYRM_ARMET_P1 },
    [167] = { trade = { xi.items.WYRM_MAIL,xi.items.WYRM_MAIL_M1, xi.items.SQUARE_OF_LAMINATED_RAM_LEATHER, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.WYRM_MAIL_P1 },
    [168] = { trade = { xi.items.WYRM_FINGER_GAUNTLETS,xi.items.WYRM_FINGER_GAUNTLETS_M1,  xi.items.SQUARE_OF_RAM_LEATHER,{ xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.WYRM_FINGER_GAUNTLETS_P1 },
    [169] = { trade = { xi.items.WYRM_BRAIS,xi.items.WYRM_BRAIS_M1,  xi.items.SQUARE_OF_RAM_LEATHER,{ xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.WYRM_BRAIS_P1 },
    [170] = { trade = { xi.items.WYRM_GREAVES,xi.items.WYRM_GREAVES_M1,  xi.items.SQUARE_OF_RAM_LEATHER,{ xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.WYRM_GREAVES_P1 },
    [171] = { trade = { xi.items.SUMMONERS_HORN,xi.items.SUMMONERS_HORN_M1, xi.items.CORAL_HORN, { xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SUMMONERS_HORN_P1 },
    [172] = { trade = { xi.items.SUMMONERS_DOUBLET,xi.items.SUMMONERS_DOUBLET_M1, xi.items.SQUARE_OF_WOLF_FELT,{ xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SUMMONERS_DOUBLET_P1 },
    [173] = { trade = { xi.items.SUMMONERS_BRACERS,xi.items.SUMMONERS_BRACERS_M1, xi.items.SQUARE_OF_WOLF_FELT,{ xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SUMMONERS_BRACERS_P1 },
    [174] = { trade = { xi.items.SUMMONERS_SPATS,xi.items.SUMMONERS_SPATS_M1, xi.items.SQUARE_OF_WOLF_FELT,{ xi.items.TUKUKU_WHITESHELL, 30 } }, reward = xi.items.SUMMONERS_SPATS_P1 },
    [175] = { trade = { xi.items.SUMMONERS_PIGACHES,xi.items.SUMMONERS_PIGACHES_M1,  720, { xi.items.TUKUKU_WHITESHELL, 28 } }, reward = xi.items.SUMMONERS_PIGACHES_P1 },
    [176] = { trade = { xi.items.MIRAGE_KEFFIYEH,xi.items.MIRAGE_KEFFIYEH_M1, xi.items.SQUARE_OF_KHROMATED_LEATHER,{ xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.MIRAGE_KEFFIYEH_P1 },
    [177] = { trade = { xi.items.MIRAGE_JUBBAH,xi.items.MIRAGE_JUBBAH_M1, xi.items.SQUARE_OF_SMOOTH_VELVET_CLOTH, { xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.MIRAGE_JUBBAH_P1 },
    [178] = { trade = { xi.items.MIRAGE_BAZUBANDS,xi.items.MIRAGE_BAZUBANDS_M1, xi.items.SQUARE_OF_KHROMATED_LEATHER,{ xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.MIRAGE_BAZUBANDS_P1 },
    [179] = { trade = { xi.items.MIRAGE_SHALWAR,xi.items.MIRAGE_SHALWAR_M1, xi.items.SQUARE_OF_SMOOTH_VELVET_CLOTH, { xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.MIRAGE_SHALWAR_P1 },
    [180] = { trade = { xi.items.MIRAGE_CHARUQS,xi.items.MIRAGE_CHARUQS_M1, xi.items.SQUARE_OF_KHROMATED_LEATHER,{ xi.items.ORDELLE_BRONZEPIECE, 26 } }, reward = xi.items.MIRAGE_CHARUQS_P1 },
    [181] = { trade = { xi.items.COMMODORE_TRICORNE,xi.items.COMMODORE_TRICORNE_M1, xi.items.SQUARE_OF_OVINNIK_LEATHER, { xi.items.ONE_BYNE_BILL, 30 } }, reward = xi.items.COMMODORE_TRICORNE_P1 },
    [182] = { trade = { xi.items.COMMODORE_FRAC,xi.items.COMMODORE_FRAC_M1, xi.items.SQUARE_OF_OIL_SOAKED_CLOTH,{ xi.items.ONE_BYNE_BILL, 30 } }, reward = xi.items.COMMODORE_FRAC_P1 },
    [183] = { trade = { xi.items.COMMODORE_GANTS,xi.items.COMMODORE_GANTS_M1, xi.items.SQUARE_OF_OIL_SOAKED_CLOTH,{ xi.items.ONE_BYNE_BILL, 30 } }, reward = xi.items.COMMODORE_GANTS_P1 },
    [184] = { trade = { xi.items.COMMODORE_TREWS,xi.items.COMMODORE_TREWS_M1, xi.items.SQUARE_OF_OIL_SOAKED_CLOTH,{ xi.items.ONE_BYNE_BILL, 30 } }, reward = xi.items.COMMODORE_TREWS_P1 },
    [185] = { trade = { xi.items.COMMODORE_BOTTES,xi.items.COMMODORE_BOTTES_M1, xi.items.SQUARE_OF_MARID_LEATHER,{ xi.items.ONE_BYNE_BILL, 30 } }, reward = xi.items.COMMODORE_BOTTES_P1 },
    [186] = { trade = { xi.items.PANTIN_TAJ,xi.items.PANTIN_TAJ_M1, xi.items.SQUARE_OF_FOULARD,{ xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.PANTIN_TAJ_P1 },
    [187] = { trade = { xi.items.PANTIN_TOBE,xi.items.PANTIN_TOBE_M1, xi.items.SQUARE_OF_GOLD_BROCADE,{ xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.PANTIN_TOBE_P1 },
    [188] = { trade = { xi.items.PANTIN_DASTANAS,xi.items.PANTIN_DASTANAS_M1, xi.items.SQUARE_OF_FOULARD,{ xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.PANTIN_DASTANAS_P1 },
    [189] = { trade = { xi.items.PANTIN_CHURIDARS,xi.items.PANTIN_CHURIDARS_M1, xi.items.SQUARE_OF_FOULARD,{ xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.PANTIN_CHURIDARS_P1 },
    [190] = { trade = { xi.items.PANTIN_BABOUCHES,xi.items.PANTIN_BABOUCHES_M1, xi.items.SQUARE_OF_PEISTE_LEATHER,{ xi.items.TUKUKU_WHITESHELL, 26 } }, reward = xi.items.PANTIN_BABOUCHES_P1 },
    [191] = { trade = { xi.items.ETOILE_TIARA,xi.items.ETOILE_TIARA_M1,  xi.items.GOLD_INGOT,{ xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.ETOILE_TIARA_P1 },
    [192] = { trade = { xi.items.ETOILE_CASAQUE,xi.items.ETOILE_CASAQUE_M1, xi.items.SQUARE_OF_CILICE,{ xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.ETOILE_CASAQUE_P1 },
    [193] = { trade = { xi.items.ETOILE_BANGLES,xi.items.ETOILE_BANGLES_M1,  xi.items.GOLD_INGOT,{ xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.ETOILE_BANGLES_P1 },
    [194] = { trade = { xi.items.ETOILE_TIGHTS,xi.items.ETOILE_TIGHTS_M1, xi.items.SQUARE_OF_SMOOTH_VELVET_CLOTH, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.ETOILE_TIGHTS_P1 },
    [195] = { trade = { xi.items.ETOILE_TOE_SHOES,xi.items.ETOILE_TOE_SHOES_M1, xi.items.SQUARE_OF_HOLY_LEATHER, { xi.items.ORDELLE_BRONZEPIECE, 30 } }, reward = xi.items.ETOILE_TOE_SHOES_P1 },
    [196] = { trade = { xi.items.ARGUTE_MORTARBOARD,xi.items.ARGUTE_MORTARBOARD_M1,  xi.items.PLATINUM_INGOT,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ARGUTE_MORTARBOARD_P1 },
    [197] = { trade = { xi.items.ARGUTE_GOWN,xi.items.ARGUTE_GOWN_M1, xi.items.SQUARE_OF_SCARLET_LINEN_CLOTH, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ARGUTE_GOWN_P1 },
    [198] = { trade = { xi.items.ARGUTE_BRACERS,xi.items.ARGUTE_BRACERS_M1, xi.items.SQUARE_OF_LYNX_LEATHER,{ xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ARGUTE_BRACERS_P1 },
    [199] = { trade = { xi.items.ARGUTE_PANTS,xi.items.ARGUTE_PANTS_M1, xi.items.SQUARE_OF_ETHER_LEATHER, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ARGUTE_PANTS_P1 },
    [200] = { trade = { xi.items.ARGUTE_LOAFERS,xi.items.ARGUTE_LOAFERS_M1, xi.items.SQUARE_OF_INCOMBUSTIBLE_WOOL, { xi.items.ONE_BYNE_BILL, 28 } }, reward = xi.items.ARGUTE_LOAFERS_P1 },
}

-----------------------------------
-- ancient beastcoin purchases
-- [menu option] = { item = itemId, abc = costInABCs }
-----------------------------------
local abcShop =
{
    [11] = { item = xi.items.FLAWLESS_RIBBON, abc = 150 },
    [12] = { item = xi.items.LOQUACIOUS_EARRING, abc =  75 },
    [13] = { item = xi.items.BRUTAL_EARRING, abc =  75 },
    [14] = { item = xi.items.CHARGER_MANTLE, abc = 150 },
    [15] = { item = xi.items.JAEGER_MANTLE, abc = 150 },
    [16] = { item = xi.items.BOXERS_MANTLE, abc =  75 },
    [17] = { item = xi.items.GUNNERS_MANTLE, abc =  75 },
    [18] = { item = xi.items.STEALTH_EARRING, abc =  75 },
    [19] = { item = xi.items.MUSICAL_EARRING, abc =  75 },
    [20] = { item =  xi.items.METAL_CHIP, abc =  75 },
}

-----------------------------------
-- trades chips for ancient beastcoins
-----------------------------------
local tier1Chips =
{
    xi.items.IVORY_CHIP,
    xi.items.SCARLET_CHIP,
    xi.items.EMERALD_CHIP,
    xi.items.SILVER_CHIP,
    xi.items.CERULEAN_CHIP,
    xi.items.SMALT_CHIP,
    xi.items.SMOKY_CHIP,
}

local tier2Chips =
{
    xi.items.ORCHID_CHIP,
    xi.items.CHARCOAL_CHIP,
    xi.items.MAGENTA_CHIP,
}

local tier1ChipValue = 5
local tier2ChipValue = 10

local cosmoReady = 2147483649 -- BITMASK for the purchase

local function getCosmoCleanseTime(player)
    local cosmoWaitTime = player:hasKeyItem(xi.ki.RHAPSODY_IN_MAUVE) and 3600 or 72000
    local lastCosmoTime = player:getCharVar("Cosmo_Cleanse_TIME")

    if lastCosmoTime ~= 0 then
        lastCosmoTime = lastCosmoTime + cosmoWaitTime
    end

    if lastCosmoTime <= os.time() then
        return cosmoReady
    end

    return (lastCosmoTime - 1009843200) - 39600 -- (os.time number - BITMASK for the event) - 11 hours in seconds. Only works in this format (strangely).
end

entity.onTrade = function(player, npc, trade)
    if player:getCurrentMission(xi.mission.log_id.COP) < xi.mission.id.cop.GARDEN_OF_ANTIQUITY then
        return
    end

    local count = trade:getItemCount()
    local afUpgrade = player:getCharVar("AFupgrade")

    -- store ancient beastcoins
    if trade:hasItemQty(xi.items.ANCIENT_BEASTCOIN, count) then
        local total = player:getCurrency("ancient_beastcoin") + count

        if total < 9999 then -- store max 9999 ancient beastcoins
            player:addCurrency("ancient_beastcoin", count)
            player:tradeComplete()
            player:startEvent(311, count, xi.items.NONE, 0, xi.items.NONE, 0, xi.items.NONE, 0, total)
        else
            player:messageSpecial(ID.text.SAGHEERA_MAX_ABCS)
        end

    -- Trade chips for ancient beastcoins
    elseif npcUtil.tradeSetInList(trade, tier1Chips) then
        player:startEvent(361, xi.items.ANCIENT_BEASTCOIN, tier1ChipValue)
    elseif npcUtil.tradeSetInList(trade, tier2Chips) then
        player:startEvent(361, xi.items.ANCIENT_BEASTCOIN, tier2ChipValue)

    -- af and relic upgrade trades
    elseif afUpgrade == 0 then
        local tradedCombo = 0
        local storedABCs  = player:getCurrency("ancient_beastcoin")

        -- check for af upgrade trades
        for k, v in pairs(afArmorPlusOne) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                if v.abc <= storedABCs then
                    player:delCurrency("ancient_beastcoin", v.abc)
                    tradedCombo = k
                else
                    player:messageSpecial(ID.text.SAGHEERA_LACK_ABCS)
                end

                break
            end
        end

        -- check for relic upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(relicArmorPlusOne) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
                end
            end
        end

        -- found a match
        if tradedCombo > 0 then
            player:confirmTrade()
            player:setCharVar("AFupgrade", tradedCombo)
            player:setCharVar("AFupgradeDay", getVanaMidnight()) -- Current time + Remaining minutes in the hour in seconds (Day Change)
            player:startEvent(312)
        end
    end
end

entity.onTrigger = function(player, npc)
    local wildcatJeuno = player:getCharVar("WildcatJeuno")

    -- LURE OF THE WILDCAT
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatJeuno, 19)
    then
        player:startEvent(313)

    -- Prevent interaction until player has progressed through COP enough
    elseif player:getCurrentMission(xi.mission.log_id.COP) < xi.mission.id.cop.GARDEN_OF_ANTIQUITY then
        player:showText(npc, ID.text.SAGHEERA_NO_LIMBUS_ACCESS)

        -- DEFAULT DIALOG (menu)
    else
        -- event parameters

        local storedABCs = player:getCurrency("ancient_beastcoin")
        local playerSagheera = player:getCharVar("SagheeraInteractions")
        -- bitfield of menu options
        local menu = 0
        -- bit 0 - has boughten a cosmo cleanse before
        if not utils.mask.getBit(playerSagheera, 0) then
            menu = utils.mask.setBit(menu, xi.items.NONE,true)
        end

        -- bit 1 - show "ask about ancient beastcoins" option
        -- Is shown once the player selects "Just wanted to chat"
        if not utils.mask.getBit(playerSagheera, 1) then
            menu = utils.mask.setBit(menu, 1, true)
        end

        -- bit 2 - display stored ABCs on "ask about ancient beastcoins"
        if storedABCs > 0 then
            menu = utils.mask.setBit(menu, 2, true)
        end

        -- bit 3 - do not give lengthy explaination on relic restoration
        -- Set the first time the player encounters option 5
        if not utils.mask.getBit(playerSagheera, 2) then
            menu = utils.mask.setBit(menu, 3, true)
        end

        -- bit 10 - ??? (this bit was set in some captures)
        menu = utils.mask.setBit(menu, 10, true)
        -- bit 11 - ??? (this bit was set in some captures)
        menu = utils.mask.setBit(menu, 11, true)
        -- bit 12 - show "Retrieve ancient beastcoins" option
        if storedABCs > 0 then
            menu = utils.mask.setBit(menu, 12, true)
        end

        -- bit 13 - player has RHAPSODY_IN_MAUVE (lowers Cosmo Cleanse cost)
        if player:hasKeyItem(xi.ki.RHAPSODY_IN_MAUVE) then
            menu = utils.mask.setBit(menu, 13, true)
        end

        local arg3 = 0
        local arg4 = 0
        local afUpgrade = player:getCharVar("AFupgrade")
        local gil = player:getGil()
        local hasCosmoCleanse = 0

        -- if player is waiting for an upgraded af or relic
        if afUpgrade > 0 then
            arg3 = afUpgrade
            if player:getCharVar("AFupgradeDay") > os.time() then
                arg4 = afUpgrade
            end
        end

        -- calculate COSMO_CLEANSE parameters
        local cosmoTime = 0

        if player:hasKeyItem(xi.ki.COSMO_CLEANSE) then
            hasCosmoCleanse = 1
        else
            cosmoTime = getCosmoCleanseTime(player)
        end

        player:startEvent(310, menu, arg3, arg4, gil, cosmoTime, 1, hasCosmoCleanse, storedABCs)
    end
end

entity.onEventUpdate = function(player, csid, option)
    -- info about af armor upgrades
    if csid == 310 and afArmorPlusOne[option] then
        local info = afArmorPlusOne[option]
        local trade = info.trade
        player:updateEvent(info.reward, trade[1], trade[2], trade[3], trade[4], xi.items.NONE, 0, info.abc)

    -- info about relic armor upgrades
    elseif csid == 310 and relicArmorPlusOne[option] then
        local info = relicArmorPlusOne[option]
        local trade = info.trade
        player:updateEvent(info.reward, trade[1], trade[2], trade[3], trade[4][1], trade[4][2], xi.items.NONE, 0)
    end
end

local handleMainEvent = function(player, option, coinAmount)
    -- "Just wanted to chat" for the first time
    if option == 1 then
        player:setCharVar("SagheeraInteractions", utils.mask.setBit(player:getCharVar("SagheeraInteractions"), 1, false))

    -- purchase COSMO_CLEANSE
    elseif option == 3 then
        local cosmoTime = getCosmoCleanseTime(player)
        local cost = player:hasKeyItem(xi.ki.RHAPSODY_IN_MAUVE) and xi.items.TWO_OF_COINS_CARD or xi.settings.main.COSMO_CLEANSE_BASE_COST
        if cosmoTime == cosmoReady and player:delGil(cost) then
            player:setCharVar("SagheeraInteractions", utils.mask.setBit(player:getCharVar("SagheeraInteractions"), xi.items.NONE,false))
            npcUtil.giveKeyItem(player, xi.ki.COSMO_CLEANSE)
        end

    -- retrieve stored ABCs
    elseif option == 4 then
        if
            player:getCurrency("ancient_beastcoin") >= coinAmount and
            npcUtil.giveItem(player, { { xi.items.ANCIENT_BEASTCOIN, coinAmount } })
        then
            player:delCurrency("ancient_beastcoin", coinAmount)
        end

    -- Relic restoration exited
    elseif option == 5 then
        player:setCharVar("SagheeraInteractions", utils.mask.setBit(player:getCharVar("SagheeraInteractions"), 2, false))

    -- purchase item using ancient beastcoins
    elseif abcShop[option] then
        local purchase = abcShop[option]

        if
            player:getCurrency("ancient_beastcoin") >= purchase.abc and
            npcUtil.giveItem(player, purchase.item)
        then
            player:delCurrency("ancient_beastcoin", purchase.abc)
        end

    -- get upgrade
    elseif option == 100 then
        local afUpgrade = player:getCharVar("AFupgrade")
        local info = afArmorPlusOne[afUpgrade]
        if info == nil then
            info = relicArmorPlusOne[afUpgrade]
        end

        -- found a valid reward
        if info and npcUtil.giveItem(player, info.reward) then
            player:setCharVar("AFupgrade", 0)
            player:setCharVar("AFupgradeDay", 0)
        end
    end
end

local handleTradeChipEvent = function(player, option)
    local trade = player:getTrade()
    if
        npcUtil.tradeSetInList(trade, tier1Chips) and
        npcUtil.giveItem(player, { { xi.items.ANCIENT_BEASTCOIN, tier1ChipValue } })
    then
        player:confirmTrade()
    elseif
        npcUtil.tradeSetInList(trade, tier2Chips) and
        npcUtil.giveItem(player, { { xi.items.ANCIENT_BEASTCOIN, tier2ChipValue } })
    then
        player:confirmTrade()
    end
end

entity.onEventFinish = function(player, csid, option)
    local coinAmount = bit.rshift(option, 16)
    option = bit.band(option, xi.items.GIL) -- Only use the first 16 bits

    -- LURE OF THE WILDCAT
    if csid == 313 then
        player:setCharVar("WildcatJeuno", utils.mask.setBit(player:getCharVar("WildcatJeuno"), 19, true))

    elseif csid == 310 then
        handleMainEvent(player, option, coinAmount)

    -- Trading chips for ancient beastcoins
    elseif csid == 361 and coinAmount > 0 then
        handleTradeChipEvent(player, option)
    end
end

return entity
