local MKDEBUGSHOW = false -- shows polyzone and onscreen closest door perms
-------------------------------------
-- remove player from vehicle THEN pedwarp
-- 2064258414 - is this the proper spin wheel????
-------------------------------------
-- perms for security
-- {
--     diamond.owner
--     diamond.manager
--     casino.manager
--     hotel.manager
--     diamond.staff
--     diamond.penthouse
--     casino.vip
-- }
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
-- Door Detection
local cd_distance = 25
local closestDoor = nil
-----------------------------------------
function AddElevatorZone(floor, floorList, shaftType)
    table.insert(ElevatorPZones, CircleZone:Create(vector3(floor.entryPos[1], floor.entryPos[2], floor.entryPos[3]), ElevatorRadius, {
        name=floor.name,
        useZ=true,
        data={'elevator', floor, floorList, shaftType},
        debugPoly=MKDEBUGSHOW
    }))    
end
-----------------------------------------
function AddPlayerWarpZone(warp)
    table.insert(PlayerPZones, CircleZone:Create(vector3(warp.entryPos[1], warp.entryPos[2], warp.entryPos[3]), PlayerRadius, {
        name=warp.name,
        useZ=true,
        data={'player',warp},
        debugPoly=MKDEBUGSHOW
    }))    
end
-----------------------------------------
function AddVehicleWarpZone(warp)
    table.insert(VehiclePZones, CircleZone:Create(vector3(warp.entryPos[1], warp.entryPos[2], warp.entryPos[3]), VehicleRadius, {
        name=warp.name,
        useZ=true,
        data={'vehicle',warp},
        debugPoly=MKDEBUGSHOW
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
drawOnScreen2D = function(text, r, g, b, a, x, y, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end
-----------------------------------------
function UpdateDoorState(CurrDoor)
    if CurrDoor.DoorDistance <= cd_distance then
        cd_distance = CurrDoor.DoorDistance
        closestDoor = CurrDoor
    end
    if CurrDoor.locked then
        -- DoorSystemSetDoorState(CurrDoor.DOOR_UUID, 6, false, false)
        DoorSystemSetDoorState(CurrDoor.DOOR_UUID, 4, false, false) -- force close
        DoorSystemSetDoorState(CurrDoor.DOOR_UUID, 1, false, false) -- lock
        DoorSystemSetAutomaticRate(CurrDoor.DOOR_UUID, 1.7, 0, 0)
        --
        FreezeEntityPosition(CurrDoor.doorObj, true) -- these seem to still work best to hard lock/unlock
        
    else
        DoorSystemSetDoorState(CurrDoor.DOOR_UUID, 0, false, false) -- unlock
        DoorSystemSetAutomaticRate(CurrDoor.DOOR_UUID, 1.7, 0, 0)
        --
        FreezeEntityPosition(CurrDoor.doorObj, false)
    end
end
-----------------------------------------
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
        pCoords = GetEntityCoords(PlayerPedId())
        -----------------------------------------
        for door = 1, #LockedDoors do
            local DoorDistance = #(pCoords -  LockedDoors[door].vec)
            if DoorDistance < 25 then         
                LockedDoors[door].doorObj = GetClosestObjectOfType(LockedDoors[door].vec.x, LockedDoors[door].vec.y, LockedDoors[door].vec.z, 1.0, LockedDoors[door].hash, false, false, false);
                if LockedDoors[door].doorObj then   
                    LockedDoors[door].DOOR_UUID = 'ld_'..door..''
                    LockedDoors[door].DoorDistance =  DoorDistance
                    if not IsDoorRegisteredWithSystem(LockedDoors[door].DOOR_UUID) then
                        AddDoorToSystem(LockedDoors[door].DOOR_UUID, LockedDoors[door].doorObj, LockedDoors[door].vec, false, false, false)
                        -- print('Adding: ['.. LockedDoors[door].DOOR_UUID ..'] '..LockedDoors[door].name..'')
                        UpdateDoorState(LockedDoors[door])
                    else
                        UpdateDoorState(LockedDoors[door])
                    end
                end
            elseif LockedDoors[door].doorObj then
                -- print('Removing: ['.. LockedDoors[door].DOOR_UUID ..'] '..LockedDoors[door].name..'')
                RemoveDoorFromSystem(LockedDoors[door].DOOR_UUID)
                LockedDoors[door].doorObj = nil
            end
        end
        
        -----------------------------------------
        for door = 1, #UnlockedDoors do
            local DoorDistance = #(pCoords -  UnlockedDoors[door].vec)
            if DoorDistance < 25 then         
                UnlockedDoors[door].doorObj = GetClosestObjectOfType(UnlockedDoors[door].vec.x, UnlockedDoors[door].vec.y, UnlockedDoors[door].vec.z, 1.0, UnlockedDoors[door].hash, false, false, false);
                if UnlockedDoors[door].doorObj then   
                    UnlockedDoors[door].DOOR_UUID = 'ud_'..door..''
                    UnlockedDoors[door].DoorDistance =  DoorDistance
                    if not IsDoorRegisteredWithSystem(UnlockedDoors[door].DOOR_UUID) then
                        AddDoorToSystem(UnlockedDoors[door].DOOR_UUID, UnlockedDoors[door].doorObj, UnlockedDoors[door].vec, false, false, false)
                        -- print('Adding: ['.. UnlockedDoors[door].DOOR_UUID ..'] '..UnlockedDoors[door].name..'')
                        UpdateDoorState(UnlockedDoors[door])
                    else
                        UpdateDoorState(UnlockedDoors[door])
                    end
                end
            elseif UnlockedDoors[door].doorObj then
                -- print('Removing: ['.. UnlockedDoors[door].DOOR_UUID ..'] '..UnlockedDoors[door].name..'')
                RemoveDoorFromSystem(UnlockedDoors[door].DOOR_UUID)
                UnlockedDoors[door].doorObj = nil
            end
        end
        -----------------------------------------
        cd_distance = 25
        closestDoor = nil
        -----------------------------------------
        for door = 1, #AlterableDoors do
            local DoorDistance = #(pCoords -  AlterableDoors[door].vec)
            if DoorDistance < 25 then         
                AlterableDoors[door].doorObj = GetClosestObjectOfType(AlterableDoors[door].vec.x, AlterableDoors[door].vec.y, AlterableDoors[door].vec.z, 1.0, AlterableDoors[door].hash, false, false, false);
                if AlterableDoors[door].doorObj then   
                    AlterableDoors[door].DOOR_UUID = 'ad_'..door..''
                    AlterableDoors[door].DoorDistance =  DoorDistance
                    if not IsDoorRegisteredWithSystem(AlterableDoors[door].DOOR_UUID) then
                        AddDoorToSystem(AlterableDoors[door].DOOR_UUID, AlterableDoors[door].doorObj, AlterableDoors[door].vec, false, false, false)
                        -- print('Adding: ['.. AlterableDoors[door].DOOR_UUID ..'] '..AlterableDoors[door].name..'')
                        UpdateDoorState(AlterableDoors[door])
                    else
                        UpdateDoorState(AlterableDoors[door])
                    end
                end
            elseif AlterableDoors[door].doorObj then
                -- print('Removing: ['.. AlterableDoors[door].DOOR_UUID ..'] '..AlterableDoors[door].name..'')
                RemoveDoorFromSystem(AlterableDoors[door].DOOR_UUID)
                AlterableDoors[door].doorObj = nil
            end
        end
        -----------------------------------------
        if closestDoor then
            if MKDEBUGSHOW then
                if closestDoor.locked then
                    drawOnScreen2D('~r~MKCASINODEBUG ~o~ Closest DOOR [~w~'..closestDoor.DOOR_UUID..'~o~] Locked: ~r~ true', 255, 255, 255, 255, 0.05, 0.15, 0.3)
                else
                    drawOnScreen2D('~r~MKCASINODEBUG ~o~ Closest DOOR [~w~'..closestDoor.DOOR_UUID..'~o~] Locked: ~g~ false', 255, 255, 255, 255, 0.05, 0.15, 0.3)
                end
            end
        end 
        -----------------------------------------
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
    ElevatorPList = ComboZone:Create(ElevatorPZones, {name="ElevatorPZones", debugPoly=false})
    VehiclePList = ComboZone:Create(VehiclePZones, {name="VehiclePZones", debugPoly=false})
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
            drawOnScreen2D('~w~Press "E" to Select a floor', 186, 218, 85, 1, 0.05, 0.15, 0.3)
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