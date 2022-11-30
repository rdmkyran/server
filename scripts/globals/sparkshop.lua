-----------------------------------
-- Spark Shop
-- TO DO: Add Naakaul Seven Treasures
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/zone')
require('scripts/globals/items')
require('scripts/globals/extravaganza')
-----------------------------------

xi = xi or {}
xi.sparkshop = xi.sparkshop or {}

local optionToItem =
{
    [1] = { -- Items page
        [ 0] = { cost =    10, id = xi.items.SCROLL_OF_INSTANT_WARP },
        [ 1] = { cost =    10, id = xi.items.SCROLL_OF_INSTANT_RERAISE },
        [ 2] = { cost =  7500, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_1 },
        [ 3] = { cost =  7500, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_2 },
        [ 4] = { cost =  7500, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_3 },
        [ 5] = { cost =  7500, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_4 },
        [ 6] = { cost =  7500, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_5 },
        [ 7] = { cost = 15000, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_6 },
        [ 8] = { cost = 15000, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_7 },
        [ 9] = { cost = 15000, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_8 },
        [10] = { cost = 15000, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_9 },
        [11] = { cost = 15000, id = xi.items.COPY_OF_REMS_TALE_CHAPTER_10 },
        [12] = { cost =  5000, id = xi.items.CAPACITY_RING },
        [13] = { cost = 10000, id = xi.items.ETCHED_MEMORY },
    },
    [2] = { -- Skill-increasing tomes
        [ 0] = { cost = 200, id = xi.items.COPY_OF_MIKHES_MEMO },
        [ 1] = { cost = 200, id = xi.items.DAGGER_ENCHIRIDION },
        [ 2] = { cost = 200, id = xi.items.COPY_OF_SWING_AND_STAB },
        [ 3] = { cost = 200, id = xi.items.COPY_OF_MIEUSELOIRS_DIARY },
        [ 4] = { cost = 200, id = xi.items.COPY_OF_STRIKING_BULLS_DIARY },
        [ 5] = { cost = 200, id = xi.items.COPY_OF_DEATH_FOR_DIMWITS },
        [ 6] = { cost = 200, id = xi.items.COPY_OF_LUDWIGS_REPORT },
        [ 7] = { cost = 200, id = xi.items.COPY_OF_CLASH_OF_TITANS },
        [ 8] = { cost = 200, id = xi.items.COPY_OF_KAGETORAS_DIARY },
        [ 9] = { cost = 200, id = xi.items.COPY_OF_NOILLURIES_LOG },
        [10] = { cost = 200, id = xi.items.COPY_OF_FERREOUSS_DIARY },
        [11] = { cost = 200, id = xi.items.COPY_OF_KAYEEL_PAYEELS_MEMOIRS },
        [12] = { cost = 200, id = xi.items.COPY_OF_PERIHS_PRIMER },
        [13] = { cost = 200, id = xi.items.COPY_OF_BARRELS_OF_FUN },
        [14] = { cost = 200, id = xi.items.THROWING_WEAPON_ENCHIRIDION },
        [15] = { cost = 200, id = xi.items.COPY_OF_MIKHES_NOTE },
        [16] = { cost = 200, id = xi.items.COPY_OF_SONIAS_DIARY },
        [17] = { cost = 200, id = xi.items.COPY_OF_THE_SUCCESSOR },
        [18] = { cost = 200, id = xi.items.COPY_OF_KAGETORAS_JOURNAL },
        [19] = { cost = 200, id = xi.items.COPY_OF_ALTANAS_HYMN },
        [20] = { cost = 200, id = xi.items.COPY_OF_COVEFFE_BARROWS_MUSINGS },
        [21] = { cost = 200, id = xi.items.COPY_OF_AID_FOR_ALL },
        [22] = { cost = 200, id = xi.items.INVESTIGATIVE_REPORT },
        [23] = { cost = 200, id = xi.items.BOUNTY_LIST },
        [24] = { cost = 200, id = xi.items.COPY_OF_DARK_DEEDS },
        [25] = { cost = 200, id = xi.items.COPY_OF_BREEZY_LIBRETTO },
        [26] = { cost = 200, id = xi.items.CAVERNOUS_SCORE },
        [27] = { cost = 200, id = xi.items.BEAMING_SCORE },
        [28] = { cost = 200, id = xi.items.COPY_OF_YOMIS_DIAGRAM },
        [29] = { cost = 200, id = xi.items.COPY_OF_ASTRAL_HOMELAND },
        [30] = { cost = 200, id = xi.items.COPY_OF_LIFE_FORM_STUDY },
        [31] = { cost = 200, id = xi.items.COPY_OF_HROHJS_RECORD },
        [32] = { cost = 200, id = xi.items.COPY_OF_THE_BELL_TOLLS },
    },
    [3] = { -- Equipment (Lv.1 - 9)
        [ 0] = { cost = 50, id = xi.items.CESTI },
        [ 1] = { cost = 50, id = xi.items.BRONZE_KNUCKLES },
        [ 2] = { cost = 50, id = xi.items.BRASS_KNUCKLES },
        [ 3] = { cost = 50, id = xi.items.BRONZE_DAGGER },
        [ 4] = { cost = 50, id = xi.items.BRONZE_KNIFE },
        [ 5] = { cost = 50, id = xi.items.BLIND_DAGGER },
        [ 6] = { cost = 50, id = xi.items.BLIND_KNIFE },
        [ 7] = { cost = 50, id = xi.items.BRASS_DAGGER },
        [ 8] = { cost = 50, id = xi.items.WAX_SWORD },
        [ 9] = { cost = 50, id = xi.items.XIPHOS },
        [10] = { cost = 50, id = xi.items.BRONZE_AXE },
        [11] = { cost = 50, id = xi.items.BRASS_AXE },
        [12] = { cost = 50, id = xi.items.BUTTERFLY_AXE },
        [13] = { cost = 50, id = xi.items.INFERNO_AXE },
        [14] = { cost = 50, id = xi.items.BRONZE_ZAGHNAL },
        [15] = { cost = 50, id = xi.items.HARPOON },
        [16] = { cost = 50, id = xi.items.BRONZE_SPEAR },
        [17] = { cost = 50, id = xi.items.KUNAI },
        [18] = { cost = 50, id = xi.items.WAKIZASHI },
        [19] = { cost = 50, id = xi.items.TACHI },
        [20] = { cost = 50, id = xi.items.ASH_CLUB },
        [21] = { cost = 50, id = xi.items.BRONZE_MACE },
        [22] = { cost = 50, id = xi.items.BRONZE_HAMMER },
        [23] = { cost = 50, id = xi.items.BRONZE_ROD },
        [24] = { cost = 50, id = xi.items.WILLOW_WAND },
        [25] = { cost = 50, id = xi.items.ASH_STAFF },
        [26] = { cost = 50, id = xi.items.ASH_POLE },
        [27] = { cost = 50, id = xi.items.SHORTBOW },
        [28] = { cost = 50, id = xi.items.LONGBOW },
        [29] = { cost = 50, id = xi.items.SELF_BOW },
        [30] = { cost = 50, id = xi.items.LIGHT_CROSSBOW },
        [31] = { cost = 50, id = xi.items.MUSKETOON },
        [32] = { cost = 50, id = xi.items.FLUTE },
        [33] = { cost = 50, id = xi.items.CORNETTE },
        [34] = { cost = 50, id = xi.items.PICCOLO },
        [35] = { cost = 50, id = xi.items.MAPLE_HARP },
        [36] = { cost = 50, id = xi.items.BRONZE_CAP },
        [37] = { cost = 50, id = xi.items.BRONZE_HARNESS },
        [38] = { cost = 50, id = xi.items.BRONZE_MITTENS },
        [39] = { cost = 50, id = xi.items.BRONZE_SUBLIGAR },
        [40] = { cost = 50, id = xi.items.BRONZE_LEGGINGS },
        [41] = { cost = 50, id = xi.items.CIRCLET },
        [42] = { cost = 50, id = xi.items.ROBE },
        [43] = { cost = 50, id = xi.items.CUFFS },
        [44] = { cost = 50, id = xi.items.SLOPS },
        [45] = { cost = 50, id = xi.items.ASH_CLOGS },
        [46] = { cost = 50, id = xi.items.LEATHER_BANDANA },
        [47] = { cost = 50, id = xi.items.LEATHER_VEST },
        [48] = { cost = 50, id = xi.items.LEATHER_GLOVES },
        [49] = { cost = 50, id = xi.items.LEATHER_TROUSERS },
        [50] = { cost = 50, id = xi.items.LEATHER_HIGHBOOTS },
        [51] = { cost = 50, id = xi.items.TUNIC },
        [52] = { cost = 50, id = xi.items.MITTS },
        [53] = { cost = 50, id = xi.items.SLACKS },
        [54] = { cost = 50, id = xi.items.SOLEA },
        [55] = { cost = 50, id = xi.items.HACHIMAKI },
        [56] = { cost = 50, id = xi.items.KENPOGI },
        [57] = { cost = 50, id = xi.items.TEKKO },
        [58] = { cost = 50, id = xi.items.SITABAKI },
        [59] = { cost = 50, id = xi.items.KYAHAN },
        [60] = { cost = 50, id = xi.items.LAUAN_SHIELD },
        [61] = { cost = 50, id = xi.items.SHELL_SHIELD },
        [62] = { cost = 50, id = xi.items.MAPLE_SHIELD },
        [63] = { cost = 50, id = xi.items.ASPIS },
    },
    [4] = { -- Equipment (Lv.10 - 19)
        [ 0] = { cost =  60, id = xi.items.BRASS_BAGHNAKHS },
        [ 1] = { cost =  60, id = xi.items.DAGGER },
        [ 2] = { cost =  60, id = xi.items.KNIFE },
        [ 3] = { cost =  80, id = xi.items.BASELARD },
        [ 4] = { cost =  70, id = xi.items.BEE_SPATHA },
        [ 5] = { cost =  80, id = xi.items.BRASS_XIPHOS },
        [ 6] = { cost = 132, id = xi.items.IRON_SWORD },
        [ 7] = { cost =  60, id = xi.items.CLAYMORE },
        [ 8] = { cost =  98, id = xi.items.FLAME_CLAYMORE },
        [ 9] = { cost =  93, id = xi.items.BONE_AXE },
        [10] = { cost =  60, id = xi.items.BONE_PICK },
        [11] = { cost =  91, id = xi.items.GREATAXE },
        [12] = { cost =  60, id = xi.items.BRASS_ZAGHNAL },
        [13] = { cost = 177, id = xi.items.SCYTHE },
        [14] = { cost =  60, id = xi.items.BRASS_SPEAR },
        [15] = { cost =  60, id = xi.items.SPARK_SPEAR },
        [16] = { cost =  93, id = xi.items.SHINOBI_GATANA },
        [17] = { cost =  89, id = xi.items.MOKUTO },
        [18] = { cost =  68, id = xi.items.UCHIGATANA },
        [19] = { cost = 135, id = xi.items.NODACHI },
        [20] = { cost =  60, id = xi.items.BRASS_HAMMER },
        [21] = { cost =  60, id = xi.items.BRASS_ROD },
        [22] = { cost =  60, id = xi.items.CHESTNUT_CLUB },
        [23] = { cost =  60, id = xi.items.YEW_WAND },
        [24] = { cost =  81, id = xi.items.MACE },
        [25] = { cost =  60, id = xi.items.HOLLY_STAFF },
        [26] = { cost =  60, id = xi.items.HOLLY_POLE },
        [27] = { cost =  99, id = xi.items.POWER_BOW },
        [28] = { cost =  60, id = xi.items.CROSSBOW },
        [29] = { cost = 200, id = xi.items.BANDITS_GUN },
        [30] = { cost = 187, id = xi.items.TANEGASHIMA },
        [31] = { cost =  86, id = xi.items.GEMSHORN },
        [32] = { cost =  60, id = xi.items.HARP },
        [33] = { cost =  60, id = xi.items.FACEGUARD },
        [34] = { cost =  60, id = xi.items.SCALE_MAIL },
        [35] = { cost =  60, id = xi.items.SCALE_FINGER_GAUNTLETS },
        [36] = { cost =  60, id = xi.items.SCALE_CUISSES },
        [37] = { cost =  60, id = xi.items.SCALE_GREAVES },
        [38] = { cost =  60, id = xi.items.HEADGEAR },
        [39] = { cost =  60, id = xi.items.DOUBLET },
        [40] = { cost =  60, id = xi.items.GLOVES },
        [41] = { cost =  60, id = xi.items.BRAIS },
        [42] = { cost =  60, id = xi.items.GAITERS },
        [43] = { cost =  65, id = xi.items.BONE_MASK },
        [44] = { cost =  60, id = xi.items.BONE_HARNESS },
        [45] = { cost =  60, id = xi.items.BONE_MITTENS },
        [46] = { cost =  60, id = xi.items.BONE_SUBLIGAR },
        [47] = { cost =  60, id = xi.items.BONE_LEGGINGS },
        [48] = { cost =  60, id = xi.items.LIZARD_HELM },
        [49] = { cost =  60, id = xi.items.LIZARD_JERKIN },
        [50] = { cost =  60, id = xi.items.LIZARD_GLOVES },
        [51] = { cost =  60, id = xi.items.LIZARD_TROUSERS },
        [52] = { cost =  60, id = xi.items.LIZARD_LEDELSENS },
        [53] = { cost =  60, id = xi.items.ELM_SHIELD },
    },
    [5] = { -- Equipment (Lv.20 - 29)
        [ 0] = { cost =  87, id = xi.items.METAL_KNUCKLES },
        [ 1] = { cost = 144, id = xi.items.BAGHNAKHS },
        [ 2] = { cost =  99, id = xi.items.POISON_CESTI },
        [ 3] = { cost = 103, id = xi.items.KUKRI },
        [ 4] = { cost =  96, id = xi.items.POISON_DAGGER },
        [ 5] = { cost = 123, id = xi.items.POISON_KNIFE },
        [ 6] = { cost = 143, id = xi.items.MYTHRIL_DAGGER },
        [ 7] = { cost = 170, id = xi.items.DEGEN },
        [ 8] = { cost = 215, id = xi.items.TUCK },
        [ 9] = { cost = 269, id = xi.items.GLADIUS },
        [10] = { cost =  70, id = xi.items.PLAIN_SWORD },
        [11] = { cost = 349, id = xi.items.INFERNO_SWORD },
        [12] = { cost = 136, id = xi.items.BATTLEAXE },
        [13] = { cost =  83, id = xi.items.TOMAHAWK },
        [14] = { cost = 209, id = xi.items.ZAGHNAL },
        [15] = { cost =  84, id = xi.items.SPEAR },
        [16] = { cost = 103, id = xi.items.HIBARI },
        [17] = { cost = 120, id = xi.items.BUSUTO },
        [18] = { cost = 109, id = xi.items.WARHAMMER },
        [19] = { cost =  70, id = xi.items.ELM_STAFF },
        [20] = { cost =  70, id = xi.items.SPIKED_CLUB },
        [21] = { cost = 132, id = xi.items.WRAPPED_BOW },
        [22] = { cost = 520, id = xi.items.ARQUEBUS },
        [23] = { cost = 432, id = xi.items.PIRATES_GUN },
        [24] = { cost =  70, id = xi.items.TRADERS_CHAPEAU },
        [25] = { cost =  71, id = xi.items.TRADERS_SAIO },
        [26] = { cost =  70, id = xi.items.TRADERS_CUFFS },
        [27] = { cost =  70, id = xi.items.TRADERS_SLOPS },
        [28] = { cost =  70, id = xi.items.TRADERS_PIGACHES },
        [29] = { cost = 171, id = xi.items.IRON_MASK },
        [30] = { cost = 264, id = xi.items.CHAINMAIL },
        [31] = { cost = 141, id = xi.items.CHAIN_MITTENS },
        [32] = { cost = 210, id = xi.items.CHAIN_HOSE },
        [33] = { cost = 129, id = xi.items.GREAVES },
        [34] = { cost = 195, id = xi.items.SHADE_TIARA },
        [35] = { cost = 525, id = xi.items.SHADE_HARNESS },
        [36] = { cost = 301, id = xi.items.SHADE_MITTENS },
        [37] = { cost = 354, id = xi.items.SHADE_TIGHTS },
        [38] = { cost = 379, id = xi.items.SHADE_LEGGINGS },
        [39] = { cost = 250, id = xi.items.EISENSCHALLER },
        [40] = { cost = 250, id = xi.items.EISENBRUST },
        [41] = { cost = 170, id = xi.items.EISENHENTZES },
        [42] = { cost = 140, id = xi.items.EISENDIECHLINGS },
        [43] = { cost = 290, id = xi.items.EISENSCHUHS },
        [44] = { cost =  70, id = xi.items.SEERS_CROWN },
        [45] = { cost = 234, id = xi.items.SEERS_TUNIC },
        [46] = { cost =  97, id = xi.items.SEERS_MITTS },
        [47] = { cost = 137, id = xi.items.SEERS_SLACKS },
        [48] = { cost = 157, id = xi.items.SEERS_PUMPS },
        [49] = { cost =  83, id = xi.items.MAHOGANY_SHIELD },
        [50] = { cost =  70, id = xi.items.TURTLE_SHIELD },
        [51] = { cost = 153, id = xi.items.KITE_SHIELD },
    },
    [6] = { -- Equipment (Lv.30 - 39)
        [ 0] = { cost = 182, id = xi.items.CLAWS },
        [ 1] = { cost = 194, id = xi.items.KATARS },
        [ 2] = { cost = 230, id = xi.items.MYTHRIL_KNUCKLES },
        [ 3] = { cost = 317, id = xi.items.THUGS_JAMBIYA },
        [ 4] = { cost = 248, id = xi.items.MYTHRIL_KUKRI },
        [ 5] = { cost = 198, id = xi.items.MYTHRIL_BASELARD },
        [ 6] = { cost = 334, id = xi.items.BROADSWORD },
        [ 7] = { cost = 497, id = xi.items.HUNTING_SWORD },
        [ 8] = { cost = 430, id = xi.items.HOLY_SWORD },
        [ 9] = { cost = 493, id = xi.items.DIVINE_SWORD },
        [10] = { cost = 532, id = xi.items.FALX },
        [11] = { cost = 525, id = xi.items.MYTHRIL_CLAYMORE },
        [12] = { cost =  80, id = xi.items.PLAIN_PICK },
        [13] = { cost = 540, id = xi.items.MYTHRIL_AXE },
        [14] = { cost = 297, id = xi.items.VOULGE },
        [15] = { cost = 515, id = xi.items.HEAVY_AXE },
        [16] = { cost = 154, id = xi.items.LANCE },
        [17] = { cost = 144, id = xi.items.SPARK_LANCE },
        [18] = { cost = 135, id = xi.items.HALBERD },
        [19] = { cost = 130, id = xi.items.BROACH_LANCE },
        [20] = { cost = 168, id = xi.items.KODACHI },
        [21] = { cost = 230, id = xi.items.HOMURA },
        [22] = { cost = 325, id = xi.items.ASHURA },
        [23] = { cost = 324, id = xi.items.HOSODACHI },
        [24] = { cost = 228, id = xi.items.MAUL },
        [25] = { cost =  80, id = xi.items.CHESTNUT_WAND },
        [26] = { cost =  80, id = xi.items.MYTHRIL_ROD },
        [27] = { cost = 226, id = xi.items.MYTHRIL_MACE },
        [28] = { cost = 319, id = xi.items.HOLY_MAUL },
        [29] = { cost =  80, id = xi.items.ELM_POLE },
        [30] = { cost = 122, id = xi.items.OAK_STAFF },
        [31] = { cost = 312, id = xi.items.GREAT_BOW },
        [32] = { cost = 125, id = xi.items.COMPOSITE_BOW },
        [33] = { cost = 171, id = xi.items.ZAMBURAK },
        [34] = { cost = 340, id = xi.items.MARSS_HEXAGUN },
        [35] = { cost = 185, id = xi.items.DARKSTEEL_HEXAGUN },
        [36] = { cost = 210, id = xi.items.TRAVERSIERE },
        [37] = { cost = 250, id = xi.items.ROSE_HARP },
        [38] = { cost =  80, id = xi.items.GARISH_CROWN },
        [39] = { cost = 265, id = xi.items.GARISH_TUNIC },
        [40] = { cost =  84, id = xi.items.GARISH_MITTS },
        [41] = { cost = 190, id = xi.items.GARISH_SLACKS },
        [42] = { cost = 124, id = xi.items.GARISH_PUMPS },
        [43] = { cost =  80, id = xi.items.NOCT_BERET },
        [44] = { cost = 198, id = xi.items.NOCT_DOUBLET },
        [45] = { cost = 136, id = xi.items.NOCT_GLOVES },
        [46] = { cost = 135, id = xi.items.NOCT_BRAIS },
        [47] = { cost = 192, id = xi.items.NOCT_GAITERS },
        [48] = { cost = 174, id = xi.items.CLOAK },
        [49] = { cost =  82, id = xi.items.LINEN_MITTS },
        [50] = { cost = 188, id = xi.items.LINEN_SLACKS },
        [51] = { cost = 110, id = xi.items.SHOES },
        [52] = { cost =  85, id = xi.items.PADDED_CAP },
        [53] = { cost = 393, id = xi.items.PADDED_ARMOR },
        [54] = { cost = 216, id = xi.items.IRON_MITTENS },
        [55] = { cost = 316, id = xi.items.IRON_SUBLIGAR },
        [56] = { cost = 196, id = xi.items.LEGGINGS },
        [57] = { cost = 125, id = xi.items.RED_CAP },
        [58] = { cost = 250, id = xi.items.GAMBISON },
        [59] = { cost =  80, id = xi.items.BRACERS },
        [60] = { cost = 175, id = xi.items.HOSE },
        [61] = { cost = 200, id = xi.items.SOCKS },
        [62] = { cost = 285, id = xi.items.VELVET_HAT },
        [63] = { cost = 425, id = xi.items.VELVET_ROBE },
        [64] = { cost = 240, id = xi.items.VELVET_CUFFS },
        [65] = { cost = 347, id = xi.items.VELVET_SLOPS },
        [66] = { cost = 134, id = xi.items.EBONY_SABOTS },
        [67] = { cost = 302, id = xi.items.IRON_VISOR },
        [68] = { cost = 464, id = xi.items.IRON_SCALE_MAIL },
        [69] = { cost = 248, id = xi.items.IRON_FINGER_GAUNTLETS },
        [70] = { cost = 226, id = xi.items.IRON_GREAVES },
        [71] = { cost =  80, id = xi.items.TARGE },
        [72] = { cost = 195, id = xi.items.OAK_SHIELD },
        [73] = { cost = 256, id = xi.items.NYMPH_SHIELD },
    },
    [7] = { -- Equipment (Lv.40 - 50)
        [ 0] = { cost =  114, id = xi.items.HIMANTES },
        [ 1] = { cost =  298, id = xi.items.MYTHRIL_CLAWS },
        [ 2] = { cost =  416, id = xi.items.PATAS },
        [ 3] = { cost =  372, id = xi.items.ACID_BASELARD },
        [ 4] = { cost =   90, id = xi.items.BONE_KNIFE },
        [ 5] = { cost =  480, id = xi.items.FLAME_DEGEN },
        [ 6] = { cost =  680, id = xi.items.FALCHION },
        [ 7] = { cost =  775, id = xi.items.FLAME_BLADE },
        [ 8] = { cost =  775, id = xi.items.KNIGHTS_SWORD },
        [ 9] = { cost =  676, id = xi.items.GREATSWORD },
        [10] = { cost =  669, id = xi.items.FAUSSAR },
        [11] = { cost =  660, id = xi.items.TABAR },
        [12] = { cost =  740, id = xi.items.MYTHRIL_PICK },
        [13] = { cost =  481, id = xi.items.KHETEN },
        [14] = { cost =  690, id = xi.items.MYTHRIL_SCYTHE },
        [15] = { cost =  698, id = xi.items.MYTHRIL_ZAGHNAL },
        [16] = { cost = 1017, id = xi.items.MANDIBULAR_SICKLE },
        [17] = { cost =  258, id = xi.items.MYTHRIL_LANCE },
        [18] = { cost =  124, id = xi.items.BOKUTO },
        [19] = { cost =  231, id = xi.items.SAKURAFUBUKI },
        [20] = { cost =  120, id = xi.items.YOTO },
        [21] = { cost =  233, id = xi.items.HIEN },
        [22] = { cost =  374, id = xi.items.MIKAZUKI },
        [23] = { cost =  112, id = xi.items.BONE_ROD },
        [24] = { cost =  136, id = xi.items.ROSE_WAND },
        [25] = { cost =  156, id = xi.items.OAK_POLE },
        [26] = { cost =  105, id = xi.items.QUARTERSTAFF },
        [27] = { cost =  360, id = xi.items.BATTLE_BOW },
        [28] = { cost =  247, id = xi.items.KAMAN },
        [29] = { cost =  408, id = xi.items.WAR_BOW },
        [30] = { cost = 1200, id = xi.items.NEGOROSHIKI },
        [31] = { cost =  255, id = xi.items.ARBALEST },
        [32] = { cost =  308, id = xi.items.SEADOG_GUN },
        [33] = { cost =   90, id = xi.items.HORN },
        [34] = { cost =  120, id = xi.items.ANGELS_FLUTE },
        [35] = { cost =  414, id = xi.items.IRON_CUISSES },
        [36] = { cost =  354, id = xi.items.SALLET },
        [37] = { cost =  546, id = xi.items.BREASTPLATE },
        [38] = { cost =  288, id = xi.items.GAUNTLETS },
        [39] = { cost =  180, id = xi.items.CUISSES },
        [40] = { cost =  264, id = xi.items.PLATE_LEGGINGS },
        [41] = { cost =  750, id = xi.items.ALUMINE_SALADE },
        [42] = { cost = 1620, id = xi.items.ALUMINE_HAUBERT },
        [43] = { cost =  540, id = xi.items.ALUMINE_MOUFLES },
        [44] = { cost =  654, id = xi.items.ALUMINE_BRAYETTES },
        [45] = { cost =  534, id = xi.items.ALUMINE_SOLLERETS },
        [46] = { cost =  427, id = xi.items.BANDED_HELM },
        [47] = { cost =  660, id = xi.items.BANDED_MAIL },
        [48] = { cost =  352, id = xi.items.MUFFLERS },
        [49] = { cost =  525, id = xi.items.BREECHES },
        [50] = { cost =  322, id = xi.items.SOLLERETS },
        [51] = { cost =  224, id = xi.items.RAPTOR_HELM },
        [52] = { cost =  152, id = xi.items.RAPTOR_JERKIN },
        [53] = { cost =  360, id = xi.items.RAPTOR_GLOVES },
        [54] = { cost =  216, id = xi.items.RAPTOR_TROUSERS },
        [55] = { cost =  336, id = xi.items.RAPTOR_LEDELSENS },
        [56] = { cost =  437, id = xi.items.MYTHRIL_SALLET },
        [57] = { cost =  750, id = xi.items.MYTHRIL_BREASTPLATE },
        [58] = { cost =  396, id = xi.items.MYTHRIL_GAUNTLETS },
        [59] = { cost =  354, id = xi.items.MYTHRIL_CUISSES },
        [60] = { cost =  363, id = xi.items.MYTHRIL_LEGGINGS },
        [61] = { cost =  437, id = xi.items.SHINOBI_HACHIGANE },
        [62] = { cost =  660, id = xi.items.SHINOBI_GI },
        [63] = { cost =  363, id = xi.items.SHINOBI_TEKKO },
        [64] = { cost =  346, id = xi.items.SHINOBI_HAKAMA },
        [65] = { cost =  338, id = xi.items.SHINOBI_KYAHAN },
        [66] = { cost =  448, id = xi.items.STEEL_VISOR },
        [67] = { cost =  688, id = xi.items.STEEL_SCALE_MAIL },
        [68] = { cost =  368, id = xi.items.STEEL_FINGER_GAUNTLETS },
        [69] = { cost =  586, id = xi.items.STEEL_CUISSES },
        [70] = { cost =  325, id = xi.items.STEEL_GREAVES },
        [71] = { cost =  210, id = xi.items.CROW_BERET },
        [72] = { cost =  308, id = xi.items.CROW_JUPON },
        [73] = { cost =  182, id = xi.items.CROW_BRACERS },
        [74] = { cost =  287, id = xi.items.CROW_HOSE },
        [75] = { cost =  385, id = xi.items.CROW_GAITERS },
        [76] = { cost =  316, id = xi.items.HEATER_SHIELD },
        [77] = { cost =  311, id = xi.items.BUCKLER },
        [78] = { cost =  128, id = xi.items.LEATHER_SHIELD },
    },
    [8] = { -- Equipment (Lv.51 - 70)
        [ 0] = { cost =  389, id = xi.items.DARKSTEEL_KNUCKLES },
        [ 1] = { cost =  484, id = xi.items.DARKSTEEL_KATARS },
        [ 2] = { cost =  362, id = xi.items.TIGERFANGS },
        [ 3] = { cost =  200, id = xi.items.BEETLE_KNIFE },
        [ 4] = { cost =  891, id = xi.items.CERMET_KUKRI },
        [ 5] = { cost =  752, id = xi.items.DARKSTEEL_SWORD },
        [ 6] = { cost = 1018, id = xi.items.HANGER },
        [ 7] = { cost =  303, id = xi.items.MAILBREAKER },
        [ 8] = { cost = 1354, id = xi.items.JAGDPLAUTE },
        [ 9] = { cost =  997, id = xi.items.DARKSTEEL_CLAYMORE },
        [10] = { cost = 1485, id = xi.items.FLAMBERGE },
        [11] = { cost = 1025, id = xi.items.DARKSTEEL_AXE },
        [12] = { cost =  556, id = xi.items.NADZIAK },
        [13] = { cost = 1155, id = xi.items.COLOSSAL_AXE },
        [14] = { cost =  200, id = xi.items.BONE_SCYTHE },
        [15] = { cost = 1253, id = xi.items.DARKSTEEL_SCYTHE },
        [16] = { cost =  735, id = xi.items.BATTLE_FORK },
        [17] = { cost =  483, id = xi.items.DARKSTEEL_LANCE },
        [18] = { cost =  482, id = xi.items.COUSE },
        [19] = { cost =  546, id = xi.items.GOLDEN_SPEAR },
        [20] = { cost =  402, id = xi.items.KABUTOWARI },
        [21] = { cost =  260, id = xi.items.KORORITO },
        [22] = { cost =  632, id = xi.items.ZANBATO },
        [23] = { cost =  795, id = xi.items.KAZARIDACHI },
        [24] = { cost =  200, id = xi.items.EBONY_WAND },
        [25] = { cost =  284, id = xi.items.MYTHIC_WAND },
        [26] = { cost =  435, id = xi.items.EBONY_POLE },
        [27] = { cost =  623, id = xi.items.LEO_CROSSBOW },
        [28] = { cost =  517, id = xi.items.HEAVY_CROSSBOW },
        [29] = { cost =  533, id = xi.items.VELOCITY_BOW },
        [30] = { cost =  200, id = xi.items.CRUMHORN },
        [31] = { cost =  200, id = xi.items.HELLISH_BUGLE },
        [32] = { cost =  700, id = xi.items.MYTHIC_HARP },
        [33] = { cost =  456, id = xi.items.SCUTUM },
        [34] = { cost =  200, id = xi.items.HOPLON },
        [35] = { cost =  825, id = xi.items.WIVRE_SHIELD },
        [36] = { cost =  473, id = xi.items.DARKSTEEL_BUCKLER },
        [37] = { cost =  540, id = xi.items.DARKSTEEL_SHIELD },
        [38] = { cost =  281, id = xi.items.ROUND_SHIELD },
        [39] = { cost =  408, id = xi.items.GOLD_BUCKLER },
        [40] = { cost =  395, id = xi.items.TOWER_SHIELD },
        [41] = { cost =  560, id = xi.items.DIAMOND_SHIELD },
        [42] = { cost = 1560, id = xi.items.GENERALS_SHIELD },
        [43] = { cost =  204, id = xi.items.HICKORY_SHIELD },
    },
    [9] = { -- Equipment (Lv.71 - 98)
        [ 0] = { cost = 1033, id = xi.items.MANOPLES },
        [ 1] = { cost =  300, id = xi.items.EYRA_BAGHNAKHS },
        [ 2] = { cost =  300, id = xi.items.GULLY },
        [ 3] = { cost =  687, id = xi.items.YATAGHAN },
        [ 4] = { cost =  687, id = xi.items.VERUS_KNIFE },
        [ 5] = { cost =  687, id = xi.items.FIRMAMENT },
        [ 6] = { cost =  852, id = xi.items.FALCATA },
        [ 7] = { cost = 1625, id = xi.items.BAHADUR },
        [ 8] = { cost =  687, id = xi.items.CRATUS_SWORD },
        [ 9] = { cost =  866, id = xi.items.KARDIA_FAUSSAR },
        [10] = { cost =  694, id = xi.items.DOOM_TABAR },
        [11] = { cost =  701, id = xi.items.MAIDEN_TABAR },
        [12] = { cost =  790, id = xi.items.BHUJ },
        [13] = { cost =  687, id = xi.items.DOLOR_BHUJ },
        [14] = { cost =  687, id = xi.items.ELEPHAS_AXE },
        [15] = { cost =  675, id = xi.items.DEATH_SCYTHE },
        [16] = { cost =  687, id = xi.items.DIRE_SCYTHE },
        [17] = { cost =  762, id = xi.items.SECTUM_SICKLE },
        [18] = { cost =  795, id = xi.items.OX_TONGUE },
        [19] = { cost =  300, id = xi.items.ICE_LANCE },
        [20] = { cost =  391, id = xi.items.BORIAN_SPEAR },
        [21] = { cost =  926, id = xi.items.HAYABUSA },
        [22] = { cost =  687, id = xi.items.KAKKO },
        [23] = { cost =  561, id = xi.items.ICHI_AN },
        [24] = { cost =  701, id = xi.items.YUKITSUGU },
        [25] = { cost =  391, id = xi.items.TAIMAKUNIYUKI },
        [26] = { cost =  300, id = xi.items.BRASS_JADAGNA },
        [27] = { cost =  687, id = xi.items.VODUN_MACE },
        [28] = { cost =  302, id = xi.items.ROBUR_MACE },
        [29] = { cost =  300, id = xi.items.EIGHT_SIDED_POLE },
        [30] = { cost =  708, id = xi.items.WARMAGES_POLE },
        [31] = { cost =  516, id = xi.items.CERBERUS_BOW },
        [32] = { cost =  361, id = xi.items.BEURSAULT_BOW },
        [33] = { cost =  808, id = xi.items.CULVERIN },
        [34] = { cost =  650, id = xi.items.STAUROBOW },
        [35] = { cost =  687, id = xi.items.DARKWING },
        [36] = { cost =  687, id = xi.items.RIBAULDEQUIN },
        [37] = { cost =  656, id = xi.items.CECCHINOS_FUCILE },
        [38] = { cost =  644, id = xi.items.RITTER_SHIELD },
        [39] = { cost =  556, id = xi.items.ICE_SHIELD },
        [40] = { cost = 2231, id = xi.items.KOENIG_SHIELD },
        [41] = { cost = 2755, id = xi.items.ACHERON_SHIELD },
        [42] = { cost =  300,  id = xi.items.GLEAMING_SHIELD },
    },
    [10] = { -- Equipment (Lv.99)
        [ 0] = { cost =  3000, id = xi.items.OUTRIDER_MASK },
        [ 1] = { cost =  5000, id = xi.items.OUTRIDER_MAIL },
        [ 2] = { cost =  3000, id = xi.items.OUTRIDER_MITTENS },
        [ 3] = { cost =  3000, id = xi.items.OUTRIDER_HOSE },
        [ 4] = { cost =  3000, id = xi.items.OUTRIDER_GREAVES },
        [ 5] = { cost =  3000, id = xi.items.ESPIAL_CAP },
        [ 6] = { cost =  5000, id = xi.items.ESPIAL_GAMBISON },
        [ 7] = { cost =  3000, id = xi.items.ESPIAL_BRACERS },
        [ 8] = { cost =  3000, id = xi.items.ESPIAL_HOSE },
        [ 9] = { cost =  3000, id = xi.items.ESPIAL_SOCKS },
        [10] = { cost =  3000, id = xi.items.WAYFARER_CIRCLET },
        [11] = { cost =  5000, id = xi.items.WAYFARER_ROBE },
        [12] = { cost =  3000, id = xi.items.WAYFARER_CUFFS },
        [13] = { cost =  3000, id = xi.items.WAYFARER_SLOPS },
        [14] = { cost =  3000, id = xi.items.WAYFARER_CLOGS },
        [15] = { cost =  2000, id = xi.items.TEMACHTIANI_HEADBAND },
        [16] = { cost =  3000, id = xi.items.TEMACHTIANI_SHIRT },
        [17] = { cost =  2000, id = xi.items.TEMACHTIANI_GLOVES },
        [18] = { cost =  2000, id = xi.items.TEMACHTIANI_PANTS },
        [19] = { cost =  2000, id = xi.items.TEMACHTIANI_BOOTS },
        [20] = { cost =  7000, id = xi.items.EMINENT_BAGHNAKHS },
        [21] = { cost =  7000, id = xi.items.EMINENT_DAGGER },
        [22] = { cost =  7000, id = xi.items.EMINENT_SCIMITAR },
        [23] = { cost =  7000, id = xi.items.EMINENT_SWORD },
        [24] = { cost =  7000, id = xi.items.EMINENT_AXE },
        [25] = { cost =  7000, id = xi.items.EMINENT_VOULGE },
        [26] = { cost =  7000, id = xi.items.EMINENT_SICKLE },
        [27] = { cost =  7000, id = xi.items.EMINENT_LANCE },
        [28] = { cost =  7000, id = xi.items.KAITSUBURI },
        [29] = { cost =  7000, id = xi.items.ICHIMONJI_YOFUSA },
        [30] = { cost =  7000, id = xi.items.EMINENT_WAND },
        [31] = { cost =  7000, id = xi.items.EMINENT_STAFF },
        [32] = { cost =  7000, id = xi.items.EMINENT_POLE },
        [33] = { cost =  7000, id = xi.items.EMINENT_BOW },
        [34] = { cost =  7000, id = xi.items.EMINENT_CROSSBOW },
        [35] = { cost =  7000, id = xi.items.EMINENT_GUN },
        [36] = { cost =  7000, id = xi.items.EMINENT_SHIELD },
        [37] = { cost =  7000, id = xi.items.EMINENT_ANIMATOR },
        [38] = { cost =  7000, id = xi.items.EMINENT_SACHET },
        [39] = { cost = 10000, id = xi.items.ENLIVENED_RING },
        [40] = { cost = 10000, id = xi.items.VEHEMENCE_RING },
        [41] = { cost = 10000, id = xi.items.LONGSHOT_RING },
        [42] = { cost = 10000, id = xi.items.FISTMELE_RING },
        [43] = { cost = 10000, id = xi.items.PERCEPTION_RING },
        [44] = { cost = 10000, id = xi.items.ACUMEN_RING },
        [45] = { cost = 10000, id = xi.items.INFLUX_EARRING },
        [46] = { cost = 10000, id = xi.items.UPSURGE_EARRING },
        [47] = { cost = 10000, id = xi.items.ALLEGRO_EARRING },
        [48] = { cost = 10000, id = xi.items.IMPREGNABLE_EARRING },
        [49] = { cost = 10000, id = xi.items.FLASHWARD_EARRING },
        [50] = { cost = 10000, id = xi.items.SPELLBREAKER_EARRING },
        [51] = { cost = 10000, id = xi.items.MERIROSVO_RING },
        [52] = { cost = 10000, id = xi.items.EMINENT_BELL },
        [53] = { cost = 10000, id = xi.items.EMINENT_FLUTE },
        [54] = { cost =  5000, id = xi.items.EMINENT_ARROW },
        [55] = { cost =  5000, id = xi.items.EMINENT_BOLT },
        [56] = { cost =  5000, id = xi.items.EMINENT_BULLET },
        [57] = { cost =  7000, id = xi.items.HACHIYA_SHURIKEN },
        [58] = { cost =  7000, id = xi.items.EMINENT_ANIMATOR_II },
    },
    [12] = { -- Alter Ego Extravaganza Trusts
        [10133] = { cost =  500, id = xi.items.CIPHER_OF_F_COFFINS_ALTER_EGO }, -- F. Coffin
        [10138] = { cost =  500, id = xi.items.CIPHER_OF_CIDS_ALTER_EGO }, -- Cid
        [10148] = { cost =  500, id = xi.items.CIPHER_OF_GILGAMESHS_ALTER_EGO }, -- Gilgamesh
        [10152] = { cost =  500, id = xi.items.CIPHER_OF_QULTADAS_ALTER_EGO }, -- Qultada
        [10181] = { cost =  500, id = xi.items.CIPHER_OF_KINGS_ALTER_EGO }, -- King
    },
    [20] = { -- Currency Exchange
        [ 0] = { amount = 1000, name = "spark_of_eminence"      },
        [ 1] = { amount = 1000, name = "conquest_points"        },
        [ 2] = { amount = 1000, name = "imperial_standing"      },
        [ 3] = { amount = 1000, name = "allied_notes"           },
        [ 4] = { amount = 1000, name = "bayld"                  },
        [ 5] = { amount = 1000, name = "valor_point"            },
        [ 6] = { amount = 1000, name = "leujaoam_assault_point" },
        [ 7] = { amount = 1000, name = "mamool_assault_point"   },
        [ 8] = { amount = 1000, name = "lebros_assault_point"   },
        [ 9] = { amount = 1000, name = "periqia_assault_point"  },
        [10] = { amount = 1000, name = "ilrusi_assault_point"   },
        [11] = { amount = 1000, name = "cruor"                  },
        [12] = { amount = 1000, name = "kinetic_unit"           },
        [13] = { amount = 1000, name = "obsidian_fragment"      },
        [14] = { amount = 1000, name = "mweya_plasm"            },
        [15] = { amount = 1000, name = "ballista_point"         },
        [16] = { amount = 1000, name = "unity_accolades"        },
        [17] = { amount = 1000, name = "escha_silt"             }, -- Not Implemented
        [18] = { amount = 1000, name = "resistance_credit"      },
    },
}

-- Get cap for currencies if necessary, for use by charutils::AddPoints()
local function getCurrencyCap(currencyName)
    local cap = nil

    if currencyName == "spark_of_eminence" then
        cap = xi.settings.main.CAP_CURRENCY_SPARKS
    elseif currencyName == "unity_accolades" then
        cap = xi.settings.main.CAP_CURRENCY_ACCOLADES
    elseif currencyName == "ballista_point" then
        cap = xi.settings.main.CAP_CURRENCY_BALLISTA
    elseif currencyName == "valor_point" then
        cap = xi.settings.main.CAP_CURRENCY_VALOR
    end

    return cap
end

function xi.sparkshop.onTrade(player, npc, trade, eventid)
    local copperVouchersStored = player:getCurrency("aman_vouchers")
    local count = trade:getItemQty(8711)

    if count > 0 then
        trade:confirmItem(8711, count)
        player:addCurrency("aman_vouchers", count)
        player:confirmTrade()
        player:startEvent(eventid, 8711, count + copperVouchersStored, 230)
    end
end

function xi.sparkshop.onTrigger(player, npc, event)
    local sparks = player:getCurrency("spark_of_eminence")
    local vouchers = player:getCurrency("aman_vouchers")
    local remainingLimit = xi.settings.main.WEEKLY_EXCHANGE_LIMIT - player:getCharVar("weekly_sparks_spent")
    local cipher = xi.extravaganza.campaignActive() * 16 * 65536 -- Trust Alter Ego Extravaganza
    local naakual = 0 -- TODO: Naakual Seven Treasures Item Logic

    -- opens shop and lists available sparks
    player:startEvent(event, 0, sparks, vouchers, naakual, cipher, remainingLimit)
end

function xi.sparkshop.onEventUpdate(player, csid, option, npc)
    local sparks = player:getCurrency("spark_of_eminence")
    local weeklySparksSpent = player:getCharVar("weekly_sparks_spent")
    local remainingLimit = xi.settings.main.WEEKLY_EXCHANGE_LIMIT - weeklySparksSpent
    local category = bit.band(option, 0xFF)
    local selection = bit.rshift(option, 16)

    local qty = 1
    local requested_qty = bit.band(bit.rshift(option, 10), 0x3F)

    -- only skillup books and currencies can have qty > 1 aside from special cases such as ammo or shurikens
    if category == 2 or category == 20 or category == 30 then
        qty = requested_qty
    end

    -- There are three specific cases for Sparks rewards currently implemented:
    -- 1. Grant an Item based on Sparks cost (Category <= 10 or 12)
    -- 2. Grant Currency based on Vouchers spent (Category == 20)
    -- 3. Grant Provision Items based on Vouchers spent (Category == 30)
    if category <= 10 or category == 12 then
        local item = optionToItem[category][selection]
        local cost = item.cost * qty

        -- makes sure player has room for three stacks of tomes
        if qty > 12 and qty < 99 and player:getFreeSlotsCount() < 3 then
            player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, item.id)
            player:updateEvent(sparks, 0, 0, 0, 0, remainingLimit)
            return
        end

        -- handles eminent ammo
        if item.id == 21302 or item.id == 21316 or item.id == 21331 then
            qty = 99
            cost = 5000

        elseif item.id == 21355 then
            qty = 99
            cost = 7000
        end

        -- verifies and finishes transaction
        if cost > remainingLimit and xi.settings.main.ENABLE_EXCHANGE_LIMIT == 1 then
            player:messageSpecial(zones[player:getZoneID()].text.MAX_SPARKS_LIMIT_REACHED, xi.settings.main.WEEKLY_EXCHANGE_LIMIT)
        elseif sparks >= cost then
            if npcUtil.giveItem(player, { { item.id, qty } }) then
                sparks = sparks - cost
                player:delCurrency("spark_of_eminence", cost)
                if xi.settings.main.ENABLE_EXCHANGE_LIMIT == 1 then
                    remainingLimit = remainingLimit - cost
                    player:setCharVar("weekly_sparks_spent", weeklySparksSpent + cost)
                end
            end
        else
            player:messageSpecial(zones[player:getZoneID()].text.NOT_ENOUGH_SPARKS)
        end

        player:updateEvent(sparks, 0, 0, 0, 0, remainingLimit)
    elseif category == 20 then
        local copperVouchersStored = player:getCurrency("aman_vouchers")
        local currency = optionToItem[category][selection]

        if copperVouchersStored >= qty then
            player:delCurrency("aman_vouchers", qty)

            if currency.name == "conquest_points" then
                local nation = player:getNation()

                if nation == 0 then
                    currency.name = "sandoria_cp"
                elseif nation == 1 then
                    currency.name = "bastok_cp"
                elseif nation == 2 then
                    currency.name = "windurst_cp"
                end
            end

            player:addCurrency(currency.name, currency.amount * qty, getCurrencyCap(currency.name))
            player:messageSpecial(zones[player:getZoneID()].text.YOU_NOW_HAVE_AMT_CURRENCY, selection, player:getCurrency(currency.name))
        else
            player:messageSpecial(zones[player:getZoneID()].text.DO_NOT_POSSESS_ENOUGH, 8711)
        end

        player:updateEvent(sparks, player:getCurrency("aman_vouchers"))
    elseif category == 30 then
        local copperVouchersStored = player:getCurrency("aman_vouchers")

        if copperVouchersStored >= qty then
            if player:addItem({ id = selection, quantity = 2 * qty, silent = true }) then
                player:delCurrency("aman_vouchers", qty)
                player:messageSpecial(zones[player:getZoneID()].text.YOU_OBTAIN_ITEM, selection, 1) -- Retail: Provisions are always singular
            else
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, selection)
            end
        else
            player:messageSpecial(zones[player:getZoneID()].text.DO_NOT_POSSESS_ENOUGH, 8711)
        end

        player:updateEvent(sparks, player:getCurrency("aman_vouchers"))
    end
end

function xi.sparkshop.onEventFinish(player, csid, option)
end
