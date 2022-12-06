-----------------------------------
-- Area: Temenos
-- Name: Temenos Northern Tower
-- !addkeyitem white_card
-- !addkeyitem cosmo_cleanse
-- !pos 580.000 -2.375 104.000 37
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/limbus")
require("scripts/globals/items")
require("scripts/globals/keyitems")
-----------------------------------

local content = Limbus:new({
    zoneId           = xi.zone.TEMENOS,
    battlefieldId    = xi.battlefield.id.TEMENOS_NORTHERN_TOWER,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 0,
    area             = 1,
    entryNpc         = 'Matter_Diffusion_Module',
    requiredKeyItems = { xi.ki.COSMO_CLEANSE, xi.ki.WHITE_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    name             = "TEMENOS_NORTHERN_TOWER",
    timeExtension    = 15,
})

content.handleMobDeathVortex = function(floor, battlefield, mob, count)
    if count == 1 then
        content:openDoor(battlefield, floor)
    end
end

content.handleAllMobDeathCrate = function(floor, battlefield, mob)
    npcUtil.showCrate(GetNPCByID(ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[floor]))
    npcUtil.showCrate(GetNPCByID(ID.TEMENOS_NORTHERN_TOWER.npc.TIME_CRATES[floor]))
    xi.limbus.showRecoverCrate(ID.TEMENOS_NORTHERN_TOWER.npc.RECOVER_CRATES[floor])
end

content.paths =
{

    [ID.TEMENOS_NORTHERN_TOWER.mob.MOBLIN_DUSTMAN] =
    {
        { x = 340.000, y = 68.000, z = 436.000, wait = 10000 },
        { x = 340.000, y = 68.000, z = 456.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.MOBLIN_DUSTMAN + 1] =
    {
        { x = 344.000, y = 68.000, z = 460.000, wait = 10000 },
        { x = 364.000, y = 68.000, z = 460.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.MOBLIN_DUSTMAN + 2] =
    {
        { x = 370.000, y = 74.000, z = 432.000, wait = 10000 },
        { x = 370.000, y = 74.000, z = 408.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.MOBLIN_DUSTMAN + 3] =
    {
        { x = 374.000, y = 74.000, z = 408.000, wait = 10000 },
        { x = 374.000, y = 74.000, z = 432.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.KARI] =
    {
        { x = 186.000, y = -82.000, z = 464.000, wait = 3000 },
        { x = 214.000, y = -82.000, z = 466.000, wait = 3000 },
        { x = 214.000, y = -82.000, z = 494.000, wait = 3000 },
        { x = 186.000, y = -82.000, z = 494.000, wait = 3000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.TELCHINES_DRAGOON] =
    {
        { x = 30.000, y = 80.000, z = 419.500, wait = 10000 },
        { x = 50.000, y = 80.000, z = 419.500, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.TELCHINES_MONK] =
    {
        { x = 30.000, y = 80.000, z = 420.500, wait = 10000 },
        { x = 10.000, y = 80.000, z = 420.500, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.TELCHINES_MONK + 1] =
    {
        { x = 70.000, y = 80.000, z = 420.500, wait = 10000 },
        { x = 50.000, y = 80.000, z = 420.500, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.KINDRED_BLACK_MAGE] =
    {
        { x = -92.000, y = -80.000, z = 427.000, wait = 5000 },
        { x = -148.000, y = -80.000, z = 427.000, wait = 5000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.KINDRED_BLACK_MAGE + 1] =
    {
        { x = -92.000, y = -80.000, z = 430.000, wait = 5000 },
        { x = -148.000, y = -80.000, z = 430.000, wait = 5000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.KINDRED_BLACK_MAGE + 2] =
    {
        { x = -148.000, y = -80.000, z = 410.000, wait = 5000 },
        { x = -92.000, y = -80.000, z = 410.000, wait = 5000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.KINDRED_BLACK_MAGE + 3] =
    {
        { x = -148.000, y = -80.000, z = 413.000, wait = 5000 },
        { x = -92.000, y = -80.000, z = 413.000, wait = 5000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.CRYPTONBERRY_ABDUCTOR] =
    {
        { x = -456.000, y = -80.000, z = 420.500, wait = 30000 },
        { x = -424.000, y = -80.000, z = 420.500, wait = 30000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.CRYPTONBERRY_DESIGNATOR] =
    {
        { x = -424.000, y = -80.000, z = 419.500, wait = 30000 },
        { x = -456.000, y = -80.000, z = 419.500, wait = 30000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.CRYPTONBERRY_ABDUCTOR + 4] =
    {
        { x = -460.500, y = -80.000, z = 416.000, wait = 10000 },
        { x = -460.500, y = -80.000, z = 408.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.CRYPTONBERRY_DESIGNATOR + 4] =
    {
        { x = -459.500, y = -80.000, z = 416.000, wait = 10000 },
        { x = -459.500, y = -80.000, z = 408.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.CRYPTONBERRY_ABDUCTOR + 8] =
    {
        { x = -419.500, y = -80.000, z = 416.000, wait = 10000 },
        { x = -419.500, y = -80.000, z = 408.000, wait = 10000 },
    },

    [ID.TEMENOS_NORTHERN_TOWER.mob.CRYPTONBERRY_DESIGNATOR + 8] =
    {
        { x = -420.500, y = -80.000, z = 416.000, wait = 10000 },
        { x = -420.500, y = -80.000, z = 408.000, wait = 10000 },
    },
}

content.groups =
{
    -- Floor 1
    {
        mobs = { "Moblin_Dustman" },
        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        death = utils.bind(content.handleMobDeathVortex, 1),
    },

    {
        mobs = { "Goblin_Slaughterman" },
        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        allDeath = utils.bind(content.handleAllMobDeathCrate, 1),
    },

    -- Floor 2
    {
        mobs = { "Kari" },
        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        death = utils.bind(content.handleMobDeathVortex, 2),
    },

    {
        mobs =
        {
            "Skadi",
            "Thrym",
            "Beli",
        },

        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        allDeath = utils.bind(content.handleAllMobDeathCrate, 2),
    },

    -- Floor 3
    {
        mobs =
        {
            "Telchines_Monk",
            "Telchines_Dragoon",
        },

        death = utils.bind(content.handleMobDeathVortex, 3),
    },

    { mobs = { "Telchiness_Wyvern" } },

    {
        mobs =
        {
            "Telchines_Bard",
            "Telchines_White_Mage",
        },

        allDeath = utils.bind(content.handleAllMobDeathCrate, 3),
    },

    -- Floor 4
    {
        mobs = { "Kindred_Black_Mage" },
        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        death = utils.bind(content.handleMobDeathVortex, 4),
    },

    {
        mobs =
        {
            "Kindred_Warrior",
            "Kindred_Dark_Knight",
            "Kindred_Summoner",
        },

        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        allDeath = utils.bind(content.handleAllMobDeathCrate, 4),
    },

    {
        mobs =
        {
            "Kindreds_Elemental",
            "Kindreds_Avatar",
        }
    },

    -- Floor 5
    {
        mobs =
        {
            "Praetorian_Guard_CCXX",
            "Praetorian_Guard_LXXIII",
            "Praetorian_Guard_CXLVIII",
            "Praetorian_Guard_CCCXI",
        },

        death = utils.bind(content.handleMobDeathVortex, 5),
        allDeath = utils.bind(content.handleAllMobDeathCrate, 5),
    },

    -- Floor 6
    {
        mobs =
        {
            "Cryptonberry_Abductor",
            "Cryptonberry_Designator",
        },

        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        death = utils.bind(content.handleMobDeathVortex, 6),
    },

    {
        mobs =
        {
            "Tonberrys_Elemental",
            "Tonberrys_Avatar",
        },
    },

    {
        mobs =
        {
            "Cryptonberry_Charmer",
            "Cryptonberry_Skulker",
        },

        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        allDeath = utils.bind(content.handleAllMobDeathCrate, 6),
    },

    -- Floor 7
    {
        mobs =
        {
            "Goblin_Warlord",
            "Goblin_Fencer",
            "Goblin_Theurgist",
        },

        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetNPCByID(ID.TEMENOS_NORTHERN_TOWER.npc.LOOT_CRATE))
        end
    },

}

content.loot =
{
    [ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[1]] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 250 },
            { itemid = xi.items.PLAITED_CORD, droprate = 159 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate = 146 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate =  85 },
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate = 171 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate = 110 },
            { itemid = xi.items.SPOOL_OF_SILKWORM_THREAD, droprate = 220 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE, droprate =  98 },
        },
    },

    [ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 400 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate = 333 },
            { itemid = xi.items.PLAITED_CORD, droprate = 200 },
            { itemid = xi.items.SPOOL_OF_CHAMELEON_YARN, droprate = 100 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate =  90 },
            { itemid = xi.items.CHUNK_OF_SNOWY_CERMET, droprate =  70 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate =  90 },
            { itemid = xi.items.SQUARE_OF_DIABOLIC_SILK, droprate = 100 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN, droprate =  90 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD, droprate =  67 },
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate = 167 },
        },
    },

    [ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[3]] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate =  27 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate = 324 },
            { itemid = xi.items.SPOOL_OF_CHAMELEON_YARN, droprate =  80 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate = 189 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate =  27 },
            { itemid = xi.items.SQUARE_OF_DIABOLIC_SILK, droprate =  81 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT, droprate =  80 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN, droprate =  81 },
            { itemid = xi.items.SPOOL_OF_SILKWORM_THREAD, droprate = 270 },
            { itemid = xi.items.SQUARE_OF_FILET_LACE, droprate = 108 },
        },
    },

    [ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[4]] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 300 },
            { itemid = xi.items.CHUNK_OF_SNOWY_CERMET, droprate =  90 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate = 435 },
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate =  80 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate = 174 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN, droprate =  87 },
            { itemid = xi.items.PLAITED_CORD, droprate =  90 },
            { itemid = xi.items.SQUARE_OF_DIABOLIC_SILK, droprate =  87 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH, droprate =  43 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD, droprate =  27 },
            { itemid = xi.items.SPOOL_OF_SILKWORM_THREAD, droprate = 261 },
        },
    },

    [ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[5]] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 200 },
            { itemid = xi.items.PLAITED_CORD, droprate =  67 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate = 353 },
            { itemid = xi.items.SQUARE_OF_DIABOLIC_SILK, droprate =  87 },
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate = 110 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN, droprate =  87 },
            { itemid = xi.items.CHUNK_OF_SNOWY_CERMET, droprate =  50 },
            { itemid = xi.items.SPOOL_OF_CHAMELEON_YARN, droprate =  60 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate =  59 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE, droprate = 100 },
            { itemid = xi.items.SQUARE_OF_FILET_LACE, droprate = 110 },
        },
    },

    [ID.TEMENOS_NORTHERN_TOWER.npc.ITEM_CRATES[6]] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid = xi.items.PLAITED_CORD, droprate = 263 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate =  59 },
            { itemid = xi.items.CHUNK_OF_SNOWY_CERMET, droprate =  53 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate =  60 },
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate = 526 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH, droprate =  60 },
            { itemid = xi.items.SQUARE_OF_DIABOLIC_SILK, droprate =  53 },
            { itemid = xi.items.SPOOL_OF_CHAMELEON_YARN, droprate = 158 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE, droprate = 105 },
        },
    },

    [ID.TEMENOS_NORTHERN_TOWER.npc.LOOT_CRATE] =
    {
        {
            quantity = 6,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate = 240 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate = 120 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate = 200 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate =  40 },
            { itemid = xi.items.PLAITED_CORD, droprate = 120 },
            { itemid = xi.items.SPOOL_OF_SILKWORM_THREAD, droprate = 200 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE, droprate =  80 },
        },

        {
            { itemid = xi.items.IVORY_CHIP, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.METAL_CHIP, droprate =  55 },
        },
    },
}

return content:register()
