-----------------------------------
-- Area: Navukgo_Execution_Chamber
-----------------------------------
zones = zones or {}

zones[xi.zone.NAVUKGO_EXECUTION_CHAMBER] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6390, -- Obtained: <item>.
        GIL_OBTAINED                  = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6393, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS           = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7023, -- Your party is unable to participate because certain members' levels are restricted.
        PARTY_MEMBERS_HAVE_FALLEN     = 7569, -- All party members have fallen in battle. Now leaving the battlefield.
        THE_PARTY_WILL_BE_REMOVED     = 7576, -- If all party members' HP are still zero after # minute[/s], the party will be removed from the battlefield.
        KARABABA_ENOUGH               = 7642, -- That's quite enough...
        KARABABA_ROUGH                = 7643, -- Time for me to start playing rough!
        KARABARA_FIRE                 = 7644, -- Fuel for the fire! It doesn't pay to invoke my ire!
        KARABARA_ICE                  = 7645, -- Well, if you won't play nice, I'll put your sorry hide on ice!
        KARABARA_WIND                 = 7646, -- This battle is growing stale. How about we have a refreshing gale!
        KARABARA_EARTH                = 7647, -- Sometimes it comes as quite a shock, how much damage you can deal with simple rock!
        KARABARA_LIGHTNING            = 7648, -- How I love to rip things asunder! Witness the power of lightning and thunder!
        KARABARA_WATER                = 7649, -- Water is more dangerous than most expect. Never fear, I'll teach you respect!
        KARABABA_QUIT                 = 7657, -- What a completely useless shield. It's time for me to quit the field.
    },
    mob =
    {
        KARABABA_OFFSET = 17039401,
        IMMORTAL_FLAN2  = 17039375, -- IMMORTAL_FLAN1 always pops in battlefield, other flans pop depending on party size
        IMMORTAL_FLAN3  = 17039376,
        IMMORTAL_FLAN4  = 17039377,
        IMMORTAL_FLAN5  = 17039378,
        IMMORTAL_FLAN6  = 17039379,
    },
    npc =
    {
    },
}

return zones[xi.zone.NAVUKGO_EXECUTION_CHAMBER]
