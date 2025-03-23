QBCore = exports['qb-core']:GetCoreObject()

local ticketCooldown = false

function CheckSpeedCamera(playerPed)
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
            local playerSpeed = GetEntitySpeed(vehicle) * 3.6 -- m/s to km/h
            local playerPos = GetEntityCoords(vehicle)

            for speedLimit, data in pairs(Config.Zones) do
                for _, zone in ipairs(data.zones) do
                    local zonePos = vector3(zone.x, zone.y, zone.z)
                    local distance = #(playerPos - zonePos)

                    if distance <= zone.radius then
                        if playerSpeed > speedLimit and not ticketCooldown then
                            TriggerServerEvent('rico_speedcameras:speedingTicket', speedLimit, data.price)
                            break
                        end
                    end
                end
            end
        end
    end
end


function StartTicketCooldown()
    ticketCooldown = true
    SetTimeout(3000, function()
    ticketCooldown = false
    end)
end

CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        CheckSpeedCamera(playerPed)
    end
end)
