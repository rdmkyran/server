-----------------------------------
-- Uninvited Guests
-----------------------------------
-- Log ID: 4, Quest ID: 81
-- Justinius    : !pos 76 -34 68 26
-- Monarch Linn : !zone 31
-----------------------------------
require('scripts/globals/common')
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.UNINVITED_GUESTS)

local rewards =
{
    { droprate = 509, rewardId = xi.items.MIRATETES_MEMOIRS           },
    { droprate = 35,  rewardId = xi.items.PLATE_OF_BREAM_RISOTTO      },
    { droprate = 30,  rewardId = xi.items.SQUARE_OF_RAXA              },
    { droprate = 30,  rewardId = xi.items.SERVING_OF_CRIMSON_JELLY    },
    { droprate = 30,  rewardId = xi.items.TAVNAZIAN_SALAD             },
    { droprate = 29,  rewardId = xi.items.CHUNK_OF_ALUMINUM_ORE       },
    { droprate = 29,  rewardId = xi.items.SERVING_OF_BISON_STEAK      },
    { droprate = 29,  rewardId = xi.items.BOWL_OF_MUSHROOM_STEW       },
    { droprate = 27,  rewardId = xi.items.TIGER_EYE                   },
    { droprate = 24,  rewardId = xi.items.UNICORN_HORN                },
    { droprate = 24,  rewardId = xi.items.ARMOIRE                     },
    { droprate = 24,  rewardId = xi.items.MANNEQUIN_BODY              },
    { droprate = 21,  rewardId = xi.items.PLATE_OF_MUSHROOM_RISOTTO   },
    { droprate = 19,  rewardId = xi.items.MANNEQUIN_HANDS             },
    { droprate = 18,  rewardId = xi.items.OVERSIZED_FANG              },
    { droprate = 18,  rewardId = xi.items.DRAGON_BONE                 },
    { droprate = 16,  rewardId = xi.items.ELM_LOG                     },
    { droprate = 15,  rewardId = xi.items.MANNEQUIN_LEGS              },
    { droprate = 11,  rewardId = xi.items.MANNEQUIN_FEET              },
    { droprate = 11,  rewardId = xi.items.CHUNK_OF_ADAMAN_ORE         },
    { droprate = 11,  rewardId = xi.items.BEHEMOTH_HIDE               },
    { droprate = 10,  rewardId = xi.items.HABU_SKIN                   },
    { droprate = 7,   rewardId = xi.items.CLOUD_EVOKER                },
    { droprate = 7,   rewardId = xi.items.MANNEQUIN_HEAD              },
    { droprate = 6,   rewardId = xi.items.CHUNK_OF_ORICHALCUM_ORE     },
    { droprate = 4,   rewardId = xi.items.SERVING_OF_VERMILLION_JELLY },
    { droprate = 4,   rewardId = xi.items.LEREMIEU_SALAD              },
    { droprate = 3,   rewardId = xi.items.ADAMANTOISE_SHELL           },
    { droprate = 3,   rewardId = xi.items.PIECE_OF_ANGEL_SKIN         },
    { droprate = 3,   rewardId = xi.items.DRAGON_HEART                },
    { droprate = 3,   rewardId = xi.items.SERVING_OF_MARBLED_STEAK    },
    { droprate = 3,   rewardId = xi.items.PLATE_OF_SEA_SPRAY_RISOTTO  },
    { droprate = 3,   rewardId = xi.items.LOCK_OF_SIRENS_HAIR         },
    { droprate = 3,   rewardId = xi.items.BOTTLE_OF_YELLOW_LIQUID     },
    { droprate = 2,   rewardId = xi.items.PLATE_OF_WITCH_RISOTTO      },
    { droprate = 2,   rewardId = xi.items.PILE_OF_CHOCOBO_BEDDING     },
    { droprate = 2,   rewardId = xi.items.ASSAULT_BREASTPLATE         },
    { droprate = 2,   rewardId = xi.items.BOWL_OF_WITCH_STEW          },
}

local updateUninvitedGuests = function(player, clearVars)
    player:setCharVar("UninvitedGuestsReset", getConquestTally())
    if clearVars then
        player:setCharVar("UninvitedGuestsStatus", 0)
        player:setCharVar("UninvitedGuestsReward", 0)
    end
end

local generateUninvitedGuestsReward = function(player)
    -- Reward info taken from https://ffxiclopedia.fandom.com/wiki/Uninvited_Guests
    -- Moved any value with a 0 to 0.1
    -- Reduced Miratete's Memoirs from 57.7% to 50.9% to align total reward percentage to 100%
    local max = 0
    local rewardId = 0

    for _, entry in pairs(rewards) do
        max = max + entry.droprate
    end

    local roll = math.random(max)

    for _, entry in pairs(rewards) do
        max = max - entry.droprate

        if roll > max then
            rewardId = entry.rewardId
            break
        end
    end
    player:setCharVar("UninvitedGuestsReward", rewardId)
    return rewardId
end

quest.reward =
{
    title = xi.title.MONARCH_LINN_PATROL_GUARD,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
            player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_SAVAGE)
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Justinius'] = quest:progressEvent(570),

            onEventFinish =
            {
                [570] = function(player, csid, option, npc)
                    if option == 1 then
                        npcUtil.giveKeyItem(player, xi.ki.MONARCH_LINN_PATROL_PERMIT)
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Justinius'] =
            {
                onTrigger = function(player, npc)
                    local uninvitedGuests =  player:getCharVar("UninvitedGuestsStatus")

                    if uninvitedGuests == 0 then
                        if not player:hasKeyItem(xi.ki.MONARCH_LINN_PATROL_PERMIT) then
                            npcUtil.giveKeyItem(player, xi.ki.MONARCH_LINN_PATROL_PERMIT)
                        end
                        return quest:progressEvent(571)
                    -- Player won, give reward
                    elseif uninvitedGuests == 1 then
                        return quest:progressEvent(572)
                    -- Uninvited Guests Failure - mocks player until conquest tally
                    elseif uninvitedGuests == 2 or (uninvitedGuests == 3 and player:getCharVar("UninvitedGuestsReset")) >= os.time() then
                        return quest:progressEvent(575)
                    -- Reissues permit post failure
                    elseif uninvitedGuests == 3 and player:getCharVar("UninvitedGuestsReset") <= os.time() then
                        return quest:progressEvent(574)
                    end
                end,
            },

            onEventFinish =
            {
                [572] = function(player, csid, option, npc)
                    -- Determine Reward (or check if a reward is pending)
                    local rewardId = player:getCharVar("UninvitedGuestsReward") -- Done to prevent ppl holding the r/ex xp page and forcing a recalculation
                    if rewardId == 0 then
                        rewardId = generateUninvitedGuestsReward(player)
                    end

                    if rewardId == 1 and quest:complete(player) then -- special case for Gil
                        updateUninvitedGuests(player, true)
                        npcUtil.giveCurrency(player, "gil", 10000)
                    elseif quest:complete(player) then -- Reward item
                        updateUninvitedGuests(player, true)
                        npcUtil.giveItem(player, rewardId)
                    end
                end,

                [574] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.MONARCH_LINN_PATROL_PERMIT)
                    player:setCharVar("UninvitedGuestsStatus", 0)
                end,

                [575] = function(player, csid, option, npc)
                    -- Player has failed and must wait until conquest to retry
                    if player:getCharVar("UninvitedGuestsStatus") == 2 then
                        updateUninvitedGuests(player, false)
                        player:setCharVar("UninvitedGuestsStatus", 3)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Justinius'] =
            {
                onTrigger = function(player, npc)
                    local uninvitedGuests =  player:getCharVar("UninvitedGuestsStatus")

                    -- Restart quest after conquest tally
                    if player:getCharVar("UninvitedGuestsReset") <= os.time() and
                        not player:hasKeyItem(xi.ki.MONARCH_LINN_PATROL_PERMIT) then
                        return quest:progressEvent(573)
                    -- Player won, give reward
                    elseif uninvitedGuests == 1 then
                        return quest:progressEvent(572)
                    -- Uninvited Guests Failure - mocks player until conquest tally
                    elseif uninvitedGuests == 2 or (uninvitedGuests == 3 and
                        player:getCharVar("UninvitedGuestsReset")) >= os.time() then
                        return quest:progressEvent(575)
                    -- Reissues permit post failure
                    elseif uninvitedGuests == 3 and
                        player:getCharVar("UninvitedGuestsReset") <= os.time() then
                        return quest:progressEvent(574)
                    end
                end,
            },
            onEventFinish =
            {
                [572] = function(player, csid, option, npc)
                    -- Determine Reward (or check if a reward is pending)
                    local rewardId = player:getCharVar("UninvitedGuestsReward") -- Done to prevent ppl holding the r/ex xp page and forcing a recalculation
                    if rewardId == 0 then
                        rewardId = generateUninvitedGuestsReward(player)
                    end

                    if rewardId == 1 then -- special case for Gil
                        updateUninvitedGuests(player, true)
                        npcUtil.giveCurrency(player, "gil", 10000)
                    else -- Reward item
                        updateUninvitedGuests(player, true)
                        npcUtil.giveItem(player, rewardId)
                    end
                end,

                [573] = function(player, csid, option, npc)
                    if option == 1 then
                        npcUtil.giveKeyItem(player, xi.ki.MONARCH_LINN_PATROL_PERMIT)
                        player:setCharVar("UninvitedGuestsStatus", 0) -- accepted
                    end
                end,

                [574] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.MONARCH_LINN_PATROL_PERMIT)
                    player:setCharVar("UninvitedGuestsStatus", 0)
                end,

                [575] = function(player, csid, option, npc)
                    -- Player has failed and must wait until conquest to retry
                    if player:getCharVar("UninvitedGuestsStatus") == 2 then
                        updateUninvitedGuests(player, false)
                        player:setCharVar("UninvitedGuestsStatus", 3)
                    end
                end,
            },
        },
    },
}

return quest
