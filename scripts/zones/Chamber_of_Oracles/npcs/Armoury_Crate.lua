-----------------------------------
-- Area: Chamber of Oracles
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- BCNM Legion XI Comitatensis
    [193] =
    {
        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.EVASION_TORQUE, droprate = 150 },
            { itemid = xi.items.PARRYING_TORQUE, droprate = 150 },
            { itemid = xi.items.GUARDING_TORQUE, droprate = 150 },
            { itemid = xi.items.NINJUTSU_TORQUE, droprate = 150 },
            { itemid = xi.items.WIND_TORQUE, droprate = 150 },
            { itemid = xi.items.SUMMONING_TORQUE, droprate = 150 },
        },

        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.DIVINE_TORQUE, droprate = 150 },
            { itemid = xi.items.DARK_TORQUE, droprate = 150 },
            { itemid = xi.items.ENHANCING_TORQUE, droprate = 150 },
            { itemid = xi.items.ENFEEBLING_TORQUE, droprate = 150 },
            { itemid = xi.items.ELEMENTAL_TORQUE, droprate = 150 },
            { itemid = xi.items.HEALING_TORQUE, droprate = 150 },
        },

        {
            { itemid = xi.items.SUNSTONE, droprate = 100 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate = 100 },
            { itemid = xi.items.JADEITE, droprate = 100 },
            { itemid = xi.items.FLUORITE, droprate = 100 },
            { itemid = xi.items.DARKSTEEL_INGOT, droprate = 100 },
            { itemid = xi.items.ZIRCON, droprate = 100 },
            { itemid = xi.items.CHRYSOBERYL, droprate = 100 },
            { itemid = xi.items.MOONSTONE, droprate = 100 },
            { itemid = xi.items.PAINITE, droprate = 100 },
            { itemid = xi.items.STEEL_INGOT, droprate = 100 },
        },

        {
            { itemid = xi.items.NONE, droprate = 500 },
            { itemid = xi.items.SCROLL_OF_RAISE_II, droprate = 500 },
        },

        {
            { itemid = xi.items.NONE, droprate = 950 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate =  50 },
        },

        {
            { itemid = xi.items.YELLOW_ROCK, droprate =  50 },
            { itemid = xi.items.WHITE_ROCK, droprate =  50 },
            { itemid = xi.items.EBONY_LOG, droprate = 125 },
            { itemid = xi.items.PLATINUM_BEASTCOIN, droprate = 775 },
        },

        {
            { itemid = xi.items.NONE, droprate = 600 },
            { itemid = xi.items.CHUNK_OF_WATER_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_ICE_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_LIGHTNING_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_EARTH_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_FIRE_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_LIGHT_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_DARK_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_WIND_ORE, droprate =  50 },
        },
    },

    -- Cactuar Suave
    [197] =
    {
        {
            { itemid = xi.items.CACTUAR_NEEDLE,  droprate = 700 },
            { itemid = xi.items.BAG_OF_CACTUS_STEMS, droprate = 250 },
            { itemid = xi.items.CACTUAR_ROOT, droprate =  50 },
        },
        {
            { itemid = xi.items.CACTUAR_RIBBON, droprate = 250 },
            { itemid = xi.items.CAPRICORN_STAFF, droprate = 250 },
            { itemid = xi.items.ARGENT_DAGGER, droprate = 250 },
            { itemid = xi.items.BALANS_SWORD, droprate = 250 },
        },
        {
            { itemid = xi.items.ZISKAS_CROSSBOW, droprate = 200 },
            { itemid = xi.items.HONEBAMI, droprate = 200 },
            { itemid = xi.items.UNJI, droprate = 200 },
            { itemid = xi.items.TAILLEFERS_DAGGER, droprate = 200 },
            { itemid = xi.items.SCHILTRON_SPEAR, droprate = 200 },
        },
        {
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,  droprate = 50 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,  droprate = 50 },
            { itemid = xi.items.MAHOGANY_LOG,  droprate = 50 },
            { itemid = xi.items.EBONY_LOG,  droprate = 50 },
            { itemid = xi.items.PETRIFIED_LOG,  droprate = 50 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD,  droprate = 50 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate = 50 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate = 50 },
            { itemid = xi.items.HANDFUL_OF_WYVERN_SCALES,  droprate = 50 },
            { itemid = xi.items.CORAL_FRAGMENT,  droprate = 50 },
            { itemid = xi.items.RAM_HORN,  droprate = 50 },
            { itemid = xi.items.DEMON_HORN,  droprate = 50 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate = 50 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate = 50 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 50 },
            { itemid = xi.items.VILE_ELIXIR, droprate = 50 },
            { itemid = xi.items.VILE_ELIXIR_P1, droprate = 50 },
            { itemid = xi.items.SCROLL_OF_CURE_V, droprate = 50 },
            { itemid = xi.items.SCROLL_OF_SHELL_IV, droprate = 50 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate = 50 },
        },
        {
            { itemid = xi.items.NONE,    droprate = 250 },
            { itemid = xi.items.DAMASCUS_INGOT,  droprate = 100 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate = 150 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,  droprate = 100 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate = 100 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 250 },
        },
    },

    -- KSNM Eye of the Storm
    [198] =
    {
        {
            { itemid = xi.items.WYVERN_WING, droprate = 1000 },
        },

        {
            { itemid = xi.items.WYVERN_SKIN, droprate = 1000 },
        },

        {
            { itemid = 65535, droprate = 1000, amount = 24000 }, -- gil

        },

        {
            { itemid = xi.items.WOODVILLES_AXE, droprate = 150 },
            { itemid = xi.items.THANATOS_BASELARD, droprate = 150 },
            { itemid = xi.items.WYVERN_PERCH, droprate = 200 },
            { itemid = xi.items.BALINS_SWORD, droprate = 300 },
        },

        {
            { itemid = xi.items.NONE, droprate = 300 },
            { itemid = xi.items.BOURDONASSE, droprate = 150 },
            { itemid = xi.items.POLE_GRIP,     droprate = 150 },
            { itemid = xi.items.SWORD_STRAP,   droprate = 350 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate =  50 },
        },

        {
            { itemid = xi.items.NONE, droprate = 100 },
            { itemid = xi.items.ZISKAS_CROSSBOW, droprate = 200 },
            { itemid = xi.items.UNJI, droprate = 150 },
            { itemid = xi.items.TAILLEFERS_DAGGER, droprate = 200 },
            { itemid = xi.items.SCHILTRON_SPEAR, droprate = 350 },
        },

        {
            { itemid = xi.items.NONE, droprate =  780 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate =  85 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate =  50 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate =  85 },
        },

        {
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE, droprate =  50 },
            { itemid = xi.items.MYTHRIL_INGOT, droprate =  50 },
            { itemid = xi.items.MAHOGANY_LOG, droprate =  75 },
            { itemid = xi.items.EBONY_LOG, droprate =  60 },
            { itemid = xi.items.PETRIFIED_LOG, droprate =  75 },
            { itemid = xi.items.CHUNK_OF_GOLD_ORE, droprate =  50 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE, droprate =  50 },
            { itemid = xi.items.SPOOL_OF_GOLD_THREAD, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH, droprate =  50 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate =  20 },
            { itemid = xi.items.CORAL_FRAGMENT, droprate =  50 },
            { itemid = xi.items.RAM_HORN, droprate =  50 },
            { itemid = xi.items.DEMON_HORN, droprate =  50 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 120 },
            { itemid = xi.items.SLAB_OF_GRANITE, droprate =  25 },
            { itemid = xi.items.RERAISER, droprate =  50 },
            { itemid = xi.items.HI_RERAISER, droprate =  25 },
        },
        {
            { itemid = xi.items.NONE, droprate = 575 },
            { itemid = xi.items.DAMASCUS_INGOT, droprate =  85 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH, droprate =  65 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER, droprate =  45 },
            { itemid = xi.items.PHOENIX_FEATHER, droprate = 100 },
            { itemid = xi.items.PHILOSOPHERS_STONE, droprate =  65 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate =  65 },
        }
    },
    -- The Scarlet King
    [199] =
    {
        {
            { itemid = xi.items.MANTICORE_HIDE, droprate = 1000 },
        },
        {
            { itemid = xi.items.LOCK_OF_MANTICORE_HAIR, droprate = 1000 },
        },
        {
            { itemid = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD,  droprate = 200 },
            { itemid = xi.items.WYVERN_PERCH, droprate = 200 },
            { itemid = xi.items.HONEBAMI, droprate = 200 },
            { itemid = xi.items.ARGENT_DAGGER, droprate = 200 },
            { itemid = xi.items.THANATOS_BASELARD, droprate = 200 },
        },
        {
            { itemid = xi.items.SCROLL_OF_SHELL_IV,  droprate = 250 },
            { itemid = xi.items.CAPRICORN_STAFF, droprate = 150 },
            { itemid = xi.items.WOODVILLES_AXE, droprate = 150 },
            { itemid = xi.items.KING_MAKER, droprate = 150 },
            { itemid = xi.items.GAWAINS_AXE, droprate = 150 },
            { itemid = xi.items.BALANS_SWORD, droprate = 150 },
        },
        {
            { itemid = xi.items.VILE_ELIXIR,  droprate = 350 },
            { itemid = xi.items.VILE_ELIXIR_P1,  droprate = 100 },
            { itemid = xi.items.SCROLL_OF_CURE_V,  droprate = 100 },
            { itemid = xi.items.POLE_GRIP,     droprate = 250 },
            { itemid = xi.items.SPEAR_STRAP,   droprate = 100 },
            { itemid = xi.items.CLAYMORE_GRIP, droprate = 100 },
        },
        {
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,  droprate =  50 },
            { itemid = xi.items.CHUNK_OF_ADAMAN_ORE,  droprate =  50 },
            { itemid = xi.items.MAHOGANY_LOG,  droprate = 100 },
            { itemid = xi.items.PETRIFIED_LOG,  droprate = 100 },
            { itemid = xi.items.CHUNK_OF_PLATINUM_ORE,  droprate =  50 },
            { itemid = xi.items.CHUNK_OF_ORICHALCUM_ORE,  droprate =  50 },
            { itemid = xi.items.GOLD_INGOT,  droprate =  25 },
            { itemid = xi.items.PLATINUM_INGOT,  droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAINBOW_CLOTH,  droprate =  25 },
            { itemid = xi.items.PHOENIX_FEATHER,  droprate = 100 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 100 },
            { itemid = xi.items.RERAISER, droprate = 100 },
            { itemid = xi.items.HI_RERAISER, droprate =  50 },
            { itemid = xi.items.SCROLL_OF_THUNDER_III, droprate = 150 },
        },
        {
            { itemid = xi.items.NONE,    droprate = 650 },
            { itemid = xi.items.DAMASCUS_INGOT,  droprate = 100 },
            { itemid = xi.items.SQUARE_OF_DAMASCENE_CLOTH,  droprate =  50 },
            { itemid = xi.items.SPOOL_OF_MALBORO_FIBER,  droprate =  50 },
            { itemid = xi.items.PHILOSOPHERS_STONE,  droprate =  50 },
            { itemid = xi.items.SQUARE_OF_RAXA, droprate = 100 },
        }
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
