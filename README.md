<h1>PedZoneWarning</h1>

 Check if a player is using a ped outside or inside of a zone and display a warning.

 <h2>Features</h2>

 * Add multiple zones all with independent settings.
 * HUD **OR** Chat warnings!
 * Configuration support in our [discord](https://discord.gg/E44eKQmGsq)!

<h2>Installation</h2>

 1. Download from [github](https://github.com/IC-Technologies/PedZoneWarning/releases).
 2. Extract.
 3. Put into resources folder.
 4. Add `start PedZoneWarning` in your server.cfg
 5. Start the server/script.
 6. Star in github 😉, Enjoy!


 <h2>Config</h2>

 ```lua
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
 ```