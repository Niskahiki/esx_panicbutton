Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(9)

        if IsControlJustPressed(0, 56) and not IsEntityDead(PlayerPedId()) then -- By default F9 key
            local playerCoords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('esx_panicbutton:controlPressed', playerCoords)
        end
    end
end)

RegisterNetEvent('esx_panicbutton:showMarker')
AddEventHandler('esx_panicbutton:showMarker', function(coords)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 137)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Police panic button alert location")
    EndTextCommandSetBlipName(blip)

    local radar = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(radar, 161)
    SetBlipColour(radar, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("")
    EndTextCommandSetBlipName(radar)

    SetNewWaypoint(coords.x, coords.y)
    SetUseWaypointAsDestination(true)

    Citizen.Wait(60000)

    RemoveBlip(blip)
    RemoveBlip(radar)
end)