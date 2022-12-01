-----------------------------------
-- Area: Apollyon Central
--  Mob: Gunpod
-----------------------------------
local entity = {}

local loot =
{
    [1] = -- AF
    {
        {
            { itemid = xi.items.ANCIENT_BRASS_INGOT, droprate =  9 },
            { itemid = xi.items.ARGYRO_RIVET, droprate = 53 },
            { itemid = xi.items.SQUARE_OF_ASTRAL_LEATHER, droprate =  6 },
            { itemid = xi.items.SPOOL_OF_BENEDICT_YARN, droprate = 12 },
            { itemid = xi.items.BLACK_RIVET, droprate = 29 },
            { itemid = xi.items.BLUE_RIVET, droprate = 12 },
            { itemid = xi.items.SQUARE_OF_BROWN_DOESKIN, droprate = 35 },
            { itemid = xi.items.SQUARE_OF_CANVAS_TOILE, droprate = 35 },
            { itemid = xi.items.SQUARE_OF_CARDINAL_CLOTH, droprate = 12 },
            { itemid = xi.items.SQUARE_OF_CHARCOAL_COTTON, droprate = 12 },
            { itemid = xi.items.SQUARE_OF_CORDUROY_CLOTH, droprate = 12 },
            { itemid = xi.items.SPOOL_OF_DIABOLIC_YARN, droprate = 18 },
            { itemid = xi.items.POT_OF_EBONY_LACQUER, droprate = 29 },
            { itemid = xi.items.ELECTRUM_STUD, droprate = 12 },
            { itemid = xi.items.FETID_LANOLIN_CUBE, droprate = 12 },
            { itemid = xi.items.SQUARE_OF_FLAMESHUN_CLOTH, droprate = 18 },
            { itemid = xi.items.GOLD_STUD, droprate =  5 },
            { itemid = xi.items.SHEET_OF_KUROGANE, droprate = 35 },
            { itemid = xi.items.SPOOL_OF_LIGHT_FILAMENT, droprate = 41 },
            { itemid = xi.items.WHITE_RIVET, droprate = 18 },
        },
    },

    [2] = -- Chip
    {
        {
            { itemid = xi.items.CHARCOAL_CHIP, droprate = 53 },
            { itemid = xi.items.MAGENTA_CHIP, droprate = 76 },
            { itemid = xi.items.SMALT_CHIP, droprate = 64 },
            { itemid = xi.items.SMOKY_CHIP, droprate = 41 },
        },
    },

    [3] = -- Crafting
    {
        {
            { itemid =  xi.items.CHUNK_OF_ADAMAN_ORE, droprate = 50 },
            { itemid = xi.items.HANDFUL_OF_CLOT_PLASMA, droprate = 50 },
            { itemid =  xi.items.DARKSTEEL_SHEET, droprate = 50 },
            { itemid =  xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate = 50 },
            { itemid = xi.items.OXBLOOD, droprate = 50 },
            { itemid = xi.items.LIGHT_STEEL_INGOT, droprate = 50 },
            { itemid =  xi.items.SPOOL_OF_RAINBOW_THREAD, droprate = 50 },
            { itemid = xi.items.PONZE_OF_SHELL_POWDER, droprate = 50 },
        },
    },

    [4] = -- ABCs
    {
        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid =    xi.items.NONE, droprate = 1000 },
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },
    },
}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local players = mob:getBattlefield():getPlayers()
        local random  = math.random(1, 4)

        for i = 1, #loot[random] do
            local lootGroup = loot[random][i]

            if lootGroup then
                local max = 0

                for _, entry in pairs(lootGroup) do
                    max = max + entry.droprate
                end

                local roll = math.random(max)

                for _, entry in pairs(lootGroup) do
                    max = max - entry.droprate

                    if roll > max then
                        if entry.itemid ~= 0 then
                            players[1]:addTreasure(entry.itemid, mob)
                        end

                        break
                    end
                end
            end
        end
    end
end

return entity
