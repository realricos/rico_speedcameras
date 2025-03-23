QBCore = exports['qb-core']:GetCoreObject()

local finedPlayers = {}

RegisterNetEvent('rico_speedcamera:speedingTicket', function(speedLimit, price)
    local src = source
    if finedPlayers[src] then return end 
    
    finedPlayers[src] = true
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        if Player.Functions.RemoveMoney('bank', price, 'speeding-ticket') then
            TriggerClientEvent('QBCore:Notify', src, 'Du fått en böter på ' .. price .. 'kr för fortkörning.', 'error')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Du har fått en böter på ' .. price .. 'kr men du har inte råd !', 'error')
        end
    end
    
    SetTimeout(5000, function()
        finedPlayers[src] = nil
    end)
end)
