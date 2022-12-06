-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Animated Spear
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/items")
local ID = require("scripts/zones/Dynamis-Xarcabard/IDs")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
    if mob:getAnimationSub() == 3 then
        SetDropRate(114, xi.items.STELLAR_FRAGMENT, 1000)
    else
        SetDropRate(114, xi.items.STELLAR_FRAGMENT, 0)
    end

    target:showText(mob, ID.text.ANIMATED_SPEAR_DIALOG)
end

entity.onMobFight = function(mob, target)
    -- TODO: add battle dialog
end

entity.onMobDisengage = function(mob)
    mob:showText(mob, ID.text.ANIMATED_SPEAR_DIALOG + 2)
end

entity.onMobDeath = function(mob, player, optParams)
    player:showText(mob, ID.text.ANIMATED_SPEAR_DIALOG + 1)
end

return entity
