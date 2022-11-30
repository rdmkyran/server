-----------------------------------
-- Area:  Nyzul_Isle
-- NPC:   Vending Box
-- Notes: Pick Temp items for assault
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/items")
-----------------------------------
local entity = {}

local items =
{
    [8450]  = { item = xi.items.BOTTLE_OF_BARBARIANS_DRINK, cost = 100, slot = 0x02      },
    [8451]  = { item = xi.items.BOTTLE_OF_FIGHTERS_DRINK, cost = 100, slot = 0x04      },
    [8452]  = { item = xi.items.BOTTLE_OF_ORACLES_DRINK, cost = 100, slot = 0x08      },
    [8453]  = { item = xi.items.BOTTLE_OF_ASSASSINS_DRINK, cost = 100, slot = 0x10      },
    [8454]  = { item = xi.items.BOTTLE_OF_SPYS_DRINK, cost = 100, slot = 0x20      },
    [8455]  = { item = xi.items.BOTTLE_OF_GNOSTICS_DRINK, cost = 100, slot = 0x400     },
    [8456]  = { item = xi.items.BOTTLE_OF_SHEPHERDS_DRINK, cost = 100, slot = 0x1000    },
    [8457]  = { item = xi.items.DUSTY_SCROLL_OF_RERAISE, cost = 100, slot = 0x40000   },
    [8458]  = { item = xi.items.FLASK_OF_STRANGE_MILK, cost = 100, slot = 0x80000   },
    [8459]  = { item = xi.items.BOTTLE_OF_STRANGE_JUICE, cost = 100, slot = 0x100000  },
    [8460]  = { item = xi.items.BOTTLE_OF_VICARS_DRINK, cost = 100, slot = 0x200000  },
    [8461]  = { item = xi.items.BOTTLE_OF_SPRINTERS_DRINK, cost = 100, slot = 0x4000000 },

    [12546] = { item = xi.items.BOTTLE_OF_BRAVERS_DRINK, cost = 200, slot = 0x40      },
    [12547] = { item = xi.items.BOTTLE_OF_SOLDIERS_DRINK, cost = 200, slot = 0x80      },
    [12548] = { item = xi.items.BOTTLE_OF_CHAMPIONS_DRINK, cost = 200, slot = 0x100     },
    [12549] = { item = xi.items.BOTTLE_OF_MONARCHS_DRINK, cost = 200, slot = 0x200     },
    [12550] = { item = xi.items.BOTTLE_OF_CLERICS_DRINK, cost = 200, slot = 0x800     },
    [12551] = { item = xi.items.DUSTY_POTION, cost = 200, slot = 0x2000    },
    [12552] = { item = xi.items.DUSTY_ETHER, cost = 200, slot = 0x4000    },
    [12553] = { item = xi.items.BOTTLE_OF_FANATICS_DRINK, cost = 200, slot = 0x10000   },
    [12554] = { item = xi.items.BOTTLE_OF_FOOLS_DRINK, cost = 200, slot = 0x20000   },
    [12555] = { item = xi.items.DUSTY_WING, cost = 200, slot = 0x400000  },
    [12556] = { item = xi.items.BOTTLE_OF_BODY_BOOST, cost = 200, slot = 0x800000  },
    [12557] = { item = xi.items.BOTTLE_OF_MANA_BOOST, cost = 200, slot = 0x1000000 },

    [16641] = { item = xi.items.DUSTY_ELIXIR, cost = 300, slot = 0x8000    },
}

local function playerHasTempItem(player)
    local hasTempItem = 0

    for _, itemList in pairs(items) do
        if player:hasItem(itemList.item, xi.inventoryLocation.TEMPITEMS) then
            hasTempItem = hasTempItem + itemList.slot
        end
    end

    return hasTempItem + 1
end

local function giveAllItems(player)
    for _, itemList in pairs(items) do
        if not player:hasItem(itemList.item, xi.inventoryLocation.TEMPITEMS) then
            if player:getCurrency("nyzul_isle_assault_point") >= itemList.cost then
                player:addTempItem(itemList.item)
                player:messageSpecial(ID.text.TEMP_ITEM_OBTAINED, itemList.item)
                player:delCurrency("nyzul_isle_assault_point", itemList.cost)
            end
        end
    end
end

local function giveAllPrefered(player)
    local preferred = player:getVar("[Nyzul]preferredItems")
    local selection =
    {
        [1]  = 8450,
        [2]  = 8451,
        [3]  = 8452,
        [4]  = 8453,
        [5]  = 8454,
        [6]  = 12546,
        [7]  = 12547,
        [8]  = 12548,
        [9]  = 12549,
        [10] = 8455,
        [11] = 12550,
        [12] = 8456,
        [13] = 12551,
        [14] = 12552,
        [15] = 16641,
        [16] = 12553,
        [17] = 12554,
        [18] = 8457,
        [19] = 8458,
        [20] = 8459,
        [21] = 8460,
        [22] = 12555,
        [23] = 12556,
        [24] = 12557,
        [25] = nil,
        [26] = 8461,
    }

    for section = 1, 26 do
        if utils.mask.getBit(preferred, section) then
            local mask   = selection[section]
            local choice = items[mask].item

            if choice ~= nil then
                if not player:hasItem(choice, xi.inventoryLocation.TEMPITEMS) then
                    player:addTempItem(choice)
                    player:messageSpecial(ID.text.TEMP_ITEM_OBTAINED, choice)
                    player:delCurrency("nyzul_isle_assault_point", items[mask].cost)
                end
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    local preferred = player:getVar("[Nyzul]preferredItems")
    local tokens    = player:getCurrency("nyzul_isle_assault_point")

    player:startEvent(202, 1, tokens, playerHasTempItem(player), preferred, 100, 200, 300)
end

entity.onEventUpdate = function(player, csid, option)
    if csid == 202 then
        if option == 20737 then
            giveAllItems(player)
        elseif option == 4353 then
            giveAllPrefered(player)
        else
            if option >= 4354 and option <= 4365 then
                option = option + 4096
            elseif option >= 4366 and option <= 4377 then
                option = option + 8180
            elseif option == 4378 then
                option = option + 12263
            end

            local vendorItems = items[option]

            if player:getCurrency("nyzul_isle_assault_point") >= vendorItems.cost then
                player:addTempItem(vendorItems.item)
                player:messageSpecial(ID.text.TEMP_ITEM_OBTAINED, vendorItems.item)
                player:delCurrency("nyzul_isle_assault_point", vendorItems.cost)
            end
        end

        local tokens = player:getCurrency("nyzul_isle_assault_point")
        player:updateEvent(1, tokens, playerHasTempItem(player), player:getVar("[Nyzul]preferredItems"), 100, 200, 300)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
