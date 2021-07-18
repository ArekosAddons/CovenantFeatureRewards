local ADDONNAME = ...





local L = LibStub("AceLocale-3.0"):NewLocale(ADDONNAME, "deDE") -- luacheck: ignore 113/LibStub
if not L then return end

L.CATALYSTS_D = "%d |4Katalysator:Katalysatoren"
L.CATALYSTS_M = "? Katalysatoren"
L.COVENANT_REWARDS_DD = "Pakt Belohnungen |cFFFFFFFF%d/%d|r"
L.SHARED_REWARDS_DD = "Geteilte Belohnungen |cFFFFFFFF%d/%d|r"
L.COVENANT_REWARDS_UNOBTAINABLE_DD ="Nicht erhältliche Pakt Belohnungen |cFFFFFFFF%d/%d|r"
L.SHARED_REWARDS_UNOBTAINABLE_DD = "Nicht erhältliche geteilte Belohnungen |cFFFFFFFF%d/%d|r"
L.COVENANT_REWARDS_EXTRA = "Erhältliche Pakt Belohnungen"
L.SHARED_REWARDS_EXTRA = "Erhältliche geteilte Belohnungen"
