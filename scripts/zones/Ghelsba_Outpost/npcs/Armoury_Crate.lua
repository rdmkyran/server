-----------------------------------
-- Area: Ghelsba_Outpost
--  NPC: Armoury Crate
-- Ghelsba_Outpost Armoury_Crate
-----------------------------------
require("scripts/globals/bcnm")
require("scripts/globals/items")
require("scripts/globals/battlefield")
-----------------------------------
local entity = {}

local loot =
{
    -- BCNM Wings of Fury
    [34] =
    {
        {
            { itemid = xi.items.BAT_FANG,                  droprate = 1000 },
        },

        {
            { itemid = xi.items.SCROLL_OF_INVISIBLE,       droprate = 319 },
            { itemid = xi.items.SCROLL_OF_SNEAK,           droprate = 125 },
            { itemid = xi.items.SCROLL_OF_DEODORIZE,       droprate = 222 },
            { itemid = xi.items.THUNDER_SPIRIT_PACT,       droprate = 306 },
        },

        {
            { itemid = xi.items.MYTHRIL_BEASTCOIN,         droprate = 444 },
            { itemid = xi.items.TRANSLUCENT_ROCK,          droprate =  56 },
            { itemid = xi.items.PLATOON_AXE,               droprate =  83 },
            { itemid = xi.items.PLATOON_POLE,              droprate =  97 },
            { itemid = xi.items.GANKO,                     droprate = 153 },
            { itemid = xi.items.PLATOON_DAGGE,             droprate = 125 },
            { itemid = xi.items.PLATOON_EDGE,              droprate = 139 },
        },

        {
            { itemid = xi.items.BLUE_ROCK,                 droprate =  69 },
            { itemid = xi.items.YELLOW_ROCK,               droprate =  14 },
            { itemid = xi.items.GREEN_ROCK,                droprate =  28 },
            { itemid = xi.items.BLACK_ROCK,                droprate =  28 },
            { itemid = xi.items.WHITE_ROCK,                droprate =  14 },
            { itemid = xi.items.RED_ROCK,                  droprate =  69 },
            { itemid = xi.items.PURPLE_ROCK,               droprate =  97 },
            { itemid = xi.items.PLATOON_SWORD,             droprate = 181 },
            { itemid = xi.items.PLATOON_DAGGE,             droprate = 139 },
            { itemid = xi.items.GUNROMARU,                 droprate = 111 },
            { itemid = xi.items.PLATOON_LANCE,             droprate =  42 },
            { itemid = xi.items.PLATOON_EDGE,              droprate = 139 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 389 },
            { itemid = xi.items.BAT_WING,                  droprate = 444 },
            { itemid = xi.items.ASTRAL_RING,               droprate = 167 },
        },
    },

    -- BCNM Petrifying Pair
    [35] =
    {
        {
            { itemid = xi.items.LIZARD_SKIN,               droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 900 },
            { itemid = xi.items.LEAPING_BOOTS,             droprate = 100 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 100 },
            { itemid = xi.items.STEEL_INGOT,               droprate = 100 },
            { itemid = xi.items.ELM_LOG,                   droprate = 350 },
            { itemid = xi.items.CHESTNUT_LOG,              droprate = 175 },
            { itemid = xi.items.RAPIER_BELT,               droprate =  75 },
            { itemid = xi.items.SCYTHE_BELT,               droprate = 175 },
            { itemid = xi.items.KATANA_OBI,                droprate =  50 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 100 },
            { itemid = xi.items.STEEL_INGOT,               droprate = 100 },
            { itemid = xi.items.CHESTNUT_LOG,              droprate = 175 },
            { itemid = xi.items.ELM_LOG,                   droprate = 350 },
            { itemid = xi.items.RAPIER_BELT,               droprate =  75 },
            { itemid = xi.items.SCYTHE_BELT,               droprate = 175 },
            { itemid = xi.items.KATANA_OBI,                droprate =  50 },
        },

        {
            { itemid = xi.items.CHUNK_OF_IRON_ORE,         droprate = 131 },
            { itemid = xi.items.CHUNK_OF_MYTHRIL_ORE,      droprate =  79 },
            { itemid = xi.items.IRON_INGOT,                droprate = 131 },
            { itemid = xi.items.CHUNK_OF_SILVER_ORE,       droprate =  79 },
            { itemid = xi.items.LAPIS_LAZULI,              droprate = 131 },
            { itemid = xi.items.PICK_BELT,                 droprate = 105 },
            { itemid = xi.items.AVATAR_BELT,               droprate = 105 },
        },

        {
            { itemid = xi.items.SCROLL_OF_ERASE,           droprate =  79 },
            { itemid = xi.items.SCROLL_OF_DISPEL,          droprate = 105 },
            { itemid = xi.items.SCROLL_OF_ABSORB_VIT,      droprate = 289 },
            { itemid = xi.items.SCROLL_OF_ABSORB_AGI,      droprate = 263 },
            { itemid = xi.items.SCROLL_OF_ABSORB_INT,      droprate = 210 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI,     droprate =  79 },
            { itemid = xi.items.SCROLL_OF_MAGIC_FINALE,    droprate = 421 },
            { itemid = xi.items.JUG_OF_COLD_CARRION_BROTH, droprate = 552 },
        },

        {
            { itemid = xi.items.NONE,                      droprate =  736 },
            { itemid = xi.items.MYTHRIL_INGOT,             droprate =  200 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,    droprate =  100 },
            { itemid = xi.items.SILVER_INGOT,              droprate =  100 },
            { itemid = xi.items.LIGHT_OPAL,                droprate =   75 },
            { itemid = xi.items.ONYX,                      droprate =   25 },
            { itemid = xi.items.TOURMALINE,                droprate =  125 },
            { itemid = xi.items.CLEAR_TOPAZ,               droprate =   10 },
            { itemid = xi.items.HI_ETHER,                  droprate =  175 },
            { itemid = xi.items.MACE_BELT,                 droprate =  175 },
            { itemid = xi.items.SHIELD_BELT,               droprate =  100 },
            { itemid = xi.items.GUN_BELT,                  droprate =   25 },
            { itemid = xi.items.SARASHI,                   droprate =  250 },
            { itemid = xi.items.SONG_BELT,                 droprate =  100 },
            { itemid = xi.items.STAFF_BELT,                droprate =  150 },
            { itemid = xi.items.AXE_BELT,                  droprate =  200 },
            { itemid = xi.items.CESTUS_BELT,               droprate =  125 },
            { itemid = xi.items.DAGGER_BELT,               droprate =   75 },
            { itemid = xi.items.LANCE_BELT,                droprate =  200 },
        },
        {
            { itemid = xi.items.MYTHRIL_INGOT,             droprate =  200 },
            { itemid = xi.items.CHUNK_OF_DARKSTEEL_ORE,    droprate =  100 },
            { itemid = xi.items.SILVER_INGOT,              droprate =  100 },
            { itemid = xi.items.LIGHT_OPAL,                droprate =   75 },
            { itemid = xi.items.ONYX,                      droprate =   25 },
            { itemid = xi.items.TOURMALINE,                droprate =  125 },
            { itemid = xi.items.CLEAR_TOPAZ,               droprate =   10 },
            { itemid = xi.items.HI_ETHER,                  droprate =  175 },
            { itemid = xi.items.MACE_BELT,                 droprate =  175 },
            { itemid = xi.items.AXE_BELT,                  droprate =  200 },
            { itemid = xi.items.CESTUS_BELT,               droprate =  125 },
            { itemid = xi.items.STAFF_BELT,                droprate =  150 },
            { itemid = xi.items.DAGGER_BELT,               droprate =   75 },
            { itemid = xi.items.SHIELD_BELT,               droprate =  100 },
            { itemid = xi.items.SONG_BELT,                 droprate =  100 },
            { itemid = xi.items.GUN_BELT,                  droprate =   25 },
            { itemid = xi.items.SARASHI,                   droprate =  250 },
            { itemid = xi.items.LANCE_BELT,                droprate =  200 },
        },
    },

    -- BCNM Toadal Recall
    [36] =
    {
        {
            { itemid = xi.items.KING_TRUFFLE,              droprate = 1000 },
        },

        {
            { itemid = xi.items.JUG_OF_SEEDBED_SOIL,       droprate = 1000 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 200 },
            { itemid = xi.items.MAGICIANS_SHIELD,          droprate = 200 },
            { itemid = xi.items.MERCENARYS_SHIELD,         droprate = 200 },
            { itemid = xi.items.BEATERS_SHIELD,            droprate = 200 },
            { itemid = xi.items.PILFERERS_ASPIS,           droprate = 200 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 250 },
            { itemid = xi.items.TRIMMERS_MANTLE,           droprate = 250 },
            { itemid = xi.items.GENIN_MANTLE,              droprate = 250 },
            { itemid = xi.items.WARLOCKS_MANTLE,           droprate = 250 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 625 },
            { itemid = xi.items.SCROLL_OF_UTSUSEMI_NI,     droprate = 125 },
            { itemid = xi.items.SCROLL_OF_PHALANX,         droprate = 125 },
            { itemid = xi.items.SCROLL_OF_ERASE,           droprate = 125 },
        },

        {
            { itemid = xi.items.NONE,                      droprate = 250 },
            { itemid = xi.items.MANNEQUIN_HEAD,            droprate = 250 },
            { itemid = xi.items.MANNEQUIN_BODY,            droprate = 250 },
            { itemid = xi.items.MANNEQUIN_HANDS,           droprate = 250 },
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
