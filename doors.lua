----------------------------------------
-- {
--     name = "EXAMPLE", 
    -- hash = 7615432876,
    -- vec = vector3(0, 0, 0),
--     locked = false,
--     restricted =  false,
    -- restrictedGroups = {}
-- }
----------------------------------------
LockedDoors = {
    {
        name = "Doorfromofficetoboss", 
        hash = 401003935,
        vec = vector3(2500.968, -236.680, -54.974),
        locked = true,
        restricted =  false,
        restrictedGroups = {}
    }
}
----------------------------------------
UnlockedDoors = {
    {
        name = "Public Casino Elevator Left", 
        hash = -1240156945,
        vec = vector3(1085.463, 213.385, -50.2),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Public Casino Elevator Right", 
        hash = -1240156945,
        vec = vector3(1084.402, 214.446, -50.2),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Utilities Casino Elevator Left", 
        hash = -1240156945,
        vec = vector3(1118.639, 267.64, -52.041),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Utilities Casino Elevator Right", 
        hash = -1240156945,
        vec = vector3(1120.139, 267.64, -52.041),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Utilities Management Elevator Left", 
        hash = -1240156945,
        vec = vector3(1118.639, 267.64, -46.841),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Utilities Management Elevator Right", 
        hash = -1240156945,
        vec = vector3(1120.139, 267.64, -46.841),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Utilities Vault Elevator Left", 
        hash = -1240156945,
        vec = vector3(2485.624, -254.447, -71.688),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Utilities Vault Elevator Right", 
        hash = -1240156945,
        vec = vector3(2485.624, -252.947, -71.688),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Operations Vault Elevator Left", 
        hash = -1240156945,
        vec = vector3(2520.204, -280.14, -59.724),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Operations Vault Elevator Right", 
        hash = -1240156945,
        vec = vector3(2520.204, -278.64, -59.724),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Operations Vault Elevator Left", 
        hash = -1240156945,
        vec = vector3(2520.246, -279.97, -71.715),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = "Operations Vault Elevator Right", 
        hash = -1240156945,
        vec = vector3(2520.246, -278.47, -71.715),
        locked = false,
        restricted =  false,
        restrictedGroups = {}
    }            
}
----------------------------------------
AlterableDoors = {}



        ----------------------------------------- make me a door damn you.
        local vaultouterL = GetClosestObjectOfType(2464.183, -280.289, -71.694, 1.0, -1549164937, false, false, false);
        FreezeEntityPosition(vaultouterL, false)
        local vaultouterR = GetClosestObjectOfType(2464.183, -278.204, -71.694, 1.0, -1710290106, false, false, false);
        FreezeEntityPosition(vaultouterR, false)
        local vaultinnerL = GetClosestObjectOfType(2492.28, -237.459, -71.694, 1.0, -1710290106, false, false, false);
        FreezeEntityPosition(vaultinnerL, false)
        local vaultinnerR = GetClosestObjectOfType(2492.28, -239.544, -71.694, 1.0, -1549164937, false, false, false);
        FreezeEntityPosition(vaultinnerR, false)
        local loadingdock = GetClosestObjectOfType(2515.308, -281.598, -64.573, 1.0, 270965283, false, false, false);
        FreezeEntityPosition(loadingdock, false)
        local operationsfrontL = GetClosestObjectOfType(2506.721, -268.511, -58.573, 1.0, 1938754783, false, false, false);
        FreezeEntityPosition(operationsfrontL, false)
        local operationsfrontR = GetClosestObjectOfType(2506.721, -270.511, -58.573, 1.0, 1938754783, false, false, false);
        FreezeEntityPosition(operationsfrontR, false)
        local hotelsidestairs = GetClosestObjectOfType(2509.743, -260.342, -38.973, 1.0, 272844368, false, false, false);
        FreezeEntityPosition(hotelsidestairs, false)
        local operVAULTL = GetClosestObjectOfType(2522.89, -285.465, -58.473, 1.0, -2050208642, false, false, false);
        FreezeEntityPosition(operVAULTL, false)