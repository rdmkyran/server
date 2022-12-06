-----------------------------------
-- Area: Apollyon
-- Name: NE Apollyon
-- !addkeyitem black_card
-- !addkeyitem cosmo_cleanse
-- !pos 600 -0.5 -600 38
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/limbus")
require("scripts/globals/items")
require("scripts/globals/keyitems")
-----------------------------------

local content = Limbus:new({
    zoneId           = xi.zone.APOLLYON,
    battlefieldId    = xi.battlefield.id.NE_APOLLYON,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 3,
    area             = 4,
    entryNpc         = '_12i',
    requiredKeyItems = { xi.ki.COSMO_CLEANSE, xi.ki.BLACK_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    lossEventParams  = { [5] = 1 },
    name             = "NE_APOLLYON",
    exitLocation     = 1,
    timeExtension   = 5,
})

function content:onBattlefieldInitialise(battlefield)
    Limbus.onBattlefieldInitialise(self, battlefield)

    for i, crateID in ipairs(ID.NE_APOLLYON.npc.TIME_CRATES) do
        npcUtil.showCrate(GetNPCByID(crateID))
    end

    for i, crateID in ipairs(ID.NE_APOLLYON.npc.RECOVER_CRATES) do
        npcUtil.showCrate(GetMobByID(crateID))
    end
end

content.paths =
{
    [ID.NE_APOLLYON.mob.GOOBBUE_HARVESTER] =
    {
        { x = 425.0, y = 0.0, z = 22.0, wait = 1000 },
        { x = 475.0, y = 0.0, z = 22.0, wait = 1000 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[1]] =
    {
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[2]] =
    {
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[3]] =
    {
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[4]] =
    {
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[5]] =
    {
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[6]] =
    {
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[7]] =
    {
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
    },

    [ID.NE_APOLLYON.mob.TROGLODYTE_DHALMEL[8]] =
    {
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
    },

}

content.groups =
{
    -- Floor 1
    {
        mobs = { "Barometz_Boss", "Borametz_Boss", "Goobbue_Harvester" },
        stationary = false,
        setup = function(battlefield, mobs)
            local bosses = utils.shuffle(mobs)
            bosses[1]:setLocalVar("item", 1)
            bosses[2]:setLocalVar("vortex", 1)
        end,

        death = function(battlefield, mob, count)
            if mob:getLocalVar("item") == 1 then
                xi.limbus.spawnFrom(mob, ID.NE_APOLLYON.npc.ITEM_CRATES[1])
            elseif mob:getLocalVar("vortex") == 1 then
                content:openDoor(battlefield, 1)
            end
        end,
    },

    {
        mobs = { "Barometz", "Borametz", "Barometz_Boss", "Borametz_Boss" },
        mobMods = { [xi.mobMod.ALLI_HATE] = 50 },
        stationary = false,
    },

    -- Floor 2
    {
        mobs = { "Bialozar_Boss" },
        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        death = function(battlefield, mob, count)
            xi.limbus.spawnFrom(mob, ID.NE_APOLLYON.npc.ITEM_CRATES[2])
        end,
    },

    {
        mobs = { "Sirin", "Cornu" },
    },

    {
        -- Bialozar and Thiazi x2
        mobs = { "Bialozar", "Thiazi" },
        mobMods = { [xi.mobMod.DETECTION] = xi.detects.HEARING },
        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 2)

            -- Determine which mobs should be in floor three and add their group
            local sweepers =
            {
                mobIds = {},
                randomDeath = function(battlefieldInner, sweeperMob)
                    content:openDoor(battlefieldInner, 3)
                end,
            }

            local cleanersLarge =
            {
                mobIds = {},
                stationary = false,

                randomDeath = function(battlefieldInner, cleanerMob)
                    xi.limbus.spawnFrom(cleanerMob, ID.NE_APOLLYON.npc.ITEM_CRATES[3])
                end,
            }

            local cleanersSmall =
            {
                -- Apollyon Cleaners (Small)
                mobIds = {},
                stationary = false,
            }

            -- Every 6 players we add another group of mobs (1 Sweeper and 4 Cleaners)
            table.insert(sweepers.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[1])
            table.insert(cleanersLarge.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[1] + 1)
            table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[1] + 2)
            table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[1] + 3)
            table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[1] + 4)

            local playerCount = #battlefield:getPlayers()
            if playerCount > 6 then
                table.insert(sweepers.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[2])
                table.insert(cleanersLarge.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[2] + 1)
                table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[2] + 2)
                table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[2] + 3)
                table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[2] + 4)
                if playerCount > 12 then
                    table.insert(sweepers.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[3])
                    table.insert(cleanersLarge.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[3] + 1)
                    table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[3] + 2)
                    table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[3] + 3)
                    table.insert(cleanersSmall.mobIds, ID.NE_APOLLYON.mob.APOLLYON_SWEEPER[3] + 4)
                end
            end

            battlefield:addGroups({ sweepers, cleanersLarge, cleanersSmall }, false)
        end,
    },

    -- Floor 3
    -- These mobs are added in the above group when the floor door opens

    -- Floor 4
    {
        mobs = { "Hyperion", "Okeanos", "Cronos" },
        stationary = false,
        randomDeath = function(battlefield, mob)
            content:openDoor(mob:getBattlefield(), 4)
        end,
    },

    {
        mobs = { "Hyperion" },
        mods = { [xi.mod.MAGIC_NULL] = 100 },
    },

    {
        mobs = { "Okeanos" },
        mods = { [xi.mod.NULL_RANGED_DAMAGE] = 100 },
    },

    {
        mobs = { "Cronos" },
        mods = { [xi.mod.NULL_PHYSICAL_DAMAGE] = 100 },
    },

    {
        mobs = { "Kerkopes_Boss" },
        stationary = false,
        death = function(battlefield, mob, count)
            xi.limbus.spawnFrom(mob, ID.NE_APOLLYON.npc.ITEM_CRATES[4])
        end,
    },

    {
        mobs = { "Kerkopes" },
        stationary = false,
    },

    -- Floor 5
    {
        mobs = { "Troglodyte_Dhalmel" },
        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetNPCByID(ID.NE_APOLLYON.npc.LOOT_CRATE))
        end,
    },

    {
        mobs = { "Criosphinx", "Hieracosphinx" },
        mods =
        {
            [xi.mod.GRAVITYRES] = 75,
            [xi.mod.BINDRES] = 75,
            [xi.mod.SLEEPRES] = 75,
        },
    }
}

content.loot =
{
    [ID.NE_APOLLYON.npc.ITEM_CRATES[1]] =
    {
        {
            quantity = 3,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 304 },
            { itemid = xi.items.WHITE_RIVET, droprate =  18 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate = 200 },
            { itemid = xi.items.GOLD_STUD, droprate = 200 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =  36 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =  18 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate =  36 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate = 411 },
            { itemid = xi.items.ELECTRUM_STUD, droprate = 482 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =  18 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate =  304 },
            { itemid = xi.items.WHITE_RIVET, droprate =   18 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate =  200 },
            { itemid = xi.items.GOLD_STUD, droprate =  200 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =   36 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =   18 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate =   36 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate =  411 },
            { itemid = xi.items.ELECTRUM_STUD, droprate =  482 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =   18 },
        },
    },

    -- NE_Apollyon floor 2
    [ID.NE_APOLLYON.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 3,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =  26 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =  53 },
            { itemid = xi.items.WHITE_RIVET, droprate =  26 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =  26 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate = 395 },
            { itemid = xi.items.BLUE_RIVET, droprate = 289 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate =  53 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 112 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 477 },
        },

        {
            { itemid =    xi.items.NONE, droprate =  1000 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =    26 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =    53 },
            { itemid = xi.items.WHITE_RIVET, droprate =    26 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =    26 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate =   395 },
            { itemid = xi.items.BLUE_RIVET, droprate =   289 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate =    53 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate =   112 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate =   477 },
        },
    },

    -- NE_Apollyon floor 3
    [ID.NE_APOLLYON.npc.ITEM_CRATES[3]] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ARGYRO_RIVET, droprate =  788 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate =   30 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate =  130 },
            { itemid = xi.items.BLUE_RIVET, droprate =  100 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =   90 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =   30 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate =   99 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =   61 },
            { itemid = xi.items.GOLD_STUD, droprate =   30 },
            { itemid = xi.items.WHITE_RIVET, droprate =  160 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ARGYRO_RIVET, droprate =  788 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate =   30 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate =  130 },
            { itemid = xi.items.BLUE_RIVET, droprate =  100 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate =   90 },
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =   30 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate =   99 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate =   61 },
            { itemid = xi.items.GOLD_STUD, droprate =   30 },
            { itemid = xi.items.WHITE_RIVET, droprate =  160 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 180 },
            { itemid = xi.items.HANDFUL_OF_CLOT_PLASMA, droprate =  30 },
            { itemid =  xi.items.SPOOL_OF_RAINBOW_THREAD, droprate =  40 },
            { itemid = xi.items.OXBLOOD, droprate =  50 },
            { itemid = xi.items.PONZE_OF_SHELL_POWDER, droprate =  40 },
            { itemid = xi.items.PONZE_OF_CARAPACE_POWDER, droprate =  20 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 180 },
            { itemid = xi.items.HANDFUL_OF_CLOT_PLASMA, droprate =  30 },
            { itemid =  xi.items.SPOOL_OF_RAINBOW_THREAD, droprate =  40 },
            { itemid = xi.items.OXBLOOD, droprate =  50 },
            { itemid = xi.items.PONZE_OF_SHELL_POWDER, droprate =  40 },
            { itemid = xi.items.PONZE_OF_CARAPACE_POWDER, droprate =  20 },
        },
    },

    -- NE_Apollyon floor 4
    [ID.NE_APOLLYON.npc.ITEM_CRATES[4]] =
    {
        {
            quantity = 6,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate = 326 },
            { itemid = xi.items.BLACK_RIVET, droprate = 256 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 395 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate = 279 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 256 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate = 326 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate =  326 },
            { itemid = xi.items.BLACK_RIVET, droprate =  256 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate =  395 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate =  279 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate =  256 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate =  326 },
        },
    },

    -- NE_Apollyon floor 5
    [ID.NE_APOLLYON.npc.LOOT_CRATE] =
    {
        {
            quantity = 7,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SMOKY_CHIP, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 100 },
            { itemid = xi.items.METAL_CHIP, droprate =  59 },
        },
    },
}

return content:register()
