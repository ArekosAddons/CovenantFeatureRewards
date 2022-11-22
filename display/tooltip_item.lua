local ADDONNAME, CFR = ...

local supportedTooltips = {
    [GameTooltip] = true,
    [ItemRefTooltip] = true,
}

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, data)
    if not supportedTooltips[tooltip] then return end

    local id = data.id
    if not id or not CFR:HasItemReward(id) then return end

    local rewards = CFR:GetRewardsForItem(id)
    CFR:GameTooltip_AddRewards(tooltip, rewards)
    tooltip:Show()
end)
