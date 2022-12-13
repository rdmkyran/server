-----------------------------------
-- Area: Port Bastok
--  NPC: Nokkhi Jinjahl
-- Type: Travelling Merchant NPC / NPC Quiver Maker / Bastok 1st Place
-- !pos 111 8 -47 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ammoList =
    {
        { xi.items.ACHIYALABOPA_ARROW,             xi.items.ACHIYALABOPA_QUIVER },
        { xi.items.ADLIVUN_ARROW,                  xi.items.ADLIVUN_QUIVER },
        { xi.items.ANTLION_ARROW,                  xi.items.ANTLION_QUIVER },
        { xi.items.BEETLE_ARROW,                   xi.items.BEETLE_QUIVER },
        { xi.items.CHAPULI_ARROW,                  xi.items.CHAPULI_QUIVER },
        { xi.items.DEMON_ARROW,                    xi.items.DEMON_QUIVER },
        { xi.items.EMINENT_ARROW,                  xi.items.EMINENT_QUIVER },
        { xi.items.GARGOUILLE_ARROW,               xi.items.GARGOUILLE_QUIVER },
        { xi.items.HORN_ARROW,                     xi.items.HORN_QUIVER },
        { xi.items.IRON_ARROW,                     xi.items.IRON_QUIVER },
        { xi.items.KABURA_ARROW,                   xi.items.KABURA_QUIVER },
        { xi.items.MANTID_ARROW,                   xi.items.MANTID_QUIVER },
        { xi.items.RAKAZNAR_ARROW,                 xi.items.RAKAZNAR_QUIVER },
        { xi.items.RAAZ_ARROW,                     xi.items.RAAZ_QUIVER },
        { xi.items.RUSZOR_ARROW,                   xi.items.RUSZOR_QUIVER },
        { xi.items.SCORPION_ARROW,                 xi.items.SCORPION_QUIVER },
        { xi.items.SILVER_ARROW,                   xi.items.SILVER_QUIVER },
        { xi.items.SLEEP_ARROW,                    xi.items.SLEEP_QUIVER },
        { xi.items.STONE_ARROW,                    xi.items.STONE_QUIVER },
        { xi.items.TULFAIRE_ARROW,                 xi.items.TULFAIRE_QUIVER },

        { xi.items.ABRASION_BOLT,                  xi.items.ABRASION_BOLT_QUIVER },
        { xi.items.ACHIYALABOPA_BOLT,              xi.items.ACHIYALABOPA_BOLT_QUIVER },
        { xi.items.ACID_BOLT,                      xi.items.ACID_BOLT_QUIVER },
        { xi.items.ADAMAN_BOLT,                    xi.items.ADAMAN_BOLT_QUIVER },
        { xi.items.ADLIVUN_BOLT,                   xi.items.ADLIVUN_BOLT_QUIVER },
        { xi.items.BISMUTH_BOLT,                   xi.items.BISMUTH_BOLT_QUIVER },
        { xi.items.BLIND_BOLT,                     xi.items.BLIND_BOLT_QUIVER },
        { xi.items.BLOODY_BOLT,                    xi.items.BLOODY_BOLT_QUIVER },
        { xi.items.DAMASCUS_BOLT,                  xi.items.DAMASCUS_BOLT_QUIVER },
        { xi.items.DARK_ADAMAN_BOLT,               xi.items.DARK_ADAMAN_BOLT_QUIVER },
        { xi.items.DARKLING_BOLT,                  xi.items.DARKLING_BOLT_QUIVER },
        { xi.items.DARKSTEEL_BOLT,                 xi.items.DARKSTEEL_BOLT_QUIVER },
        { xi.items.EMINENT_BOLT,                   xi.items.EMINENT_BOLT_QUIVER },
        { xi.items.FUSION_BOLT,                    xi.items.FUSION_BOLT_QUIVER },
        { xi.items.GASHING_BOLT,                   xi.items.GASHING_BOLT_QUIVER },
        { xi.items.HOLY_BOLT,                      xi.items.HOLY_BOLT_QUIVER },
        { xi.items.MIDRIUM_BOLT,                   xi.items.MIDRIUM_BOLT_QUIVER },
        { xi.items.MYTHRIL_BOLT,                   xi.items.MYTHRIL_BOLT_QUIVER },
        { xi.items.OXIDANT_BOLT,                   xi.items.OXIDANT_BOLT_QUIVER },
        { xi.items.RAKAZNAR_BOLT,                  xi.items.RAKAZNAR_BOLT_QUIVER },
        { xi.items.RIGHTEOUS_BOLT,                 xi.items.RIGHTEOUS_BOLT_QUIVER },
        { xi.items.SLEEP_BOLT,                     xi.items.SLEEP_BOLT_QUIVER },
        { xi.items.TITANIUM_BOLT,                  xi.items.TITANIUM_BOLT_QUIVER },
        { xi.items.VENOM_BOLT,                     xi.items.VENOM_BOLT_QUIVER },

        { xi.items.ADAMAN_BULLET,                  xi.items.ADAMAN_BULLET_POUCH },
        { xi.items.ADLIVUN_BULLET,                 xi.items.ADLIVUN_BULLET_POUCH },
        { xi.items.ACHIYALABOPA_BULLET,            xi.items.ACHIYALABOPA_BULLET_POUCH },
        { xi.items.BULLET,                         xi.items.BULLET_POUCH },
        { xi.items.BISMUTH_BULLET,                 xi.items.BISMUTH_BULLET_POUCH },
        { xi.items.BRONZE_BULLET,                  xi.items.BRONZE_BULLET_POUCH },
        { xi.items.DAMASCUS_BULLET,                xi.items.DAMASCUS_BULLET_POUCH },
        { xi.items.DARK_ADAMAN_BULLET,             xi.items.DARK_ADAMAN_BULLET_POUCH },
        { xi.items.DECIMATING_BULLET,              xi.items.DECIMATING_BULLET_POUCH },
        { xi.items.DIVINE_BULLET,                  xi.items.DIVINE_BULLET_POUCH },
        { xi.items.DWEOMER_BULLET,                 xi.items.DWEOMER_BULLET_POUCH },
        { xi.items.EMINENT_BULLET,                 xi.items.EMINENT_BULLET_POUCH },
        { xi.items.IRON_BULLET,                    xi.items.IRON_BULLET_POUCH },
        { xi.items.ORICHALCUM_BULLET,              xi.items.ORICHALCUM_BULLET_POUCH },
        { xi.items.OBERONS_BULLET,                 xi.items.OBERON_BULLET_POUCH },
        { xi.items.RAKAZNAR_BULLET,                xi.items.RAKAZNAR_BULLET_POUCH },
        { xi.items.SILVER_BULLET,                  xi.items.SILVER_BULLET_POUCH },
        { xi.items.STEEL_BULLET,                   xi.items.STEEL_BULLET_POUCH },
        { xi.items.SPARTAN_BULLET,                 xi.items.SPARTAN_BULLET_POUCH },
        { xi.items.TITANIUM_BULLET,                xi.items.TITANIUM_BULLET_POUCH },

        { xi.items.FIRE_CARD,                      xi.items.FIRE_CARD_CASE },
        { xi.items.ICE_CARD,                       xi.items.ICE_CARD_CASE },
        { xi.items.WIND_CARD,                      xi.items.WIND_CARD_CASE },
        { xi.items.EARTH_CARD,                     xi.items.EARTH_CARD_CASE },
        { xi.items.THUNDER_CARD,                   xi.items.THUNDER_CARD_CASE },
        { xi.items.WATER_CARD,                     xi.items.WATER_CARD_CASE },
        { xi.items.LIGHT_CARD,                     xi.items.LIGHT_CARD_CASE },
        { xi.items.DARK_CARD,                      xi.items.DARK_CARD_CASE },
    }

    local carnationsNeeded = 0
    local giveToPlayer = {}

    -- check for invalid items
    for i = 0, 8, 1 do
        local itemId = trade:getItemId(i)
        if itemId > 0 and itemId ~= 948 then
            local validSlot = false
            for k, v in pairs(ammoList) do
                if v[1] == itemId then
                    local itemQty = trade:getSlotQty(i)
                    if itemQty % 99 ~= 0 then
                        player:messageSpecial(ID.text.NOKKHI_BAD_COUNT)
                        return
                    end

                    local stacks = itemQty / 99
                    carnationsNeeded = carnationsNeeded + stacks
                    giveToPlayer[#giveToPlayer + 1] = { v[2], stacks }
                    validSlot = true
                    break
                end
            end

            if not validSlot then
                player:messageSpecial(ID.text.NOKKHI_BAD_ITEM)
                return
            end
        end
    end

    -- check for correct number of carnations
    if carnationsNeeded == 0 or trade:getItemQty(948) ~= carnationsNeeded then
        player:messageSpecial(ID.text.NOKKHI_BAD_COUNT)
        return
    end

    -- check for enough inventory space
    if player:getFreeSlotsCount() < carnationsNeeded then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1])
        return
    end

    -- make the trade
    player:messageSpecial(ID.text.NOKKHI_GOOD_TRADE)
    for k, v in pairs(giveToPlayer) do
        player:addItem(v[1], v[2])
        player:messageSpecial(ID.text.ITEM_OBTAINED, v[1])
    end

    player:tradeComplete()
end

entity.onTrigger = function(player, npc)
    player:startEvent(285, npc:getID())
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
