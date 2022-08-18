local ADDONNAME, CFR = ...

local L = LibStub("AceLocale-3.0"):GetLocale(ADDONNAME)


local REWARD_TYPE_PET = CFR.REWARD_TYPES.PET
local REWARD_TYPE_MOUNT = CFR.REWARD_TYPES.MOUNT
local REWARD_TYPE_WARDROBE = CFR.REWARD_TYPES.WARDROBE
local REWARD_TYPE_QUEST = CFR.REWARD_TYPES.QUEST
local REWARD_TYPE_TOY = CFR.REWARD_TYPES.TOY

local KYRIAN = CFR.COVENANTS.KYRIAN
local NECROLORD = CFR.COVENANTS.NECROLORD
local NIGHTFAE = CFR.COVENANTS.NIGHTFAE
local VENTHYR = CFR.COVENANTS.VENTHYR


local RewardMixin = {}

--- RewardMixin:IsCollected()
-- return isCollected<boolean>, canCollectMore<boolean>
function RewardMixin:IsCollected()
    if self.type == REWARD_TYPE_MOUNT then
        return select(11, C_MountJournal.GetMountInfoByID(self.mountID)), false
    elseif self.type == REWARD_TYPE_PET then
        local numCollected, limit = C_PetJournal.GetNumCollectedInfo(self.speciesID)
        return numCollected > 0, numCollected < limit
    elseif self.type == REWARD_TYPE_TOY then
        return PlayerHasToy(self.itemID)
    elseif self.type == REWARD_TYPE_WARDROBE then
        if C_TransmogCollection.PlayerHasTransmogByItemInfo(self.itemID) then
            return true, false
        end

        local _, sourceID = C_TransmogCollection.GetItemInfo(self.itemID)
        if sourceID then
            local _, _, _, _, isCollected = C_TransmogCollection.GetAppearanceSourceInfo(sourceID)

            return isCollected, false
        end
    elseif self.type == REWARD_TYPE_QUEST then
        return C_QuestLog.IsQuestFlaggedCompleted(self.questID), false
    end

    return false, false
end

local isScheduled = false
local function resetRewardsCache()
    CFR:ResetCaches()
    isScheduled = false
end

local canObtainCache = {}
function RewardMixin:CanObtain()
    if self.type == REWARD_TYPE_WARDROBE then
        local canObtain = canObtainCache[self.itemID]
        if canObtain ~= nil then return canObtain end

        local _, sourceID = C_TransmogCollection.GetItemInfo(self.itemID)
        if sourceID then
            local hasData, canCollect = C_TransmogCollection.PlayerCanCollectSource(sourceID)

            if hasData then
                canObtain = canCollect
            end
        elseif not isScheduled then
            -- reset cache to check again
            isScheduled = true
            C_Timer.After(1, resetRewardsCache)

            -- show as collectable until we got results
            return true
        end

        canObtainCache[self.itemID] = canObtain
        return canObtain
    end

    return true
end

function RewardMixin:AvailableForVisitor(visitor)
    local visitors = self.visitors
    if visitors then
        return visitors[visitor]
    else
        return false
    end
end

function RewardMixin:GetRewardString()
    return string.format("%s (%s)", self.itemLink, self.type)
end

function RewardMixin:GetConditionString(covenant)
    if covenant == NIGHTFAE then
        local garden = self.garden
        if type(garden) == "number" then
            return string.format(L.CATALYSTS_D, self.garden)
        else
            return L.CATALYSTS_M
        end
    elseif covenant == VENTHYR then
        return "NIY"
    elseif covenant == KYRIAN then
        return "NIY"
    elseif covenant == NECROLORD then
        return "NIY"
    end

    return ""
end

local TEXTUREINFO = {margin={left=5, top=2, right=2}}
function RewardMixin:Render(tooltip, covenant, extra)
    local collected, hasMore = self:IsCollected()
    if not collected or (extra and hasMore) then
        tooltip:AddDoubleLine(self:GetRewardString(), self:GetConditionString(covenant), nil, nil, nil, 1, 1, 1)
        tooltip:AddTexture(self.itemIcon, TEXTUREINFO)
    end
end

function CFR:CreateReward(rewardType, data)
    data.type = rewardType

    data.itemLink = RETRIEVING_ITEM_INFO
    data.itemLink = "Interface\\Icons\\Inv_misc_questionmark"

    local item = Item:CreateFromItemID(data.itemID)
    item:ContinueOnItemLoad(function()
        data.itemLink = item:GetItemLink()
        data.itemIcon = item:GetItemIcon()

        -- poke transmog system
        local _, sourceID = C_TransmogCollection.GetItemInfo(data.itemID)
        if sourceID then
            local _, _ = C_TransmogCollection.PlayerCanCollectSource(sourceID)
        end
    end)

    return Mixin(data, RewardMixin)
end
