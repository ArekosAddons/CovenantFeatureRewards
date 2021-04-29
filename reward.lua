local ADDONNAME, CFR = ...

local L = LibStub("AceLocale-3.0"):GetLocale(ADDONNAME)


local REWARD_TYPE_PET = PET
local REWARD_TYPE_MOUNT = RAF_BENEFIT5 -- MOUNT translates to the verb, the noun is RAF_BENEFIT5
local REWARD_TYPE_WARDROBE = WARDROBE
local REWARD_TYPE_QUEST = "Quest"

CFR.REWARD_TYPES = {
    PET = REWARD_TYPE_PET,
    MOUNT = REWARD_TYPE_MOUNT,
    WARDROBE = REWARD_TYPE_WARDROBE,
    QUEST = REWARD_TYPE_QUEST,
}

local KYRIAN = Enum.CovenantType.Kyrian
local NECROLORD = Enum.CovenantType.Necrolord
local NIGHTFAE = Enum.CovenantType.NightFae
local VENTHYR = Enum.CovenantType.Venthyr

CFR.COVENANTS = {
    KYRIAN = KYRIAN,
    NECROLORD = NECROLORD,
    NIGHTFAE = NIGHTFAE,
    VENTHYR = VENTHYR,
}


local RewardMixin = {}

function RewardMixin:IsCollected()
    if self.type == REWARD_TYPE_MOUNT then
        return select(11, C_MountJournal.GetMountInfoByID(self.mountID))
    elseif self.type == REWARD_TYPE_PET then
        return C_PetJournal.GetNumCollectedInfo(self.speciesID) > 0
    elseif self.type == REWARD_TYPE_WARDROBE then
        local _, sourceID = C_TransmogCollection.GetItemInfo(self.itemID)
        if sourceID then
            local _, _, _, _, isCollected = C_TransmogCollection.GetAppearanceSourceInfo(sourceID)

            return isCollected
        end
    elseif self.type == REWARD_TYPE_QUEST then
        return C_QuestLog.IsQuestFlaggedCompleted(self.questID)
    end
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

        local appearanceID = C_TransmogCollection.GetItemInfo(self.itemID)
        local sources = C_TransmogCollection.GetAppearanceSources(appearanceID)
        if sources and next(sources) then
            local spec = GetItemSpecInfo(self.itemID)

            if type(spec) == "table" then
                if #spec == 0 then
                    -- will not drop
                    canObtain = false
                else
                    canObtain = true
                end
            else
                -- skip caching when nil and reset rewards cache
                if not isScheduled then
                    isScheduled = true
                    C_Timer.After(1, resetRewardsCache)
                end
                return true
            end
        else
            -- can't learn appearance
            canObtain = false
        end

        canObtainCache[self.itemID] = canObtain
        return canObtain
    end

    return true
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
    else
        return "NYI"
    end
end

local TEXTUREINFO = {margin={left=5, top=2, right=2}}
function RewardMixin:Render(tooltip, covenant)
    local collected = self:IsCollected()
    if not collected then
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
    end)

    return Mixin(data, RewardMixin)
end
