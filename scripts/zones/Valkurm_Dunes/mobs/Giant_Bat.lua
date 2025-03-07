-----------------------------------
-- Area: Valkurm Dunes (103)
--  Mob: Giant Bat
--  PH for Golden Bat
-----------------------------------
local ID = zones[xi.zone.VALKURM_DUNES]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.GOLDEN_BAT_PH, 5, 3600) -- 1 hour minimum
end

return entity
