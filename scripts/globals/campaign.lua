-----------------------------------
-- Campaign global
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/zone")
require("scripts/globals/status")
require("scripts/globals/items")
-----------------------------------
xi = xi or {}
xi.campaign = {}

xi.campaign.control =
{
    Sandoria = 2,
    Bastok   = 4,
    Windurst = 6,
    Beastman = 8,
}

xi.campaign.union =
{
    Adder  = 1,
    Bison  = 2,
    Coyote = 3,
    Dhole  = 4,
    Eland  = 5,
}

xi.campaign.army =
{
    Sandoria = 0,
    Bastok   = 1,
    Windurst = 2,
    Orcish   = 3,
    Quadav   = 4,
    Yagudo   = 5,
    Kindred  = 6,
}

xi.campaign.zone =
{
    SouthernSandOria     = 80,
    EastRonfaure         = 81,
    JugnerForest         = 82,
    VunkerlInlet         = 83,
    BatalliaDowns        = 84,
    LaVaule              = 85,
    TheEldiemeNecropolis = 175,
    BastokMarkets        = 87,
    NorthGustaberg       = 88,
    Grauberg             = 89,
    PashhowMarshlands    = 90,
    RolanberryFields     = 91,
    Beadeaux             = 92,
    CrawlersNest         = 171,
    WindurstWaters       = 94,
    WestSarutabaruta     = 95,
    FortKarugoNarugo     = 96,
    MeriphataudMountains = 97,
    SauromugueChampaign  = 98,
    CastleOztroja        = 99,
    GarlaigeCitadel      = 164,
    BeaucedineGlacier    = 136,
    Xarcabard            = 137,
    CastleZvahlBaileys   = 138,
    CastleZvahlKeep      = 155,
    ThroneRoom           = 156,
}

-----------------------------------------------------------------
-- Variable for getNationTeleport and getPoint
-----------------------------------------------------------------

--[[
ALLIED_NOTES = 11
MAW = 4
PAST_SANDORIA = 5
PAST_BASTOK = 6
PAST_WINDURST = 7
]]

-- -------------------------------------------------------------------
-- getMedalRank()
-- Returns the numerical Campaign Medal of the player.
-- -------------------------------------------------------------------

xi.campaign.getMedalRank = function(player)
    local rank = 0
    -- TODO: Use xi.ki enum in this table
    local medals =
    {
        924, 925, 926, 927, 928, 929, 930,
        931, 932, 933, 934, 935, 936, 937,
        938, 939, 940, 941, 942, 943
    }

    while player:hasKeyItem(medals[rank + 1]) do
        rank = rank + 1
    end

    return rank
end

-- -------------------------------------------------------------------
-- get[nation]NotesItem()
-- Returns the item ID and cost of the Allied Notes indexed item
-- (the same value as that used by the vendor event)
-- Format:
-- ListName_AN_item[optionID] = itemID -- ItemName
-- ListName_AN_price[optionID] = cost -- ItemName
-- -------------------------------------------------------------------

xi.campaign.getSandOriaNotesItem = function(i)
    local sandOriaAlliedNotesItems =
    {
        [2] = { id = xi.items.SPRINTERS_SHOES, price = 980 },
        [258] = { id = xi.items.SCROLL_OF_INSTANT_RETRACE, price = 10 },
        [514] = { id = xi.items.IRON_RAM_JACK_COAT, price = 1500, adj = 1000 },
        [770] = { id = xi.items.PILGRIM_TUNICA, price = 1500, adj = 1000 },
        [1026] = { id = xi.items.IRON_RAM_SHIELD, price = 4500, adj = 3000 },
        [1282] = { id = xi.items.RECALL_RING_JUGNER, price = 5000, adj = 5000 },
        [1538] = { id = xi.items.RECALL_RING_PASHHOW, price = 5000, adj = 5000 },
        [1794] = { id = xi.items.RECALL_RING_MERIPHATAUD, price = 5000, adj = 5000 },
        -- Stars Service
        [18] = { id = xi.items.IRON_RAM_CHAINMAIL, price = 15000, adj = 10000 },
        [274] = { id = xi.items.IRON_RAM_MUFFLERS, price = 10500, adj = 7000 },
        [530] = { id = xi.items.IRON_RAM_SOLLERETS, price = 10500, adj = 7000 },
        [786] = { id = xi.items.IRON_RAM_HELM, price = 10500, adj = 7000 },
        [1042] = { id = xi.items.IRON_RAM_BREECHES, price = 10500, adj = 7000 },
        -- Emblems Service
        [34] = { id = xi.items.IRON_RAM_HORN, price = 30000, adj = 20000 },
        [290] = { id = xi.items.IRON_RAM_LANCE, price = 30000, adj = 20000 },
        [546] = { id = xi.items.IRON_RAM_PICK, price = 30000, adj = 20000 },
        [802] = { id = xi.items.IRON_RAM_SALLET, price = 60000, adj = 40000 },
        [1058] = { id = xi.items.IRON_RAM_DASTANAS, price = 60000, adj = 40000 },
        -- Wings Service
        [50] = { id = xi.items.IRON_RAM_GREAVES, price = 75000, adj = 50000 },
        [306] = { id = xi.items.IRON_RAM_HOSE, price = 75000, adj = 50000 },
        -- Medals Service
        [66] = { id = xi.items.PATRONUS_RING, price = 45000, adj = 30000 },
        [322] = { id = xi.items.FOX_EARRING, price = 45000, adj = 30000 },
        [578] = { id = xi.items.MUSICAL_EARRING, price = 45000, adj = 30000 },
        [834] = { id = xi.items.CRIMSON_BELT, price = 45000, adj = 30000 },
        [1090] = { id = xi.items.ROSE_STRAP, price = 45000, adj = 30000 },
        [1346] = { id = xi.items.IRON_RAM_HAUBERK, price = 112500, adj = 75000 },
        [1602] = { id = xi.items.ROYAL_GUARD_LIVERY, price = 15000, adj = 10000 },
        [1858] = { id = xi.items.ALLIED_RING, price = 22500, adj = 15000 },
        -- Medal of Altana
        [82] = { id = xi.items.GRIFFINCLAW, price = 150000, adj = 100000 },
        [338] = { id = xi.items.ROYAL_KNIGHT_SIGIL_RING, price = 75000, adj = 50000 }
    }
    local item = sandOriaAlliedNotesItems[i]
    return item.id, item.price, item.adj
end

xi.campaign.getBastokNotesItem = function(i)
    local bastokAlliedNotesItems =
    {
        [2] = { id = xi.items.SPRINTERS_SHOES, price = 980 },
        [258] = { id = xi.items.SCROLL_OF_INSTANT_RETRACE, price = 10 },
        [514] = { id = xi.items.FOURTH_DIVISION_TUNICA, price = 1500, adj = 1000 },
        [770] = { id = xi.items.PILGRIM_TUNICA, price = 1500, adj = 1000 },
        [1026] = { id = xi.items.FOURTH_DIVISION_GUN, price = 4500, adj = 3000 },
        [1282] = { id = xi.items.RECALL_RING_JUGNER, price = 5000 },
        [1538] = { id = xi.items.RECALL_RING_PASHHOW, price = 5000 },
        [1794] = { id = xi.items.RECALL_RING_MERIPHATAUD, price = 5000 },
        -- Stars Service
        [18] = { id = xi.items.FOURTH_DIVISION_CUIRASS, price = 15000, adj = 10000 },
        [274] = { id = xi.items.FOURTH_DIVISION_GAUNTLETS, price = 10500, adj = 7000 },
        [530] = { id = xi.items.FOURTH_DIVISION_SABATONS, price = 10500, adj = 7000 },
        [786] = { id = xi.items.FOURTH_DIVISION_ARMET, price = 10500, adj = 7000 },
        [1042] = { id = xi.items.FOURTH_DIVISION_CUISSES, price = 10500, adj = 7000 },
        -- Emblems Service
        [34] = { id = xi.items.FOURTH_DIVISION_TOPOROK, price = 30000, adj = 20000 },
        [290] = { id = xi.items.FOURTH_DIVISION_MACE, price = 30000, adj = 20000 },
        [546] = { id = xi.items.FOURTH_DIVISION_ZAGHNAL, price = 30000, adj = 20000 },
        [802] = { id = xi.items.FOURTH_DIVISION_HAUBE, price = 60000, adj = 40000 },
        [1058] = { id = xi.items.FOURTH_DIVISION_HENTZES, price = 60000, adj = 40000 },
        -- Wings Service
        [50] = { id = xi.items.FOURTH_DIVISION_SCHUHS, price = 75000, adj = 50000 },
        [306] = { id = xi.items.FOURTH_DIVISION_SCHOSS, price = 75000, adj = 50000 },
        -- Medals Service
        [66] = { id = xi.items.SHIELD_COLLAR, price = 45000, adj = 30000 },
        [322] = { id = xi.items.STURMS_REPORT, price = 45000, adj = 30000 },
        [578] = { id = xi.items.SONIAS_PLECTRUM, price = 45000, adj = 30000 },
        [834] = { id = xi.items.BULL_NECKLACE, price = 45000, adj = 30000 },
        [1090] = { id = xi.items.ARRESTOR_MANTLE, price = 45000, adj = 30000 },
        [1346] = { id = xi.items.FOURTH_DIVISION_BRUNNE, price = 112500, adj = 75000 },
        [1602] = { id = xi.items.MYTHRIL_MUSKETEER_LIVERY, price = 15000, adj = 10000 },
        [1858] = { id = xi.items.ALLIED_RING, price = 22500, adj = 15000 },
        -- Medal of Altana
        [82] = { id = xi.items.LEX_TALIONIS, price = 150000, adj = 100000 },
        [338] = { id = xi.items.FOURTH_DIVISION_MANTLE, price = 75000, adj = 50000 }
    }
    local item = bastokAlliedNotesItems[i]
    return item.id, item.price, item.adj
end

xi.campaign.getWindurstNotesItem = function(i)
    local windurstAlliedNotesItems =
    {
        [2] = { id = xi.items.SPRINTERS_SHOES, price = 980 },
        [258] = { id = xi.items.SCROLL_OF_INSTANT_RETRACE, price = 10 },
        [514] = { id = xi.items.COBRA_UNIT_TUNICA, price = 1500, adj = 1000 },
        [770] = { id = xi.items.PILGRIM_TUNICA, price = 1500, adj = 1000 },
        [1026] = { id = xi.items.COBRA_UNIT_CLAYMORE, price = 4500, adj = 3000 },
        [1282] = { id = xi.items.RECALL_RING_JUGNER, price = 5000 },
        [1538] = { id = xi.items.RECALL_RING_PASHHOW, price = 5000 },
        [1794] = { id = xi.items.RECALL_RING_MERIPHATAUD, price = 5000 },
        -- Stars Service
        [18] = { id = xi.items.COBRA_UNIT_COAT, price = 15000, adj = 10000 },
        [274] = { id = xi.items.COBRA_UNIT_CUFFS, price = 10500, adj = 7000 },
        [530] = { id = xi.items.COBRA_UNIT_PIGACHES, price = 10500, adj = 7000 },
        [786] = { id = xi.items.COBRA_UNIT_HAT, price = 10500, adj = 7000 },
        [1042] = { id = xi.items.COBRA_UNIT_SLOPS, price = 10500, adj = 7000 },
        -- Emblems Service
        [34] = { id = xi.items.COBRA_UNIT_BAGHNAKHS, price = 30000, adj = 20000 },
        [290] = { id = xi.items.COBRA_UNIT_KNIFE, price = 30000, adj = 20000 },
        [546] = { id = xi.items.COBRA_UNIT_BOW, price = 30000, adj = 20000 },
        [802] = { id = xi.items.COBRA_UNIT_CAP, price = 60000, adj = 40000 },
        [1058] = { id = xi.items.COBRA_UNIT_MITTENS, price = 60000, adj = 40000 },
        [1314] = { id = xi.items.COBRA_UNIT_CLOCHE, price = 60000, adj = 40000 },
        [1570] = { id = xi.items.COBRA_UNIT_GLOVES, price = 60000, adj = 40000 },
        -- Wings Service
        [50] = { id = xi.items.COBRA_UNIT_LEGGINGS, price = 75000, adj = 50000 },
        [306] = { id = xi.items.COBRA_UNIT_SUBLIGAR, price = 75000, adj = 50000 },
        [562] = { id = xi.items.COBRA_UNIT_CRACKOWS, price = 75000, adj = 50000 },
        [818] = { id = xi.items.COBRA_UNIT_TREWS, price = 75000, adj = 50000 },
        -- Medals Service
        [66] = { id = xi.items.CAPRICORNIAN_ROPE, price = 45000, adj = 30000 },
        [322] = { id = xi.items.EARTHY_BELT, price = 45000, adj = 30000 },
        [578] = { id = xi.items.COUGAR_PENDANT, price = 45000, adj = 30000 },
        [834] = { id = xi.items.CROCODILE_COLLAR, price = 45000, adj = 30000 },
        [1090] = { id = xi.items.ARIESIAN_GRIP, price = 45000, adj = 30000 },
        [1346] = { id = xi.items.COBRA_UNIT_HARNESS, price = 112500, adj = 75000 },
        [1602] = { id = xi.items.COBRA_UNIT_ROBE, price = 15000, adj = 75000 },
        [1858] = { id = xi.items.ALLIED_RING, price = 22500, adj = 15000 },
        -- Medal of Altana
        [82] = { id = xi.items.GRIFFINCLAW, price = 150000, adj = 10000 },
        [338] = { id = xi.items.ROYAL_KNIGHT_SIGIL_RING, price = 75000, adj = 50000 }
    }
    local item = windurstAlliedNotesItems[i]
    return item.id, item.price, item.adj
end

-- -------------------------------------------------------------------
-- getSigilTimeStamp(player)
-- This is for the time-stamp telling player what day/time the
-- effect will last until, NOT the actual status effect duration.
-- -------------------------------------------------------------------

xi.campaign.getSigilTimeStamp = function(player)
    local timeStamp = 0 -- zero'd till math is done.

    -- TODO: calculate time stamp for menu display of when it wears off

    return timeStamp
end

-----------------------------------
-- hasMawActivated Action
-----------------------------------

-- 1st number for hasMawActivated()
-- 2nd number for player:addNationTeleport()

-- 0    1   Batallia Downs (S) (H-5)
-- 1    2   Rolanberry Fields (S) (H-6)
-- 2    4   Sauromugue Champaign (S) (K-9)
-- 3    8   Jugner Forest (S) (H-11)
-- 4    16  Pashhow Marshlands (S) (K-8)
-- 5    32  Meriphataud Mountains (S) (K-6)
-- 6    64  East Ronfaure (S) (H-5)
-- 7    128 North Gustaberg (S) (K-7)
-- 8    256 West Sarutabaruta (S) (H-9)
--[[
function hasMawActivated(player, portal)
    local mawActivated = player:getNationTeleport(MAW)
    local bit = {}

    for i = 8, 0, -1 do
        local twop = 2^i

        if (mawActivated >= twop) then
            bit[i] = true mawActivated = mawActivated - twop
        else
            bit[i] = false
        end
    end

    return bit[portal]
end
]]
-- TODO:
-- Past nation teleport
