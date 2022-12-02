-----------------------------------
-- ID: 13173
-- Item: Memento Muffler
-- Item Effect: VIT +7
-- Duration: 3 minutes
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/items")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.VIT_BOOST)
    if effect ~= nil and effect:getSubType() == xi.items.MEMENTO_MUFFLER then
        target:delStatusEffect(xi.effect.VIT_BOOST)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.VIT_BOOST, 7, 0, 300, 13173)
end

return itemObject
