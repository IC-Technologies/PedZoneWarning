    --[[
    Copyright (C) 2023 ICTechnologies

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    ]]
local zones = {}

-- @desc calculate xy distance between two vectors
-- @param vector1 the first vector
-- @param vector2 the second vector
function DistanceCalc (vector1, vector2)
    local dx = vector1.x - vector2.x
    local dy = vector1.y - vector2.y

    local r = math.sqrt(math.pow(dx, 2) + math.pow(dy, 2))

    return math.floor(r)
end

function CheckPed(ped, zone)
    for _, a in pairs(Config.Zones[zone].Peds) do
        if IsPedModel(ped, GetHashKey(a)) then
            return true
        end
    end

    return false
end

function Draw2DText(x, y, text, scale, center)
    -- Draw text on screen
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    if center then 
    	SetTextJustification(0)
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPED = PlayerPedId()
        local playerPOS = GetEntityCoords(playerPED)

        for zoneName, zone in pairs(Config.Zones) do
            zones[zoneName] = false
            if CheckPed(playerPED, zoneName) then
                local dist = DistanceCalc(playerPOS, zone.location)

                if dist > zone.radius and zone.whitelist then
                    zones[zoneName] = true                
                elseif dist <= zone.radius and not zone.whitelist then
                    zones[zoneName] = true 
                else
                    zones[zoneName] = false
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(500)

        for zoneName, state in pairs(zones) do
            if state then
                if Config.Zones[zoneName].HUD.displayOnHud then
                    while zones[zoneName] do
                        Wait(0)

                        for id, display in pairs(Config.Zones[zoneName].HUD.Displays) do
                            Draw2DText(display.x, display.y, display.text, display.scale, display.center)
                        end
                    end
                else
                    while zones[zoneName] do
                        TriggerEvent("chatMessage", Config.Zones[zoneName].text)

                        Wait(Config.Zones[zoneName].delay * 1000)
                    end
                end
            end
        end
    end
end)