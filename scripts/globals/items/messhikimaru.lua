-----------------------------------
-- ID: 17826
-- Item: Messhikimaru
-- Enchantment: Arcana Killer
-- Durration: 10 Mins
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/items")
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ARCANE_CIRCLE)
    if effect ~= nil and effect:getSubType() == xi.items.MESSHIKIMARU then
        target:delStatusEffect(xi.effect.ARCANE_CIRCLE)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ARCANE_CIRCLE, 20, 0, 600, 17826)
end

return itemObject
