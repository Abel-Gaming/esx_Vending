ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_VendingMachines:BuyItem')
AddEventHandler('esx_VendingMachines:BuyItem', function(item, price, location)
	local xPlayer = ESX.GetPlayerFromId(source)

	if price <= xPlayer.getMoney() then
		xPlayer.removeMoney(price)
		xPlayer.addInventoryItem(item, 1)
		xPlayer.showNotification("You purchased: ~y~" .. ESX.GetItemLabel(item))
	else
		xPlayer.showNotification("~r~[ERROR]~w~ Not enough money to purchase item!")
	end
end)