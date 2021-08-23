local ADDDONNAME, CFR = ...


function CFR:GetPlayerCovenant()
    local covenantID = C_Covenants.GetActiveCovenantID()

    return covenantID
end

function CFR:HasItemReward(itemID)
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

function CFR:GetThemeForItem(itemID)
    return self.kyrian_items[itemID]
        or self.necrolord_items[itemID]
        or self.nightfae_items[itemID]
        or self.venthyr_items[itemID]
end

function CFR:GetThemeForVisitor(visitor)
    return self.VISITOR_THEMES[visitor]
end


local rewards_cache = setmetatable({}, { __meta = "v"})
function CFR:GetRewards(covenant, theme)
    local rewards = rewards_cache[(covenant or "-") .. (theme or "-")]
    if rewards ~= nil then return rewards end

    rewards = {
        specific = {},
        specific_known = 0,
        specific_unobtainable = {},
        specific_unobtainable_known = 0,
        specific_extra = {},
        shared = {},
        shared_known = 0,
        shared_unobtainable = {},
        shared_unobtainable_known = 0,
        shared_extra = {},
        covenant = covenant,
    }

    -- rewards available to only specific covenants
    if covenant then
        for _, reward in pairs(CFR.covenant_specific[covenant]) do
            if (reward.theme == true) or (not reward.theme and covenant == theme) or (reward.theme == theme) then
                if reward:CanObtain() then
                    local isCollected, canCollectMore = reward:IsCollected()
                    if isCollected then
                        rewards.specific_known = rewards.specific_known + 1
                    end

                    tinsert(rewards.specific, reward)
                    if canCollectMore then
                        tinsert(rewards.specific_extra, reward)
                    end
                else
                    if reward:IsCollected() then
                        rewards.specific_unobtainable_known = rewards.specific_unobtainable_known + 1
                    end

                    tinsert(rewards.specific_unobtainable, reward)
                end
            end
        end
    end

    -- rewards available to all covenants
    for _, reward in pairs(CFR.shared_rewards) do
        if reward.theme == theme then
            if reward:CanObtain() then
                local isCollected, canCollectMore = reward:IsCollected()
                if isCollected then
                    rewards.shared_known = rewards.shared_known + 1
                end

                tinsert(rewards.shared, reward)
                if canCollectMore then
                    tinsert(rewards.shared_extra, reward)
                end
            else
                if reward:IsCollected() then
                    rewards.shared_unobtainable_known = rewards.shared_unobtainable_known + 1
                end

                tinsert(rewards.shared_unobtainable, reward)
            end
        end
    end

    rewards_cache[(covenant or "-") .. (theme or "-")] = rewards
    return rewards
end

local item_cache = setmetatable({}, { __meta = "v"})
function CFR:GetRewardsForItem(itemID)
    local rewards = item_cache[itemID]
    if rewards ~= nil then return rewards end

    local covenant = CFR:GetCovenantForItem(itemID)
    local theme = CFR:GetThemeForItem(itemID)

    rewards = self:GetRewards(covenant, theme)
    item_cache[itemID] = rewards
    return rewards
end
    return rewards
end

function CFR:ResetCaches()
    wipe(rewards_cache)
    wipe(item_cache)
end
