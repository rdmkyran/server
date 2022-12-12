-----------------------------------
-- Area: Temenos
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/limbus")
require("scripts/globals/zone")
local ID = require("scripts/zones/Temenos/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local loot =
{
    -- central temenos basement
    [1301] =
    {
        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },
    },

    -- central temenos floor 2
    [1304] =
    {
        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.DARK_ORICHALCUM_INGOT, droprate = 250 },
            { itemid = xi.items.SQUARE_OF_DIABOLIC_SILK, droprate =  94 },
            { itemid = xi.items.SPOOL_OF_CHAMELEON_YARN, droprate =  63 },
            { itemid = xi.items.CHUNK_OF_SNOWY_CERMET, droprate = 125 },
            { itemid = xi.items.SQUARE_OF_SMALT_LEATHER, droprate =  63 },
            { itemid = xi.items.PANTIN_WIRE, droprate = 281 },
            { itemid = xi.items.SQUARE_OF_FILET_LACE, droprate = 125 },
        },

        {
            { itemid = xi.items.CERULEAN_CHIP, droprate = 1000 },
        },
    },

    -- central temenos floor 3
    [1305] =
    {
        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
        },

        {
            { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate =  53 },
            { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate = 132 },
            { itemid = xi.items.PLAITED_CORD, droprate = 105 },
            { itemid = xi.items.UTOPIAN_GOLD_THREAD, droprate = 211 },
            { itemid = xi.items.SHEET_OF_COBALT_MYTHRIL, droprate = 211 },
            { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH, droprate = 100 },
            { itemid = xi.items.SPOOL_OF_SILKWORM_THREAD, droprate = 211 },
            { itemid = xi.items.SQUARE_OF_BRILLIANTINE, droprate = 105 },
        },

        {
            { itemid = xi.items.SILVER_CHIP, droprate = 1000 },
        },
    },

    -- central temenos floor 4
    [1306] =
    {
        [1] =
        {
            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.PIECE_OF_ULTIMAS_CEREBRUM, droprate = 659 },
                { itemid = xi.items.SEGMENT_OF_ULTIMAS_TAIL, droprate = 394 },
                { itemid = xi.items.SEGMENT_OF_ULTIMAS_LEG, droprate = 388 },
                { itemid = xi.items.SEGMENT_OF_ULTIMAS_CLAW, droprate = 404 },
            },

            {
                { itemid = xi.items.SEGMENT_OF_ULTIMAS_TAIL, droprate = 394 },
                { itemid = xi.items.SEGMENT_OF_ULTIMAS_CLAW, droprate = 402 },
                { itemid = xi.items.PIECE_OF_ULTIMAS_CEREBRUM, droprate = 659 },
                { itemid = xi.items.SEGMENT_OF_ULTIMAS_LEG, droprate = 383 },
            },

            {
                { itemid = xi.items.PIECE_OF_ULTIMAS_HEART, droprate = 265 },
                { itemid = xi.items.NONE, droprate = 735 },
            },
        },

        -- central temenos floor 4 side loot
        [2] =
        {
            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.ANCIENT_BEASTCOIN, droprate = 1000 },
            },

            {
                { itemid = xi.items.SQUARE_OF_BENEDICT_SILK, droprate = 200 },
                { itemid = xi.items.SQUARE_OF_ECARLATE_CLOTH, droprate = 200 },
                { itemid = xi.items.SPOOL_OF_GLITTERING_YARN, droprate = 200 },
                { itemid = xi.items.SPOOL_OF_SILKWORM_THREAD, droprate = 400 },
                { itemid = xi.items.SQUARE_OF_SUPPLE_SKIN, droprate = 200 },
            },
        },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local battlefield = player:getBattlefield()
    if not battlefield then
        return
    end

    local crateID = npc:getID()
    local xPos = npc:getXPos()
    local yPos = npc:getYPos()
    local zPos = npc:getZPos()
    local bfid = battlefield:getID()
    local hold = false
    if npc:getLocalVar("open") == 0 then
        switch (bfid): caseof
        {
            [1301] = function() -- Temenos Central Basement Crate Handling
                xi.limbus.handleLootRolls(battlefield, loot[bfid], nil, npc)
                battlefield:setLocalVar("cutsceneTimer", 10)
                battlefield:setLocalVar("lootSeen", 1)
            end,

            [1304] = function() -- Temenos Central F2 Crate Handling
                xi.limbus.handleLootRolls(battlefield, loot[bfid], nil, npc)
                battlefield:setLocalVar("cutsceneTimer", 10)
                battlefield:setLocalVar("lootSeen", 1)
            end,

            [1305] = function() -- Temenos Central F3 Crate Handling
                xi.limbus.handleLootRolls(battlefield, loot[bfid], nil, npc)
                battlefield:setLocalVar("cutsceneTimer", 10)
                battlefield:setLocalVar("lootSeen", 1)
            end,

            [1306] = function() -- Temenos Central F4 Crate Handling
                if crateID ~= ID.npc.TEMENOS_C_CRATE[4][1] then
                    local randmimic = math.random(1, 24)
                    if randmimic < 17 then
                        local mimicList =
                        {
                            ID.mob.TEMENOS_C_MOB[4] + 20, ID.mob.TEMENOS_C_MOB[4] + 21,
                            ID.mob.TEMENOS_C_MOB[4] + 22, ID.mob.TEMENOS_C_MOB[4] + 25,
                            ID.mob.TEMENOS_C_MOB[4] + 26, ID.mob.TEMENOS_C_MOB[4] + 27,
                            ID.mob.TEMENOS_C_MOB[4] + 28, ID.mob.TEMENOS_C_MOB[4] + 29,
                            ID.mob.TEMENOS_C_MOB[4] + 30, ID.mob.TEMENOS_C_MOB[4] + 31,
                            ID.mob.TEMENOS_C_MOB[4] + 32, ID.mob.TEMENOS_C_MOB[4] + 33,
                            ID.mob.TEMENOS_C_MOB[4] + 34, ID.mob.TEMENOS_C_MOB[4] + 35,
                            ID.mob.TEMENOS_C_MOB[4] + 36, ID.mob.TEMENOS_C_MOB[4] + 37,
                        }
                        GetMobByID(mimicList[randmimic]):setSpawn(xPos, yPos, zPos)
                        SpawnMob(mimicList[randmimic]):setPos(xPos, yPos, zPos)
                        GetMobByID(mimicList[randmimic]):updateClaim(player)
                    else
                        xi.limbus.handleLootRolls(battlefield, loot[bfid][2], nil, npc)
                    end

                    for i = ID.npc.TEMENOS_C_CRATE[4][1] + 2, ID.npc.TEMENOS_C_CRATE[4][1] + 20 do
                        if ID.npc.TEMENOS_C_CRATE[4][crateID] == ID.npc.TEMENOS_C_CRATE[4][i] then
                            if crateID ~= i then
                                GetNPCByID(i):setStatus(xi.status.DISAPPEAR)
                            end
                        end
                    end
                else
                    xi.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
        }
        if not hold then
            npc:entityAnimationPacket("open")
            npc:setLocalVar("open", 1)
            npc:timer(15000, function(npcArg)
                npcArg:entityAnimationPacket("kesu")
            end)

            npc:timer(16000, function(npcArg)
                npcArg:setStatus(xi.status.DISAPPEAR)
                npcArg:timer(500, function(mob)
                    mob:setLocalVar("open", 0)
                end)
            end)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
