local ADDONNAME, CFR = ...


local function hook(tooltip)
    local _, link = tooltip:GetItem()
    if not link then return end

    local id = tonumber( string.match(link, "item:(%d+)") )
    if not id then return end

    if not CFR:HasItemReward(id) then return end

    local rewards = CFR:GetRewardsForItem(id)
    CFR:GameTooltip_AddRewards(tooltip, rewards)
    tooltip:Show()
end

local function hook_tooltip(tooltip)
    hooksecurefunc(tooltip, "SetBagItem", hook)
    hooksecurefunc(tooltip, "SetHyperlink", hook)
    hooksecurefunc(tooltip, "SetInventoryItem", hook)
    hooksecurefunc(tooltip, "SetInventoryItemByID", hook)
    hooksecurefunc(tooltip, "SetItemByID", hook)
    hooksecurefunc(tooltip, "SetQuestItem", hook)
    hooksecurefunc(tooltip, "SetQuestLogItem", hook)
end

hook_tooltip(GameTooltip)
hook_tooltip(ItemRefTooltip)
