Config = {}

Config.Zones = {
    [80] = {  -- Speed
        price = 200, -- Fine 
        zones = { -- Different locations              
            {x = 139.0, y = -1047.0, z = 29.4, radius = 50.0},  -- Example
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
        }
    },
    [50] = {
        price = 500,
        zones = {
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
        }
    },
    [70] = {
        price = 2000,
        zones = {
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
            {x = 0.0, y = 0.0 z = 0.0, radius = 0.0},
        }
    },
}
