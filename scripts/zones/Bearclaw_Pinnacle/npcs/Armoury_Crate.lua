-----------------------------------
-- Area: Bearclaw Pinnacle
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/items")
-----------------------------------
local entity = {}

-- Leaving this loot here until their respective battlefields are implemented
 local loot =
 {
     -- ENM: Follow the White Rabbit
     [641] =
     {
         {
             { itemid = xi.items.NONE,                      droprate =  50 }, 
             { itemid = xi.items.SQUARE_OF_GALATEIA,        droprate = 450 }, 
             { itemid = xi.items.SQUARE_OF_KEJUSU_SATIN,    droprate =  50 }, 
             { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI,    droprate = 450 }, 
         },

         {
             { itemid = xi.items.NONE,                      droprate = 950 }, 
             { itemid = xi.items.CLOUD_EVOKER,              droprate =  50 }, 
         },

         {
             { itemid = xi.items.NONE,                      droprate = 325 }, 
             { itemid = xi.items.MARTIAL_SWORD,             droprate = 225 }, 
             { itemid = xi.items.SHAMO,                     droprate = 125 }, 
             { itemid = xi.items.VENTURERS_BELT,            droprate =  50 }, 
             { itemid = xi.items.SERENE_RING,               droprate = 100 }, 
             { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 175 }, 
         },

         {
             { itemid = xi.items.NONE,                      droprate = 325 }, 
             { itemid = xi.items.MARTIAL_SWORD,             droprate = 225 }, 
             { itemid = xi.items.SHAMO,                     droprate = 125 }, 
             { itemid = xi.items.VENTURERS_BELT,            droprate =  50 }, 
             { itemid = xi.items.SERENE_RING,               droprate = 100 }, 
             { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 175 }, 
         },
     },

     -- ENM: When Hell Freezes Over
     [642] =
     {
         {
             { itemid = xi.items.NONE,                      droprate = 100 }, 
             { itemid = xi.items.SQUARE_OF_GALATEIA,        droprate = 500 }, 
             { itemid = xi.items.SQUARE_OF_KEJUSU_SATIN,    droprate = 150 }, 
             { itemid = xi.items.POT_OF_VIRIDIAN_URUSHI,    droprate = 250 }, 
         },

         {
             { itemid = xi.items.NONE,                      droprate = 950 }, 
             { itemid = xi.items.CLOUD_EVOKER,              droprate =  50 }, 
         },

         {
             { itemid = xi.items.NONE,                      droprate = 250 }, 
             { itemid = xi.items.MARTIAL_BHUJ,              droprate = 125 }, 
             { itemid = xi.items.MARTIAL_GUN,               droprate = 125 }, 
             { itemid = xi.items.MARTIAL_STAFF,             droprate = 125 }, 
             { itemid = xi.items.HEXEREI_CAPE,              droprate = 125 }, 
             { itemid = xi.items.SETTLERS_CAPE,             droprate = 125 }, 
             { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 125 }, 
         },

         {
             { itemid = xi.items.NONE,                      droprate = 250 }, 
             { itemid = xi.items.MARTIAL_BHUJ,              droprate = 125 }, 
             { itemid = xi.items.MARTIAL_GUN,               droprate = 125 }, 
             { itemid = xi.items.MARTIAL_STAFF,             droprate = 125 }, 
             { itemid = xi.items.HEXEREI_CAPE,              droprate = 125 }, 
             { itemid = xi.items.SETTLERS_CAPE,             droprate = 125 }, 
             { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 125 }, 
         },
     },

     -- ENM: Brothers

     [643] =
     {
         {
             { itemid = xi.items.NONE,                      droprate = 100 },
             { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER,  droprate = 500 },
             { itemid = xi.items.PIECE_OF_CASSIA_LUMBER,    droprate = 150 },
             { itemid = xi.items.DRAGON_BONE,               droprate = 250 },
         },

         {
             { itemid = xi.items.NONE,                      droprate = 950 },
             { itemid = xi.items.CLOUD_EVOKER,              droprate =  50 },
         },

         {
             { itemid = xi.items.NONE,                      droprate = 250 },
             { itemid = xi.items.SCOUTERS_ROPE,             droprate = 125 },
             { itemid = xi.items.HEDGEHOG_BOMB,             droprate = 125 },
             { itemid = xi.items.MARTIAL_ANELACE,           droprate = 125 },
             { itemid = xi.items.MARTIAL_LANCE,             droprate = 125 },
             { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 125 },
         },

         {
            { itemid = xi.items.NONE,                      droprate = 250 },
            { itemid = xi.items.SCOUTERS_ROPE,             droprate = 125 },
            { itemid = xi.items.HEDGEHOG_BOMB,             droprate = 125 },
            { itemid = xi.items.MARTIAL_ANELACE,           droprate = 125 },
            { itemid = xi.items.MARTIAL_LANCE,             droprate = 125 },
            { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 125 },
        },
     },

     -- ENM: Holy Cow
     [644] =
     {
         {
             { itemid = xi.items.NONE,                      droprate = 100 }, -- nothing
             { itemid = xi.items.SQUARE_OF_ELTORO_LEATHER,  droprate = 500 }, -- Square of Galateia
             { itemid = xi.items.PIECE_OF_CASSIA_LUMBER,    droprate = 150 }, -- Kejusu Satin
             { itemid = xi.items.DRAGON_BONE,               droprate = 250 }, -- Viridian Urushi
         },

         {
             { itemid = xi.items.NONE,                      droprate = 950 }, -- nothing
             { itemid = xi.items.CLOUD_EVOKER,              droprate =  50 }, -- Cloud Evoker
         },

         {
             { itemid = xi.items.NONE,                      droprate = 250 }, -- nothing
             { itemid = xi.items.GIGANT_MANTLE,             droprate = 125 }, -- Martial Bhuj
             { itemid = xi.items.PSILOS_MANTLE,             droprate = 125 }, -- Martial Gun
             { itemid = xi.items.MARTIAL_BOW,               droprate = 125 }, -- Martial Staff
             { itemid = xi.items.MARTIAL_KNUCKLES,          droprate = 125 }, -- Hexerei Cape
             { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 125 }, -- Settler's Cape
         },

         {
            { itemid = xi.items.NONE,                      droprate = 250 }, -- nothing
            { itemid = xi.items.GIGANT_MANTLE,             droprate = 125 }, -- Martial Bhuj
            { itemid = xi.items.PSILOS_MANTLE,             droprate = 125 }, -- Martial Gun
            { itemid = xi.items.MARTIAL_BOW,               droprate = 125 }, -- Martial Staff
            { itemid = xi.items.MARTIAL_KNUCKLES,          droprate = 125 }, -- Hexerei Cape
            { itemid = xi.items.SCROLL_OF_RAISE_III,       droprate = 125 }, -- Settler's Cape
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
