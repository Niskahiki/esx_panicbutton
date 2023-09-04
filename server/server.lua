ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx_panicbutton:controlPressed')
AddEventHandler('esx_panicbutton:controlPressed', function(playerCoords)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == 'police' then 
        ShowAlert(playerCoords)
    end
end)

function ShowAlert(coords) 
    local players = ESX.GetPlayers()

    for _, player in ipairs(players) do 
        local xPlayer = ESX.GetPlayerFromId(player)
        if isPlayerPolice(xPlayer) then 
            local playerInGameName = xPlayer.getName()
            if playerInGameName then 
                TriggerClientEvent('esx:showNotification', player, "~r~Alert: ~c~Police officer panic button is pressed by: ~b~" .. playerInGameName)
            else
                TriggerClientEvent('esx:showNotification', player, "~r~Alert: ~c~Police officer panic button is pressed.")
            end
            TriggerClientEvent('esx_panicbutton:showMarker', player, coords)
        end
    end

end

function isPlayerPolice(xPlayer)
    return xPlayer and xPlayer.job.name == 'police'
end