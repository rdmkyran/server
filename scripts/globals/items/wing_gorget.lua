-----------------------------------
-- ID: 15170
-- Item: wing gorget
-- Item Effect: gives regain
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/items")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.REGAIN)
    if effect ~= nil and effect:getSubType() == xi.items.BLINK_BAND then
        target:delStatusEffect(xi.effect.REGAIN)
    end
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.REGAIN) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(xi.effect.REGAIN, 5, 3, 30, 15170)
    end
end

return itemObject
