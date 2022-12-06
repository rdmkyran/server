-----------------------------------
-- Area: Mog Garden
--  NPC: Green Thumb Moogle
-----------------------------------
local ID = require("scripts/zones/Mog_Garden/IDs")
require('scripts/globals/items')
require("scripts/globals/moghouse")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.moghouse.moogleTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(1016)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 1016 and option == 0xFFF00FF then -- Show the Mog House menu
        -- Print the expire time for mog locker if exists
        local lockerLease = xi.moghouse.getMogLockerExpiryTimestamp(player)
        if lockerLease ~= nil then
            if lockerLease == -1 then -- Lease expired..
                player:messageSpecial(ID.text.MOGLOCKER_MESSAGE_OFFSET + 2, xi.items.IMPERIAL_BRONZE_PIECE)
            else
                player:messageSpecial(ID.text.MOGLOCKER_MESSAGE_OFFSET + 1, lockerLease)
            end
        end

        -- Show the mog house menu
        player:sendMenu(1)

    elseif csid == 1016 and option == 0xFFE00FF then -- Buy/Sell Things
        local stock =
        {
            xi.items.BAG_OF_VEGETABLE_SEEDS,    280,
            xi.items.BAG_OF_FRUIT_SEEDS,        320,
            xi.items.BAG_OF_GRAIN_SEEDS,        280,
            xi.items.BAG_OF_HERB_SEEDS,         280,
            xi.items.BAG_OF_CACTUS_STEMS,       1685,
            xi.items.BAG_OF_WILDGRASS_SEEDS,    320,

            xi.items.PITCHER_OF_CHESTNUT_TREE_SAP, 1111,
            xi.items.JAR_OF_MONARCH_BEETLE_SALIVA, 1111,
            xi.items.GOLDEN_SEED_POUCH,         1111,
        }
        xi.shop.general(player, stock)

    elseif csid == 1016 and option == 0xFFB00FF then -- Leave this Mog Garden -> Whence I Came
        player:warp() -- Workaround for now, the last zone seems to get messed up due to mog house issues.

    end
end

return entity
