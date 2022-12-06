-----------------------------------
-- Area: Port San d'Oria
--  NPC: Regine
-- Standard Merchant NPC
-- !pos 68 -9 -74 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/utils")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local flyersForRegine = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.FLYERS_FOR_REGINE)
    local theBrugaireConsortium = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THE_BRUGAIRE_CONSORTIUM)

    -- FLYERS FOR REGINE
    if
        flyersForRegine == QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, { { "gil", 10 } })
    then
        if npcUtil.giveItem(player, xi.items.MAGICMART_FLYER) then
            player:confirmTrade()
        end

    -- THE BRUGAIRE CONSORTIUM
    elseif
        theBrugaireConsortium == QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, xi.items.PARCEL_FOR_THE_MAGIC_SHOP)
    then
        player:startEvent(535)
    end
end

entity.onTrigger = function(player, npc)
    local ffr = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.FLYERS_FOR_REGINE)

    -- FLYERS FOR REGINE
    if ffr == QUEST_AVAILABLE then -- ready to accept quest
        player:startEvent(510, 2)
    elseif
        ffr == QUEST_ACCEPTED and
        utils.mask.isFull(player:getCharVar('[ffr]deliveryMask'), 15)
    then
        -- all 15 flyers delivered
        player:startEvent(603)
    elseif ffr == QUEST_ACCEPTED and not player:hasItem(xi.items.MAGICMART_FLYER) then -- on quest but out of flyers
        player:startEvent(510, 3)

    -- DEFAULT MENU
    else
        player:startEvent(510)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- FLYERS FOR REGINE
    if csid == 510 and option == 2 then
        player:addItem(xi.items.MAGICMART_FLYER, 15)
        player:messageSpecial(ID.text.ITEM_OBTAINED + 9, xi.items.MAGICMART_FLYER, 15)
        player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.FLYERS_FOR_REGINE)
    elseif csid == 603 then
        npcUtil.completeQuest(
            player, xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.FLYERS_FOR_REGINE,
            {
                gil = 440,
                title = xi.title.ADVERTISING_EXECUTIVE,
                var = '[ffr]deliveryMask',
            }
        )

    -- THE BRUGAIRE CONSORTIUM
    elseif csid == 535 then
        player:confirmTrade()
        player:setCharVar("TheBrugaireConsortium-Parcels", 11)

    -- WHITE MAGIC SHOP
    elseif csid == 510 and option == 0 then
        local stockA =
        {
            xi.items.SCROLL_OF_DIAGA,           1165, 1,
            xi.items.SCROLL_OF_SLOW,            837, 1,
            xi.items.SCROLL_OF_STONESKIN,       7025, 1,

            xi.items.SCROLL_OF_BANISH,          140, 2,
            xi.items.SCROLL_OF_BANISHGA,        1165, 2,
            xi.items.SCROLL_OF_BLINK,           2097, 2,
            xi.items.SCROLL_OF_CURE_II,         585, 2,

            xi.items.SCROLL_OF_AQUAVEIL,        360, 3,
            xi.items.SCROLL_OF_BLINDNA,         990, 3,
            xi.items.SCROLL_OF_CURAGA,          1363, 3,
            xi.items.SCROLL_OF_CURE,            61, 3,
            xi.items.SCROLL_OF_DIA,             82, 3,
            xi.items.SCROLL_OF_PARALYNA,        324, 3,
            xi.items.SCROLL_OF_POISONA,         180, 3,
            xi.items.SCROLL_OF_PROTECT,         219, 3,
            xi.items.SCROLL_OF_SHELL,           1584, 3
        }
        xi.shop.nation(player, stockA, xi.nation.SANDORIA)

    -- BLACK MAGIC SHOP
    elseif csid == 510 and option == 1 then
        local stockB =
        {
            xi.items.SCROLL_OF_BLIND,           111, 1,
            xi.items.SCROLL_OF_BIO,             360, 2,
            xi.items.SCROLL_OF_POISON,          82, 2,
            xi.items.SCROLL_OF_SLEEP,           2250, 2,

            xi.items.SCROLL_OF_AERO,            324, 3,
            xi.items.SCROLL_OF_BLIZZARD,        1584, 3,
            xi.items.SCROLL_OF_BURN,            4644, 3,
            xi.items.SCROLL_OF_CHOKE,           2250, 3,
            xi.items.SCROLL_OF_DROWN,           6366, 3,
            xi.items.SCROLL_OF_FIRE,            837, 3,
            xi.items.SCROLL_OF_FROST,           3688, 3,
            xi.items.SCROLL_OF_RASP,            1827, 3,
            xi.items.SCROLL_OF_SHOCK,           1363, 3,
            xi.items.SCROLL_OF_STONE,           61, 3,
            xi.items.SCROLL_OF_THUNDER,         3261, 3,
            xi.items.SCROLL_OF_WATER,           140, 3
        }
        xi.shop.nation(player, stockB, xi.nation.SANDORIA)
    end
end

return entity
