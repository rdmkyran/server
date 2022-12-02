-----------------------------------
-- Trust: Abenzio
-----------------------------------
require("scripts/globals/trust")
require("scripts/globals/items")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

local isWearingMandragoraGear = function(player)
    local wearingHead = player:getEquipID(xi.slot.HEAD) == xi.items.MANDRAGORA_MASQUE or player:getEquipID(xi.slot.HEAD) == xi.items.MANDRAGORA_MASQUE_P1
    local wearingBody = player:getEquipID(xi.slot.BODY) == xi.items.MANDRAGORA_SUIT or player:getEquipID(xi.slot.BODY) == xi.items.MANDRAGORA_SUIT_P1
    return wearingHead and wearingBody
end

spellObject.onMobSpawn = function(mob)
    local master = mob:getMaster()
    if isWearingMandragoraGear(master) then
        xi.trust.message(mob, xi.trust.message_offset.SPAWN)
    end
end

spellObject.onMobDespawn = function(mob)
    local master = mob:getMaster()
    if isWearingMandragoraGear(master) then
        xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
    end
end

spellObject.onMobDeath = function(mob)
    local master = mob:getMaster()
    if isWearingMandragoraGear(master) then
        xi.trust.message(mob, xi.trust.message_offset.DEATH)
    end
end

return spellObject
