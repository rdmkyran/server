-----------------------------------
-- Area: Windurst Woods
--  NPC: Ominous Cloud
-- Type: Ninjutsu Toolbag Maker
-- !pos -20.632 -3.939 -40.554 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local toolList =
    {
        { xi.items.UCHITAKE,                  xi.items.TOOLBAG_UCHITAKE           },
        { xi.items.TSURARA,                   xi.items.TOOLBAG_TSURARA            },
        { xi.items.KAWAHORI_OGI,              xi.items.TOOLBAG_KAWAHORI_OGI       },
        { xi.items.MAKIBISHI,                 xi.items.TOOLBAG_MAKIBISHI          },
        { xi.items.HIRAISHIN,                 xi.items.TOOLBAG_HIRAISHIN          },
        { xi.items.MIZU_DEPPO,                xi.items.TOOLBAG_MIZU_DEPPO         },
        { xi.items.SHIHEI,                    xi.items.TOOLBAG_SHIHEI             },
        { xi.items.JUSATSU,                   xi.items.TOOLBAG_JUSATSU            },
        { xi.items.KAGINAWA,                  xi.items.TOOLBAG_KAGINAWA           },
        { xi.items.SAIRUI_RAN,                xi.items.TOOLBAG_SAIRUI_RAN         },
        { xi.items.KODOKU,                    xi.items.TOOLBAG_KODOKU             },
        { xi.items.SHINOBI_TABI,              xi.items.TOOLBAG_SHINOBI_TABI       },
        { xi.items.SANJAKU_TENUGUI,           xi.items.TOOLBAG_SANJAKU_TENUGUI    },
        { xi.items.SOSHI,                     xi.items.TOOLBAG_SOSHI              },
        { xi.items.KABENRO,                   xi.items.TOOLBAG_KABENRO            },
        { xi.items.JINKO,                     xi.items.TOOLBAG_JINKO              },
        { xi.items.MOKUJIN,                   xi.items.TOOLBAG_MOKUJIN            },
        { xi.items.INOSHISHINOFUDA,           xi.items.TOOLBAG_INOSHISHINOFUDA    },
        { xi.items.SHIKANOFUDA,               xi.items.TOOLBAG_SHIKANOFUDA        },
        { xi.items.CHONOFUDA,                 xi.items.TOOLBAG_CHONOFUDA          },

        { xi.items.SHURIKEN,                  xi.items.SHURIKEN_POUCH             },
        { xi.items.JUJI_SHURIKEN,             xi.items.JUJI_SHURIKEN_POUCH        },
        { xi.items.MANJI_SHURIKEN,            xi.items.MANJI_SHURIKEN_POUCH       },
        { xi.items.FUMA_SHURIKEN,             xi.items.FUMA_SHURIKEN_POUCH        },
        { xi.items.KOGA_SHURIKEN,             xi.items.KOGA_SHURIKEN_POUCH        },
        { xi.items.IGA_SHURIKEN,              xi.items.IGA_SHURIKEN_POUCH         },
        { xi.items.ROPPO_SHURIKEN,            xi.items.ROPPO_SHURIKEN_POUCH       },
        { xi.items.ROPPO_SHURIKEN_P1,         xi.items.ROPPO_SHURIKEN_P1_POUCH    },
        { xi.items.HAPPO_SHURIKEN,            xi.items.HAPPO_SHURIKEN_POUCH       },
        { xi.items.HAPPO_SHURIKEN_P1,         xi.items.HAPPO_SHURIKEN_P1_POUCH    },
        { xi.items.HACHIYA_SHURIKEN,          xi.items.HACHIYA_SHURIKEN_POUCH     },
        { xi.items.SUPPA_SHURIKEN,            xi.items.SUPPA_SHURIKEN_POUCH       },
        { xi.items.TOGAKUSHI_SHURIKEN,        xi.items.TOGAKUSHI_SHURIKEN_POUCH   },
        { xi.items.SASUKE_SHURIKEN,           xi.items.SASUKE_SHURIKEN_POUCH      },
        { xi.items.SASUKE_SHURIKEN_P1,        xi.items.SASUKE_SHURIKEN_POUCH_P1   },
    }

    local fruitNeeded = 0
    local giveToPlayer = {}

    -- check for invalid items
    for i = 0, 8, 1 do
        local itemId = trade:getItemId(i)
        if itemId > 0 and itemId ~= 951 then
            local validSlot = false
            for k, v in pairs(toolList) do
                if v[1] == itemId then
                    local itemQty = trade:getSlotQty(i)
                    if itemQty % 99 ~= 0 then
                        player:messageSpecial(ID.text.CLOUD_BAD_COUNT, 951)
                        return
                    end

                    local stacks = itemQty / 99
                    fruitNeeded = fruitNeeded + stacks
                    giveToPlayer[#giveToPlayer + 1] = { v[2], stacks }
                    validSlot = true
                    break
                end
            end

            if not validSlot then
                player:messageSpecial(ID.text.CLOUD_BAD_ITEM)
                return
            end
        end
    end

    -- check for correct number of wijnfruit
    if fruitNeeded == 0 or trade:getItemQty(951) ~= fruitNeeded then
        player:messageSpecial(ID.text.CLOUD_BAD_COUNT, 951)
        return
    end

    -- check for enough inventory space
    if player:getFreeSlotsCount() < fruitNeeded then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1])
        return
    end

    -- make the trade
    player:messageSpecial(ID.text.CLOUD_GOOD_TRADE)
    for k, v in pairs(giveToPlayer) do
        player:addItem(v[1], v[2])
        player:messageSpecial(ID.text.ITEM_OBTAINED, v[1])
    end

    player:tradeComplete()
end

entity.onTrigger = function(player, npc)
    player:startEvent(698, npc:getID())
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
