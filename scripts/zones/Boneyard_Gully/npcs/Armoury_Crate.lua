-----------------------------------
-- Area: Boneyard Gully
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- ENM: Like the Wind
    [673] =
    {
        {
            { itemid = xi.items.NONE, droprate = 140 },
            { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI, droprate = 310 },
            { itemid = xi.items.SQUARE_OF_GALATEIA, droprate = 241 },
            { itemid = xi.items.SQUARE_OF_KEJUSU_SATIN, droprate = 310 },
        },

        {
            { itemid = xi.items.NONE, droprate = 862 },
            { itemid = xi.items.CLOUD_EVOKER, droprate = 138 },
        },

        {
            { itemid = xi.items.NONE, droprate = 380 },
            { itemid = xi.items.MANEATER, droprate = 138 },
            { itemid = xi.items.WAGH_BAGHNAKHS, droprate = 172 },
            { itemid = xi.items.ONIMARU, droprate = 138 },
            { itemid = xi.items.SCROLL_OF_ARMYS_PAEON_V, droprate = 172 },
        },

        {
            { itemid = xi.items.NONE, droprate = 380 },
            { itemid = xi.items.MANEATER, droprate = 138 },
            { itemid = xi.items.WAGH_BAGHNAKHS, droprate = 172 },
            { itemid = xi.items.ONIMARU, droprate = 138 },
            { itemid = xi.items.SCROLL_OF_ARMYS_PAEON_V, droprate = 172 },
        },
    },

    -- ENM: Sheep in Antlion's Clothing
    [674] =
    {
        {
            { itemid = xi.items.NONE, droprate = 124 },
            { itemid = xi.items.SQUARE_OF_GALATEIA, droprate = 268 },
            { itemid = xi.items.SQUARE_OF_KEJUSU_SATIN, droprate = 266 },
            { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI, droprate = 342 },
        },

        {
            { itemid = xi.items.NONE, droprate = 944 },
            { itemid = xi.items.CLOUD_EVOKER, droprate =  56 },
        },

        {
            { itemid = xi.items.HAGUN, droprate =  82 },
            { itemid = xi.items.MARTIAL_AXE, droprate =  92 },
            { itemid = xi.items.MARTIAL_WAND, droprate =  63 },
            { itemid = xi.items.FORAGERS_MANTLE, droprate = 105 },
            { itemid = xi.items.HARMONIAS_TORQUE, droprate = 121 },
        },
    },

    -- ENM: Shell We Dance?
    [675] =
    {
        {
            { itemid = xi.items.NONE, droprate = 250 },
            { itemid = xi.items.PIECE_OF_CASSIA_LUMBER, droprate = 350 },
            { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER, droprate = 325 },
            { itemid = xi.items.DRAGON_BONE, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 812 },
            { itemid = xi.items.CLOUD_EVOKER, droprate = 188 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.STONE_SPLITTER, droprate = 150 },
            { itemid = xi.items.FRENZY_FIFE, droprate = 175 },
            { itemid = xi.items.BLAU_DOLCH, droprate = 238 },
            { itemid = xi.items.SCROLL_OF_ARMYS_PAEON_V, droprate = 237 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.STONE_SPLITTER, droprate = 150 },
            { itemid = xi.items.FRENZY_FIFE, droprate = 175 },
            { itemid = xi.items.BLAU_DOLCH, droprate = 238 },
            { itemid = xi.items.SCROLL_OF_ARMYS_PAEON_V, droprate = 237 },
        },
    },

    -- ENM: Totentanz (Wiki did not have groupings or droprates, these values are guesses based on other ENMs)
    [676] =
    {
        {
            { itemid = xi.items.NONE, droprate = 800 },
            { itemid = xi.items.CLOUD_EVOKER, droprate = 200 },
        },
        {
            { itemid = xi.items.NONE, droprate = 325 },
            { itemid = xi.items.ONIMARU, droprate = 100 },
            { itemid = xi.items.BLAU_DOLCH, droprate = 250 },
            { itemid = xi.items.STONE_SPLITTER, droprate = 150 },
            { itemid = xi.items.FRENZY_FIFE, droprate = 175 },
        },
        {
            { itemid = xi.items.NONE, droprate = 670 },
            { itemid = xi.items.MANEATER, droprate = 100 },
            { itemid = xi.items.WAGH_BAGHNAKHS, droprate =  65 },
            { itemid = xi.items.RAISE_II_ROD, droprate =  65 },
            { itemid = xi.items.CORSE_CAPE, droprate = 100 },
        },
        {
            { itemid = xi.items.NONE, droprate = 325 },
            { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI, droprate = 350 },
            { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER, droprate = 325 },
        },
        {
            { itemid = xi.items.NONE, droprate = 150 },
            { itemid = xi.items.UNICORN_HORN, droprate = 225 },
            { itemid = xi.items.PIECE_OF_CASSIA_LUMBER, droprate = 375 },
            { itemid = xi.items.DRAGON_BONE, droprate = 250 },
        },
    },

    -- Requiem of Sin
    [678] =
    {
        {
            { itemid = xi.items.NONE, droprate = 655 },
            { itemid = xi.items.PIECE_OF_CASSIA_LUMBER, droprate = 150 },
            { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER, droprate = 120 },
            { itemid = xi.items.DRAGON_BONE, droprate =  75 },
        },
        {
            { itemid = xi.items.NONE, droprate = 655 },
            { itemid = xi.items.PIECE_OF_CASSIA_LUMBER, droprate = 150 },
            { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER, droprate = 120 },
            { itemid = xi.items.DRAGON_BONE, droprate =  75 },
        },
        {
            { itemid = xi.items.NONE, droprate = 650 },
            { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI, droprate = 110 },
            { itemid = xi.items.SQUARE_OF_KEJUSU_SATIN, droprate = 120 },
            { itemid = xi.items.SQUARE_OF_GALATEIA, droprate = 110 },
        },
        {
            { itemid = xi.items.NONE, droprate = 650 },
            { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI, droprate = 110 },
            { itemid = xi.items.SQUARE_OF_KEJUSU_SATIN, droprate = 120 },
            { itemid = xi.items.SQUARE_OF_GALATEIA, droprate = 110 },
        },
        {
            { itemid = xi.items.NONE, droprate = 745 },
            { itemid = xi.items.XS_KNIFE, droprate = 75 },
            { itemid = xi.items.YS_SCYTHE, droprate = 90 },
            { itemid = xi.items.ZS_TRIDENT, droprate = 90 },
        },
        {
            { itemid = xi.items.NONE, droprate = 835 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 110 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate =  45 },
            { itemid = xi.items.LACQUER_TREE_LOG, droprate =  10 },
        },
        {
            { itemid = xi.items.NONE, droprate = 805 },
            { itemid = xi.items.PETRIFIED_LOG, droprate =  50 },
            { itemid = xi.items.DIVINE_LOG, droprate =  10 },
            { itemid = xi.items.SQUARE_OF_SHINING_CLOTH, droprate =  10 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate =  75 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  50 },
        },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        xi.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
