
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
Config = {
    Zones = {
        ["Spawn"] = {
            whitelist = true, --Whether or not to only allow the ped(s) in this zone. If false it will display the warning while in the zone.
            location = vector3(1931.21, 2618.04, 46.28),
            radius = 75,
            HUD = {
                displayOnHud = true, --Whether or not to send the following message in chat or display on the hud.
                Displays = {
                    [1] = {
                        x = .5,
                        y = .5,
                        scale = .6,
                        center = true,
                        text = "~r~Warning! ~w~You are no longer in spawn while using the default ped!"
                    },
                    [2] = {
                        x = .5,
                        y = .55,
                        scale = .6,
                        center = true,
                        text = "~w~You can change your ped in the F1 menu."
                    },
                },
            },
            --The text and delay of the messages if "displayOnHud" is false.
            text = "^1Warning! ^0You are no longer in spawn while using the default ped! You can change your ped in the F1 menu.",
            delay = 30,
            Peds = {--Peds that trigger it.
                "a_m_y_skater_01",
            },
        },
    },
}