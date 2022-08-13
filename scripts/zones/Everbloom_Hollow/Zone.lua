-----------------------------------
-- Zone: Everbloom_Hollow
-- !zone 86
-----------------------------------
local ID = require("scripts/zones/Everbloom_Hollow/IDs")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onInstanceZoneIn = function(player, instance)
    local cs = -1

    if not player:getInstance() then
        player:setPos(-34.2, -16, 58, 32, xi.zone.BATALLIA_DOWNS_S)
    end

    local pos = player:getPos()
    if pos.x == 0 and pos.y == 0 and pos.z == 0 then
        local entrypos = instance:getEntryPos()
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot)
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

zone_object.onInstanceLoadFailed = function()
    return xi.zone.BATALLIA_DOWNS_S
end

return zone_object
