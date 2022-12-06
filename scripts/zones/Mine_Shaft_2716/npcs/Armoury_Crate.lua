-----------------------------------
-- Area: Mine Shaft #2716
-- NPC: Armoury Crate
-- Note: A loot offset is used to differentuate loot
--  tables based on race vs job as they share similar
--  int values to represent them. All race values are
--  offset by 20.
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local lootOffset = 20

local loot =
{
    -- ENM: Bionic Bug
    [738] =
    {
        {
            { itemid = xi.items.NONE, droprate = 900 },
            { itemid = xi.items.CLOUD_EVOKER, droprate = 100 },
        },
        {
            { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER, droprate = 333 },
            { itemid = xi.items.PIECE_OF_CASSIA_LUMBER, droprate = 333 },
            { itemid = xi.items.DRAGON_BONE, droprate = 334 },
        },
        {
            { itemid = xi.items.NONE, droprate = 625 },
            { itemid = xi.items.MARTIAL_KNIFE, droprate =  75 },
            { itemid = xi.items.MARTIAL_SCYTHE, droprate =  75 },
            { itemid = xi.items.COMMANDERS_CAPE, droprate =  75 },
            { itemid = xi.items.FAERIE_HAIRPIN, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_RAISE_III, droprate =  50 },
        },
        {
            { itemid = xi.items.NONE, droprate = 625 },
            { itemid = xi.items.MARTIAL_KNIFE, droprate =  75 },
            { itemid = xi.items.MARTIAL_SCYTHE, droprate =  75 },
            { itemid = xi.items.COMMANDERS_CAPE, droprate =  75 },
            { itemid = xi.items.FAERIE_HAIRPIN, droprate = 100 },
            { itemid = xi.items.SCROLL_OF_RAISE_III, droprate =  50 },
        },
    },

    -- Automaton Assault Hume
    [xi.race.HUME_M + lootOffset] =
    {
        {
            { itemid = xi.items.NONE,    droprate = 800 },
            { itemid = xi.items.SACK_OF_LUGWORM_SAND, droprate = 200 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.BELINKYS_EARRING, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.QUANTZS_EARRING, droprate = 100 },
        },
    },

    -- Automaton Assault Elvaan
    [xi.race.ELVAAN_M + lootOffset] =
    {
        {
            { itemid = xi.items.NONE,    droprate = 800 },
            { itemid = xi.items.SACK_OF_LUGWORM_SAND, droprate = 200 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.DESAMILIONS_EARRING, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.MELNINAS_EARRING, droprate = 100 },
        },
    },

    -- Automaton Assault Taru
    [xi.race.TARU_M + lootOffset] =
    {
        {
            { itemid = xi.items.NONE,    droprate = 800 },
            { itemid = xi.items.SACK_OF_LUGWORM_SAND, droprate = 200 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.WAETOTOS_EARRING, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.MORUKAKAS_EARRING, droprate = 100 },
        },
    },

    -- Automaton Assault Mithra
    [xi.race.MITHRA + lootOffset] =
    {
        {
            { itemid = xi.items.NONE,    droprate = 800 },
            { itemid = xi.items.SACK_OF_LUGWORM_SAND, droprate = 200 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.RYAKHOS_EARRING, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.RYAKHOS_EARRING, droprate = 100 },
        },
    },

    -- Automaton Assault Galka
    [xi.race.GALKA + lootOffset] =
    {
        {
            { itemid = xi.items.NONE,    droprate = 800 },
            { itemid = xi.items.SACK_OF_LUGWORM_SAND, droprate = 200 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.ZEDOMAS_EARRING, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE,     droprate = 900 },
            { itemid = xi.items.GAYANJS_EARRING, droprate = 100 },
        },
    },

    -- Pulling the Strings Specific Job Rewards
    [xi.job.WAR] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.JANIZARY_EARRING, droprate = 250 },
        },
    },
    [xi.job.MNK] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.COUNTER_EARRING, droprate = 250 },
        },
    },

    [xi.job.WHM] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.HEALING_FEATHER, droprate = 250 },
        },
    },

    [xi.job.BLM] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.SPIRIT_LANTERN, droprate = 250 },
        },
    },

    [xi.job.RDM] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.SANATION_RING, droprate = 250 },
        },
    },

    [xi.job.THF] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.ASSASSINS_RING, droprate = 250 },
        },
    },

    [xi.job.PLD] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.VIAL_OF_REFRESH_MUSK, droprate = 250 },
        },
    },

    [xi.job.DRK] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.TACTICAL_RING, droprate = 250 },
        },
    },

    [xi.job.BST] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.PACIFIST_RING, droprate = 250 },
        },
    },

    [xi.job.BRD] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.GETSUL_RING, droprate = 250 },
        },
    },

    [xi.job.RNG] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.DEADEYE_EARRING, droprate = 250 },
        },
    },

    [xi.job.SAM] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.GAMUSHARA_EARRING, droprate = 250 },
        },
    },

    [xi.job.NIN] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.NARUKO_EARRING, droprate = 250 },
        },
    },

    [xi.job.DRG] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.BAG_OF_WYVERN_FEED, droprate = 250 },
        },
    },

    [xi.job.SMN] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.ASTRAL_POT, droprate = 250 },
        },
    },

    [xi.job.BLU] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.DEATH_CHAKRAM, droprate = 250 },
        },
    },

    [xi.job.COR] =
    {
        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.CORSAIR_BULLET_POUCH, droprate = 250 },
        },
    },

    [xi.job.PUP] =
    {
        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.ATTUNER,            droprate = 100 },
            { itemid = xi.items.TACTICAL_PROCESSOR, droprate = 100 },
            { itemid = xi.items.DRUM_MAGAZINE,      droprate = 100 },
            { itemid = xi.items.EQUALIZER,          droprate = 100 },
            { itemid = xi.items.TARGET_MAKER,       droprate = 100 },
            { itemid = xi.items.MANA_CHANNELER,     droprate = 100 },
            { itemid = xi.items.ERASER,             droprate = 100 },
            { itemid = xi.items.SMOKER_SCREEN,      droprate = 100 },
        },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local battlefield = player:getBattlefield()
    local bfID = player:getBattlefieldID()

    if bfID == 740 then
        local raceLoot = player:getRace()
        if raceLoot < 7 then
            if raceLoot % 2 == 0 then
                raceLoot = raceLoot - 1
            end
        end
        xi.battlefield.HandleLootRolls(battlefield, loot[raceLoot + lootOffset], nil, npc)

    elseif bfID == 739 then
        xi.battlefield.HandleLootRolls(battlefield, loot[player:getMainJob()], nil, npc)

    elseif battlefield then
        xi.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
