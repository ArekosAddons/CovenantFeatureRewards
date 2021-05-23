local ADDONNAME, CFR = ...

local L = LibStub("AceLocale-3.0"):GetLocale(ADDONNAME)

function CFR:GameTooltip_AddRewards(tooltip, rewards)
    local covenant = rewards.covenant

    local num_specific_rewards = #rewards.specific
    local num_specific_known = rewards.specific_known

    if num_specific_rewards > 0 then
        local ur_line = string.format(L.COVENANT_REWARDS_DD, num_specific_known, num_specific_rewards)
        tooltip:AddLine(ur_line)
        for _, reward in ipairs(rewards.specific) do
            reward:Render(tooltip, covenant)
        end
    end


    local num_shared_rewards = #rewards.shared
    local num_shared_known = rewards.shared_known

    if num_shared_rewards > 0 then
        local sr_line = string.format(L.SHARED_REWARDS_DD, num_shared_known, num_shared_rewards)
        tooltip:AddLine(sr_line)
        for _, reward in ipairs(rewards.shared) do
            reward:Render(tooltip, covenant)
        end
    end

    if IsShiftKeyDown() then
        local num_specific_unobtainable_rewards = #rewards.specific_unobtainable
        local num_specific_unobtainable_known = rewards.specific_unobtainable_known

        if num_specific_unobtainable_rewards > 0 then
            local uur_line = string.format(L.COVENANT_REWARDS_UNOBTAINABLE_DD,
                num_specific_unobtainable_known, num_specific_unobtainable_rewards
            )
            tooltip:AddLine(uur_line)
            for _, reward in ipairs(rewards.specific_unobtainable) do
                reward:Render(tooltip, covenant)
            end
        end


        local num_shared_unobtainable_rewards = #rewards.shared_unobtainable
        local num_shared_unobtainable_known = rewards.shared_unobtainable_known

        if num_shared_unobtainable_rewards > 0 then
            local ssr_line = string.format(L.SHARED_REWARDS_UNOBTAINABLE_DD,
                num_shared_unobtainable_known, num_shared_unobtainable_rewards
            )
            tooltip:AddLine(ssr_line)
            for _, reward in ipairs(rewards.shared_unobtainable) do
                reward:Render(tooltip, covenant)
            end
        end
    end
end
