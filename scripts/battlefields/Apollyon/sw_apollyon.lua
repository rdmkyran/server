-----------------------------------
-- Area: Apollyon
-- Name: SW Apollyon
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
    battlefieldId    = xi.battlefield.id.SW_APOLLYON,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 0,
    area             = 1,
    entryNpc         = '_127',
    requiredKeyItems = { xi.ki.COSMO_CLEANSE, xi.ki.RED_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    name             = "SW_APOLLYON",
    timeExtension   = 10,
})

function content:onBattlefieldRegister(player, battlefield)
    Limbus.onBattlefieldRegister(self, player, battlefield)

    -- Get the initiator's race for the first floor. Convert to male since that's what mobs are using.
    local race = player:getRace()
    if race == xi.race.ELVAAN_F then
        race = xi.race.ELVAAN_M
    elseif race == xi.race.HUME_F then
        race = xi.race.HUME_M
    elseif race == xi.race.TARU_F then
        race = xi.race.TARU_M
    end

    battlefield:setLocalVar("initiatorRace", race)
end

content.sections =
{
    {
        [xi.zone.APOLLYON] =
        {
            onEventFinish =
            {
                [207] = function(player, csid, option)
                    local battlefield = player:getBattlefield()
                    if battlefield:getLocalVar("weather") == 0 then
                        battlefield:setLocalVar("weather", VanadielDayElement())
                    end
                end
            }
        }
    }
}

local checkRaceVortex = function(mobRace, battlefield, mob)
    local race = battlefield:getLocalVar("initiatorRace")
    if race == mobRace then
        content:openDoor(mob:getBattlefield(), 1)
    end
end

local checkRaceCrates = function(mobRace, battlefield, mob)
    local race = battlefield:getLocalVar("initiatorRace")
    if race == mobRace then
        npcUtil.showCrate(GetNPCByID(ID.SW_APOLLYON.npc.ITEM_CRATES[1]))
        npcUtil.showCrate(GetNPCByID(ID.SW_APOLLYON.npc.TIME_CRATES[1]))
        xi.limbus.showRecoverCrate(ID.SW_APOLLYON.npc.RECOVER_CRATES[1])
    end
end

local checkElementalCrate = function(mobElement, battlefield, mob)
    local weatherElement = battlefield:getLocalVar("weather")
    if weatherElement == mobElement then
        npcUtil.showCrate(GetNPCByID(ID.SW_APOLLYON.npc.LOOT_CRATE))
    end
end

content.paths =
{
    [ID.SW_APOLLYON.mob.AIR_ELEMENTAL[1]] =
    {
        { x = -613.0, y =  0.0, z = -373.0, wait = 7500 },
        { x = -602.0, y =  0.0, z = -369.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.AIR_ELEMENTAL[2]] =
    {
        { x = -591.0, y =  0.0, z = -374.0, wait = 7500 },
        { x = -602.0, y =  0.0, z = -369.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.AIR_ELEMENTAL[3]] =
    {
        { x = -602.0, y =  0.0, z = -369.0, wait = 7500 },
        { x = -599.0, y =  0.0, z = -368.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.DARK_ELEMENTAL[1]] =
    {
        { x = -611.0, y =  0.0, z = -376.0, wait = 7500 },
        { x = -585.0, y = -0.5, z = -365.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.DARK_ELEMENTAL[2]] =
    {
        { x = -574.0, y =  0.0, z = -363.0, wait = 7500 },
        { x = -585.0, y =  0.0, z = -365.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.DARK_ELEMENTAL[3]] =
    {
        { x = -585.0, y =  0.0, z = -365.0, wait = 7500 },
        { x = -615.0, y =  0.0, z = -371.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.EARTH_ELEMENTAL[1]] =
    {
        { x = -571.0, y =  0.0, z = -328.0, wait = 7500 },
        { x = -561.0, y =  0.0, z = -323.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.EARTH_ELEMENTAL[2]] =
    {
        { x = -581.0, y =  0.0, z = -340.0, wait = 7500 },
        { x = -571.0, y =  0.0, z = -328.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.EARTH_ELEMENTAL[3]] =
    {
        { x = -571.0, y =  0.0, z = -328.0, wait = 7500 },
        { x = -556.0, y =  0.0, z = -330.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.FIRE_ELEMENTAL[1]] =
    {
        { x = -557.0, y =  0.0, z = -359.0, wait = 7500 },
        { x = -531.0, y =  0.0, z = -343.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.FIRE_ELEMENTAL[2]] =
    {
        { x = -531.0, y =  0.0, z = -343.0, wait = 7500 },
        { x = -530.0, y =  0.0, z = -325.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.FIRE_ELEMENTAL[3]] =
    {
        { x = -537.0, y =  0.0, z = -358.0, wait = 7500 },
        { x = -531.0, y =  0.0, z = -343.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.ICE_ELEMENTAL[1]] =
    {
        { x = -595.0, y =  0.0, z = -388.0, wait = 7500 },
        { x = -590.0, y =  0.0, z = -372.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.ICE_ELEMENTAL[2]] =
    {
        { x = -607.0, y =  0.0, z = -397.0, wait = 7500 },
        { x = -595.0, y =  0.0, z = -388.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.ICE_ELEMENTAL[3]] =
    {
        { x = -595.0, y =  0.0, z = -388.0, wait = 7500 },
        { x = -593.0, y =  0.0, z = -367.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.LIGHT_ELEMENTAL[1]] =
    {
        { x = -547.0, y =  0.0, z = -366.0, wait = 7500 },
        { x = -560.0, y =  0.0, z = -362.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.LIGHT_ELEMENTAL[2]] =
    {
        { x = -565.0, y =  0.0, z = -351.0, wait = 7500 },
        { x = -547.0, y =  0.0, z = -366.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.LIGHT_ELEMENTAL[3]] =
    {
        { x = -583.0, y =  0.0, z = -370.0, wait = 7500 },
        { x = -551.0, y =  0.0, z = -366.44, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.WATER_ELEMENTAL[1]] =
    {
        { x = -574.0, y =  0.0, z = -377.0, wait = 7500 },
        { x = -570.0, y =  0.0, z = -346.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.WATER_ELEMENTAL[2]] =
    {
        { x = -576.0, y =  0.0, z = -377.0, wait = 7500 },
        { x = -570.0, y =  0.0, z = -346.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.WATER_ELEMENTAL[3]] =
    {
        { x = -570.0, y =  0.0, z = -346.0, wait = 7500 },
        { x = -574.0, y =  0.0, z = -379.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.THUNDER_ELEMENTAL[1]] =
    {
        { x = -569.0, y =  0.0, z = -346.0, wait = 7500 },
        { x = -605.0, y =  0.0, z = -343.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.THUNDER_ELEMENTAL[2]] =
    {
        { x = -569.0, y =  0.0, z = -346.0, wait = 7500 },
        { x = -594.0, y =  0.0, z = -344.0, wait = 7500 },
    },

    [ID.SW_APOLLYON.mob.THUNDER_ELEMENTAL[3]] =
    {
        { x = -569.0, y =  0.0, z = -346.0, wait = 7500 },
        { x = -617.0, y =  0.0, z = -344.0, wait = 7500 },
    }
}

content.groups =
{
    -- Floor 1
    {
        mobs = { "Fir_Bholg_THF" },
        stationary = false,
        randomDeath = utils.bind(checkRaceVortex, xi.race.ELVAAN_M),
        allDeath = utils.bind(checkRaceCrates, xi.race.ELVAAN_M),
    },

    {
        mobs = { "Fir_Bholg_PLD" },
        stationary = false,
        randomDeath = utils.bind(checkRaceVortex, xi.race.GALKA),
        allDeath = utils.bind(checkRaceCrates, xi.race.GALKA),
    },

    {
        mobs = { "Fir_Bholg_SAM" },
        stationary = false,
        randomDeath = utils.bind(checkRaceVortex, xi.race.HUME_M),
        allDeath = utils.bind(checkRaceCrates, xi.race.HUME_M),
    },

    {
        mobs = { "Fir_Bholg_RDM" },
        stationary = false,
        randomDeath = utils.bind(checkRaceVortex, xi.race.MITHRA),
        allDeath = utils.bind(checkRaceCrates, xi.race.MITHRA),
    },

    {
        mobs = { "Fir_Bholg_BLM" },
        stationary = false,
        randomDeath = utils.bind(checkRaceVortex, xi.race.TARU_M),
        allDeath = utils.bind(checkRaceCrates, xi.race.TARU_M),
    },

    -- Floor 2
    {
        mobs = { "Jidra_Boss" },
        mobMods = { [xi.mobMod.DONT_ROAM_HOME] = 1 },
        death = function(battlefield, mob, count)
            content:openDoor(battlefield, 2)
        end,
    },

    {
        mobs = { "Jidra" },
        mobMods = { [xi.mobMod.DONT_ROAM_HOME] = 1 },
        setup = function(battlefield, mobs)
            local positions =
            {
                { x = -222.52, y = -0.50, z = -414.11, rot = 38 },
                { x = -150.90, y = -0.50, z = -507.21, rot = 65 },
                { x = -101.32, y = -0.50, z = -582.85, rot = 158 },
                { x = -114.74, y = -0.50, z = -470.75, rot = 91 },
                { x = -202.64, y = -0.50, z = -484.55, rot = 207 },
                { x = -117.56, y = -0.50, z = -516.36, rot = 117 },
                { x = -197.58, y = -0.50, z = -593.41, rot = 39 },
                { x = -176.13, y = -0.60, z = -560.06, rot = 112 },
            }

            positions = utils.shuffle(positions)
            for i, mob in ipairs(mobs) do
                local position = positions[i]
                mob:setPos(position.x, position.y, position.z, position.rot)
            end

            local position = positions[#positions]
            local mob = GetMobByID(ID.SW_APOLLYON.mob.JIDRA_BOSS)
            mob:setPos(position.x, position.y, position.z, position.rot)
        end,

        death = function(battlefield, mob, count)
            local addID = mob:getID() + 7
            local add = GetMobByID(addID)
            add:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
            SpawnMob(addID)

            local enmityList = mob:getEnmityList()
            local target = utils.randomEntry(enmityList)["entity"]
            if target ~= nil then
                add:updateEnmity(target)
            end
        end,
    },

    {
        -- Jidra (Adds)
        mobs =
        {
            "Arboricole_Hornet",
            "Arboricole_Raven",
            "Arboricole_Opo-opo",
            "Arboricole_Spider",
            "Arboricole_Beetle",
            "Arboricole_Crawler",
            "Apollyon_Sapling",
        },

        spawned = false,
        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetNPCByID(ID.SW_APOLLYON.npc.ITEM_CRATES[2]))
            npcUtil.showCrate(GetNPCByID(ID.SW_APOLLYON.npc.TIME_CRATES[2]))
            xi.limbus.showRecoverCrate(ID.SW_APOLLYON.npc.RECOVER_CRATES[2])
        end,
    },

    -- Floor 3
    {
        mobs = { "Armoury_Crate_Mimic" },
        mobMods =
        {
            [xi.mobMod.DRAW_IN] = 1,
            [xi.mobMod.NO_MOVE] = 1,
            [xi.mobMod.NO_DESPAWN] = 1,
            [xi.mobMod.NO_AGGRO] = 1,
        },

        setup = function(battlefield, mobs)
            local shuffled = utils.shuffle(mobs)
            shuffled[1]:setLocalVar("time", 1)
            shuffled[2]:setLocalVar("item", 1)
            shuffled[3]:setLocalVar("recover", 1)
            shuffled[4]:setLocalVar("vortex", 1)

            for _, mob in ipairs(mobs) do
                mob:hideName(true)
                mob:setStatus(xi.status.NORMAL)
                mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
                mob:setMobMod(xi.mobMod.NO_LINK, 1)
                mob:setAnimationSub(0)

                local swapWithCrate = function(crate)
                    crate:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
                    crate:entityAnimationPacket("deru")
                    crate:setModelId(961)
                    crate:setAnimationSub(8)
                    npcUtil.showCrate(crate)
                    npcUtil.disappearCrate(mob)
                end

                mob:addListener("ON_TRIGGER", "TRIGGER_RECOVER_CRATE", function(player, npc)
                    if mob:getLocalVar("time") == 1 then
                        swapWithCrate(GetNPCByID(ID.SW_APOLLYON.npc.TIME_CRATES[3]))
                    elseif mob:getLocalVar("item") == 1 then
                        swapWithCrate(GetNPCByID(ID.SW_APOLLYON.npc.ITEM_CRATES[3]))
                    elseif mob:getLocalVar("recover") == 1 then
                        swapWithCrate(GetMobByID(ID.SW_APOLLYON.npc.RECOVER_CRATES[3]))
                    else
                        mob:hideName(false)
                        mob:setStatus(xi.status.MOB)
                        mob:setAnimationSub(1)
                        mob:setMobMod(xi.mobMod.NO_AGGRO, 0)
                        mob:updateClaim(player)
                    end
                end)
            end
        end,

        death = function(battlefield, mob)
            if mob:getLocalVar("vortex") == 1 then
                content:openDoor(mob:getBattlefield(), 3)
            end
        end
    },

    -- Floor 4
    {
        mobs = { "Air_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate, xi.magic.element.WIND),
    },

    {
        mobs = { "Dark_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.DARK),
    },

    {
        mobs = { "Earth_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.EARTH),
    },

    {
        mobs = { "Fire_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.FIRE),
    },

    {
        mobs = { "Ice_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.ICE),
    },

    {
        mobs = { "Light_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.LIGHT),
    },

    {
        mobs = { "Water_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.WATER),
    },

    {
        mobs = { "Thunder_Elemental" },
        isParty = true,
        superlink = true,
        allDeath = utils.bind(checkElementalCrate,  xi.magic.element.THUNDER),
    },
}

content.loot =
{
    [ID.SW_APOLLYON.npc.ITEM_CRATES[1]] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN,   droprate = 464 },
            { itemid = xi.items.BLACK_RIVET,               droprate = 250 },
            { itemid = xi.items.SHEET_OF_KUROGANE,         droprate = 110 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN,    droprate =  71 },
            { itemid = xi.items.ARGYRO_RIVET,              droprate = 180 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 210 },
            { itemid = xi.items.ELECTRUM_STUD,             droprate = 111 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN,    droprate = 107 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN,   droprate =  464 },
            { itemid = xi.items.BLACK_RIVET,               droprate =  250 },
            { itemid = xi.items.SHEET_OF_KUROGANE,         droprate =  110 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN,    droprate =   71 },
            { itemid = xi.items.ARGYRO_RIVET,              droprate =  180 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate =  210 },
            { itemid = xi.items.ELECTRUM_STUD,             droprate =  111 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN,    droprate =  107 },
        },
    },

    [ID.SW_APOLLYON.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 154 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN,    droprate =  95 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER,  droprate = 269 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN,    droprate = 106 },
            { itemid = xi.items.ARGYRO_RIVET,              droprate =  77 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE,    droprate = 423 },
            { itemid = xi.items.BLUE_RIVET,                droprate = 110 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 999 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 154 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN,    droprate =  95 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER,  droprate = 269 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN,    droprate = 106 },
            { itemid = xi.items.ARGYRO_RIVET,              droprate =  77 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE,    droprate = 423 },
            { itemid = xi.items.BLUE_RIVET,                droprate = 110 },
        },
    },

    [ID.SW_APOLLYON.npc.ITEM_CRATES[3]] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 120 },
            { itemid = xi.items.ARGYRO_RIVET,              droprate = 120 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER,      droprate = 595 },
            { itemid = xi.items.BLUE_RIVET,                droprate = 100 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN,    droprate =  24 },
            { itemid = xi.items.SHEET_OF_KUROGANE,         droprate =  48 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN,    droprate =  24 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate =  24 },
            { itemid = xi.items.ELECTRUM_STUD,             droprate =  71 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 120 },
            { itemid = xi.items.ARGYRO_RIVET,              droprate = 120 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER,      droprate = 595 },
            { itemid = xi.items.BLUE_RIVET,                droprate = 100 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN,    droprate =  24 },
            { itemid = xi.items.SHEET_OF_KUROGANE,         droprate =  48 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN,    droprate =  24 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate =  24 },
            { itemid = xi.items.ELECTRUM_STUD,             droprate =  71 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 638 },
            { itemid = xi.items.OXBLOOD,                   droprate =  32 },
            { itemid = xi.items.PONZE_OF_SHELL_POWDER,     droprate =  40 },
            { itemid = xi.items.LIGHT_STEEL_INGOT,         droprate =  31 },
            { itemid = xi.items.HANDFUL_OF_CLOT_PLASMA,    droprate =  71 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,    droprate =  31 },
            { itemid = xi.items.DARKSTEEL_SHEET,           droprate =  63 },
            { itemid = xi.items.CHUNK_OF_ADAMAN_ORE,       droprate =  31 },
            { itemid = xi.items.SPOOL_OF_RAINBOW_THREAD,   droprate =  63 },
        },
    },

    [ID.SW_APOLLYON.npc.LOOT_CRATE] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT,   droprate = 468 },
            { itemid = xi.items.FETID_LANOLIN_CUBE,        droprate = 340 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT,       droprate = 255 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH,  droprate = 191 },
            { itemid = xi.items.WHITE_RIVET,               droprate = 170 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH,  droprate = 340 },
            { itemid = xi.items.GOLD_STUD,                 droprate = 170 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 400 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT,   droprate = 468 },
            { itemid = xi.items.FETID_LANOLIN_CUBE,        droprate = 340 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT,       droprate = 255 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH,  droprate = 191 },
            { itemid = xi.items.WHITE_RIVET,               droprate = 170 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH,  droprate = 340 },
            { itemid = xi.items.GOLD_STUD,                 droprate = 170 },
        },

        {
            { itemid = xi.items.CHARCOAL_CHIP,             droprate = 1000 },
        },

        {
            { itemid = xi.items.METAL_CHIP,                droprate =  59 },
            { itemid = xi.items.NONE,                      droprate = 100 },
        },
    },
}

return content:register()
