-----------------------------------
-- ID: 4422
-- Item: Orange Juice
-- Item Effect: Restores 30 MP over 1 minute and 30 seconds.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    local power = 1
    local legs = target:getEquipID(xi.slot.LEGS)
    if legs == xi.items.DREAM_TROUSERS_P1 or legs == xi.items.DREAM_PANTS_P1 then
        power = power + 1
    end

    if not target:hasStatusEffect(xi.effect.REFRESH) then
        target:addStatusEffect(xi.effect.REFRESH, power, 3, 90)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
