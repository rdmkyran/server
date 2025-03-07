-----------------------------------
-- Reactive Armor
-- Description: Covers the user in shock spikes. Enemies that hit it take lightning damage.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = math.random(20, 30)
    local duration = 180
    local typeEffect = xi.effect.SHOCK_SPIKES
    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, power, 0, duration))
    return typeEffect
end

return mobskillObject
