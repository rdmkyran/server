-----------------------------------
-- Beastmen Treasure side quests
-- https://ffxiclopedia.fandom.com/wiki/Beastmen_Treasure
-----------------------------------
require('scripts/globals/keyitems')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/zone')
require("scripts/globals/items")
-----------------------------------
xi = xi or {}
xi.beastmentreasure = xi.beastmentreasure or {}

local zoneData =
{
    [xi.zone.YUHTUNGA_JUNGLE] =
    {
        statusvar = 'BMT_Lowlands_Status',
        dsvar = 'BMT_Lowlands_Digsite',
        mapid = xi.ki.MAP_OF_THE_ELSHIMO_REGIONS,
        day = xi.day.WINDSDAY,
        fetchitems =
        {
            xi.items.MERMAID_HEAD,
            xi.items.MERMAID_BODY,
            xi.items.MERMAID_HANDS,
            xi.items.MERMAID_TAIL
        },
        loot =
        {
            unique = { [xi.items.MERMAIDS_RING] = 5 },
            racial = { [xi.items.CORAL_FRAGMENT] = 3 }
        }
    },
    [xi.zone.YHOATOR_JUNGLE] =
    {
        statusvar = 'BMT_Uplands_Status',
        dsvar = 'BMT_Uplands_Digsite',
        mapid = xi.ki.MAP_OF_THE_ELSHIMO_REGIONS,
        day = xi.day.LIGHTNINGDAY,
        fetchitems =
        {
            xi.items.RANCOR_MANTLE,
            xi.items.RANCOR_GLOBE,
            xi.items.RANCOR_TANK,
            xi.items.RANCOR_HANDLE
        },
        loot =
        {
            unique = { [xi.items.BITTER_EARRING] = 5 },
            racial = { [xi.items.FLASK_OF_VENOM_POTION] = 3 }
        }
    },
    [xi.zone.WESTERN_ALTEPA_DESERT] =
    {
        statusvar = 'BMT_Kuzotz_Status',
        dsvar = 'BMT_Kuzotz_Digsite',
        mapid = xi.ki.MAP_OF_THE_KUZOTZ_REGION,
        day = xi.day.EARTHSDAY,
        fetchitems =
        {
            xi.items.BAG_OF_XHIFHUT_STRINGS,
            xi.items.XHIFHUT_BODY,
            xi.items.XHIFHUT_BOW,
            xi.items.XHIFHUT_HEAD
        },
        loot =
        {
            unique = { [xi.items.SAND_MANTLE] = 5 },
            racial = { [xi.items.CHUNK_OF_DARKSTEEL_ORE] = 3 }
        }
    }
}

local sharedLoot =
{
    -- All items are assigned a "weight" here
    rocksgems =
    {
        [xi.items.RED_ROCK] = 1,
        [xi.items.BLUE_ROCK] = 1,
        [xi.items.YELLOW_ROCK] = 1,
        [xi.items.GREEN_ROCK] = 1,
        [xi.items.TRANSLUCENT_ROCK] = 1,
        [xi.items.PURPLE_ROCK] = 1,
        [xi.items.BLACK_ROCK] = 1,
        [xi.items.WHITE_ROCK] = 1,
        -- Tier 1 gems
        [xi.items.LAPIS_LAZULI] = 2,
        [xi.items.LIGHT_OPAL] = 2,
        [xi.items.ONYX] = 2,
        [xi.items.AMETHYST] = 2,
        [xi.items.TOURMALINE] = 2,
        [xi.items.SARDONYX] = 2,
        [xi.items.CLEAR_TOPAZ] = 2,
        [xi.items.AMBER_STONE] = 2,
    },
    seeds =
    {
        [xi.items.BAG_OF_HERB_SEEDS] = 1,
        [xi.items.BAG_OF_VEGETABLE_SEEDS] = 1,
        [xi.items.BAG_OF_FRUIT_SEEDS] = 1,
        [xi.items.BAG_OF_GRAIN_SEEDS] = 1,
    },
    coins =
    {
        [xi.items.GOLD_BEASTCOIN] = 1,
        [xi.items.MYTHRIL_BEASTCOIN] = 1,
        [xi.items.SILVER_BEASTCOIN] = 1,
    },
    seals =
    {
        [xi.items.BEASTMENS_SEAL] = 2
    }
}

local function convertToWeighted(loot)
    -- Takes a loot table formatted like the members of `sharedloot` and returns a weighted version that can be indexed
    local weightedLoot = {}

    for item, weight in pairs(loot) do
        for i = 1, weight do
            table.insert(weightedLoot, item)
        end
    end

    return weightedLoot
end

local function addLoot(t1, t2)
    -- Used for non-destructively combining a table containing a single weighted item (`t2`)
    -- and an existing loot table containing one or more weighted items (`t1`).
    local newTable = {}
    local newItem = table.maxn(t2)

    -- Copy the contents of the first table so that we don't modify the global version
    for item, weight in pairs(t1) do
        newTable[item] = weight
    end

    -- Add in our new item
    newTable[newItem] = t2[newItem]

    return newTable
end

-- Generate weighted loot tables now (on server init) so it doesn't have to be done at runtime
local w_rocksgems   = convertToWeighted(sharedLoot.rocksgems)
local w_seedsracial =
{
    [xi.zone.YUHTUNGA_JUNGLE] = convertToWeighted(addLoot(sharedLoot.seeds, zoneData[xi.zone.YUHTUNGA_JUNGLE].loot.racial)),
    [xi.zone.YHOATOR_JUNGLE] = convertToWeighted(addLoot(sharedLoot.seeds, zoneData[xi.zone.YHOATOR_JUNGLE].loot.racial)),
    [xi.zone.WESTERN_ALTEPA_DESERT] = convertToWeighted(addLoot(sharedLoot.seeds, zoneData[xi.zone.WESTERN_ALTEPA_DESERT].loot.racial))
}
local w_coins       = convertToWeighted(sharedLoot.coins)
local w_sealsunique =
{
    [xi.zone.YUHTUNGA_JUNGLE] = convertToWeighted(addLoot(sharedLoot.seals, zoneData[xi.zone.YUHTUNGA_JUNGLE].loot.unique)),
    [xi.zone.YHOATOR_JUNGLE] = convertToWeighted(addLoot(sharedLoot.seals, zoneData[xi.zone.YHOATOR_JUNGLE].loot.unique)),
    [xi.zone.WESTERN_ALTEPA_DESERT] = convertToWeighted(addLoot(sharedLoot.seals, zoneData[xi.zone.WESTERN_ALTEPA_DESERT].loot.unique)),
}

local function weightedRandomSelect(w_loot)
    -- Takes a weighted loot table and returns a single random result
    return w_loot[math.random(#w_loot)]
end

local function getAssignedDigSite(player)
    -- Returns the player's assigned digsite for the zone they're currently in
    return player:getCharVar(zoneData[player:getZoneID()].dsvar)
end

local function startMapMarkerEvent(eventid, player, digsiteids)
    --[[ Map marker event notes:
        Event 101 creates the "Treasure" map marker using coordinate args
        Event 103 shows the "Treasure" map marker using coordinate args
        Event 105, played on excavation, deletes the "Treasure" map marker

        Parameters for events 101/103 are as follows:
            1: zone id
            2: unknown, seems static
            3: (x position of qm) * 1000
            4: (z position of qm) * 1000
            5: unknown, dynamic
            6: unknown, dynamic
            7: unknown, seems static
            8: unknown, seems static (possibly y position of qm + 95)

        Example: `player:startEvent(101, 123, 0, 369795, 201805, 0, 0, 0, 4095)`
            ...plays event 101 in Yuhtunga Jungle (zone 123), which creates a map marker
            corresponding to the QM at position (369.795, 4.0, 201.805)
            Full args from a retail capture for this point were:
                101, 123, 32, 369795, 201805, 425920, 760, 529191, 4095
                103, 123, 32, 369795, 201805, 308060, 1694, 529191, 4095 ]]--
    local pos = GetNPCByID(digsiteids[getAssignedDigSite(player)]):getPos()

    player:startEvent(eventid, player:getZoneID(), 0, pos.x * 1000, pos.z * 1000)
end

xi.beastmentreasure.handleNpcOnTrigger = function(player, digsiteids)
    local zd = zoneData[player:getZoneID()]
    local status = player:getCharVar(zd.statusvar)

    if not player:hasKeyItem(zd.mapid) then
        player:startEvent(102) -- Peddlestox lectures you for not having a map
    elseif status == QUEST_AVAILABLE then
        player:startEvent(100) -- Peddlestox says go fetch
    elseif status == QUEST_ACCEPTED then
        player:startEvent(104) -- "What do I look like, a charity?"
    elseif status == QUEST_COMPLETED then
        -- Note: Quest will be "completed" after trading the correct items,
        -- but will be set to available again after excavating the reward.
        startMapMarkerEvent(103, player, digsiteids) -- Peddlestox reminds you where your digsite is
    end
end

xi.beastmentreasure.handleNpcOnTrade = function(player, trade, digsiteids)
    local zd = zoneData[player:getZoneID()]

    if
        player:getCharVar(zd.statusvar) == QUEST_ACCEPTED and
        npcUtil.tradeHasExactly(trade, zd.fetchitems)
    then
        -- Assign a random dig site to the player
        player:setCharVar(zd.dsvar, math.random(1, 8))

        startMapMarkerEvent(101, player, digsiteids) -- Peddlestox shows you where to dig
    end
end

xi.beastmentreasure.handleNpcOnEventFinish = function(player, csid)
    local zd = zoneData[player:getZoneID()]

    if csid == 100 then
        player:incrementCharVar(zd.statusvar, QUEST_ACCEPTED)
    elseif csid == 101 then
        player:confirmTrade()
        player:setCharVar(zd.statusvar, QUEST_COMPLETED)
    end
end

xi.beastmentreasure.updatePeddlestox = function(zone, peddlestoxID)
    --[[ Allows Peddlestox to appear on the appropriate day and disappear when the day is over.
    This function is called by each of the three zones where Peddlestox can appear: once on init,
    and once at the start of each new game day. Since Peddlestox is disabled in the db by default, we
    only need to enable her on the appropriate day and disable her on the following day. ]]--
    local peddlestox = GetNPCByID(peddlestoxID)

    if zoneData[zone].day == VanadielDayOfTheWeek() then
        peddlestox:setStatus(xi.status.NORMAL)
    elseif peddlestox:getStatus() == xi.status.NORMAL then
        --[[
            Peddlestox should play a teleport animation and then fade out. On retail this is an 0x03A
            packet with animation id 122. Retail capture of
            the correct animation packet is as follows:
             |  0  1  2  3   4  5  6  7   8  9  A  B   C  D  E  F    | 0123456789ABCDEF
        -----+----------------------------------------------------  -+------------------
           0 | 3A 0A B5 00  67 B2 07 01  67 B2 07 01  67 02 67 02    | :...g...g...g.g.
          10 | 7A 00 00 BF                                           | z...
        ]]--
        peddlestox:independentAnimation(peddlestox, 122, 0)
        peddlestox:timer(5000, function(npc)
            peddlestox:setStatus(xi.status.DISAPPEAR)
        end)
    end
end

xi.beastmentreasure.handleQmOnTrigger = function(player, npc, buriedtext, nothingtext, digsiteids)
    local digsiteid = digsiteids[getAssignedDigSite(player)]
    local qmid = npc:getID()

    if digsiteid == nil or digsiteid ~= qmid then
        player:messageSpecial(nothingtext)
    elseif digsiteid == qmid then
        -- "It looks like something is buried here. If you had a <pickaxe> you could dig it up."
        player:messageSpecial(buriedtext, 605)
    end
end

xi.beastmentreasure.handleQmOnTrade = function(player, npc, trade, digsiteids)
    local zoneid = player:getZoneID()
    local digsite = getAssignedDigSite(player)

    if
        npcUtil.tradeHasExactly(trade, 605) and
        player:getCharVar(zoneData[zoneid].statusvar) == QUEST_COMPLETED and
        npc:getID() == digsiteids[digsite]
    then
        --[[ Event 105 needs args to spawn and animate a treasure chest
             Example args from retail capture: 105 123 450762 1745 201805 7 723 490292 4095
             An arg in the 5th parameter will spawn and animate a chest somewhere in the zone
             based on some internal list in the game files. For example, an arg of 7, as
             in the retail capture above, will spawn and animate a chest at Yuhtunga Jungle
             qm10. Chests will spawn at a static location regardless of whether or not
             coordinates are passed in, and will always be rotated to face the player.
        ]]--
        player:startEvent(105, zoneid, 0, 0, 0, digsite - 1)
    end
end

xi.beastmentreasure.handleQmOnEventFinish = function(player, csid)
    local zoneid = player:getZoneID()

    if csid == 105 then
        -- Successfully excavating a dig site rewards 4000 gil plus the following items:
        -- First reward is 1 item from the rocks and gems pool
        local item1 = weightedRandomSelect(w_rocksgems)
        -- Second reward is 1 item from a pool containing seeds and the zone's "racial" junk
        local item2 = weightedRandomSelect(w_seedsracial[zoneid])
        -- Third reward is a silver, gold, or mythril beastcoin
        local item3 = weightedRandomSelect(w_coins)
        -- Final reward is a seal or the region's exclusive item
        local item4 = weightedRandomSelect(w_sealsunique[zoneid])
        -- Distribute rewards
        player:confirmTrade()
        player:addGil(4000)
        player:addTreasure(item1, nil)
        player:addTreasure(item2, nil)
        player:addTreasure(item3, nil)
        player:addTreasure(item4, nil)
        -- Reset player vars
        player:setCharVar(zoneData[zoneid].statusvar, QUEST_AVAILABLE)
        player:setCharVar(zoneData[zoneid].dsvar, 0)
    end
end

xi.bmt = xi.beastmentreasure
