-----------------------------------
--    Functions for Shop system
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/items")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/keyitems")
-----------------------------------

-----------------------------------
-- IDs for Curio Vendor Moogle
-----------------------------------

local curio =
{
    ["medicine"]        = 1,
    ["ammunition"]      = 2,
    ["ninjutsuTools"]   = 3,
    ["foodStuffs"]      = 4,
    ["scrolls"]         = 5,
    ["keys"]            = 6,
    -- keyitems not implemented yet
}

xi = xi or {}

xi.shop =
{
    -- send general shop dialog to player
    -- stock cuts off after 16 items. if you add more, extras will not display
    -- stock is of form { itemId1, price1, itemId2, price2, ... }
    -- log is a fame area from xi.quest.fame_area
    general = function(player, stock, log)
        local priceMultiplier = 1

        if log == 0 or log == 4 then -- Sandoria has a 15.55%/fame tax while the other nations only havee 13%.
            priceMultiplier = (1 + ((7 / 45) * (9 - player:getFameLevel(log)) / 8)) * xi.settings.main.SHOP_PRICE
        elseif log then
            priceMultiplier = (1 + (0.13 * (9 - player:getFameLevel(log)) / 8)) * xi.settings.main.SHOP_PRICE
        else
            log = -1
        end

        player:createShop(#stock / 2, log)

        for i = 1, #stock, 2 do
            player:addShopItem(stock[i], stock[i + 1] * priceMultiplier)
        end

        player:sendMenu(2)
    end,

    -- send general guild shop dialog to player (Added on June 2014 QoL)
    -- stock is of form { itemId1, price1, guildID, guildRank, ... }
    -- log is default set to -1 as it's needed as part of createShop()
    generalGuild = function(player, stock, guildSkillId)
        local log = -1

        player:createShop(#stock / 3, log)

        for i = 1, #stock, 3 do
            player:addShopItem(stock[i], stock[i + 1], guildSkillId, stock[i + 2])
        end

        player:sendMenu(2)
    end,

    -- send curio vendor moogle shop shop dialog to player
    -- stock is of form { itemId1, price1, keyItemRequired, ... }
    -- log is default set to -1 as it's needed as part of createShop()
    curioVendorMoogle = function(player, stock)
        local log = -1

        player:createShop(#stock / 3, log)

        for i = 1, #stock, 3 do
            if player:hasKeyItem(stock[i + 2]) then
                player:addShopItem(stock[i], stock[i + 1])
            end
        end

        player:sendMenu(2)
    end,

    -- send nation shop dialog to player
    -- stock cuts off after 16 items. if you add more, extras will not display
    -- stock is of form { itemId1, price1, place1, itemId2, price2, place2, ... }
    --     where place is what place the nation must be in for item to be stocked
    -- nation is a xi.nation ID from scripts/globals/zone.lua
    nation = function(player, stock, nation)
        local rank = GetNationRank(nation)
        local newStock = {}
        for i = 1, #stock, 3 do
            if
                (stock[i + 2] == 1 and player:getNation() == nation and rank == 1) or
                (stock[i + 2] == 2 and rank <= 2) or
                (stock[i + 2] == 3)
            then
                table.insert(newStock, stock[i])
                table.insert(newStock, stock[i + 1])
            end
        end

        xi.shop.general(player, newStock, nation)
    end,

    -- send outpost shop dialog to player
    outpost = function(player)
        local stock =
        {
            xi.items.ANTIDOTE,                   316,
            xi.items.FLASK_OF_ECHO_DROPS,        800,
            xi.items.ETHER,                     4832,
            xi.items.FLASK_OF_EYE_DROPS,        2595,
            xi.items.POTION,                     910,
        }
        xi.shop.general(player, stock)
    end,

    -- send celebratory chest shop dialog to player
    celebratory = function(player)
        local stock =
        {
            xi.items.CRACKER,                     30,
            xi.items.TWINKLE_SHOWER,              30,
            xi.items.POPSTAR,                     60,
            xi.items.BRILLIANT_SNOW,              60,
            xi.items.OUKA_RANMAN,                 30,
            xi.items.LITTLE_COMET,                30,
            xi.items.POPPER,                     650,
            xi.items.WEDDING_BELL,              1000,
            xi.items.SERENE_SERINETTE,          6000,
            xi.items.JOYOUS_SERINETTE,          6000,
            xi.items.BOTTLE_OF_GRAPE_JUICE,     1116,
            xi.items.INFERNO_CRYSTAL,           3000,
            xi.items.CYCLONE_CRYSTAL,           3000,
            xi.items.TERRA_CRYSTAL,             3000,
        }
        xi.shop.general(player, stock)
    end,

    -- stock for guild vendors that are open 24/8
    generalGuildStock =
    {
        [xi.skill.COOKING] =
        {
            xi.items.CHUNK_OF_ROCK_SALT,              16,      xi.craftRank.AMATEUR,
            xi.items.FLASK_OF_DISTILLED_WATER,       12,      xi.craftRank.AMATEUR,
            xi.items.LIZARD_EGG,                    100,      xi.craftRank.AMATEUR,
            xi.items.SARUTA_ORANGE,                  32,      xi.craftRank.AMATEUR,
            xi.items.BUNCH_OF_SAN_DORIAN_GRAPES,      76,      xi.craftRank.AMATEUR,
            xi.items.JAR_OF_MISO,                  2500,      xi.craftRank.AMATEUR,
            xi.items.BOTTLE_OF_SOY_SAUCE,          2500,      xi.craftRank.AMATEUR,
            xi.items.HANDFUL_OF_DRIED_BONITO,      2500,      xi.craftRank.AMATEUR,
            xi.items.BAG_OF_SAN_DORIAN_FLOUR,         60,      xi.craftRank.RECRUIT,
            xi.items.POT_OF_MAPLE_SUGAR,              40,      xi.craftRank.RECRUIT,
            xi.items.FAERIE_APPLE,                   44,      xi.craftRank.RECRUIT,
            xi.items.JUG_OF_SELBINA_MILK,            60,      xi.craftRank.RECRUIT,
            xi.items.POT_OF_HONEY,                  200,      xi.craftRank.RECRUIT,
            xi.items.KAZHAM_PINEAPPLE,               60,     xi.craftRank.INITIATE,
            xi.items.LA_THEINE_CABBAGE,              24,     xi.craftRank.INITIATE,
            xi.items.BAG_OF_RYE_FLOUR,                40,     xi.craftRank.INITIATE,
            xi.items.THUNDERMELON,                  325,       xi.craftRank.NOVICE,
            xi.items.WATERMELON,                    200,       xi.craftRank.NOVICE,
            xi.items.STICK_OF_SELBINA_BUTTER,         60,       xi.craftRank.NOVICE,
            xi.items.BUNCH_OF_KAZHAM_PEPPERS,         60,   xi.craftRank.APPRENTICE,
            xi.items.BLOCK_OF_GELATIN,              900,   xi.craftRank.APPRENTICE,
            xi.items.SERVING_OF_SPAGHETTI,         3000,   xi.craftRank.JOURNEYMAN,
            xi.items.JAR_OF_GROUND_WASABI,         2595,   xi.craftRank.JOURNEYMAN,
            xi.items.PIECE_OF_PIE_DOUGH,            1600,    xi.craftRank.CRAFTSMAN,
            xi.items.PIECE_OF_PIZZA_DOUGH,         3000,    xi.craftRank.CRAFTSMAN,
            xi.items.AZUKI_BEAN,                    600,    xi.craftRank.CRAFTSMAN,
            xi.items.COOKING_KIT_5,                 300,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_10,                400,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_15,                650,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_20,               1050,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_25,               1600,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_30,               2300,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_35,               3150,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_40,               4150,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_45,               5300,      xi.craftRank.AMATEUR,
            xi.items.COOKING_KIT_50,               7600,      xi.craftRank.AMATEUR
        },

        [xi.skill.CLOTHCRAFT] =
        {
            xi.items.SPINDLE,                        75,      xi.craftRank.AMATEUR,
            xi.items.SPOOL_OF_ZEPHYR_THREAD,         75,      xi.craftRank.AMATEUR,
            xi.items.CLUMP_OF_MOKO_GRASS,             20,      xi.craftRank.AMATEUR,
            xi.items.BALL_OF_SARUTA_COTTON,          500,      xi.craftRank.RECRUIT,
            xi.items.CLUMP_OF_RED_MOKO_GRASS,       200,      xi.craftRank.RECRUIT,
            xi.items.SPOOL_OF_LINEN_THREAD,          150,     xi.craftRank.INITIATE,
            xi.items.SPOOL_OF_WOOL_THREAD,          2800,       xi.craftRank.NOVICE,
            xi.items.CLUMP_OF_MOHBWA_GRASS,         800,   xi.craftRank.APPRENTICE,
            xi.items.SPOOL_OF_SILK_THREAD,          1500,   xi.craftRank.APPRENTICE,
            xi.items.CLUMP_OF_KARAKUL_WOOL,        1400,   xi.craftRank.JOURNEYMAN,
            xi.items.SPOOL_OF_GOLD_THREAD,         14500,    xi.craftRank.CRAFTSMAN,
            xi.items.CLOTHCRAFT_KIT_5,              300,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_10,             400,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_15,             650,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_20,            1050,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_25,            1600,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_30,            2300,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_35,            3150,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_40,            4150,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_45,            5300,      xi.craftRank.AMATEUR,
            xi.items.CLOTHCRAFT_KIT_50,            7600,      xi.craftRank.AMATEUR,
            xi.items.SPOOL_OF_KHOMA_THREAD,     1126125,      xi.craftRank.AMATEUR
        },

        [xi.skill.GOLDSMITHING] =
        {
            xi.items.WORKSHOP_ANVIL,                 75,      xi.craftRank.AMATEUR,
            xi.items.MANDREL,                        75,      xi.craftRank.AMATEUR,
            xi.items.CHUNK_OF_ZINC_ORE,              200,      xi.craftRank.AMATEUR,
            xi.items.CHUNK_OF_COPPER_ORE,             12,      xi.craftRank.AMATEUR,
            xi.items.BRASS_NUGGET,                   40,      xi.craftRank.RECRUIT,
            xi.items.BRASS_SHEET,                    300,      xi.craftRank.RECRUIT,
            xi.items.CHUNK_OF_SILVER_ORE,            450,      xi.craftRank.RECRUIT,
            xi.items.SILVER_NUGGET,                 200,     xi.craftRank.INITIATE,
            xi.items.TOURMALINE,                    1863,     xi.craftRank.INITIATE,
            xi.items.SARDONYX,                      1863,     xi.craftRank.INITIATE,
            xi.items.CLEAR_TOPAZ,                   1863,     xi.craftRank.INITIATE,
            xi.items.AMETHYST,                      1863,     xi.craftRank.INITIATE,
            xi.items.LAPIS_LAZULI,                  1863,     xi.craftRank.INITIATE,
            xi.items.AMBER_STONE,                   1863,     xi.craftRank.INITIATE,
            xi.items.ONYX,                          1863,     xi.craftRank.INITIATE,
            xi.items.LIGHT_OPAL,                    1863,     xi.craftRank.INITIATE,
            xi.items.SILVER_CHAIN,                 23000,       xi.craftRank.NOVICE,
            xi.items.CHUNK_OF_MYTHRIL_ORE,          2000,       xi.craftRank.NOVICE,
            xi.items.CHUNK_OF_GOLD_ORE,             3000,   xi.craftRank.APPRENTICE,
            xi.items.MYTHRIL_SHEET,                12000,   xi.craftRank.APPRENTICE,
            xi.items.PERIDOT,                       8000,   xi.craftRank.APPRENTICE,
            xi.items.GARNET,                        8000,   xi.craftRank.APPRENTICE,
            xi.items.GOSHENITE,                     8000,   xi.craftRank.APPRENTICE,
            xi.items.AMETRINE,                      8000,   xi.craftRank.APPRENTICE,
            xi.items.TURQUOISE,                     8000,   xi.craftRank.APPRENTICE,
            xi.items.SPHENE,                        8000,   xi.craftRank.APPRENTICE,
            xi.items.BLACK_PEARL,                   8000,   xi.craftRank.APPRENTICE,
            xi.items.PEARL,                         8000,   xi.craftRank.APPRENTICE,
            xi.items.CHUNK_OF_ALUMINUM_ORE,         5000,   xi.craftRank.APPRENTICE,
            xi.items.GOLD_SHEET,                   32000,   xi.craftRank.JOURNEYMAN,
            xi.items.GOLD_CHAIN,                   58000,   xi.craftRank.JOURNEYMAN,
            xi.items.CHUNK_OF_PLATINUM_ORE,         6000,    xi.craftRank.CRAFTSMAN,
            xi.items.GOLDSMITHING_KIT_5,            300,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_10,           400,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_15,           650,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_20,          1050,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_25,          1600,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_30,          2300,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_35,          3150,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_40,          4150,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_45,          5300,      xi.craftRank.AMATEUR,
            xi.items.GOLDSMITHING_KIT_50,          7600,      xi.craftRank.AMATEUR,
            xi.items.CHUNK_OF_RUTHENIUM_ORE,    1126125,      xi.craftRank.AMATEUR
        },

        [xi.skill.WOODWORKING] =
        {
            xi.items.SPOOL_OF_BUNDLING_TWINE,       100,      xi.craftRank.AMATEUR,
            xi.items.ARROWWOOD_LOG,                   25,      xi.craftRank.AMATEUR,
            xi.items.LAUAN_LOG,                       50,      xi.craftRank.AMATEUR,
            xi.items.MAPLE_LOG,                       70,      xi.craftRank.AMATEUR,
            xi.items.HOLLY_LOG,                      800,      xi.craftRank.RECRUIT,
            xi.items.WILLOW_LOG,                    1600,      xi.craftRank.RECRUIT,
            xi.items.WALNUT_LOG,                    1300,      xi.craftRank.RECRUIT,
            xi.items.YEW_LOG,                        500,     xi.craftRank.INITIATE,
            xi.items.ELM_LOG,                       3800,     xi.craftRank.INITIATE,
            xi.items.CHESTNUT_LOG,                  3400,     xi.craftRank.INITIATE,
            xi.items.DOGWOOD_LOG,                   2000,       xi.craftRank.NOVICE,
            xi.items.OAK_LOG,                       4000,       xi.craftRank.NOVICE,
            xi.items.ROSEWOOD_LOG,                  4500,   xi.craftRank.APPRENTICE,
            xi.items.MAHOGANY_LOG,                  4500,   xi.craftRank.JOURNEYMAN,
            xi.items.EBONY_LOG,                     5000,    xi.craftRank.CRAFTSMAN,
            xi.items.FEYWEALD_LOG,                 5500,    xi.craftRank.CRAFTSMAN,
            xi.items.WOODWORKING_KIT_5,             300,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_10,            400,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_15,            650,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_20,           1050,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_25,           1600,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_30,           2300,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_35,           3150,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_40,           4150,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_45,           5300,      xi.craftRank.AMATEUR,
            xi.items.WOODWORKING_KIT_50,           7600,      xi.craftRank.AMATEUR,
            xi.items.CYPRESS_LOG,               1126125,      xi.craftRank.AMATEUR
        },

        [xi.skill.ALCHEMY] =
        {
            xi.items.TRITURATOR,                     75,      xi.craftRank.AMATEUR,
            xi.items.BEEHIVE_CHIP,                    40,      xi.craftRank.AMATEUR,
            xi.items.VIAL_OF_MERCURY,               1700,      xi.craftRank.AMATEUR,
            xi.items.BLOCK_OF_ANIMAL_GLUE,           300,      xi.craftRank.RECRUIT,
            xi.items.PINCH_OF_POISON_DUST,           320,      xi.craftRank.RECRUIT,
            xi.items.VIAL_OF_SLIME_OIL,             1500,     xi.craftRank.INITIATE,
            xi.items.PINCH_OF_BOMB_ASH,              515,     xi.craftRank.INITIATE,
            xi.items.BOTTLE_OF_AHRIMAN_TEARS,        200,     xi.craftRank.INITIATE,
            xi.items.LOOP_OF_GLASS_FIBER,           1200,       xi.craftRank.NOVICE,
            xi.items.JAR_OF_FIRESAND,               5000,       xi.craftRank.NOVICE,
            xi.items.FLASK_OF_VITRIOL,              700,   xi.craftRank.APPRENTICE,
            xi.items.BOTTLE_OF_SIEGLINDE_PUTTY,    4000,   xi.craftRank.APPRENTICE,
            xi.items.DRYAD_ROOT,                    1800,   xi.craftRank.APPRENTICE,
            xi.items.LOOP_OF_CARBON_FIBER,          1900,   xi.craftRank.JOURNEYMAN,
            xi.items.HECTEYES_EYE,                  2100,   xi.craftRank.JOURNEYMAN,
            xi.items.JAR_OF_TOAD_OIL,               3600,   xi.craftRank.JOURNEYMAN,
            xi.items.CERMET_CHUNK,                  5000,    xi.craftRank.CRAFTSMAN,
            xi.items.PINCH_OF_VENOM_DUST,           1035,    xi.craftRank.CRAFTSMAN,
            xi.items.ALCHEMY_KIT_5,                 300,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_10,                400,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_15,                650,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_20,               1050,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_25,               1600,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_30,               2300,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_35,               3150,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_40,               4150,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_45,               5300,      xi.craftRank.AMATEUR,
            xi.items.ALCHEMY_KIT_50,               7600,      xi.craftRank.AMATEUR,
            xi.items.AZURE_LEAF,                1126125,      xi.craftRank.AMATEUR
        },

        [xi.skill.BONECRAFT] =
        {
            xi.items.SHAGREEN_FILE,                  75,      xi.craftRank.AMATEUR,
            xi.items.BONE_CHIP,                      150,      xi.craftRank.AMATEUR,
            xi.items.HANDFUL_OF_FISH_SCALES,          96,      xi.craftRank.AMATEUR,
            xi.items.CHICKEN_BONE,                  1500,      xi.craftRank.RECRUIT,
            xi.items.GIANT_FEMUR,                   1400,      xi.craftRank.RECRUIT,
            xi.items.BEETLE_SHELL,                   500,     xi.craftRank.INITIATE,
            xi.items.BEETLE_JAW,                    1000,     xi.craftRank.INITIATE,
            xi.items.RAM_HORN,                      1800,       xi.craftRank.NOVICE,
            xi.items.BLACK_TIGER_FANG,              2000,       xi.craftRank.NOVICE,
            xi.items.CRAB_SHELL,                    2500,   xi.craftRank.APPRENTICE,
            xi.items.TURTLE_SHELL,                  6000,   xi.craftRank.JOURNEYMAN,
            xi.items.SCORPION_CLAW,                 2400,   xi.craftRank.JOURNEYMAN,
            xi.items.BUGARD_TUSK,                  4000,   xi.craftRank.JOURNEYMAN,
            xi.items.SCORPION_SHELL,                3000,    xi.craftRank.CRAFTSMAN,
            xi.items.MARID_TUSK,                   4500,    xi.craftRank.CRAFTSMAN,
            xi.items.BONECRAFT_KIT_5,               300,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_10,              400,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_15,              650,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_20,             1050,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_25,             1600,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_30,             2300,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_35,             3150,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_40,             4150,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_45,             5300,      xi.craftRank.AMATEUR,
            xi.items.BONECRAFT_KIT_50,             7600,      xi.craftRank.AMATEUR,
            xi.items.FRAGMENT_OF_CYAN_CORAL,    1126125,      xi.craftRank.AMATEUR
        },

        [xi.skill.LEATHERCRAFT] =
        {
            xi.items.TANNING_VAT,                    75,      xi.craftRank.AMATEUR,
            xi.items.SHEEPSKIN,                      100,      xi.craftRank.AMATEUR,
            xi.items.RABBIT_HIDE,                     80,      xi.craftRank.AMATEUR,
            xi.items.LIZARD_SKIN,                    600,      xi.craftRank.RECRUIT,
            xi.items.KARAKUL_SKIN,                   600,      xi.craftRank.RECRUIT,
            xi.items.WOLF_HIDE,                      600,      xi.craftRank.RECRUIT,
            xi.items.DHALMEL_HIDE,                  2400,     xi.craftRank.INITIATE,
            xi.items.BUGARD_SKIN,                  2500,     xi.craftRank.INITIATE,
            xi.items.RAM_SKIN,                      1500,       xi.craftRank.NOVICE,
            xi.items.BUFFALO_HIDE,                16000,   xi.craftRank.APPRENTICE,
            xi.items.RAPTOR_SKIN,                   3000,   xi.craftRank.JOURNEYMAN,
            xi.items.CATOBLEPAS_HIDE,              2500,   xi.craftRank.JOURNEYMAN,
            xi.items.SMILODON_HIDE,                3000,    xi.craftRank.CRAFTSMAN,
            xi.items.COCKATRICE_SKIN,               3000,    xi.craftRank.CRAFTSMAN,
            xi.items.LEATHERCRAFT_KIT_5,            300,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_10,           400,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_15,           650,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_20,          1050,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_25,          1600,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_30,          2300,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_35,          3150,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_40,          4150,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_45,          5300,      xi.craftRank.AMATEUR,
            xi.items.LEATHERCRAFT_KIT_50,          7600,      xi.craftRank.AMATEUR,
            xi.items.SQUARE_OF_SYNTHETIC_FAULPIE_LEATHER, 1126125,      xi.craftRank.AMATEUR
        },

        [xi.skill.SMITHING] =
        {
            xi.items.WORKSHOP_ANVIL,                 75,      xi.craftRank.AMATEUR,
            xi.items.MANDREL,                        75,      xi.craftRank.AMATEUR,
            xi.items.CHUNK_OF_COPPER_ORE,             12,      xi.craftRank.AMATEUR,
            xi.items.BRONZE_NUGGET,                  70,      xi.craftRank.AMATEUR,
            xi.items.CHUNK_OF_TIN_ORE,                60,      xi.craftRank.RECRUIT,
            xi.items.BRONZE_SHEET,                   120,      xi.craftRank.RECRUIT,
            xi.items.CHUNK_OF_IRON_ORE,              900,      xi.craftRank.RECRUIT,
            xi.items.CHUNK_OF_KOPPARNICKEL_ORE,     800,     xi.craftRank.INITIATE,
            xi.items.IRON_NUGGET,                   500,     xi.craftRank.INITIATE,
            xi.items.IRON_SHEET,                    6000,     xi.craftRank.INITIATE,
            xi.items.STEEL_SHEET,                  10000,       xi.craftRank.NOVICE,
            xi.items.STEEL_INGOT,                   6000,   xi.craftRank.APPRENTICE,
            xi.items.LUMP_OF_TAMA_HAGANE,          12000,   xi.craftRank.APPRENTICE,
            xi.items.DARKSTEEL_NUGGET,             2700,   xi.craftRank.JOURNEYMAN,
            xi.items.CHUNK_OF_DARKSTEEL_ORE,        7000,   xi.craftRank.JOURNEYMAN,
            xi.items.STEEL_NUGGET,                  800,   xi.craftRank.JOURNEYMAN,
            xi.items.DARKSTEEL_SHEET,              28000,   xi.craftRank.JOURNEYMAN,
            xi.items.CHUNK_OF_SWAMP_ORE,           5000,    xi.craftRank.CRAFTSMAN,
            xi.items.SMITHING_KIT_5,                300,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_10,               400,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_15,               650,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_20,              1050,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_25,              1600,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_30,              2300,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_35,              3150,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_40,              4150,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_45,              5300,      xi.craftRank.AMATEUR,
            xi.items.SMITHING_KIT_50,              7600,      xi.craftRank.AMATEUR,
            xi.items.CHUNK_OF_NIOBIUM_ORE,      1126125,      xi.craftRank.AMATEUR
        }
    },

    curioVendorMoogleStock =
    {
        [curio.medicine] =
        {
            4112,     300,      xi.ki.RHAPSODY_IN_WHITE,   -- Potion
            4116,     600,      xi.ki.RHAPSODY_IN_UMBER,   -- Hi-Potion
            4120,    1200,    xi.ki.RHAPSODY_IN_CRIMSON,   -- X-Potion
            -- 4128,     650,      xi.ki.RHAPSODY_IN_WHITE,   -- Ether / Temporarily(?) removed by SE June 2021
            4132,    1300,      xi.ki.RHAPSODY_IN_UMBER,   -- Hi-Ether
            4136,    3000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Super Ether
            4145,   15000,      xi.ki.RHAPSODY_IN_AZURE,   -- Elixir
            4148,     300,      xi.ki.RHAPSODY_IN_WHITE,   -- Antidote
            4150,    1000,      xi.ki.RHAPSODY_IN_UMBER,   -- Eye Drops
            4151,     700,      xi.ki.RHAPSODY_IN_UMBER,   -- Echo Drops
            4156,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Mulsum
            4164,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Prism Powder
            4165,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Silent Oil
            4166,     250,      xi.ki.RHAPSODY_IN_WHITE,   -- Deodorizer
            4172,    1000,      xi.ki.RHAPSODY_IN_AZURE,   -- Reraiser
        },

        [curio.ammunition] =
        {
            4219,     400,      xi.ki.RHAPSODY_IN_WHITE,   -- Stone Quiver
            4220,     680,      xi.ki.RHAPSODY_IN_WHITE,   -- Bone Quiver
            4225,    1200,      xi.ki.RHAPSODY_IN_WHITE,   -- Iron Quiver
            4221,    1350,      xi.ki.RHAPSODY_IN_WHITE,   -- Beetle Quiver
            4226,    2040,      xi.ki.RHAPSODY_IN_WHITE,   -- Silver Quiver
            4222,    2340,      xi.ki.RHAPSODY_IN_WHITE,   -- Horn Quiver
            5333,    3150,      xi.ki.RHAPSODY_IN_UMBER,   -- Sleep Quiver
            4223,    3500,      xi.ki.RHAPSODY_IN_UMBER,   -- Scorpion Quiver
            4224,    7000,      xi.ki.RHAPSODY_IN_AZURE,   -- Demon Quiver
            5332,    8800,      xi.ki.RHAPSODY_IN_AZURE,   -- Kabura Quiver
            5819,    9900,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Antlion Quiver
            4227,     400,      xi.ki.RHAPSODY_IN_WHITE,   -- Bronze Bolt Quiver
            5334,     800,      xi.ki.RHAPSODY_IN_WHITE,   -- Blind Bolt Quiver
            5335,    1250,      xi.ki.RHAPSODY_IN_WHITE,   -- Acid Bolt Quiver
            5337,    1500,      xi.ki.RHAPSODY_IN_WHITE,   -- Sleep Bolt Quiver
            5339,    2100,      xi.ki.RHAPSODY_IN_WHITE,   -- Bloody Bolt Quiver
            5338,    2100,      xi.ki.RHAPSODY_IN_WHITE,   -- Venom Bolt Quiver
            5336,    2400,      xi.ki.RHAPSODY_IN_WHITE,   -- Holy Bolt Quiver
            4228,    3500,      xi.ki.RHAPSODY_IN_UMBER,   -- Mythril Bolt Quiver
            4229,    5580,      xi.ki.RHAPSODY_IN_AZURE,   -- Darksteel Bolt Quiver
            5820,    9460,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Darkling Bolt Quiver
            5821,    9790,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Fusion Bolt Quiver
            5359,     400,      xi.ki.RHAPSODY_IN_WHITE,   -- Bronze Bullet Pouch
            5363,    1920,      xi.ki.RHAPSODY_IN_WHITE,   -- Bullet Pouch
            5341,    2400,      xi.ki.RHAPSODY_IN_WHITE,   -- Spartan Bullet Pouch
            5353,    4800,      xi.ki.RHAPSODY_IN_UMBER,   -- Iron Bullet Pouch
            5340,    4800,      xi.ki.RHAPSODY_IN_UMBER,   -- Silver Bullet Pouch
            5342,    7100,      xi.ki.RHAPSODY_IN_AZURE,   -- Corsair Bullet Pouch
            5416,    7600,      xi.ki.RHAPSODY_IN_AZURE,   -- Steel Bullet Pouch
            5822,    9680,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Dweomer Bullet Pouch
            5823,    9900,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Oberon Bullet Pouch
            6299,    1400,      xi.ki.RHAPSODY_IN_WHITE,   -- Shuriken Pouch
            6297,    2280,      xi.ki.RHAPSODY_IN_WHITE,   -- Juji Shuriken Pouch
            6298,    4640,      xi.ki.RHAPSODY_IN_UMBER,   -- Manji Shuriken Pouch
            6302,    7000,      xi.ki.RHAPSODY_IN_AZURE,   -- Fuma Shuriken Pouch
            6303,    9900,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Iga Shuriken Pouch
        },

        [curio.ninjutsuTools] =
        {
            5308,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Uchi)
            5309,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Tsurara)
            5310,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kawahori-Ogi)
            5311,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Makibishi)
            5312,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Hiraishin)
            5313,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Mizu-Deppo)
            5314,    5000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Shihei)
            5315,    5000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Jusatsu)
            5316,    5000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kaginawa)
            5317,    5000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Sairui-Ran)
            5318,    5000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kodoku)
            5319,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Shinobi-Tabi)
            5417,    3000,      xi.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Sanjaku-Tenugui)
            5734,    5000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Toolbag (Soshi)
        },
        [curio.foodStuffs] =
        {
            4378,      60,      xi.ki.RHAPSODY_IN_WHITE,   -- Selbina Milk
            4299,     100,      xi.ki.RHAPSODY_IN_WHITE,   -- Orange au Lait
            5703,     100,      xi.ki.RHAPSODY_IN_WHITE,   -- Uleguerand Milk
            4300,     300,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Apple au Lait
            4301,     600,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Pear au Lait
            4422,     200,      xi.ki.RHAPSODY_IN_WHITE,   -- Orange Juice
            4424,    1100,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Melon Juice
            4558,    2000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Yagudo Drink
            4405,     160,      xi.ki.RHAPSODY_IN_WHITE,   -- Rice Ball
            4376,     120,      xi.ki.RHAPSODY_IN_WHITE,   -- Meat Jerky
            4371,     184,      xi.ki.RHAPSODY_IN_WHITE,   -- Grilled Hare
            4381,     720,      xi.ki.RHAPSODY_IN_UMBER,   -- Meat Mithkabob
            -- 4456,     550,      xi.ki.RHAPSODY_IN_WHITE,   -- Boiled Crab / Temporarily(?) removed by SE June 2021
            4398,    1080,      xi.ki.RHAPSODY_IN_UMBER,   -- Fish Mithkabob
            5166,    1500,      xi.ki.RHAPSODY_IN_WHITE,   -- Coeurl Sub
            4538,     900,      xi.ki.RHAPSODY_IN_WHITE,   -- Roast Pipira
            6217,     500,      xi.ki.RHAPSODY_IN_AZURE,   -- Anchovy Slice
            6215,     400,      xi.ki.RHAPSODY_IN_UMBER,   -- Pepperoni Slice
            5752,    3500,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Pot-auf-feu
            4488,    1000,      xi.ki.RHAPSODY_IN_WHITE,   -- Jack-o'-Lantern
            5176,    5000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Bream Sushi
            5178,    4000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Dorado Sushi
            5721,    1500,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Crab Sushi
            5775,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Chocolate Crepe
            5766,    1000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Butter Crepe
            4413,     320,      xi.ki.RHAPSODY_IN_WHITE,   -- Apple Pie
            4421,     800,      xi.ki.RHAPSODY_IN_WHITE,   -- Melon Pie
            4446,    1200,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Pumpkin Pie
            4410,     344,      xi.ki.RHAPSODY_IN_WHITE,   -- Roast Mushroom
            4510,      24,      xi.ki.RHAPSODY_IN_WHITE,   -- Acorn Cookie
            4394,      12,      xi.ki.RHAPSODY_IN_AZURE,   -- Ginger Cookie
            5782,    1000,      xi.ki.RHAPSODY_IN_WHITE,   -- Sugar Rusk
            5783,    2000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Chocolate Rusk
            5779,    1000,      xi.ki.RHAPSODY_IN_WHITE,   -- Cherry Macaron
            5780,    2000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Coffee Macaron
            5885,    1000,      xi.ki.RHAPSODY_IN_WHITE,   -- Saltena
            5886,    2000,      xi.ki.RHAPSODY_IN_AZURE,   -- Elshena
            5887,    2500,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Montagna
            5889,    1000,      xi.ki.RHAPSODY_IN_WHITE,   -- Stuffed Pitaru
            5890,    2000,      xi.ki.RHAPSODY_IN_AZURE,   -- Poultry Pitaru
            5891,    2500,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Seafood Pitaru
            6258,    3000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Shiromochi
            6262,    3000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Kusamochi
            6260,    3000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Akamochi
            5547,   15000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Beef Stewpot
            5727,   15000,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Zaru Soba
            4466,     450,    xi.ki.RHAPSODY_IN_CRIMSON,   -- Spicy Cracker
        },

        [curio.scrolls] =
        {
            4181,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Instant Warp
            4182,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Instant Reraise
            5428,     500,      xi.ki.RHAPSODY_IN_AZURE,   -- Instant Retrace
            5988,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Instant Protect
            5989,     500,      xi.ki.RHAPSODY_IN_WHITE,   -- Instant Shell
            5990,     500,      xi.ki.RHAPSODY_IN_UMBER,   -- Instant Stoneskin
        },

        [curio.keys] =
        {
            1024,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Ghelsba Chest Key
            1025,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Palborough Chest Key
            1026,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Giddeus Chest Key
            1027,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Ranperre Chest Key
            1028,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Dangruf Chest Key
            1029,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Horutoto Chest Key
            1030,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Ordelle Chest Key
            1031,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Gusgen Chest Key
            1032,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Shakhrami Chest Key
            1033,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Davoi Chest Key
            1034,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Beadeaux Chest Key
            1035,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Oztroja Chest Key
            1036,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Delkfutt Chest Key
            1037,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Fei'Yin Chest Key
            1038,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Zvahl Chest Key
            1039,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Eldieme Chest Key
            1040,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Nest Chest Key
            1041,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Garlaige Chest Key
            1043,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Beadeaux Coffer Key
            1042,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Davoi Coffer Key
            1044,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Oztroja Coffer Key
            1045,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Nest Coffer Key
            1046,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Eldieme Coffer Key
            1047,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Garlaige Coffer Key
            1048,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Zvhal Coffer Key
            1049,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Uggalepih Coffer Key
            1050,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Den Coffer Key
            1051,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Kuftal Coffer Key
            1052,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Boyahda Coffer Key
            1053,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Cauldron Coffer Key
            1054,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Quicksand Coffer Key
            1055,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Grotto Chest Key
            1056,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Onzozo Chest Key
            1057,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Toraimarai Coffer Key
            1058,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Ru'Aun Coffer Key
            1059,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Grotto Coffer Key
            1060,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Ve'Lugannon Coffer Key
            1061,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Sacrarium Chest Key
            1062,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Oldton Chest Key
            1063,    5000,      xi.ki.RHAPSODY_IN_UMBER,   -- Newton Coffer Key
            1064,    2500,      xi.ki.RHAPSODY_IN_WHITE,   -- Pso'Xja Chest Key
        }
    }
}
