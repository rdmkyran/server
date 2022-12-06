-----------------------------------
-- Area: Lower Jeuno
--  NPC: Amalasanda
-- Type: Tenshodo Merchant
-- !pos 28.149 2.899 -44.780 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.TENSHODO_MEMBERS_CARD) then
        local stock =
        {
            xi.items.BAMBOO_STICK,                 144,
            xi.items.SQUARE_OF_SILK_CLOTH,       21000,
            xi.items.KOMA,                        220,
            xi.items.LUMP_OF_TAMA_HAGANE,         7000,
            xi.items.POT_OF_URUSHI,             73530,
            xi.items.UCHITAKE,                     40,
            xi.items.TSURARA,                      40,
            xi.items.KAWAHORI_OGI,                 40,
            xi.items.MAKIBISHI,                    40,
            xi.items.HIRAISHIN,                    40,
            xi.items.MIZU_DEPPO,                   40,
            xi.items.SHIHEI,                      125,
            xi.items.JUSATSU,                     125,
            xi.items.KAGINAWA,                    125,
            xi.items.SAIRUI_RAN,                  125,
            xi.items.KODOKU,                      125,
            xi.items.SHINOBI_TABI,                125,
            xi.items.BOX_OF_STICKY_RICE,          316,
            xi.items.ONZ_OF_TURMERIC,             645,
            xi.items.ONZ_OF_CORIANDER,           1585,
            xi.items.SPRIG_OF_HOLY_BASIL,         800,
            xi.items.ONZ_OF_CURRY_POWDER,         990,
            xi.items.JAR_OF_GROUND_WASABI,       2595,
            xi.items.BOTTLE_OF_RICE_VINEGAR,      200,
            xi.items.BUNDLE_OF_SHIRATAKI,         492,
            xi.items.BAG_OF_BUCKWHEAT_FLOUR,     5000,
            xi.items.SCROLL_OF_KATON_ICHI,       2331,
            xi.items.SCROLL_OF_HYOTON_ICHI,      2331,
            xi.items.SCROLL_OF_HUTON_ICHI,       2331,
            xi.items.SCROLL_OF_DOTON_ICHI,       2331,
            xi.items.SCROLL_OF_RAITON_ICHI,      2331,
            xi.items.SCROLL_OF_SUITON_ICHI,      2331,
            xi.items.SCROLL_OF_JUBAKU_ICHI,      2849,
            xi.items.SCROLL_OF_HOJO_ICHI,        2849,
            xi.items.SCROLL_OF_KURAYAMI_ICHI,    2849,
            xi.items.SCROLL_OF_DOKUMORI_ICHI,    2849,
            xi.items.SCROLL_OF_TONKO_ICHI,       2849,
            xi.items.SCROLL_OF_MONOMI_ICHI,      9590,
            xi.items.SCROLL_OF_RECALL_JUGNER,   60750,
            xi.items.SCROLL_OF_RECALL_PASHH,    60750,
            xi.items.SCROLL_OF_RECALL_MERIPH,   60750,
            xi.items.SCROLL_OF_TELEPORT_VAHZL,  34656,
            xi.items.SCROLL_OF_TELEPORT_YHOAT,  34656,
            xi.items.SCROLL_OF_TELEPORT_ALTEP,  34656,
            xi.items.SCROLL_OF_TELEPORT_HOLLA,  34656,
            xi.items.SCROLL_OF_TELEPORT_DEM,    34656,
            xi.items.SCROLL_OF_TELEPORT_MEA,    34656,
            xi.items.SCROLL_OF_DRAIN,           10428,
            xi.items.SCROLL_OF_ASPIR,           12850,
            xi.items.SCROLL_OF_BLAZE_SPIKES,    10428,
            xi.items.SCROLL_OF_WARP,            11953,
            xi.items.SCROLL_OF_WARP_II,         37200,
            xi.items.SCROLL_OF_RETRACE,         32320,
            xi.items.SCROLL_OF_SLEEPGA_II,      67818,
            xi.items.SCROLL_OF_UTSUSEMI_ICHI,   13133,
            xi.items.SCROLL_OF_MAGES_BALLAD,    11830,
        }

        player:showText(npc, ID.text.AMALASANDA_SHOP_DIALOG)
        xi.shop.general(player, stock)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
