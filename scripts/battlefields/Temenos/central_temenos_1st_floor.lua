-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 1st Floor
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
    battlefieldId    = xi.battlefield.id.CENTRAL_TEMENOS_1ST_FLOOR,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(45),
    index            = 6,
    area             = 7,
    entryNpc         = 'Matter_Diffusion_Module',
    requiredKeyItems = { xi.ki.COSMO_CLEANSE, xi.ki.WHITE_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    requiredItems    = { xi.items.EMERALD_CHIP },
    name             = "CENTRAL_TEMENOS_1ST_FLOOR",
})

function content:handleMobPartnerDeath(mobs, battlefield, mob, count)
    if count > 1 then
        return
    end

    local zone = mob:getZone()
    local target = zone:queryEntitiesByName(mobs[1])[1]
    if target and mob:getID() == target:getID() then
        target = zone:queryEntitiesByName(mobs[2])[1]
    end

    target:timer(15000, function(mobArg)
        if target:isAlive() then
            target:injectActionPacket(target:getID(), 11, 439, 0, 24, 0, 307, 0)
            target:addMod(xi.mod.REGAIN, 150)
        end
    end)
end

content.groups =
{
    {
        mobs = { "Airi", "Temenos_Cleaner" },
        death = utils.bind(content.handleMobPartnerDeath, content, { "Airi", "Temenos_Cleaner" }),
    },

    {
        mobs = { "Iruci", "Temenos_Weapon" },
        death = utils.bind(content.handleMobPartnerDeath, content, { "Iruci", "Temenos_Weapon" }),
    },

    {
        mobs = { "Enhanced_Dragon", "Enhanced_Ahriman" },
        death = utils.bind(content.handleMobPartnerDeath, content, { "Enhanced_Dragon", "Enhanced_Ahriman" }),
    },

    {
        mobs =
        {
            "Airi",
            "Temenos_Cleaner",
            "Iruci",
            "Temenos_Weapon",
            "Enhanced_Dragon",
            "Enhanced_Ahriman",
        },

        mods = { [xi.mod.REGEN] = 24 },
        allDeath = function(battlefield, mob)
            xi.limbus.spawnFrom(mob, ID.CENTRAL_TEMENOS_1ST_FLOOR.npc.LOOT_CRATE)
        end
    }
}

content.loot =
{
    [ID.CENTRAL_TEMENOS_1ST_FLOOR.npc.LOOT_CRATE] =
    {
        {
            quantity = 7,
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH, droprate = 265 },
            { itemid = xi.items.SPOOL_OF_RUBY_SILK_THREAD, droprate = 118 },
            { itemid = xi.items.SPOOL_OF_COILED_YARN, droprate = 147 },
            { itemid = xi.items.SPOOL_OF_GLITTERING_YARN, droprate = 147 },
            { itemid = xi.items.SPOOL_OF_SCARLET_ODOSHI, droprate = 118 },
            { itemid = xi.items.SPOOL_OF_LUMINIAN_THREAD, droprate = 235 },
        },

        {
            { itemid = xi.items.ORCHID_CHIP, droprate = 1000 },
        },
    }
}

return content:register()
