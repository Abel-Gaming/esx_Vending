Config = {}

-- Locations and items at each location
Config.Locations = {
    {
        name = 'Mission Row PD Food', -- Name on the map
        coord = vector3(449.64, -973.93, 34.97), -- Blip coordinate and the shop marker
        availableitems = -- Available items at the shop
        {
            {
                label = 'Bread ($2)', -- Item label in menu
                item = 'bread', -- What to give the player (see database)
                price = 2 -- Price of the item
            },
			{
                label = 'Donuts ($2)', -- Item label in menu
                item = 'donut', -- What to give the player (see database)
                price = 2 -- Price of the item
            }
        }
    },
	{
        name = 'Mission Row PD Drink', -- Name on the map
        coord = vector3(447.8, -973.9, 34.97), -- Blip coordinate and the shop marker
        availableitems = -- Available items at the shop
        {
            {
                label = 'Water ($2)', -- Item label in menu
                item = 'water', -- What to give the player (see database)
                price = 2 -- Price of the item
            },
			{
                label = 'Soda ($2)', -- Item label in menu
                item = 'soda', -- What to give the player (see database)
                price = 2 -- Price of the item
            }
        }
    }
}