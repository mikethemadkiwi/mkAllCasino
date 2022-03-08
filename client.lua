-------------------------------------
-- vehicle warp.
-- remove player from vehicle THEN pedwarp
-------------------------------------
Citizen.CreateThread(function()
    RequestAllIpls()
end)
function RequestAllIpls()
    RequestIpl("vw_casino_main");
    RequestIpl("vw_casino_carpark");
    RequestIpl("vw_casino_garage");
    RequestIpl("vw_casino_penthouse");
    RequestIpl("hei_dlc_casino_aircon");
    RequestIpl("hei_dlc_casino_aircon_lod");
    RequestIpl("hei_dlc_casino_door");
    RequestIpl("hei_dlc_casino_door_lod");
    RequestIpl("hei_dlc_vw_roofdoors_locked");
    RequestIpl("hei_dlc_windows_casino");
    RequestIpl("hei_dlc_windows_casino_lod");
    RequestIpl("vw_ch3_additions");
    RequestIpl("vw_ch3_additions_long_0");
    RequestIpl("vw_ch3_additions_strm_0");
    RequestIpl("vw_dlc_casino_door");
    RequestIpl("vw_dlc_casino_door_lod");
    RequestIpl("vw_casino_billboard");
    RequestIpl("vw_casino_billboard_lod(1)");
    RequestIpl("vw_casino_billboard_lod");
    RequestIpl("vw_int_placement_vw");
    RequestIpl("vw_dlc_casino_apart");  
    ActivateInteriorEntitySet(274689, "Set_Pent_Arcade_Retro")  
end
-----------------------------------------
local isInZone = false
local lastInteractedZone = nil
-----------------------------------------
-- Stores polyzone objects and thier data.
local ElevatorPZones = {}
local VehiclePZones = {}
local PlayerPZones = {}
-----------------------------------------
-- Stores polyzone event trigger zones.
local ElevatorPList = {}
local VehiclePList = {}
local PlayerPList = {}
-----------------------------------------
-- detection size for the  trigger zones.
local ElevatorRadius = 1.5
local VehicleRadius = 5.0
local PlayerRadius = 1.0
-----------------------------------------
function AddElevatorZone(floor, floorList, shaftType)
    table.insert(ElevatorPZones, CircleZone:Create(vector3(floor.entryPos[1], floor.entryPos[2], floor.entryPos[3]), ElevatorRadius, {
        name=floor.name,
        useZ=true,
        data={'elevator', floor, floorList, shaftType},
        debugPoly=false
    }))    
end
-----------------------------------------
function AddPlayerWarpZone(warp)
    table.insert(PlayerPZones, CircleZone:Create(vector3(warp.entryPos[1], warp.entryPos[2], warp.entryPos[3]), PlayerRadius, {
        name=warp.name,
        useZ=true,
        data={'player',warp},
        debugPoly=false
    }))    
end
-----------------------------------------
function AddVehicleWarpZone(warp)
    table.insert(VehiclePZones, CircleZone:Create(vector3(warp.entryPos[1], warp.entryPos[2], warp.entryPos[3]), VehicleRadius, {
        name=warp.name,
        useZ=true,
        data={'vehicle',warp},
        debugPoly=false
    }))    
end
-----------------------------------------
function WarpPlayer(zone)
    local ped = PlayerPedId()
    FreezeEntityPosition(PlayerPedId(), true)
    DoScreenFadeOut(1000)
    while IsScreenFadingOut() do Citizen.Wait(0) end
    SetEntityCoords(ped, zone.exitPos.x, zone.exitPos.y, zone.exitPos.z - 0.8)
    Citizen.Wait(500)
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityHeading(ped, zone.exitHeading)
    DoScreenFadeIn(1000)
    while IsScreenFadingIn() do Citizen.Wait(0)	end
end
-----------------------------------------
function WarpVehicle(zone)
    print('i should have warped a vehicle')
    -- check vehicle collision of location for placement. the tp WITH players.
    local ped = PlayerPedId()    
    local vehicle = GetVehiclePedIsIn(ped, true)
    FreezeEntityPosition(ped, true)
    FreezeEntityPosition(vehicle, true)
    DoScreenFadeOut(1000)
    while IsScreenFadingOut() do Citizen.Wait(0) end
    SetEntityCoords(vehicle, zone.exitPos.x, zone.exitPos.y, zone.exitPos.z - 0.8)
    Citizen.Wait(500)
    FreezeEntityPosition(ped, false)
    FreezeEntityPosition(vehicle, false)
    SetEntityHeading(ped, zone.exitHeading)
    DoScreenFadeIn(1000)
    while IsScreenFadingIn() do Citizen.Wait(0)	end
end
-----------------------------------------
function WarpVeh2Foot(zone)
    print('i should have warped a player after deleting thier vehicle')
    -- remove player from vehicle, delete vehicle then teleport inside.
end
-----------------------------------------
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
        -----------------------------------------
        for door = 1, #LockedDoors do
            local door = GetClosestObjectOfType(LockedDoors[door].vec.x, LockedDoors[door].vec.y, LockedDoors[door].vec.z, 1.0, LockedDoors[door].hash, false, false, false);            
            FreezeEntityPosition(door, true)
        end
        -----------------------------------------
        for door = 1, #UnlockedDoors do
            local door = GetClosestObjectOfType(UnlockedDoors[door].vec.x, UnlockedDoors[door].vec.y, UnlockedDoors[door].vec.z, 1.0, UnlockedDoors[door].hash, false, false, false);
            FreezeEntityPosition(door, false)
        end
        -----------------------------------------
        for door = 1, #AlterableDoors do
            local door = GetClosestObjectOfType(AlterableDoors[door].vec.x, AlterableDoors[door].vec.y, AlterableDoors[door].vec.z, 1.0, AlterableDoors[door].hash, false, false, false);
            FreezeEntityPosition(door, AlterableDoors[door].locked)
        end
    end
end)
-----------------------------------------
Citizen.CreateThread(function()
    for warp = 1, #PlayerTeleports do
        AddPlayerWarpZone(PlayerTeleports[warp])
    end
    for floor = 1, #ElevatorShaft.Main do
        AddElevatorZone(ElevatorShaft.Main[floor], ElevatorShaft.Main, 'Public')
    end
    for floor = 1, #ElevatorShaft.Staff do
        AddElevatorZone(ElevatorShaft.Staff[floor], ElevatorShaft.Staff, 'Staff')
    end
    for floor = 1, #ElevatorShaft.Utilities do
        AddElevatorZone(ElevatorShaft.Utilities[floor], ElevatorShaft.Utilities, 'Utilities')
    end
    for floor = 1, #ElevatorShaft.Vault do
        AddElevatorZone(ElevatorShaft.Vault[floor], ElevatorShaft.Vault, 'Secure')
    end
    for veh = 1, #VehicleTeleports do
        AddVehicleWarpZone(VehicleTeleports[veh])
    end
    -- Make the PloyZones and Behaviours.
    PlayerPList = ComboZone:Create(PlayerPZones, {name="PlayerPZones", debugPoly=false})
    ElevatorPList = ComboZone:Create(ElevatorPZones, {name="ElevatorPZones", debugPoly=true})
    VehiclePList = ComboZone:Create(VehiclePZones, {name="VehiclePZones", debugPoly=true})
    -- Listen to Movement in them and trigger responses
    -----------------------------------------
    PlayerPList:onPlayerInOut(function(isPointInside, point, zone)
        if zone then
            if isPointInside then
                lastInteractedZone = zone.data
                isInZone = true
                local ped = PlayerPedId()
                if IsPedOnFoot(ped) then
                    WarpPlayer(zone.data[2])
                else
                    WarpVeh2Foot(zone.data[2])
                end       
            else
                isInZone = false
            end
        end
    end)
    -----------------------------------------
    ElevatorPList:onPlayerInOut(function(isPointInside, point, zone)
        if zone then
            if isPointInside then
                lastInteractedZone = zone.data
                isInZone = true 
              else
                isInZone = false
              end
        end
    end)
    -----------------------------------------
    VehiclePList:onPlayerInOut(function(isPointInside, point, zone)
        if zone then
            if isPointInside then  
                lastInteractedZone = zone.data             
                isInZone = true
                local ped = PlayerPedId()
                if IsPedOnFoot(ped) then
                    WarpPlayer(zone.data[2])
                else
                    WarpVehicle(zone.data[2])
                end       
            else
                isInZone = false
            end
        end
    end)
    -----------------------------------------
end)
-----------------------------------------
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if isInZone == true then
            if IsControlJustPressed(0, 51) then
                if lastInteractedZone[1] == 'elevator' then 
                    SendNUIMessage({
                        elevator = lastInteractedZone
                    })
                end
            end
        else            
            SendNUIMessage({
                closeElevatorMenu = true
            })
        end
    end
end)
-----------------------------------------
RegisterNUICallback('nuifocus', function(nuistate, cb)    
    SetNuiFocus(nuistate.state, nuistate.state)
    cb(true)
end)
-----------------------------------------
RegisterNUICallback('floorSelected', function(zone, cb)
    WarpPlayer(zone[2])
    cb(true)
end)