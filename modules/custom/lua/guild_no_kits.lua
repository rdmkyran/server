-----------------------------------
-- Conquest: Regional npcs always up, regardless of conquest results
-----------------------------------
require("modules/module_utils")
require("scripts/globals/shop")
-----------------------------------
local m = Module:new("guild_no_kits")

m:addOverride("xi.shop.generalGuild", function(player, stock, guildSkillId)
    local log = -1
    local generalGuildStockNoKit =
        {
            [xi.skill.COOKING] =
            {
                     xi.items.CHUNK_OF_ROCK_SALT,             16,      xi.craftRank.AMATEUR,
                    xi.items.FLASK_OF_DISTILLED_WATER,       12,      xi.craftRank.AMATEUR,
                    xi.items.LIZARD_EGG,                    100,      xi.craftRank.AMATEUR,
                    xi.items.SARUTA_ORANGE,                  32,      xi.craftRank.AMATEUR,
                    xi.items.BUNCH_OF_SAN_DORIAN_GRAPES,      76,      xi.craftRank.AMATEUR,
                    xi.items.JAR_OF_MISO,                  2500,      xi.craftRank.AMATEUR,
                    xi.items.BOTTLE_OF_SOY_SAUCE,          2500,      xi.craftRank.AMATEUR,
                    xi.items.HANDFUL_OF_DRIED_BONITO,      2500,      xi.craftRank.AMATEUR,
                     xi.items.BAG_OF_SAN_DORIAN_FLOUR,        60,      xi.craftRank.RECRUIT,
                     xi.items.POT_OF_MAPLE_SUGAR,             40,      xi.craftRank.RECRUIT,
                    xi.items.FAERIE_APPLE,                   44,      xi.craftRank.RECRUIT,
                    xi.items.JUG_OF_SELBINA_MILK,            60,      xi.craftRank.RECRUIT,
                    xi.items.POT_OF_HONEY,                  200,      xi.craftRank.RECRUIT,
                    xi.items.KAZHAM_PINEAPPLE,               60,     xi.craftRank.INITIATE,
                    xi.items.LA_THEINE_CABBAGE,              24,     xi.craftRank.INITIATE,
                     xi.items.BAG_OF_RYE_FLOUR,               40,     xi.craftRank.INITIATE,
                    xi.items.THUNDERMELON,                  325,       xi.craftRank.NOVICE,
                    xi.items.WATERMELON,                    200,       xi.craftRank.NOVICE,
                     xi.items.STICK_OF_SELBINA_BUTTER,        60,       xi.craftRank.NOVICE,
                     xi.items.BUNCH_OF_KAZHAM_PEPPERS,        60,   xi.craftRank.APPRENTICE,
                    xi.items.BLOCK_OF_GELATIN,              900,   xi.craftRank.APPRENTICE,
                    xi.items.SERVING_OF_SPAGHETTI,         3000,   xi.craftRank.JOURNEYMAN,
                    xi.items.JAR_OF_GROUND_WASABI,         2595,   xi.craftRank.JOURNEYMAN,
                     xi.items.PIECE_OF_PIE_DOUGH,           1600,    xi.craftRank.CRAFTSMAN,
                    xi.items.PIECE_OF_PIZZA_DOUGH,         3000,    xi.craftRank.CRAFTSMAN,
                    xi.items.AZUKI_BEAN,                    600,    xi.craftRank.CRAFTSMAN,
            },
            [xi.skill.CLOTHCRAFT] =
            {
                    xi.items.SPINDLE,                        75,      xi.craftRank.AMATEUR,
                    xi.items.SPOOL_OF_ZEPHYR_THREAD,         75,      xi.craftRank.AMATEUR,
                     xi.items.CLUMP_OF_MOKO_GRASS,            20,      xi.craftRank.AMATEUR,
                     xi.items.BALL_OF_SARUTA_COTTON,         500,      xi.craftRank.RECRUIT,
                    xi.items.CLUMP_OF_RED_MOKO_GRASS,       200,      xi.craftRank.RECRUIT,
                     xi.items.SPOOL_OF_LINEN_THREAD,         150,     xi.craftRank.INITIATE,
                     xi.items.SPOOL_OF_WOOL_THREAD,         2800,       xi.craftRank.NOVICE,
                    xi.items.CLUMP_OF_MOHBWA_GRASS,         800,   xi.craftRank.APPRENTICE,
                     xi.items.SPOOL_OF_SILK_THREAD,         1500,   xi.craftRank.APPRENTICE,
                    xi.items.CLUMP_OF_KARAKUL_WOOL,        1400,   xi.craftRank.JOURNEYMAN,
                     xi.items.SPOOL_OF_GOLD_THREAD,        14500,    xi.craftRank.CRAFTSMAN,
                    xi.items.SPOOL_OF_KHOMA_THREAD,     1126125,      xi.craftRank.AMATEUR
            },
            [xi.skill.GOLDSMITHING] =
            {
                    xi.items.WORKSHOP_ANVIL,                 75,      xi.craftRank.AMATEUR,
                    xi.items.MANDREL,                        75,      xi.craftRank.AMATEUR,
                     xi.items.CHUNK_OF_ZINC_ORE,             200,      xi.craftRank.AMATEUR,
                     xi.items.CHUNK_OF_COPPER_ORE,            12,      xi.craftRank.AMATEUR,
                    xi.items.BRASS_NUGGET,                   40,      xi.craftRank.RECRUIT,
                     xi.items.BRASS_SHEET,                   300,      xi.craftRank.RECRUIT,
                     xi.items.CHUNK_OF_SILVER_ORE,           450,      xi.craftRank.RECRUIT,
                    xi.items.SILVER_NUGGET,                 200,     xi.craftRank.INITIATE,
                     xi.items.TOURMALINE,                   1863,     xi.craftRank.INITIATE,
                     xi.items.SARDONYX,                     1863,     xi.craftRank.INITIATE,
                     xi.items.CLEAR_TOPAZ,                  1863,     xi.craftRank.INITIATE,
                     xi.items.AMETHYST,                     1863,     xi.craftRank.INITIATE,
                     xi.items.LAPIS_LAZULI,                 1863,     xi.craftRank.INITIATE,
                     xi.items.AMBER_STONE,                  1863,     xi.craftRank.INITIATE,
                     xi.items.ONYX,                         1863,     xi.craftRank.INITIATE,
                     xi.items.LIGHT_OPAL,                   1863,     xi.craftRank.INITIATE,
                     xi.items.SILVER_CHAIN,                23000,       xi.craftRank.NOVICE,
                     xi.items.CHUNK_OF_MYTHRIL_ORE,         2000,       xi.craftRank.NOVICE,
                     xi.items.CHUNK_OF_GOLD_ORE,            3000,   xi.craftRank.APPRENTICE,
                     xi.items.MYTHRIL_SHEET,               12000,   xi.craftRank.APPRENTICE,
                     xi.items.PERIDOT,                      8000,   xi.craftRank.APPRENTICE,
                     xi.items.GARNET,                       8000,   xi.craftRank.APPRENTICE,
                     xi.items.GOSHENITE,                    8000,   xi.craftRank.APPRENTICE,
                     xi.items.AMETRINE,                     8000,   xi.craftRank.APPRENTICE,
                     xi.items.TURQUOISE,                    8000,   xi.craftRank.APPRENTICE,
                     xi.items.SPHENE,                       8000,   xi.craftRank.APPRENTICE,
                     xi.items.BLACK_PEARL,                  8000,   xi.craftRank.APPRENTICE,
                     xi.items.PEARL,                        8000,   xi.craftRank.APPRENTICE,
                     xi.items.CHUNK_OF_ALUMINUM_ORE,        5000,   xi.craftRank.APPRENTICE,
                     xi.items.GOLD_SHEET,                  32000,   xi.craftRank.JOURNEYMAN,
                     xi.items.GOLD_CHAIN,                  58000,   xi.craftRank.JOURNEYMAN,
                     xi.items.CHUNK_OF_PLATINUM_ORE,        6000,    xi.craftRank.CRAFTSMAN,
                    xi.items.CHUNK_OF_RUTHENIUM_ORE,    1126125,      xi.craftRank.AMATEUR
            },
            [xi.skill.WOODWORKING] =
            {
                    xi.items.SPOOL_OF_BUNDLING_TWINE,       100,      xi.craftRank.AMATEUR,
                     xi.items.ARROWWOOD_LOG,                  25,      xi.craftRank.AMATEUR,
                     xi.items.LAUAN_LOG,                      50,      xi.craftRank.AMATEUR,
                     xi.items.MAPLE_LOG,                      70,      xi.craftRank.AMATEUR,
                     xi.items.HOLLY_LOG,                     800,      xi.craftRank.RECRUIT,
                     xi.items.WILLOW_LOG,                   1600,      xi.craftRank.RECRUIT,
                     xi.items.WALNUT_LOG,                   1300,      xi.craftRank.RECRUIT,
                     xi.items.YEW_LOG,                       500,     xi.craftRank.INITIATE,
                     xi.items.ELM_LOG,                      3800,     xi.craftRank.INITIATE,
                     xi.items.CHESTNUT_LOG,                 3400,     xi.craftRank.INITIATE,
                     xi.items.DOGWOOD_LOG,                  2000,       xi.craftRank.NOVICE,
                     xi.items.OAK_LOG,                      4000,       xi.craftRank.NOVICE,
                     xi.items.ROSEWOOD_LOG,                 4500,   xi.craftRank.APPRENTICE,
                     xi.items.MAHOGANY_LOG,                 4500,   xi.craftRank.JOURNEYMAN,
                     xi.items.EBONY_LOG,                    5000,    xi.craftRank.CRAFTSMAN,
                    xi.items.FEYWEALD_LOG,                 5500,    xi.craftRank.CRAFTSMAN,
                    xi.items.CYPRESS_LOG,               1126125,      xi.craftRank.AMATEUR
            },
            [xi.skill.ALCHEMY] =
            {
                    xi.items.TRITURATOR,                     75,      xi.craftRank.AMATEUR,
                     xi.items.BEEHIVE_CHIP,                   40,      xi.craftRank.AMATEUR,
                     xi.items.VIAL_OF_MERCURY,              1700,      xi.craftRank.AMATEUR,
                     xi.items.BLOCK_OF_ANIMAL_GLUE,          300,      xi.craftRank.RECRUIT,
                     xi.items.PINCH_OF_POISON_DUST,          320,      xi.craftRank.RECRUIT,
                     xi.items.VIAL_OF_SLIME_OIL,            1500,     xi.craftRank.INITIATE,
                     xi.items.PINCH_OF_BOMB_ASH,             515,     xi.craftRank.INITIATE,
                     xi.items.LOOP_OF_GLASS_FIBER,          1200,       xi.craftRank.NOVICE,
                     xi.items.JAR_OF_FIRESAND,              5000,       xi.craftRank.NOVICE,
                    xi.items.FLASK_OF_VITRIOL,              700,   xi.craftRank.APPRENTICE,
                    xi.items.BOTTLE_OF_SIEGLINDE_PUTTY,    4000,   xi.craftRank.APPRENTICE,
                     xi.items.DRYAD_ROOT,                   1800,   xi.craftRank.APPRENTICE,
                     xi.items.LOOP_OF_CARBON_FIBER,         1900,   xi.craftRank.JOURNEYMAN,
                     xi.items.HECTEYES_EYE,                 2100,   xi.craftRank.JOURNEYMAN,
                     xi.items.JAR_OF_TOAD_OIL,              3600,   xi.craftRank.JOURNEYMAN,
                     xi.items.CERMET_CHUNK,                 5000,    xi.craftRank.CRAFTSMAN,
                     xi.items.PINCH_OF_VENOM_DUST,          1035,    xi.craftRank.CRAFTSMAN,
                    xi.items.AZURE_LEAF,                1126125,      xi.craftRank.AMATEUR
                     -- xi.items.BOTTLE_OF_AHRIMAN_TEARS,       200,     xi.craftRank.INITIATE,
            },
            [xi.skill.BONECRAFT] =
            {
                    xi.items.SHAGREEN_FILE,                  75,      xi.craftRank.AMATEUR,
                     xi.items.BONE_CHIP,                     150,      xi.craftRank.AMATEUR,
                     xi.items.HANDFUL_OF_FISH_SCALES,         96,      xi.craftRank.AMATEUR,
                     xi.items.CHICKEN_BONE,                 1500,      xi.craftRank.RECRUIT,
                     xi.items.GIANT_FEMUR,                  1400,      xi.craftRank.RECRUIT,
                     xi.items.BEETLE_SHELL,                  500,     xi.craftRank.INITIATE,
                     xi.items.BEETLE_JAW,                   1000,     xi.craftRank.INITIATE,
                     xi.items.RAM_HORN,                     1800,       xi.craftRank.NOVICE,
                     xi.items.BLACK_TIGER_FANG,             2000,       xi.craftRank.NOVICE,
                     xi.items.CRAB_SHELL,                   2500,   xi.craftRank.APPRENTICE,
                     xi.items.TURTLE_SHELL,                 6000,   xi.craftRank.JOURNEYMAN,
                     xi.items.SCORPION_CLAW,                2400,   xi.craftRank.JOURNEYMAN,
                    xi.items.BUGARD_TUSK,                  4000,   xi.craftRank.JOURNEYMAN,
                     xi.items.SCORPION_SHELL,               3000,    xi.craftRank.CRAFTSMAN,
                    xi.items.MARID_TUSK,                   4500,    xi.craftRank.CRAFTSMAN,
                    xi.items.FRAGMENT_OF_CYAN_CORAL,    1126125,      xi.craftRank.AMATEUR
            },
            [xi.skill.LEATHERCRAFT] =
            {
                    xi.items.TANNING_VAT,                    75,      xi.craftRank.AMATEUR,
                     xi.items.SHEEPSKIN,                     100,      xi.craftRank.AMATEUR,
                     xi.items.RABBIT_HIDE,                    80,      xi.craftRank.AMATEUR,
                     xi.items.LIZARD_SKIN,                   600,      xi.craftRank.RECRUIT,
                     xi.items.KARAKUL_SKIN,                  600,      xi.craftRank.RECRUIT,
                     xi.items.WOLF_HIDE,                     600,      xi.craftRank.RECRUIT,
                     xi.items.DHALMEL_HIDE,                 2400,     xi.craftRank.INITIATE,
                    xi.items.BUGARD_SKIN,                  2500,     xi.craftRank.INITIATE,
                     xi.items.RAM_SKIN,                     1500,       xi.craftRank.NOVICE,
                    xi.items.BUFFALO_HIDE,                16000,   xi.craftRank.APPRENTICE,
                     xi.items.RAPTOR_SKIN,                  3000,   xi.craftRank.JOURNEYMAN,
                    xi.items.CATOBLEPAS_HIDE,              2500,   xi.craftRank.JOURNEYMAN,
                    xi.items.SMILODON_HIDE,                3000,    xi.craftRank.CRAFTSMAN,
                     xi.items.COCKATRICE_SKIN,              3000,    xi.craftRank.CRAFTSMAN,
                    xi.items.SQUARE_OF_SYNTHETIC_FAULPIE_LEATHER, 1126125,      xi.craftRank.AMATEUR
            },
            [xi.skill.SMITHING] =
            {
                    xi.items.WORKSHOP_ANVIL,                 75,      xi.craftRank.AMATEUR,
                    xi.items.MANDREL,                        75,      xi.craftRank.AMATEUR,
                     xi.items.CHUNK_OF_COPPER_ORE,            12,      xi.craftRank.AMATEUR,
                    xi.items.BRONZE_NUGGET,                  70,      xi.craftRank.AMATEUR,
                     xi.items.CHUNK_OF_TIN_ORE,               60,      xi.craftRank.RECRUIT,
                     xi.items.BRONZE_SHEET,                  120,      xi.craftRank.RECRUIT,
                     xi.items.CHUNK_OF_IRON_ORE,             900,      xi.craftRank.RECRUIT,
                    xi.items.CHUNK_OF_KOPPARNICKEL_ORE,     800,     xi.craftRank.INITIATE,
                    xi.items.IRON_NUGGET,                   500,     xi.craftRank.INITIATE,
                     xi.items.IRON_SHEET,                   6000,     xi.craftRank.INITIATE,
                     xi.items.STEEL_SHEET,                 10000,       xi.craftRank.NOVICE,
                     xi.items.STEEL_INGOT,                  6000,   xi.craftRank.APPRENTICE,
                     xi.items.LUMP_OF_TAMA_HAGANE,         12000,   xi.craftRank.APPRENTICE,
                    xi.items.DARKSTEEL_NUGGET,             2700,   xi.craftRank.JOURNEYMAN,
                     xi.items.CHUNK_OF_DARKSTEEL_ORE,       7000,   xi.craftRank.JOURNEYMAN,
                    xi.items.STEEL_NUGGET,                  800,   xi.craftRank.JOURNEYMAN,
                     xi.items.DARKSTEEL_SHEET,             28000,   xi.craftRank.JOURNEYMAN,
                    xi.items.CHUNK_OF_SWAMP_ORE,           5000,    xi.craftRank.CRAFTSMAN,
                    xi.items.CHUNK_OF_NIOBIUM_ORE,      1126125,      xi.craftRank.AMATEUR
            }
        }
    local stock = generalGuildStockNoKit[guildSkillId]
--    player:createShop(#stock / 3, log)
--
--    for i = 1, #stock, 3 do
--        player:addShopItem(stock[i], stock[i+1], guildSkillId, stock[i+2])
--    end
--
--    player:sendMenu(2)
end)

return m
