ESX	= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
end)

-- Check the distance from the markers
Citizen.CreateThread(function() --Checks to see if player is near the coords and if so, displays the text.
	while not NetworkIsSessionStarted() do -- Wait for the user to load
		Wait(500)
	end

	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Locations) do
			local markerlocation = vector3(v.coord.x, v.coord.y, v.coord.z)
		
			-- Check how close the player is to the marker location
			while #(GetEntityCoords(PlayerPedId()) - markerlocation) <= 1.0 do
				Citizen.Wait(0) -- REQUIRED

				-- Draw text with instructions
				ESX.Game.Utils.DrawText3D(markerlocation, "Press ~y~[E]~s~ to purchase items", 0.4)

				-- Check for button press
				if IsControlJustReleased(0, 51) then
					-- Open menu is the button is pressed
					OpenMenu(v.availableitems)

					-- Wait for menu control
					while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "general_menu") do
						Wait(50)
					end
				end
			end
		end
	end
end)

--Opens the purchase menu
function OpenMenu(items)
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
		title = "Buy Items",
		align = "center",
		elements = items
	}, function(data, menu)		
		TriggerServerEvent("esx_VendingMachines:BuyItem", data.current.item, data.current.price, data.current.name)
	end,
	function(data, menu)
		menu.close()
	end)
end