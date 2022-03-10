-----------------------------------------
------       Player TelePorts       -----
-----------------------------------------
PlayerTeleports = {
    {
        name = 'DEBUG',
        -- currently town hall second floor doorway to casino
        entryPos = vector3(-626.1, -132.6, 46.9),
        exitPos = vector3(1089.7, 209.1, -48.9999),
        exitHeading = 0.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Entrance IN',
        entryPos = vector3(935.7,47.0,81.1),
        exitPos = vector3(1089.7, 209.1, -48.9999),
        exitHeading = 328.216,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Entrance OUT',
        entryPos = vector3(1089.6083984375,205.9,-49.0),
        exitPos = vector3(934.2, 46.0, 81.1),
        exitHeading = 110.4,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Roof to Penthouse',
        entryPos = vector3(968.0, 63.5, 112.6),
        exitPos = vector3(971.5, 62.2, 112.6),
        exitHeading = 251.758,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Penthouse to Roof',
        entryPos = vector3(969.5, 63.1, 112.6),
        exitPos = vector3(966.6, 64.2, 112.6),
        exitHeading = 66.470,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'EmployeeEntrance to Operations',
        entryPos = vector3(1121.3, 214.8, -49.4),
        exitPos = vector3(2503.0, -279.0, -58.7),
        exitHeading = 265.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Operations to EmployeeEntrance',
        entryPos = vector3(2501.3, -279.0, -58.7),
        exitPos = vector3(1119.0, 213.9, -49.4),
        exitHeading = 112.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Operations to Cashier',
        entryPos = vector3(2501.2, -271.9, -58.7),
        exitPos = vector3(1119.5, 222.2, -49.4),
        exitHeading = 151.4,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Cashier to Operations',
        entryPos = vector3(1121.1, 222.0, -49.4),
        exitPos = vector3(2502.8, -271.4, -58.7),
        exitHeading = 259.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Operations to CasinoFloor',
        entryPos = vector3(2525.8, -254.00, -60.3),
        exitPos = vector3(1146.6, 242.3, -51.0),
        exitHeading = 352.950,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'CasinoFloor to Operations',
        entryPos = vector3(1146.6, 240.8, -51.0),
        exitPos = vector3(2525.6, -256.5, -60.3),
        exitHeading = 178.7,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Rooftop to Engineering',
        entryPos = vector3(959.8, 32.5, 120.2),
        exitPos = vector3(2522.2, -246.2, -24.1),
        exitHeading = 171.5,
        restricted =  false,
        restrictedGroups = {'diamond.staff'}
    },
    {
        name = 'Engineering to Rooftop',
        entryPos = vector3(2521.8, -243.7, -24.1),
        exitPos = vector3(956.5, 30.7, 120.2),
        exitHeading = 176.5,
        restricted =  false,
        restrictedGroups = {'diamond.staff'}
    },
    {
        name = 'Office to Manager',
        entryPos = vector3(2501.3, -237.5, -55.1),
        exitPos = vector3(1120.1, 256.4, -45.8),
        exitHeading = 92.5,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Manager to Office',
        entryPos = vector3(1121.2, 256.6, -45.8),
        exitPos = vector3(2503.1, -237.4, -55.1),
        exitHeading = 267.5,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'GarbageRoom INSIDE',
        entryPos = vector3(2541.1, -211.5, -58.7),
        exitPos = vector3(993.9, 77.9, 81.0),
        exitHeading = 328.0,
        restricted =  false,
        restrictedGroups = {'diamond.staff'}
    },
    {
        name = 'GarbageRoom OUTSIDE',
        entryPos = vector3(992.7, 76.1, 81.0),
        exitPos = vector3(2542.0, -213.9, -58.7),
        exitHeading = 218.0,
        restricted =  false,
        restrictedGroups = {'diamond.staff'}
    },
    {
        name = 'hoteltodeck_side IN',
        entryPos = vector3(986.773, 75.806, 111.263),
        exitPos = vector3(2525.600, -289.7, -39.122),
        exitHeading = 86.221,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'hoteltodeck_side OUT',
        entryPos = vector3(2526.843, -289.932, -39.122),
        exitPos = vector3(988.773, 77.616, 111.233),
        exitHeading = 304.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'hoteltodeck_front IN',
        entryPos = vector3(2488.095, -293.612, -39.122),
        exitPos = vector3(955.384, 2.905, 111.259),
        exitHeading = 243.715,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'hoteltodeck_front OUT',
        entryPos = vector3(953.307, 4.398, 111.268),
        exitPos = vector3(2488.297, -290.884, -39.122),
        exitHeading = 354.144,
        restricted =  false,
        restrictedGroups = {}
    }
}
-----------------------------------------
------      Vehicle TelePorts       -----
-----------------------------------------
VehicleTeleports = {
    {
        name = 'Parking Level IN',
        entryPos = vector3(936.5, 1.6, 78.8),
        exitPos = vector3(1344.9,183.5,-48.2),
        exitHeading = 270.0,
        restricted =  false,
        restrictedGroups = {}        
    },
    {
        name = 'Parking Level OUT',
        entryPos = vector3(1335.6,193.1,-47.9),
        exitPos = vector3(920.8, -18.9, 78.8),
        exitHeading = 147.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'VIP Parking Level IN',
        entryPos = vector3(1410.7,181.6,-49.4),
        exitPos = vector3(1260.6, 223.0, -48.3),
        exitHeading = 266.0,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'VIP Parking Level OUT',
        entryPos = vector3(1250.7, 232.8, -47.9),
        exitPos = vector3(1403.0,190.8,-49.0),
        exitHeading = 87.400,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Secure Vehicle INSIDE',
        entryPos = vector3(2652.8, -341.6, -64.7),
        exitPos = vector3(997.5, -59.2, 75.0),
        exitHeading = 115.668,
        restricted =  false,
        restrictedGroups = {}
    },
    {
        name = 'Secure Vehicle OUTSIDE',
        entryPos = vector3(998.971, -52.554, 73.956),
        exitPos = vector3(2646.2, -336.3, -64.7),
        exitHeading = 51.542,
        restricted =  false,
        restrictedGroups = {}
    }
}