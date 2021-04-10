local ADDONNAME = ...
local debug = false -- luacheck: ignore 311/debug
--@debug@
debug = true
--@end-debug@

local L = LibStub("AceLocale-3.0"):NewLocale(ADDONNAME, "enUS", true, debug) -- luacheck: ignore 113/LibStub
if not L then return end

L.CATALYSTS_D = "%d |4Catalyst:Catalysts"
L.CATALYSTS_M = "? Catalysts"
L.COVENANT_REWARDS_DD = "Covenant rewards |cFFFFFFFF%d/%d|r"
L.SHARED_REWARDS_DD = "Shared rewards |cFFFFFFFF%d/%d|r"
