-----------------------------------
-- Area: Lower Jeuno
--  NPC: Treasure Coffer
-- Type: Add-on NPC
-- !pos 41.169 3.899 -51.005 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

local optionToKI =
{
    [ 1] = xi.ki.CRIMSON_KEY,
    [ 2] = xi.ki.VIRIDIAN_KEY,
    [ 3] = xi.ki.AMBER_KEY,
    [ 4] = xi.ki.AZURE_KEY,
    [ 5] = xi.ki.IVORY_KEY,
    [ 6] = xi.ki.EBON_KEY,
    [ 8] = xi.ki.WHITE_CORAL_KEY,
    [ 9] = xi.ki.BLUE_CORAL_KEY,
    [10] = xi.ki.PEACH_CORAL_KEY,
    [11] = xi.ki.BLACK_CORAL_KEY,
    [12] = xi.ki.RED_CORAL_KEY,
    [13] = xi.ki.ANGEL_SKIN_KEY,
    [15] = xi.ki.MOOGLE_KEY,
    [16] = xi.ki.BIRD_KEY,
    [17] = xi.ki.CACTUAR_KEY,
    [18] = xi.ki.BOMB_KEY,
    [19] = xi.ki.CHOCOBO_KEY,
    [20] = xi.ki.TONBERRY_KEY,
}

local prizes =
{
    [xi.ki.CRIMSON_KEY] =
    {
        { cutoff =   70, itemId = xi.items.GOLD_OBI,                  augments = { { 9, 0,  5 }, { 516, 0, 1 }, { 517, 0, 1 }, { 518, 0, 1 }, {  32, 0, 1 }, {  96, 0, 1 } } },
        { cutoff =   80, itemId = xi.items.GOLD_RING,                 augments = { { 9, 0,  8 }, { 516, 0, 1 }, { 517, 0, 1 }, { 518, 0, 2 }, {  39, 0, 1 }, {  35, 0, 2 } } },
        { cutoff =  186, itemId = xi.items.MYTHRIL_RING,              augments = { { 1, 0, 15 }, {  13, 0, 2 }, {  25, 0, 5 }, {  31, 0, 2 }, { 195, 0, 1 }, {  35, 0, 2 } } },
        { cutoff =  276, itemId = xi.items.SARCENET_CAPE,             augments = { { 9, 0,  5 }, { 516, 0, 1 }, { 517, 0, 1 }, { 518, 0, 1 }, { 100, 0, 1 }, {  39, 0, 1 } } },
        { cutoff =  351, itemId = xi.items.SILVER_BELT,               augments = { { 1, 0,  5 }, {  23, 0, 1 }, {  27, 0, 1 }, { 512, 0, 1 }, { 520, 0, 1 }, { 515, 0, 1 } } },
        { cutoff =  460, itemId = xi.items.WOLF_MANTLE,               augments = { { 1, 0,  5 }, {  25, 0, 3 }, {  29, 0, 3 }, { 512, 0, 0 }, { 769, 0, 1 }, {  32, 0, 1 } } },
        { cutoff =  468, itemId = xi.items.CHESTNUT_LOG               },
        { cutoff =  471, itemId = xi.items.CORAL_FRAGMENT             },
        { cutoff =  476, itemId = xi.items.DARK_SPIRIT_PACT           },
        { cutoff =  479, itemId = xi.items.DARKSTEEL_INGOT            },
        { cutoff =  500, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff =  523, itemId = xi.items.SCROLL_OF_DISPEL           },
        { cutoff =  619, itemId = xi.items.ELIXIR                     },
        { cutoff =  668, itemId = xi.items.ELM_LOG                    },
        { cutoff =  699, itemId = xi.items.SCROLL_OF_ERASE            },
        { cutoff =  702, itemId = xi.items.HI_POTION                  },
        { cutoff =  723, itemId = xi.items.IRON_INGOT                 },
        { cutoff =  775, itemId = xi.items.CHUNK_OF_IRON_ORE          },
        { cutoff =  785, itemId = xi.items.LIGHT_SPIRIT_PACT          },
        { cutoff =  821, itemId = xi.items.SCROLL_OF_MAGIC_FINALE     },
        { cutoff =  824, itemId = xi.items.MAPLE_LOG                  },
        { cutoff =  858, itemId = xi.items.MYTHRIL_INGOT              },
        { cutoff =  879, itemId = xi.items.CHUNK_OF_MYTHRIL_ORE       },
        { cutoff =  884, itemId = xi.items.POTION_P1                  },
        { cutoff =  923, itemId = xi.items.SILVER_INGOT               },
        { cutoff =  949, itemId = xi.items.CHUNK_OF_SILVER_ORE        },
        { cutoff =  993, itemId = xi.items.STEEL_INGOT                },
        { cutoff = 1003, itemId = xi.items.SCROLL_OF_UTSUSEMI_NI      },
    },

    [xi.ki.VIRIDIAN_KEY] =
    {
        { cutoff =   65, itemId = xi.items.AURORA_MANTLE              },
        { cutoff =  142, itemId = xi.items.CORSETTE                   },
        { cutoff =  237, itemId = xi.items.NYMPH_SHIELD               },
        { cutoff =  356, itemId = xi.items.RAM_MANTLE                 },
        { cutoff =  457, itemId = xi.items.SWORDBELT                  },
        { cutoff =  463, itemId = xi.items.BROCADE_OBI                },
        { cutoff =  469, itemId = xi.items.BLACK_PEARL                },
        { cutoff =  497, itemId = xi.items.BLACK_ROCK                 },
        { cutoff =  515, itemId = xi.items.BLUE_ROCK                  },
        { cutoff =  616, itemId = xi.items.ELIXIR                     },
        { cutoff =  670, itemId = xi.items.ETHER_P1                   },
        { cutoff =  676, itemId = xi.items.GARNET                     },
        { cutoff =  672, itemId = xi.items.GOSHENITE                  },
        { cutoff =  684, itemId = xi.items.GREEN_ROCK                 },
        { cutoff =  775, itemId = xi.items.OAK_LOG                    },
        { cutoff =  811, itemId = xi.items.PEARL                      },
        { cutoff =  829, itemId = xi.items.PERIDOT                    },
        { cutoff =  835, itemId = xi.items.CHUNK_OF_PLATINUM_ORE      },
        { cutoff =  871, itemId = xi.items.POTION_P1                  },
        { cutoff =  877, itemId = xi.items.PURPLE_ROCK                },
        { cutoff =  901, itemId = xi.items.RED_ROCK                   },
        { cutoff =  984, itemId = xi.items.ROSEWOOD_LOG               },
        { cutoff = 1008, itemId = xi.items.SPHENE                     },
        { cutoff = 1020, itemId = xi.items.TRANSLUCENT_ROCK           },
        { cutoff = 1032, itemId = xi.items.WHITE_ROCK                 },
        { cutoff = 1044, itemId = xi.items.YELLOW_ROCK                },
        { cutoff = 1056, itemId = xi.items.TURQUOISE                  },
    },

    [xi.ki.AMBER_KEY] =
    {
        { cutoff = 111, itemId = xi.items.BEAK_NECKLACE              },
        { cutoff = 219, itemId = xi.items.BROCADE_OBI                },
        { cutoff = 334, itemId = xi.items.CARAPACE_GORGET            },
        { cutoff = 436, itemId = xi.items.GOLD_RING                  },
        { cutoff = 561, itemId = xi.items.RAPTOR_MANTLE              },
        { cutoff = 564, itemId = xi.items.CORAL_FRAGMENT             },
        { cutoff = 576, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff = 599, itemId = xi.items.DEMON_HORN                 },
        { cutoff = 616, itemId = xi.items.EBONY_LOG                  },
        { cutoff = 625, itemId = xi.items.CHUNK_OF_GOLD_ORE          },
        { cutoff = 683, itemId = xi.items.HI_ELIXIR                  },
        { cutoff = 730, itemId = xi.items.HI_ETHER                   },
        { cutoff = 771, itemId = xi.items.HI_POTION                  },
        { cutoff = 788, itemId = xi.items.MAHOGANY_LOG               },
        { cutoff = 805, itemId = xi.items.MANTICORE_HIDE             },
        { cutoff = 807, itemId = xi.items.PETRIFIED_LOG              },
        { cutoff = 809, itemId = xi.items.CHUNK_OF_PLATINUM_ORE      },
        { cutoff = 818, itemId = xi.items.CHUNK_OF_MYTHRIL_ORE       },
        { cutoff = 835, itemId = xi.items.RAM_HORN                   },
        { cutoff = 876, itemId = xi.items.RAM_SKIN                   },
        { cutoff = 885, itemId = xi.items.SCROLL_OF_RAISE_II         },
        { cutoff = 920, itemId = xi.items.SCROLL_OF_REGEN_III        },
        { cutoff = 946, itemId = xi.items.HANDFUL_OF_WYVERN_SCALES   },
        { cutoff = 961, itemId = xi.items.WYVERN_SKIN                },
    },

    [xi.ki.AZURE_KEY] =
    {
        { cutoff = 106, itemId = xi.items.BEAK_MANTLE                },
        { cutoff = 203, itemId = xi.items.COEURL_GORGET              },
        { cutoff = 305, itemId = xi.items.PLATINUM_RING              },
        { cutoff = 386, itemId = xi.items.RAINBOW_OBI                },
        { cutoff = 490, itemId = xi.items.TORQUE                     },
        { cutoff = 498, itemId = xi.items.AQUAMARINE                 },
        { cutoff = 502, itemId = xi.items.CHRYSOBERYL                },
        { cutoff = 536, itemId = xi.items.DARKSTEEL_INGOT            },
        { cutoff = 612, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff = 659, itemId = xi.items.EBONY_LOG                  },
        { cutoff = 693, itemId = xi.items.GOLD_INGOT                 },
        { cutoff = 786, itemId = xi.items.HI_ELIXIR                  },
        { cutoff = 789, itemId = xi.items.HI_ETHER_I                 },
        { cutoff = 831, itemId = xi.items.HI_POTION_P1               },
        { cutoff = 835, itemId = xi.items.JADEITE                    },
        { cutoff = 856, itemId = xi.items.MAHOGANY_LOG               },
        { cutoff = 907, itemId = xi.items.MYTHRIL_INGOT              },
        { cutoff = 911, itemId = xi.items.RAM_HORN                   },
        { cutoff = 915, itemId = xi.items.SCROLL_OF_REGEN_III        },
        { cutoff = 948, itemId = xi.items.STEEL_INGOT                },
        { cutoff = 956, itemId = xi.items.SUNSTONE                   },
        { cutoff = 960, itemId = xi.items.HANDFUL_OF_WYVERN_SCALES   },
    },

    [xi.ki.IVORY_KEY] =
    {
        { cutoff =   62, itemId = xi.items.ANGELS_EARRING             },
        { cutoff =   70, itemId = xi.items.DEATH_EARRING              },
        { cutoff =  113, itemId = xi.items.DIAMOND_EARRING            },
        { cutoff =  196, itemId = xi.items.EMERALD_EARRING            },
        { cutoff =  301, itemId = xi.items.RUBY_EARRING               },
        { cutoff =  392, itemId = xi.items.SAPPHIRE_EARRING           },
        { cutoff =  478, itemId = xi.items.SPINEL_EARRING             },
        { cutoff =  497, itemId = xi.items.TOPAZ_EARRING              },
        { cutoff =  546, itemId = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD },
        { cutoff =  602, itemId = xi.items.SPOOL_OF_GOLD_THREAD       },
        { cutoff =  627, itemId = xi.items.SLAB_OF_GRANITE            },
        { cutoff =  658, itemId = xi.items.HI_ETHER_II                },
        { cutoff =  901, itemId = xi.items.HI_POTION_P2               },
        { cutoff =  963, itemId = xi.items.SPOOL_OF_MALBORO_FIBER     },
        { cutoff =  982, itemId = xi.items.VIAL_OF_FIEND_BLOOD        },
        { cutoff = 1019, itemId = xi.items.PHOENIX_FEATHER            },
        { cutoff = 1062, itemId = xi.items.SQUARE_OF_RAINBOW_CLOTH    },
        { cutoff = 1124, itemId = xi.items.SQUARE_OF_RAXA             },
        { cutoff = 1172, itemId = xi.items.VILE_ELIXIR                },
    },

    [xi.ki.EBON_KEY] =
    {
        { cutoff =  31, itemId = xi.items.ANGELS_RING                },
        { cutoff =  82, itemId = xi.items.DEATH_RING                 },
        { cutoff = 174, itemId = xi.items.DIAMOND_RING               },
        { cutoff = 225, itemId = xi.items.EMERALD_RING               },
        { cutoff = 296, itemId = xi.items.RUBY_RING                  },
        { cutoff = 357, itemId = xi.items.SAPPHIRE_RING              },
        { cutoff = 459, itemId = xi.items.SPINEL_RING                },
        { cutoff = 500, itemId = xi.items.TOPAZ_RING                 },
        { cutoff = 510, itemId = xi.items.ADAMAN_INGOT               },
        { cutoff = 541, itemId = xi.items.ANGELSTONE                 },
        { cutoff = 561, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff = 592, itemId = xi.items.DEATHSTONE                 },
        { cutoff = 633, itemId = xi.items.DIAMOND                    },
        { cutoff = 643, itemId = xi.items.EMERALD                    },
        { cutoff = 714, itemId = xi.items.HI_ETHER_P3                },
        { cutoff = 785, itemId = xi.items.HI_POTION_P3               },
        { cutoff = 805, itemId = xi.items.CHUNK_OF_ORICHALCUM_ORE    },
        { cutoff = 815, itemId = xi.items.CHUNK_OF_PLATINUM_ORE      },
        { cutoff = 835, itemId = xi.items.RUBY                       },
        { cutoff = 855, itemId = xi.items.SAPPHIRE                   },
        { cutoff = 896, itemId = xi.items.SCROLL_OF_CURE_V           },
        { cutoff = 916, itemId = xi.items.SCROLL_OF_SHELL_IV         },
        { cutoff = 936, itemId = xi.items.SCROLL_OF_THUNDER_III      },
        { cutoff = 987, itemId = xi.items.VILE_ELIXIR                },
        { cutoff = 997, itemId = xi.items.SCROLL_OF_RAISE_III        },
    },

    [xi.ki.WHITE_CORAL_KEY] =
    {
        { cutoff =   31, itemId = xi.items.BRASS_MASK                 },
        { cutoff =  109, itemId = xi.items.CHESTNUT_SABOTS            },
        { cutoff =  218, itemId = xi.items.COTTON_GLOVES              },
        { cutoff =  296, itemId = xi.items.STUDDED_TROUSERS           },
        { cutoff =  437, itemId = xi.items.WOOL_ROBE                  },
        { cutoff =  468, itemId = xi.items.CHESTNUT_LOG               },
        { cutoff =  499, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff =  624, itemId = xi.items.ELIXIR                     },
        { cutoff =  655, itemId = xi.items.ELM_LOG                    },
        { cutoff =  686, itemId = xi.items.CHUNK_OF_IRON_ORE          },
        { cutoff =  717, itemId = xi.items.IRON_INGOT                 },
        { cutoff =  764, itemId = xi.items.MYTHRIL_INGOT              },
        { cutoff =  780, itemId = xi.items.CHUNK_OF_MYTHRIL_ORE       },
        { cutoff =  843, itemId = xi.items.SILVER_INGOT               },
        { cutoff =  874, itemId = xi.items.CHUNK_OF_SILVER_ORE        },
        { cutoff =  937, itemId = xi.items.STEEL_INGOT                },
        { cutoff =  968, itemId = xi.items.SCROLL_OF_DISPEL           },
        { cutoff =  999, itemId = xi.items.SCROLL_OF_MAGIC_FINALE     },
        { cutoff = 1015, itemId = xi.items.SCROLL_OF_UTSUSEMI_NI      },
        { cutoff = 1031, itemId = xi.items.SCROLL_OF_ERASE            },
    },

    [xi.ki.BLUE_CORAL_KEY] =
    {
        { cutoff =   42, itemId = xi.items.CUIR_BOUILLI               },
        { cutoff =  250, itemId = xi.items.IRON_GREAVES               },
        { cutoff =  292, itemId = xi.items.LINEN_SLACKS               },
        { cutoff =  375, itemId = xi.items.PADDED_CAP                 },
        { cutoff =  458, itemId = xi.items.VELVET_CUFFS               },
        { cutoff =  500, itemId = xi.items.BLACK_PEARL                },
        { cutoff =  583, itemId = xi.items.ELIXIR                     },
        { cutoff =  625, itemId = xi.items.ETHER_P1                   },
        { cutoff =  667, itemId = xi.items.GARNET                     },
        { cutoff =  709, itemId = xi.items.PERIDOT                    },
        { cutoff =  751, itemId = xi.items.POTION_P1                  },
        { cutoff =  876, itemId = xi.items.OAK_LOG                    },
        { cutoff =  918, itemId = xi.items.SQUARE_OF_RAINBOW_CLOTH    },
        { cutoff =  960, itemId = xi.items.RED_ROCK                   },
        { cutoff = 1002, itemId = xi.items.TURQUOISE                  },
    },

    [xi.ki.PEACH_CORAL_KEY] =
    {
        { cutoff =   66, itemId = xi.items.CARAPACE_HARNESS           },
        { cutoff =  198, itemId = xi.items.RAPTOR_LEDELSENS           },
        { cutoff =  303, itemId = xi.items.SILK_HAT                   },
        { cutoff =  395, itemId = xi.items.STEEL_FINGER_GAUNTLETS     },
        { cutoff =  487, itemId = xi.items.WHITE_SLACKS               },
        { cutoff =  500, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff =  526, itemId = xi.items.DEMON_HORN                 },
        { cutoff =  565, itemId = xi.items.EBONY_LOG                  },
        { cutoff =  591, itemId = xi.items.CHUNK_OF_GOLD_ORE          },
        { cutoff =  696, itemId = xi.items.HI_ELIXIR                  },
        { cutoff =  747, itemId = xi.items.HI_ETHER                   },
        { cutoff =  773, itemId = xi.items.HI_POTION                  },
        { cutoff =  786, itemId = xi.items.MAHOGANY_LOG               },
        { cutoff =  839, itemId = xi.items.MANTICORE_HIDE             },
        { cutoff =  852, itemId = xi.items.CHUNK_OF_MYTHRIL_ORE       },
        { cutoff =  891, itemId = xi.items.PETRIFIED_LOG              },
        { cutoff =  930, itemId = xi.items.SCROLL_OF_RAISE_II         },
        { cutoff =  969, itemId = xi.items.CHUNK_OF_PLATINUM_ORE      },
        { cutoff = 1008, itemId = xi.items.RAM_HORN                   },
        { cutoff = 1021, itemId = xi.items.RAM_SKIN                   },
        { cutoff = 1074, itemId = xi.items.SCROLL_OF_REGEN_III        },
        { cutoff = 1087, itemId = xi.items.HANDFUL_OF_WYVERN_SCALES   },
        { cutoff = 1103, itemId = xi.items.WYVERN_SKIN                },
    },

    [xi.ki.BLACK_CORAL_KEY] =
    {
        { cutoff =   90, itemId = xi.items.BEAK_HELM                  },
        { cutoff =  194, itemId = xi.items.PIGACHES                   },
        { cutoff =  224, itemId = xi.items.DARKSTEEL_BREECHES         },
        { cutoff =  433, itemId = xi.items.SCORPION_MITTENS           },
        { cutoff =  552, itemId = xi.items.SILK_COAT                  },
        { cutoff =  597, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff =  612, itemId = xi.items.DARKSTEEL_INGOT            },
        { cutoff =  642, itemId = xi.items.GOLD_INGOT                 },
        { cutoff =  776, itemId = xi.items.HI_ELIXIR                  },
        { cutoff =  821, itemId = xi.items.HI_ETHER_I                 },
        { cutoff =  851, itemId = xi.items.HI_POTION_P1               },
        { cutoff =  866, itemId = xi.items.MAHOGANY_LOG               },
        { cutoff =  881, itemId = xi.items.MYTHRIL_INGOT              },
        { cutoff =  896, itemId = xi.items.PAINITE                    },
        { cutoff = 1000, itemId = xi.items.STEEL_INGOT                },
        { cutoff = 1015, itemId = xi.items.ZIRCON                     },
    },

    [xi.ki.RED_CORAL_KEY] =
    {
        { cutoff =  109, itemId = xi.items.ALLOY_TORQUE               },
        { cutoff =  200, itemId = xi.items.AUREATE_NECKLACE           },
        { cutoff =  273, itemId = xi.items.BURLY_GORGET               },
        { cutoff =  382, itemId = xi.items.NITID_CHOKER               },
        { cutoff =  473, itemId = xi.items.PNEUMA_COLLAR              },
        { cutoff =  528, itemId = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD },
        { cutoff =  619, itemId = xi.items.SPOOL_OF_GOLD_THREAD       },
        { cutoff =  692, itemId = xi.items.SLAB_OF_GRANITE            },
        { cutoff =  728, itemId = xi.items.HI_ETHER_II                },
        { cutoff =  764, itemId = xi.items.SPOOL_OF_MALBORO_FIBER     },
        { cutoff =  782, itemId = xi.items.VIAL_OF_FIEND_BLOOD        },
        { cutoff =  800, itemId = xi.items.PHOENIX_FEATHER            },
        { cutoff =  836, itemId = xi.items.SQUARE_OF_RAINBOW_CLOTH    },
        { cutoff =  872, itemId = xi.items.SQUARE_OF_RAXA             },
        { cutoff =  999, itemId = xi.items.VILE_ELIXIR                },
        { cutoff = 1017, itemId = xi.items.SERVING_OF_YELLOW_CURRY    },
    },

    [xi.ki.ANGEL_SKIN_KEY] =
    {
        { cutoff =   65, itemId = xi.items.ALTIUS_MANTLE              },
        { cutoff =  162, itemId = xi.items.CHIFFON_CAPE               },
        { cutoff =  243, itemId = xi.items.CORTEGE_CAPE               },
        { cutoff =  356, itemId = xi.items.RESILIENT_MANTLE           },
        { cutoff =  437, itemId = xi.items.RUGGED_MANTLE              },
        { cutoff =  469, itemId = xi.items.CHUNK_OF_ADAMAN_ORE        },
        { cutoff =  501, itemId = xi.items.ANGELSTONE                 },
        { cutoff =  517, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff =  582, itemId = xi.items.DEATHSTONE                 },
        { cutoff =  614, itemId = xi.items.DIAMOND                    },
        { cutoff =  646, itemId = xi.items.EMERALD                    },
        { cutoff =  662, itemId = xi.items.HI_ETHER_P3                },
        { cutoff =  694, itemId = xi.items.HI_POTION_P3               },
        { cutoff =  742, itemId = xi.items.CHUNK_OF_ORICHALCUM_ORE    },
        { cutoff =  790, itemId = xi.items.RUBY                       },
        { cutoff =  822, itemId = xi.items.SCROLL_OF_CURE_V           },
        { cutoff =  855, itemId = xi.items.SCROLL_OF_SHELL_IV         },
        { cutoff =  888, itemId = xi.items.SPINEL                     },
        { cutoff = 1021, itemId = xi.items.VILE_ELIXIR                },
        { cutoff = 1037, itemId = xi.items.SCROLL_OF_THUNDER_III      },
        { cutoff = 1047, itemId = xi.items.SCROLL_OF_RAISE_III        },
    },

    [xi.ki.MOOGLE_KEY] =
    {
        { cutoff =  167, itemId = xi.items.STUDDED_BANDANA            },
        { cutoff =  374, itemId = xi.items.CHAIN_BELT                 },
        { cutoff =  707, itemId = xi.items.CHAIN_CHOKER               },
        { cutoff =  874, itemId = xi.items.SCROLL_OF_ERASE            },
        { cutoff = 1041, itemId = xi.items.MYTHRIL_INGOT              },
        { cutoff = 1100, itemId = xi.items.SILVER_INGOT               },
    },

    [xi.ki.BIRD_KEY] =
    {
        { cutoff = 143, itemId = xi.items.EBONY_SABOTS               },
        { cutoff = 393, itemId = xi.items.IRON_SCALE_MAIL            },
        { cutoff = 536, itemId = xi.items.OAK_SHIELD                 },
        { cutoff = 653, itemId = xi.items.WAISTBELT                  },
        { cutoff = 663, itemId = xi.items.BLACK_PEARL                },
        { cutoff = 678, itemId = xi.items.BLUE_ROCK                  },
        { cutoff = 770, itemId = xi.items.ELIXIR                     },
        { cutoff = 801, itemId = xi.items.ETHER_P1                   },
        { cutoff = 816, itemId = xi.items.GOSHENITE                  },
        { cutoff = 847, itemId = xi.items.OAK_LOG                    },
        { cutoff = 852, itemId = xi.items.PEARL                      },
        { cutoff = 862, itemId = xi.items.PERIDOT                    },
        { cutoff = 871, itemId = xi.items.POTION_P1                  },
        { cutoff = 922, itemId = xi.items.ROSEWOOD_LOG               },
        { cutoff = 927, itemId = xi.items.SPHENE                     },
        { cutoff = 947, itemId = xi.items.TRANSLUCENT_ROCK           },
        { cutoff = 957, itemId = xi.items.WHITE_ROCK                 },
        { cutoff = 967, itemId = xi.items.YELLOW_ROCK                },
        { cutoff = 972, itemId = xi.items.PURPLE_ROCK                },
    },

    [xi.ki.CACTUAR_KEY] =
    {
        { cutoff = 109, itemId = xi.items.NODOWA                     },
        { cutoff = 196, itemId = xi.items.SILK_COAT                  },
        { cutoff = 305, itemId = xi.items.TURTLE_BANGLES             },
        { cutoff = 370, itemId = xi.items.CARAPACE_MASK              },
        { cutoff = 435, itemId = xi.items.HI_ETHER                   },
        { cutoff = 544, itemId = xi.items.HI_ELIXIR                  },
        { cutoff = 609, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff = 631, itemId = xi.items.CHUNK_OF_GOLD_ORE          },
        { cutoff = 674, itemId = xi.items.SCROLL_OF_REGEN_III        },
        { cutoff = 696, itemId = xi.items.SCROLL_OF_RAISE_II         },
        { cutoff = 718, itemId = xi.items.CHUNK_OF_PLATINUM_ORE      },
        { cutoff = 761, itemId = xi.items.HANDFUL_OF_WYVERN_SCALES   },
        { cutoff = 804, itemId = xi.items.EBONY_LOG                  },
        { cutoff = 847, itemId = xi.items.DEMON_HORN                 },
        { cutoff = 869, itemId = xi.items.PETRIFIED_LOG              },
        { cutoff = 891, itemId = xi.items.MANTICORE_HIDE             },
        { cutoff = 913, itemId = xi.items.RAM_HORN                   },
        { cutoff = 935, itemId = xi.items.RAM_SKIN                   },
    },

    [xi.ki.BOMB_KEY] =
    {
        { cutoff = 308, itemId = xi.items.BATTLE_BOOTS               },
        { cutoff = 462, itemId = xi.items.SILK_SLOPS                 },
        { cutoff = 616, itemId = xi.items.TIGER_MANTLE               },
        { cutoff = 693, itemId = xi.items.BASCINET                   },
        { cutoff = 747, itemId = xi.items.HI_ELIXIR                  },
        { cutoff = 824, itemId = xi.items.DARKSTEEL_INGOT            },
        { cutoff = 901, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
    },

    [xi.ki.CHOCOBO_KEY] =
    {
        { cutoff =  190, itemId = xi.items.APTUS_EARRING              },
        { cutoff =  285, itemId = xi.items.STEARC_SUBLIGAR            },
        { cutoff =  571, itemId = xi.items.VARIUS_TORQUE              },
        { cutoff =  595, itemId = xi.items.SPOOL_OF_GOLD_THREAD       },
        { cutoff =  643, itemId = xi.items.HI_ETHER_II                },
        { cutoff =  714, itemId = xi.items.HI_POTION_P2               },
        { cutoff =  785, itemId = xi.items.SPOOL_OF_MALBORO_FIBER     },
        { cutoff =  856, itemId = xi.items.VIAL_OF_BLACK_BEETLE_BLOOD },
        { cutoff =  927, itemId = xi.items.VIAL_OF_FIEND_BLOOD        },
        { cutoff =  995, itemId = xi.items.SQUARE_OF_RAINBOW_CLOTH    },
        { cutoff = 1043, itemId = xi.items.SQUARE_OF_RAXA             },
        { cutoff = 1067, itemId = xi.items.SLAB_OF_GRANITE            },
        { cutoff = 1115, itemId = xi.items.VILE_ELIXIR                },
        { cutoff = 1186, itemId = xi.items.PHOENIX_FEATHER            },
    },

    [xi.ki.TONBERRY_KEY] =
    {
        { cutoff =  291, itemId = xi.items.ESPRIT_BELT                },
        { cutoff =  600, itemId = xi.items.FETTLE_BELT                },
        { cutoff =  636, itemId = xi.items.ANGELSTONE                 },
        { cutoff =  654, itemId = xi.items.DEATHSTONE                 },
        { cutoff =  690, itemId = xi.items.CHUNK_OF_DARKSTEEL_ORE     },
        { cutoff =  708, itemId = xi.items.DIAMOND                    },
        { cutoff =  744, itemId = xi.items.EMERALD                    },
        { cutoff =  780, itemId = xi.items.SPOOL_OF_GOLD_THREAD       },
        { cutoff =  798, itemId = xi.items.HI_POTION_P3               },
        { cutoff =  816, itemId = xi.items.CHUNK_OF_PLATINUM_ORE      },
        { cutoff =  834, itemId = xi.items.CHUNK_OF_ORICHALCUM_ORE    },
        { cutoff =  870, itemId = xi.items.RUBY                       },
        { cutoff =  883, itemId = xi.items.SAPPHIRE                   },
        { cutoff =  901, itemId = xi.items.SCROLL_OF_CURE_V           },
        { cutoff =  919, itemId = xi.items.SCROLL_OF_RAISE_III        },
        { cutoff =  937, itemId = xi.items.SCROLL_OF_THUNDER_III      },
        { cutoff =  955, itemId = xi.items.SPINEL                     },
        { cutoff =  973, itemId = xi.items.TOPAZ                      },
        { cutoff = 1082, itemId = xi.items.VILE_ELIXIR                },
    },
}

local function givePrize(player, ki)
    if not player:hasKeyItem(ki) then
        player:showText(player, ID.text.NO_KEY)
    else
        local p = prizes[ki]
        if p ~= nil then
            -- determine prize
            local prize = nil
            local roll = math.random(p[#p].cutoff)
            for i = 1, #p do
                if roll <= p[i].cutoff then
                    prize = p[i]
                    break
                end
            end

            -- determine augments
            local addAug = {}
            if prize.augments ~= nil then
                local pAug = prize.augments
                local alreadyRolled = {}
                for i = 1, 4 do
                    roll = math.random(0, #pAug)
                    local a = pAug[roll]
                    if a ~= nil and alreadyRolled[a[1]] == nil then
                        alreadyRolled[a[1]] = true
                        table.insert(addAug, a[1])
                        table.insert(addAug, math.random(a[2], a[3]))
                    end
                end
            end

            for i = #addAug, 7 do
                table.insert(addAug, 0)
            end

            -- give prize
            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, prize.itemId)
            else
                player:addItem(prize.itemId, 1, unpack(addAug))
                player:messageSpecial(ID.text.ITEM_OBTAINED, prize.itemId)
                player:delKeyItem(ki)
            end
        end
    end
end

entity.onTrade = function(player, npc, trade)
end

local argumentKeyItems =
{
    [1] =
    {
        xi.ki.CRIMSON_KEY,
        xi.ki.VIRIDIAN_KEY,
        xi.ki.AMBER_KEY,
        xi.ki.AZURE_KEY,
        xi.ki.IVORY_KEY,
        xi.ki.EBON_KEY,
        xi.ki.PRISMATIC_KEY,
    },

    [2] =
    {
        xi.ki.WHITE_CORAL_KEY,
        xi.ki.BLUE_CORAL_KEY,
        xi.ki.PEACH_CORAL_KEY,
        xi.ki.BLACK_CORAL_KEY,
        xi.ki.RED_CORAL_KEY,
        xi.ki.ANGEL_SKIN_KEY,
        xi.ki.OXBLOOD_KEY,
    },

    [3] =
    {
        xi.ki.MOOGLE_KEY,
        xi.ki.BIRD_KEY,
        xi.ki.CACTUAR_KEY,
        xi.ki.BOMB_KEY,
        xi.ki.CHOCOBO_KEY,
        xi.ki.TONBERRY_KEY,
        xi.ki.BEHEMOTH_KEY,
    },
}

entity.onTrigger = function(player, npc)
    local receivedNexusCape = player:getCharVar("receivedNexusCape")
    local kiArgs = { 0, 0, 0 }

    for argNum = 1, 3 do
        for bitPos, keyItem in ipairs(argumentKeyItems[argNum]) do
            if not player:hasKeyItem(keyItem) then
                kiArgs[argNum] = utils.mask.setBit(kiArgs[argNum], bitPos, true)
            end
        end
    end

    local arg4 =
        ((xi.settings.main.ENABLE_ACP == 0 or kiArgs[1] == 254) and 2 or 0) +
        ((xi.settings.main.ENABLE_AMK == 0 or kiArgs[2] == 254) and 4 or 0) +
        ((xi.settings.main.ENABLE_ASA == 0 or kiArgs[3] == 254) and 8 or 0) +
        ((xi.settings.main.ENABLE_ACP * xi.settings.main.ENABLE_AMK * xi.settings.main.ENABLE_ASA == 0 or receivedNexusCape == 1) and 16 or 0) +
        ((xi.settings.main.ENABLE_ACP * xi.settings.main.ENABLE_AMK * xi.settings.main.ENABLE_ASA == 0 or receivedNexusCape == 0) and 32 or 0)

    player:startEvent(10099, kiArgs[1], kiArgs[2], kiArgs[3], arg4, 0, 0, 0, 0)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 10099 then
        if
            option == 16777216 and
            player:getCharVar("receivedNexusCape") == 0 and
            npcUtil.giveItem(player, xi.items.NEXUS_CAPE)
        then
            player:setCharVar("receivedNexusCape", 1)

        elseif
            option == 33554432 or
            (option == 16777216 and player:getCharVar("receivedNexusCape") == 0)
        then
            player:addUsedItem(xi.items.NEXUS_CAPE)

        elseif option >= 1 and option <= 20 then
            local ki = optionToKI[option]
            if ki ~= nil then
                givePrize(player, ki)
            end
        end
    end
end

return entity
