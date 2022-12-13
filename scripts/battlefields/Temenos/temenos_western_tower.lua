-----------------------------------
-- Area: Temenos
-- Name: Temenos Western Tower
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
    battlefieldId    = xi.battlefield.id.TEMENOS_WESTERN_TOWER,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 2,
    area             = 3,
    entryNpc         = 'Matter_Diffusion_Module',
    requiredKeyItems = { xi.ki.COSMO_CLEANSE, xi.ki.WHITE_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    name             = "TEMENOS_WESTERN_TOWER",
    timeExtension    = 15,
})

local setupItemCrate = function(crateID, floor)
    local crate = GetEntityByID(crateID)
    xi.limbus.hideCrate(crate)
    crate:setModelId(961)
    crate:addListener("ON_TRIGGER", "TRIGGER_CRATE", function(player, npc)
        npcUtil.openCrate(npc, function()
            content:handleLootRolls(player:getBattlefield(), content.loot[floor], npc)
        end)
    end)
end

local setupTimeCrate = function(crateID, floor)
    local crate = GetEntityByID(crateID)
    xi.limbus.hideCrate(crate)
    crate:setModelId(962)
    crate:addListener("ON_TRIGGER", "TRIGGER_CRATE", utils.bind(content.handleOpenTimeCrate, content))
end

local setupRecoverCrate = function(crateID, floor)
    local crate = GetEntityByID(crateID)
    xi.limbus.hideCrate(crate)
    crate:setModelId(960)
    crate:addListener("ON_TRIGGER", "TRIGGER_CRATE", utils.bind(content.handleOpenRecoverCrate, content))
end

function content:onBattlefieldInitialise(battlefield)
    Limbus.onBattlefieldInitialise(self, battlefield)

    local crateSetupFuncs =
    {
        setupItemCrate,
        setupTimeCrate,
        setupRecoverCrate,
    }

    -- Crates are always spawned with sequential IDs
    -- Randomize crate type order by shuffling setup functions
    for floor, crateOffset in ipairs(ID.TEMENOS_WESTERN_TOWER.npc.CRATE_OFFSETS) do
        local setupFuncs = utils.shuffle(crateSetupFuncs)
        for i = 0, 2 do
            setupFuncs[i + 1](crateOffset + i, floor)
        end
    end
end

content.handleMobDeath = function(floor, battlefield, mob, count)
    content:openDoor(battlefield, floor)

    local crateCount = battlefield:getLocalVar("CrateCount"..floor)
    if crateCount < 3 and math.random(4) == 1 then
        -- Crate type randomization happens in onBattlefieldRegister
        local crateID = ID.TEMENOS_WESTERN_TOWER.npc.CRATE_OFFSETS[floor] + crateCount
        xi.limbus.spawnFrom(mob, crateID)
        battlefield:setLocalVar("CrateCount"..floor, crateCount + 1)
    end
end

content.paths =
{
    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_TIGER + 7] =
    {
        { x = 340.0, y = 68.0, z = -104.0, wait = 10000 },
        { x = 340.0, y = 74.0, z = -139.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_TIGER + 8] =
    {
        { x = 344.0, y = 68.0, z = -100.0, wait = 10000 },
        { x = 379.0, y = 74.0, z = -100.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA] =
    {
        { x = 198.0, y = -81.0, z = -74.0, wait = 10000 },
        { x = 198.0, y = -81.0, z = -86.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 1] =
    {
        { x = 202.0, y = -81.0, z = -86.0, wait = 10000 },
        { x = 202.0, y = -81.0, z = -74.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 2] =
    {
        { x = 193.0, y = -81.0, z = -88.0, wait = 10000 },
        { x = 207.0, y = -81.0, z = -88.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 3] =
    {
        { x = 208.0, y = -81.0, z = -87.0, wait = 10000 },
        { x = 208.0, y = -81.0, z = -73.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 4] =
    {
        { x = 207.0, y = -81.0, z = -72.0, wait = 10000 },
        { x = 193.0, y = -81.0, z = -72.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 5] =
    {
        { x = 192.0, y = -81.0, z = -73.0, wait = 10000 },
        { x = 192.0, y = -81.0, z = -87.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 6] =
    {
        { x = 232.0, y = -80.0, z = -140.0, wait = 10000 },
        { x = 204.0, y = -80.0, z = -140.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 7] =
    {
        { x = 234.0, y = -80.0, z = -140.0, wait = 10000 },
        { x = 206.0, y = -80.0, z = -140.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_MANDRAGORA + 8] =
    {
        { x = 236.0, y = -80.0, z = -140.0, wait = 10000 },
        { x = 208.0, y = -80.0, z = -140.0, wait = 10000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_BEETLE] =
    {
        { x = 18.0, y = 80.0, z = -140.0, wait = 30000 },
        { x = 8.0, y = 80.0, z = -140.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_BEETLE + 1] =
    {
        { x = 20.0, y = 80.0, z = -138.0, wait = 30000 },
        { x = 20.0, y = 80.0, z = -128.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_BEETLE + 2] =
    {
        { x = 22.0, y = 80.0, z = -140.0, wait = 30000 },
        { x = 32.0, y = 80.0, z = -140.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_BEETLE + 3] =
    {
        { x = 58.0, y = 80.0, z = -140.0, wait = 30000 },
        { x = 48.0, y = 80.0, z = -140.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_BEETLE + 4] =
    {
        { x = 60.0, y = 80.0, z = -138.0, wait = 30000 },
        { x = 60.0, y = 80.0, z = -128.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_BEETLE + 5] =
    {
        { x = 62.0, y = 80.0, z = -140.0, wait = 30000 },
        { x = 72.0, y = 80.0, z = -140.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD] =
    {
        { x = -152.0, y = -80.0, z = -150.50, wait = 1000 },
        { x = -88.0, y = -80.0, z = -150.50, wait = 1000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 1] =
    {
        { x = -150.0, y = -80.0, z = -147.0, wait = 5000 },
        { x = -130.0, y = -80.0, z = -147.0, wait = 5000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 2] =
    {
        { x = -110.0, y = -80.0, z = -147.0, wait = 5000 },
        { x = -90.0, y = -80.0, z = -147.0, wait = 5000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 3] =
    {
        { x = -152.0, y = -80.0, z = -142.0, wait = 1000 },
        { x = -88.0, y = -80.0, z = -142.0, wait = 1000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 4] =
    {
        { x = -88.0, y = -80.0, z = -138.0, wait = 1000 },
        { x = -152.0, y = -80.0, z = -138.0, wait = 1000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 5] =
    {
        { x = -128.0, y = -80.0, z = -140.0, wait = 5000 },
        { x = -112.0, y = -80.0, z = -140.0, wait = 5000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 6] =
    {
        { x = -150.0, y = -80.0, z = -133.0, wait = 5000 },
        { x = -130.0, y = -80.0, z = -133.0, wait = 5000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 7] =
    {
        { x = -110.0, y = -80.0, z = -133.0, wait = 5000 },
        { x = -90.0, y = -80.0, z = -133.0, wait = 5000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_LIZARD + 8] =
    {
        { x = -152.0, y = -80.0, z = -129.50, wait = 1000 },
        { x = -88.0, y = -80.0, z = -129.50, wait = 1000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_SLIME + 2] =
    {
        { x = -300.0, y = 80.0, z = -148.0, wait = 30000 },
        { x = -300.0, y = 80.0, z = -132.0, wait = 30000 },
    },

    [ID.TEMENOS_WESTERN_TOWER.mob.ENHANCED_SLIME + 5] =
    {
        { x = -260.0, y = 80.0, z = -148.0, wait = 30000 },
        { x = -260.0, y = 80.0, z = -132.0, wait = 30000 },
    },
}

content.groups =
{
    {
        mobs = { "Armoury_Crate_Western" },
        setup = function(battlefield, crates)
            for _, crate in ipairs(crates) do
                crate:setBattleID(1) -- Different battle ID prevents the crate from being hit by AOEs
            end
        end
    },

    {
        mobs = { "Enhanced_Tiger" },
        death = utils.bind(content.handleMobDeath, 1),
    },

    {
        mobs = { "Enhanced_Mandragora" },
        mobMods = { [xi.mobMod.LINK_RADIUS] = 8 },
        death = utils.bind(content.handleMobDeath, 2),
    },

    {
        mobs = { "Enhanced_Beetle" },
        death = utils.bind(content.handleMobDeath, 3),
    },

    {
        mobs = { "Enhanced_Lizard" },
        death = utils.bind(content.handleMobDeath, 4),
    },

    {
        mobs = { "Enhanced_Slime" },
        death = utils.bind(content.handleMobDeath, 5),
    },

    {
        mobs = { "Enhanced_Pugil" },
        death = utils.bind(content.handleMobDeath, 6),
    },

    {
        mobs = { "Enhanced_Vulture" },
        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetEntityByID(ID.TEMENOS_WESTERN_TOWER.npc.LOOT_CRATE))
        end,
    },
}

content.loot =
{
    [1] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            quantity = 3,
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 100 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 172 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 138 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 138 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 207 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 241 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD,  droprate = 172 },
        },
    },

    [2] =
    {
        {
            quantity = 5,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 179 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 571 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate =  71 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 179 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate = 120 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate =  71 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 143 },
            { itemid = xi.items.PANTIN_WIRE,               droprate = 143 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 200 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 179 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 571 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate =  71 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 179 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate = 120 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate =  71 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 143 },
            { itemid = xi.items.PANTIN_WIRE,               droprate = 143 },
        },
    },

    [3] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            quantity = 3,
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 536 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 107 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate =  60 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate = 110 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate =  80 },
            { itemid = xi.items.PANTIN_WIRE,               droprate =  90 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate =  71 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate = 103 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 160 },
            { itemid = xi.items.PLAITED_CORD,              droprate =  36 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD,  droprate = 250 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE,    droprate = 350 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 750 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 536 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 107 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate =  60 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate = 110 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate =  80 },
            { itemid = xi.items.PANTIN_WIRE,               droprate =  90 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate =  71 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate = 103 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 160 },
            { itemid = xi.items.PLAITED_CORD,              droprate =  36 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD,  droprate = 250 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE,    droprate = 350 },
        },
    },

    [4] =
    {
        {
            quantity = 4,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 533 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate =  90 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 133 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD,       droprate =  90 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate =  10 },
            { itemid = xi.items.PLAITED_CORD,              droprate = 133 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate = 133 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 133 },
            { itemid = xi.items.PANTIN_WIRE,               droprate =  33 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 500 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 533 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate =  90 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 133 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD,       droprate =  90 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate =  10 },
            { itemid = xi.items.PLAITED_CORD,              droprate = 133 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate = 133 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 133 },
            { itemid = xi.items.PANTIN_WIRE,               droprate =  33 },
        },
    },

    [5] =
    {
        {
            quantity = 6,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            quantity = 2,
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.PLAITED_CORD,              droprate =  59 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 294 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate =  59 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate =  78 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 176 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate =  59 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate =  25 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD,       droprate = 118 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD,  droprate = 294 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 200 },
            { itemid = xi.items.PLAITED_CORD,              droprate =  59 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 294 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER,   droprate =  59 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate =  78 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 176 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate =  59 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate =  25 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD,       droprate = 118 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD,  droprate = 294 },
        },
    },

    [6] =
    {
        {
            quantity = 6,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.PLAITED_CORD,              droprate = 200 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 400 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 100 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate = 150 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD,       droprate =  50 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate =  60 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 200 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate =  60 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 200 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 400 },
            { itemid = xi.items.PLAITED_CORD,              droprate = 200 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 400 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate = 100 },
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK,   droprate = 150 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD,       droprate =  50 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate =  60 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 200 },
            { itemid = xi.items.DARK_ORICHALCUM_INGOT,     droprate =  60 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 200 },
        },
    },

    [ID.TEMENOS_WESTERN_TOWER.npc.LOOT_CRATE] =
    {
        {
            quantity = 6,
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN,         droprate = 1000 },
        },

        {
            { itemid = xi.items.SPOOL_OF_COILED_YARN,      droprate =  36 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI,   droprate = 143 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH,  droprate = 143 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN,  droprate = 214 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate =  71 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD,  droprate = 321 },
        },

        {
            { itemid = xi.items.EMERALD_CHIP,              droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 100 },
            { itemid = xi.items.METAL_CHIP,                droprate =  55 },
        },
    },
}

return content:register()
