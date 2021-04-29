local ADDDONNAME, CFR = ...


function CFR:GetThemeForItem(itemID)
    return self.kyrian_items[itemID]
        or self.necrolord_items[itemID]
        or self.nightfae_items[itemID]
        or self.venthyr_items[itemID]
end

function CFR:HasReward(itemID)
    return not not self:GetThemeForItem(itemID)
end

function CFR:GetCovenantForItem(itemID)
    if self.kyrian_items[itemID] then
        return CFR.COVENANTS.KYRIAN
    elseif self.necrolord_items[itemID] then
        return CFR.COVENANTS.NECROLORD
    elseif self.venthyr_items[itemID] then
        return CFR.COVENANTS.VENTHYR
    elseif self.nightfae_items[itemID] then
        return CFR.COVENANTS.NIGHTFAE
    end
end

function CFR:GetPlayerCovenant()
    local covenantID = C_Covenants.GetActiveCovenantID()

    return covenantID
end

local rewards_cache = setmetatable({}, { __meta = "v"})
function CFR:GetRewards(itemID)
    local rewards = rewards_cache[itemID]
    if rewards ~= nil then return rewards end

    local covenant = CFR:GetCovenantForItem(itemID)
    local theme = CFR:GetThemeForItem(itemID)

    rewards = {
        specific = {},
        specific_known = 0,
        shared = {},
        shared_known = 0,
        covenant = covenant
    }

    -- rewards available to only specific covenants
    if covenant then
        for _, reward in pairs(CFR.covenant_specific[covenant]) do
            if (reward.theme == true) or (not reward.theme and covenant == theme) or (reward.theme == theme) then
                if reward:CanCollect() then
                    if reward:IsCollected() then
                        rewards.specific_known = rewards.specific_known + 1
                    end

                    tinsert(rewards.specific, reward)
                end
            end
        end
    end

    -- rewards available to all covenants
    for _, reward in pairs(CFR.shared_rewards) do
        if reward.theme == theme then
            if reward:CanCollect() then
                if reward:IsCollected() then
                    rewards.shared_known = rewards.shared_known + 1
                end

                tinsert(rewards.shared, reward)
            end
        end
    end

    rewards_cache[itemID] = rewards
    return rewards
end

function CFR:ResetCaches()
    wipe(rewards_cache)
end
