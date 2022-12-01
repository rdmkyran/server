-----------------------------------
-- Area: Apollyon
-- Name: NW Apollyon
-- !addkeyitem red_card
-- !addkeyitem cosmo_cleanse
-- !pos -600 -0.5 -600 38
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/limbus")
require("scripts/globals/items")
require("scripts/globals/keyitems")
-----------------------------------

local content = Limbus:new({
    zoneId           = xi.zone.APOLLYON,
    battlefieldId    = xi.battlefield.id.NW_APOLLYON,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 1,
    area             = 2,
    entryNpc         = '_127',
    requiredKeyItems = { xi.ki.COSMO_CLEANSE, xi.ki.RED_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    name             = "NW_APOLLYON",
    timeExtension   = 5,
})

function content:onBattlefieldInitialise(battlefield)
    Limbus.onBattlefieldInitialise(self, battlefield)

    for i, crateID in ipairs(ID.NW_APOLLYON.npc.TIME_CRATES) do
        npcUtil.showCrate(GetNPCByID(crateID))
    end

    for i, crateID in ipairs(ID.NW_APOLLYON.npc.RECOVER_CRATES) do
        npcUtil.showCrate(GetMobByID(crateID))
    end
end

local empowerBoss = function(battlefield, mobs)
    local boss = mobs[1]
    boss:addMod(xi.mod.ATTP, 100)
    boss:addMod(xi.mod.ACC, 50)
end

local depowerBoss = function(bossID)
    local boss = GetMobByID(bossID)
    boss:delMod(xi.mod.ATTP, 100)
    boss:delMod(xi.mod.ACC, 50)
end

content.paths =
{
    [ID.NW_APOLLYON.mob.PLUTO] =
    {
        { x = -458.0, y = 0.0, z = 46.0, wait = 5000 },
        { x = -458.0, y = 0.0, z = -14.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[1]] =
    {
        { x = -418.0, y = 0.0, z = 36.0, wait = 2500 },
        { x = -390.0, y = 0.0, z = 62.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[2]] =
    {
        { x = -410.0, y = 0.0, z = 68.0, wait = 2500 },
        { x = -396.0, y = 0.0, z = 34.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[3]] =
    {
        { x = -456.0, y = 0.0, z = 24.0, wait = 2500 },
        { x = -432.0, y = 0.0, z = 19.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[4]] =
    {
        { x = -502.0, y = 0.0, z = 30.0, wait = 2500 },
        { x = -476.0, y = 0.0, z = 23.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[5]] =
    {
        { x = -448.0, y = 0.0, z = 22.0, wait = 2500 },
        { x = -425.0, y = 0.0, z = 23.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[6]] =
    {
        { x = -429.0, y = 0.0, z = -28.0, wait = 2500 },
        { x = -450.0, y = 0.0, z = -24.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.BARDHA[7]] =
    {
        { x = -460.0, y = 0.0, z = 55.0, wait = 2500 },
        { x = -414.0, y = 0.0, z = 31.0, wait = 2500 },
    },

    [ID.NW_APOLLYON.mob.ZLATOROG] =
    {
        { x = -384.0, y = 0.0,  z = 268.0, wait = 5000 },
        { x = -336.0, y = -0.5, z = 320.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[1]] =
    {
        { x = -306.0, y = 0.0, z = 317.0, wait = 5000 },
        { x = -295.0, y = 0.0, z = 354.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[2]] =
    {
        { x = -329.0, y = 0.0, z = 283.0, wait = 5000 },
        { x = -345.0, y = 0.0, z = 281.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[3]] =
    {
        { x = -334.0, y = 0.0, z = 222.0, wait = 5000 },
        { x = -373.0, y = 0.0, z = 252.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[4]] =
    {
        { x = -334.0, y = 0.0,  z = 233.0, wait = 5000 },
        { x = -345.0, y = -1.0, z = 246.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[5]] =
    {
        { x = -315.0, y = 0.0, z = 233.0, wait = 5000 },
        { x = -317.0, y = 0.0, z = 263.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[6]] =
    {
        { x = -366.0, y = 0.0, z = 235.0, wait = 5000 },
        { x = -350.0, y = 0.0, z = 280.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.MOUNTAIN_BUFFALO[7]] =
    {
        { x = -307.0, y = 0.0, z = 287.0, wait = 5000 },
        { x = -317.0, y = 0.0, z = 316.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.APOLLYON_SCAVENGER[1]] =
    {
        { x = -252.0, y = 0.0, z = 530.0, wait = 5000 },
        { x = -218.0, y = 0.0, z = 540.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.APOLLYON_SCAVENGER[2]] =
    {
        { x = -310.0, y = 0.0, z = 485.0, wait = 10000 },
        { x = -293.0, y = 0.0, z = 505.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.APOLLYON_SCAVENGER[4]] =
    {
        { x = -332.0, y = 0.0, z = 553.0, wait = 5000 },
        { x = -295.0, y = 0.0, z = 573.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.APOLLYON_SCAVENGER[5]] =
    {
        { x = -324.0, y = 0.0, z = 590.0, wait = 5000 },
        { x = -290.0, y = 0.0, z = 557.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.APOLLYON_SCAVENGER[6]] =
    {
        { x = -323.0, y = 0.0, z = 514.0, wait = 5000 },
        { x = -340.0, y = 0.0, z = 547.0, wait = 5000 },
    },

    [ID.NW_APOLLYON.mob.APOLLYON_SCAVENGER[7]] =
    {
        { x = -308.0, y = 0.0, z = 494.0, wait = 10000 },
        { x = -337.0, y = 0.0, z = 522.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.GORYNICH[1]] =
    {
        { x = -567.0, y = 0.0, z = 603.0, wait = 10000 },
        { x = -537.0, y = 0.0, z = 637.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.GORYNICH[2]] =
    {
        { x = -548.0, y = 0.0, z = 581.0, wait = 10000 },
        { x = -600.0, y = 0.0, z = 570.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.GORYNICH[3]] =
    {
        { x = -615.0, y = 0.0, z = 531.0, wait = 10000 },
        { x = -583.0, y = 0.0, z = 571.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.GORYNICH[4]] =
    {
        { x = -600.0, y = 0.0, z = 523.0, wait = 10000 },
        { x = -554.0, y = 0.0, z = 537.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.GORYNICH[5]] =
    {
        { x = -555.0, y = 0.0, z = 614.0, wait = 10000 },
        { x = -529.0, y = 0.0, z = 630.0, wait = 10000 },
    },

    [ID.NW_APOLLYON.mob.KAISER_BEHEMOTH] =
    {
        { x = -533.384, y = 0.000, z = 317.332 },
        { x = -572.622, y = 0.000, z = 321.561 },
        { x = -586.765, y = 0.000, z = 306.422 },
        { x = -592.706, y = 0.000, z = 271.736 },
        { x = -604.253, y = 0.000, z = 248.940 },
        { x = -590.466, y = 0.000, z = 232.526 },
        { x = -577.526, y = 0.000, z = 235.779 },
        { x = -564.415, y = 0.000, z = 244.076 },
        { x = -554.712, y = 0.000, z = 250.640 },
        { x = -534.004, y = 0.000, z = 248.469 },
        { x = -531.384, y = 0.000, z = 263.066 },
        { x = -524.566, y = 0.000, z = 290.070 },
        { x = -529.820, y = 0.000, z = 299.678 },
        { x = -530.384, y = 0.000, z = 305.172 },
        { x = -528.506, y = 0.000, z = 310.466 },
        { x = -536.660, y = 0.000, z = 317.356 },
    },
}

content.groups =
{
    {
        mobs = { "Pluto" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            xi.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[1])
        end,
    },

    {
        mobs = { "Bardha" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
            [xi.mod.SLEEPRES] = -25,
        },

        allDeath = function(battlefield, mob)
            depowerBoss(ID.NW_APOLLYON.mob.PLUTO)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 1)
        end,
    },

    -- Floor 2
    {
        mobs = { "Zlatorog" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
            [xi.mod.SLEEPRES] = -25,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            xi.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[2])
        end,
    },

    {
        mobs = { "Mountain_Buffalo" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
            [xi.mod.SLEEPRES] = -25,
        },

        allDeath = function(battlefield, mob)
            depowerBoss(ID.NW_APOLLYON.mob.ZLATOROG)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 2)
        end,
    },

    -- Floor 3
    {
        mobs = { "Millenary_Mossback" },
        stationary = true,
        setup = empowerBoss,
        death = function(battlefield, mob, count)
            xi.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[3])
        end,
    },

    {
        mobs = { "Apollyon_Scavenger" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
            [xi.mod.SLEEPRES] = -25,
        },

        stationary = true,
        allDeath = function(battlefield, mob)
            depowerBoss(ID.NW_APOLLYON.mob.MILLENARY_MOSSBACK)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 3)
        end,
    },

    -- Floor 4
    {
        mobs = { "Cynoprosopi" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            xi.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[4])
        end,
    },
    {
        --
        mobs = { "Gorynich" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = -25,
            [xi.mod.SLEEPRES] = -25,
        },

        allDeath = function(battlefield, mob)
            depowerBoss(ID.NW_APOLLYON.mob.CYNOPROSOPI)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 4)
        end,
    },

    -- Floor 5
    {
        mobs = { "Kaiser_Behemoth" },
        mobMods =
        {
            [xi.mobMod.ALLI_HATE] = 50,
            [xi.mobMod.MAGIC_COOL] = 30,
            [xi.mobMod.SEVERE_SPELL_CHANCE] = 100,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            npcUtil.showCrate(GetNPCByID(ID.NW_APOLLYON.npc.LOOT_CRATE))
        end,
    },

    {
        mobs = { "Kronprinz_Behemoth" },
        mods =
        {
            [xi.mod.GRAVITYRES] = -25,
            [xi.mod.BINDRES] = 25,
            [xi.mod.SLEEPRES] = 25,
        },

        mobMods = { [xi.mobMod.ALLI_HATE] = 50 },
        stationary = false,
        allDeath = function(battlefield, mob)
            depowerBoss(ID.NW_APOLLYON.mob.KAISER_BEHEMOTH)
        end,
    },
}

content.loot =
{
    [ID.NW_APOLLYON.npc.ITEM_CRATES[1]] =
    {
        {
            quantity = 2,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate =  25 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 175 },
            { itemid = xi.items.BLUE_RIVET, droprate = 100 },
            { itemid = xi.items.WHITE_RIVET, droprate =  25 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 250 },
            { itemid = xi.items.ELECTRUM_STUD, droprate =  75 },
            { itemid = xi.items.ARGYRO_RIVET, droprate = 225 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate =  50 },
        },
    },

    [ID.NW_APOLLYON.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 2,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.WHITE_RIVET, droprate = 235 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate =  59 },
            { itemid = xi.items.BLACK_RIVET, droprate = 235 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 147 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 118 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate = 176 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate = 110 },
        },
    },

    -- NW_Apollyon floor 3
    [ID.NW_APOLLYON.npc.ITEM_CRATES[3]] =
    {
        {
            quantity = 5,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate = 133 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate = 133 },
            { itemid = xi.items.WHITE_RIVET, droprate = 133 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate = 133 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 110 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate = 400 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 400 },
            { itemid =  xi.items.CHUNK_OF_ADAMAN_ORE, droprate =  50 },
            { itemid = xi.items.HANDFUL_OF_CLOT_PLASMA, droprate =  50 },
            { itemid =  xi.items.DARKSTEEL_SHEET, droprate =  50 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  50 },
            { itemid = xi.items.OXBLOOD, droprate =  50 },
            { itemid = xi.items.LIGHT_STEEL_INGOT, droprate =  50 },
            { itemid =  xi.items.SPOOL_OF_RAINBOW_THREAD, droprate =  50 },
            { itemid = xi.items.PONZE_OF_SHELL_POWDER, droprate =  50 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 400 },
            { itemid =  xi.items.CHUNK_OF_ADAMAN_ORE, droprate =  50 },
            { itemid = xi.items.HANDFUL_OF_CLOT_PLASMA, droprate =  50 },
            { itemid =  xi.items.DARKSTEEL_SHEET, droprate =  50 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  50 },
            { itemid = xi.items.OXBLOOD, droprate =  50 },
            { itemid = xi.items.LIGHT_STEEL_INGOT, droprate =  50 },
            { itemid =  xi.items.SPOOL_OF_RAINBOW_THREAD, droprate =  50 },
            { itemid = xi.items.PONZE_OF_SHELL_POWDER, droprate =  50 },
        },
    },

    -- NW_Apollyon floor 4
    [ID.NW_APOLLYON.npc.ITEM_CRATES[4]] =
    {
        {
            quantity = 7,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate =  80 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate =  70 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate =  48 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =  30 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate =  25 },
            { itemid = xi.items.BLUE_RIVET, droprate =  19 },
            { itemid = xi.items.BLACK_RIVET, droprate =  48 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =  90 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 100 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =  48 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 136 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate =  80 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 110 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate =  95 },
            { itemid = xi.items.GOLD_STUD, droprate = 123 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate =  48 },
        },
    },

    -- NW_Apollyon floor 5
    [ID.NW_APOLLYON.npc.LOOT_CRATE] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 152 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate = 283 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate =  65 },
            { itemid = xi.items.GOLD_STUD, droprate = 130 },
            { itemid = xi.items.BLUE_RIVET, droprate =  65 },
            { itemid = xi.items.BLACK_RIVET, droprate = 174 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate = 130 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 196 },
            { itemid = xi.items.WHITE_RIVET, droprate = 174 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate = 174 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 130 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 304 },
            { itemid = xi.items.ELECTRUM_STUD, droprate =  87 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate = 217 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate = 174 },
            { itemid = xi.items.ARGYRO_RIVET, droprate = 130 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate = 109 },
        },

        {
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 152 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate = 283 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate =  65 },
            { itemid = xi.items.GOLD_STUD, droprate = 130 },
            { itemid = xi.items.BLUE_RIVET, droprate =  65 },
            { itemid = xi.items.BLACK_RIVET, droprate = 174 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate = 130 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 196 },
            { itemid = xi.items.WHITE_RIVET, droprate = 174 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate = 174 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 130 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 304 },
            { itemid = xi.items.ELECTRUM_STUD, droprate =  87 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate = 217 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate = 174 },
            { itemid = xi.items.ARGYRO_RIVET, droprate = 130 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate = 109 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 300 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 152 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate = 283 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate =  65 },
            { itemid = xi.items.GOLD_STUD, droprate = 130 },
            { itemid = xi.items.BLUE_RIVET, droprate =  65 },
            { itemid = xi.items.BLACK_RIVET, droprate = 174 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate = 130 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 196 },
            { itemid = xi.items.WHITE_RIVET, droprate = 174 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate = 174 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 109 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 130 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 304 },
            { itemid = xi.items.ELECTRUM_STUD, droprate =  87 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate = 217 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate = 174 },
            { itemid = xi.items.ARGYRO_RIVET, droprate = 130 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate = 109 },
        },

        {
            { itemid = xi.items.MAGENTA_CHIP, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.METAL_CHIP, droprate =  59 },
        },
    },
}

return content:register()
