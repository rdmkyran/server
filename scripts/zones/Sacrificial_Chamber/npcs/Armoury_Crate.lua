-----------------------------------
-- Area: Sacrificial Chamber
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- BCNM Jungle Boogymen
    [129] =
    {
        {
            { itemid = xi.items.DARK_TORQUE, droprate = 250 },
            { itemid = xi.items.ELEMENTAL_TORQUE, droprate = 250 },
            { itemid = xi.items.HEALING_TORQUE, droprate = 250 },
            { itemid = xi.items.WIND_TORQUE, droprate = 250 },
        },

        {
            { itemid = xi.items.PLATINUM_BEASTCOIN, droprate = 500 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate =  48 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 143 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 119 },
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_FIRE_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_ICE_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_WIND_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_EARTH_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_LIGHTNING_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_WATER_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_LIGHT_ORE, droprate =  48 },
            { itemid = xi.items.CHUNK_OF_DARK_ORE, droprate =  48 },
        },

        {
            { itemid = xi.items.PLATINUM_BEASTCOIN, droprate = 833 },
            { itemid = xi.items.CHUNK_OF_ICE_ORE, droprate = 167 },
        },

        {
            { itemid = xi.items.ENFEEBLING_TORQUE, droprate = 250 },
            { itemid = xi.items.EVASION_TORQUE, droprate = 250 },
            { itemid = xi.items.GUARDING_TORQUE, droprate = 250 },
            { itemid = xi.items.SUMMONING_TORQUE, droprate = 250 },
        },

        {
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 154 },
            { itemid = xi.items.PAINITE, droprate = 154 },
            { itemid = xi.items.GOLD_INGOT, droprate = 154 },
            { itemid = xi.items.AQUAMARINE, droprate =  77 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  77 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate = 153 },
            { itemid = xi.items.CHRYSOBERYL, droprate =  30 },
            { itemid = xi.items.MOONSTONE, droprate =  30 },
            { itemid = xi.items.SUNSTONE, droprate =  30 },
            { itemid = xi.items.ZIRCON, droprate =  30 },
            { itemid = xi.items.AQUAMARINE, droprate =  30 },
            { itemid = xi.items.EBONY_LOG, droprate =  30 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  30 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate =  30 },
        },

        {
            { itemid = xi.items.DARKSTEEL_INGOT, droprate =  77 },
            { itemid = xi.items.MOONSTONE, droprate = 134 },
            { itemid = xi.items.STEEL_INGOT, droprate = 154 },
            { itemid = xi.items.CHRYSOBERYL, droprate =  50 },
            { itemid = xi.items.HI_RERAISER, droprate = 154 },
            { itemid = xi.items.JADEITE, droprate = 121 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  10 },
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD, droprate =  10 },
            { itemid = xi.items.RED_ROCK, droprate =  30 },
            { itemid = xi.items.BLUE_ROCK, droprate =  30 },
            { itemid = xi.items.YELLOW_ROCK, droprate =  30 },
            { itemid = xi.items.GREEN_ROCK, droprate =  30 },
            { itemid = xi.items.TRANSLUCENT_ROCK, droprate =  30 },
            { itemid = xi.items.PURPLE_ROCK, droprate =  30 },
            { itemid = xi.items.BLACK_ROCK, droprate =  30 },
            { itemid = xi.items.WHITE_ROCK, droprate =  30 },
            { itemid = xi.items.FLUORITE, droprate =  50 },
        },
    },

    -- BCNM Amphibian Assault
    [130] =
    {
        {
            { itemid = xi.items.ENFEEBLING_TORQUE, droprate = 250 },
            { itemid = xi.items.DIVINE_TORQUE, droprate = 250 },
            { itemid = xi.items.SHIELD_TORQUE, droprate = 250 },
            { itemid = xi.items.STRING_TORQUE, droprate = 250 },
        },

        {
            { itemid = xi.items.ELEMENTAL_TORQUE, droprate = 250 },
            { itemid = xi.items.EVASION_TORQUE, droprate = 250 },
            { itemid = xi.items.GUARDING_TORQUE, droprate = 250 },
            { itemid = xi.items.ENHANCING_TORQUE, droprate = 250 },
        },

        {
            { itemid = xi.items.CHUNK_OF_WATER_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_WIND_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_ICE_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_LIGHTNING_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_LIGHT_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_FIRE_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_DARK_ORE, droprate = 125 },
            { itemid = xi.items.CHUNK_OF_EARTH_ORE, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 750 },
            { itemid = xi.items.SUMMONING_TORQUE, droprate = 250 },
        },

        {
            { itemid = xi.items.NONE, droprate = 200 },
            { itemid = xi.items.PLATINUM_BEASTCOIN, droprate = 800 },
        },

        {
            { itemid = xi.items.NONE, droprate = 375 },
            { itemid = xi.items.FIRE_SPIRIT_PACT, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ABSORB_STR, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_PHALANX, droprate = 125 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 125 },
        },

        {
            { itemid = xi.items.NONE, droprate = 888 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  56 },
            { itemid = xi.items.HI_RERAISER, droprate =  56 },
        },

        {
            { itemid = xi.items.FLUORITE, droprate =  10 },
            { itemid = xi.items.PAINITE, droprate =  50 },
            { itemid = xi.items.SUNSTONE, droprate =  10 },
            { itemid = xi.items.JADEITE, droprate = 150 },
            { itemid = xi.items.AQUAMARINE, droprate =  50 },
            { itemid = xi.items.MOONSTONE, droprate = 150 },
            { itemid = xi.items.YELLOW_ROCK, droprate =  50 },
            { itemid = xi.items.RED_ROCK, droprate =  50 },
            { itemid = xi.items.WHITE_ROCK, droprate = 100 },
            { itemid = xi.items.GREEN_ROCK, droprate =  50 },
            { itemid = xi.items.TRANSLUCENT_ROCK, droprate = 100 },
            { itemid = xi.items.CHRYSOBERYL, droprate = 150 },
            { itemid = xi.items.BLACK_ROCK, droprate =  50 },
            { itemid = xi.items.PURPLE_ROCK, droprate =  50 },
        },

        {
            { itemid = xi.items.PLATINUM_BEASTCOIN, droprate = 500 },
            { itemid = xi.items.CORAL_FRAGMENT, droprate = 222 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  10 },
            { itemid = xi.items.STEEL_INGOT, droprate = 111 },
            { itemid = xi.items.EBONY_LOG, droprate =  56 },
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
