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
function ToggleEntitySet(interior, entitySet, toggle)
    if toggle then
        ActivateInteriorEntitySet(interior, entitySet, true)
    else
        DeactivateInteriorEntitySet(interior, entitySet, false)
    end
end
function RequestAllIpls()
    Citizen.Wait(1)
    loadMainIPL()
    Citizen.Wait(1)
    loadVault()
    Citizen.Wait(1)
    Print('Loaded Casino IPL')
    -- ActivateInteriorEntitySet(274689, "Set_Pent_Arcade_Retro")  
end
function loadMainIPL()
    RequestIpl("vw_casino_main");
    RequestIpl("vw_casino_carpark");
    RequestIpl("vw_casino_garage");
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
    RequestIpl("vw_int_placement_vw");
    RequestIpl("vw_casino_billboard");
    RequestIpl("vw_casino_billboard_lod(1)");
    RequestIpl("vw_casino_billboard_lod");
    RequestIpl("vw_casino_ch3_additions")
    RequestIpl("vw_casino_ch3_additions_long_0")
    RequestIpl("vw_casino_ch3_additions_strm_0")
end
function loadVault()
    local interiorid = GetInteriorAtCoords(2488.348, -267.3637, -71.64563)
    ToggleEntitySet(interiorid, "set_vault_door", true) -- Open vault
    ToggleEntitySet(interiorid, "set_spawn_group1", true) -- small locker on the sides and arts
    -- ToggleEntitySet(interiorid, "set_spawn_group2", false) -- small locker on the sides and arts
    ToggleEntitySet(interiorid, "set_vault_dressing", true) -- all the stuff that spawns on the floor
    -- ToggleEntitySet(interiorid, "set_vault_cash_01", true)
    ToggleEntitySet(interiorid, "set_vault_cash_02", true)
    ToggleEntitySet(interiorid, "set_vault_art_01", true)
    -- ToggleEntitySet(interiorid, "set_vault_art_02", true)
    ToggleEntitySet(interiorid, "set_vault_gold_01", true)
    ToggleEntitySet(interiorid, "set_vault_gold_02", true)
    ToggleEntitySet(interiorid, "set_vault_diamonds_01", true)
    ToggleEntitySet(interiorid, "set_vault_diamonds_02", true)
    -- ToggleEntitySet(interiorid, "set_vault_door_lockedxd", false) -- Locked vault door
    -- ToggleEntitySet(interiorid, "set_vault_door_broken", false) -- Vault door exloded/broken
    -- ToggleEntitySet(interiorid, "set_vault_wall_damagedxd", false) -- Vault wall damaged -- always broken?
    RefreshInterior(interiorid)
end
function loadPenthouse()
    RequestIpl("vw_casino_penthouse");
    RequestIpl("vw_dlc_casino_apart");
    local interiorid = GetInteriorAtCoords(976.63640000, 70.29476000, 115.16410000)
    local color = 3
    ToggleEntitySet(interiorid, "casino_manager_default", true)
    ToggleEntitySet(interiorid, "casino_manager_workout", true)
    ToggleEntitySet(interiorid, "set_pent_tint_shell", true)
    SetInteriorEntitySetColor(interiorid, "set_pent_tint_shell", color)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_spax_shell", true)
    SetInteriorEntitySetColor(interiorid, "vw_vwint02_pent_spax_shell", color)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_spa_shell", true)
    SetInteriorEntitySetColor(interiorid, "vw_vwint02_pent_spa_shell", color)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_sbt_shell", true)
    SetInteriorEntitySetColor(interiorid, "vw_vwint02_pent_sbt_shell", color)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_mbt_shell", true)
    SetInteriorEntitySetColor(interiorid, "vw_vwint02_pent_mbt_shell", color)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_hal_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_mb_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_lou_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_sb_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_din_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_bar_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_off_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_lv_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_ex_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_spax_window", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_spa_window", true)

    ToggleEntitySet(interiorid, "set_pent_media_bar_open", true)
    -- ToggleEntitySet(interiorid, "set_pent_media_bar_closed", true)

    ToggleEntitySet(interiorid, "set_pent_spa_bar_open", true)
    -- ToggleEntitySet(interiorid, "set_pent_spa_bar_closed", true)

    ToggleEntitySet(interiorid, "set_pent_dealer", true)
    -- ToggleEntitySet(interiorid, "set_pent_nodealer", true)

    -- local pattern = "set_pent_pattern_01"
    -- local pattern = "set_pent_pattern_02"
    -- local pattern = "set_pent_pattern_03"
    -- local pattern = "set_pent_pattern_04"
    -- local pattern = "set_pent_pattern_05"
    -- local pattern = "set_pent_pattern_06"
    -- local pattern = "set_pent_pattern_07"
    -- local pattern = "set_pent_pattern_08"
    local pattern = "set_pent_pattern_09"
    ToggleEntitySet(interiorid, pattern, true)
    SetInteriorEntitySetColor(interiorid, pattern, color)

    ToggleEntitySet(interiorid, "set_pent_arcade_retro", true)
    -- ToggleEntitySet(interiorid, "set_pent_arcade_modern", true)

    -- ToggleEntitySet(interiorid, "set_pent_clutter_01") -- trash on the floor
    -- ToggleEntitySet(interiorid, "set_pent_clutter_02") -- trash on the floor
    -- ToggleEntitySet(interiorid, "set_pent_clutter_03") -- trash on the floor
    -- ToggleEntitySet(interiorid, "set_pent_bar_clutter") -- trash on the bar

    -- ToggleEntitySet(interiorid, "set_pent_lounge_blocker") -- hitbox to block doors
    -- ToggleEntitySet(interiorid, "set_pent_guest_blocker") -- hitbox to block doors
    -- ToggleEntitySet(interiorid, "set_pent_office_blocker") -- hitbox to block doors
    -- ToggleEntitySet(interiorid, "set_pent_cine_blocker") -- hitbox to block doors
    -- ToggleEntitySet(interiorid, "set_pent_spa_blocker") -- hitbox to block doors
    -- ToggleEntitySet(interiorid, "set_pent_bar_blocker") -- hitbox to block doors

    -- ToggleEntitySet(interiorid, "set_pent_bar_party_after", true)
    -- ToggleEntitySet(interiorid, "set_pent_bar_party_0", true)
    -- ToggleEntitySet(interiorid, "set_pent_bar_party_1", true)
    ToggleEntitySet(interiorid, "set_pent_bar_party_2", true)

    ToggleEntitySet(interiorid, "set_pent_bar_light_0", true)
    ToggleEntitySet(interiorid, "set_pent_bar_light_01", true)
    ToggleEntitySet(interiorid, "set_pent_bar_light_02", true)

    -- TVs
    ToggleEntitySet(interiorid, "prop_tv_flat_03b", true)
    ToggleEntitySet(interiorid, "prop_tv_flat_michael", true)
    ToggleEntitySet(interiorid, "prop_tv_flat_01", true)
    ToggleEntitySet(interiorid, "vw_prop_vw_cinema_tv_01", true)
    ToggleEntitySet(interiorid, "v_res_tt_tvremote", true)
    ToggleEntitySet(interiorid, "vw_prop_vw_tv_rt_01a", true)

    -- Mirrors
    ToggleEntitySet(interiorid, "vw_vwint02_pent_mbt_mirror", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_mbx_drframe", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_loux_mirror", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_sbt_mirror", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_wk_mirror", true)

    -- edge blends
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_mb_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_hal_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_lou_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_sb_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_din_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_bar_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_off_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_wk_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_lv_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_spa_edgeblend", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_cin_edgeblend", true)

    ToggleEntitySet(interiorid, "vw_prop_vw_wallart_47a", true)
    -- ToggleEntitySet(interiorid, "vw_prop_vw_safedoor_office2a_l", true)
    -- ToggleEntitySet(interiorid, "vw_prop_vw_safedoor_office2a_r", true)

    -- ToggleEntitySet(interiorid, "prop_box_guncase_01a", true)
    -- ToggleEntitySet(interiorid, "prop_box_guncase_02a", true)

    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_spa_water_01", true)
    -- ToggleEntitySet(interiorid, "vw_vwint02_pent_spa_water_02", true)
    ToggleEntitySet(interiorid, "vw_vwint02_pent_spa_water_03", true)

    ToggleEntitySet(interiorid, "vw_vwint02_pent_signs", true)

    RefreshInterior(interiorid)

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
-- zone counts
local zonecount = 0
local doorcount = 0
-----------------------------------------
function AddElevatorZone(floor, floorList, shaftType)
    table.insert(ElevatorPZones, CircleZone:Create(vector3(floor.entryPos[1], floor.entryPos[2], floor.entryPos[3]), ElevatorRadius, {
        name=floor.name,
        useZ=true,
        data={'elevator', floor, floorList, shaftType},
        debugPoly=MKDEBUGSHOW
    }))
    zonecount = zonecount + 1   
end
-----------------------------------------
function AddPlayerWarpZone(warp)
    table.insert(PlayerPZones, CircleZone:Create(vector3(warp.entryPos[1], warp.entryPos[2], warp.entryPos[3]), PlayerRadius, {
        name=warp.name,
        useZ=true,
        data={'player',warp},
        debugPoly=MKDEBUGSHOW
    }))
    zonecount = zonecount + 1     
end
-----------------------------------------
function AddVehicleWarpZone(warp)
    table.insert(VehiclePZones, CircleZone:Create(vector3(warp.entryPos[1], warp.entryPos[2], warp.entryPos[3]), VehicleRadius, {
        name=warp.name,
        useZ=true,
        data={'vehicle',warp},
        debugPoly=MKDEBUGSHOW
    }))
    zonecount = zonecount + 1      
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
function doIHavePerms(zone)

    return true
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
        doorcount = 0
        -----------------------------------------
        doorcount = doorcount + #LockedDoors
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
        doorcount = doorcount + #UnlockedDoors
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
        doorcount = doorcount + #AlterableDoors
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
    PlayerPList = ComboZone:Create(PlayerPZones, {name="PlayerPZones", debugPoly=MKDEBUGSHOW})
    ElevatorPList = ComboZone:Create(ElevatorPZones, {name="ElevatorPZones", debugPoly=MKDEBUGSHOW})
    VehiclePList = ComboZone:Create(VehiclePZones, {name="VehiclePZones", debugPoly=MKDEBUGSHOW})
    -- Listen to Movement in them and trigger responses
    -----------------------------------------
    PlayerPList:onPlayerInOut(function(isPointInside, point, zone)
        if zone then
            if isPointInside then
                lastInteractedZone = zone.data
                isInZone = true
                if not zone.data[2].restricted then
                    local ped = PlayerPedId()
                    if IsPedOnFoot(ped) then
                        WarpPlayer(zone.data[2])
                    else
                        WarpVeh2Foot(zone.data[2])
                    end
                else
                    
                    -- check player then tp.

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
                if not zone.data[2].restricted then
                    local ped = PlayerPedId()
                    if IsPedOnFoot(ped) then
                        WarpPlayer(zone.data[2])
                    else
                        WarpVehicle(zone.data[2])
                    end
                else
                    -- check for permissions THEN tp. 

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
            if lastInteractedZone[1] == 'elevator' then
                if IsControlJustPressed(0, 51) then
                    SendNUIMessage({
                        elevator = lastInteractedZone
                    })
                end
                if not IsNuiFocused() then
                    drawOnScreen2D('You are in an Elevator Zone!\nPress "E" to select a floor.', 186, 218, 85, 255, 0.45, 0.25, 0.5)
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
CreateThread(function()
	while true do
		Wait(0)
        local pCoords = GetEntityCoords(PlayerPedId())
        for warp = 1, #PlayerTeleports do
            local pTP = PlayerTeleports[warp]
            local warpEntryCoords = vector3(pTP.entryPos[1], pTP.entryPos[2], pTP.entryPos[3])
            local exitDistance = #(pCoords -  warpEntryCoords)
            if exitDistance < 7.5 then
                DrawMarker(0, warpEntryCoords.x, warpEntryCoords.y, warpEntryCoords.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, 186, 218, 85, 255, true, false, 2, false, nil, nil, false)
            end
        end
        for warp = 1, #VehicleTeleports do
            local pTP = VehicleTeleports[warp]
            local warpEntryCoords = vector3(pTP.entryPos[1], pTP.entryPos[2], pTP.entryPos[3])
            local exitDistance = #(pCoords -  warpEntryCoords)
            if exitDistance < 15 then
                DrawMarker(0, warpEntryCoords.x, warpEntryCoords.y, warpEntryCoords.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, 186, 218, 85, 255, true, false, 2, false, nil, nil, false)
            end
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
    
    if not zone[2].restricted then    
        WarpPlayer(zone[2])   
    else
        -- check for permissions THEN tp.
    end
    cb(true)

end)
----------------------------------------------------
RegisterCommand('mkallcasinoinfo', function(source, args) 
    print('zones being handled:'..zonecount..'') 
    print('doors being handled:'..doorcount..'') 
end,false)





    -- RequestIpl("ch_int_placement_ch_interior_0_dlc_casino_heist_milo_")
    -- apparently no interior_1_ ??
    -- RequestIpl("ch_int_placement_ch_interior_2_dlc_plan_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_3_dlc_casino_back_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_4_dlc_casino_hotel_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_5_dlc_casino_loading_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_6_dlc_casino_vault_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_7_dlc_casino_utility_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_8_dlc_tunnel_milo_")
    -- RequestIpl("ch_int_placement_ch_interior_9_dlc_casino_shaft_milo_")