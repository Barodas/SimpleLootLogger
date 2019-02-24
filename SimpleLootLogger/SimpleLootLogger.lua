local SimpleLootLogger = {} -- Addon namespace, a top level table that will contain everything
SimpleLootLogger.name = "SimpleLootLogger" -- Event registration string

function SimpleLootLogger.OnPlayerLootItem(event, lootedBy, itemLink, quantity, itemSound, lootType, self)
	if self == true then
		local output = string.format("|c008000Looted: %s x%s", itemLink, quantity)
		CHAT_SYSTEM:AddMessage(output)
	end
end

function SimpleLootLogger.OnAddOnLoaded(event, addonName)
	if addonName == SimpleLootLogger.name then
		EVENT_MANAGER:UnregisterForEvent(SimpleLootLogger.name, EVENT_ADD_ON_LOADED)
		EVENT_MANAGER:RegisterForEvent(SimpleLootLogger.name, EVENT_LOOT_RECEIVED, SimpleLootLogger.OnPlayerLootItem)
	end
end

EVENT_MANAGER:RegisterForEvent(SimpleLootLogger.name, EVENT_ADD_ON_LOADED, SimpleLootLogger.OnAddOnLoaded)