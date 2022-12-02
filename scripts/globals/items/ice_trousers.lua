-----------------------------------
-- ID: 15651
-- Item: Ice Trousers
-- Item Effect: Ice Spikes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/items")
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ICE_SPIKES)
    if effect ~= nil and effect:getSubType() == xi.items.ICE_TROUSERS then
        target:delStatusEffect(xi.effect.ICE_SPIKES)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ICE_SPIKES, 15, 0, 180, 15651)
end

return itemObject
