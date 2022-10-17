local ADDONNAME, CFR = ...


local KYRIAN    = CFR.COVENANTS.KYRIAN
local NECROLORD = CFR.COVENANTS.NECROLORD
local NIGHTFAE  = CFR.COVENANTS.NIGHTFAE
local VENTHYR   = CFR.COVENANTS.VENTHYR

local REWARD_TYPE_MOUNT     = CFR.REWARD_TYPES.MOUNT
local REWARD_TYPE_PET       = CFR.REWARD_TYPES.PET
local REWARD_TYPE_WARDROBE  = CFR.REWARD_TYPES.WARDROBE
local REWARD_TYPE_QUEST     = CFR.REWARD_TYPES.QUEST
local REWARD_TYPE_TOY       = CFR.REWARD_TYPES.TOY


-- Reward for specific covenants only
CFR.covenant_specific = {}
do-- Kyrian only
    local kyrian = {}

    -- Eternal Phalynx of Loyalty
    CFR:AddReward(kyrian, REWARD_TYPE_MOUNT,
        { itemID = 180767, mountID = 1401, arena = "ACHIEVEMENT#14863" } -- TODO: arena
    )
    -- Eternal Phalynx of Humility
    CFR:AddReward(kyrian, REWARD_TYPE_MOUNT,
        { itemID = 180768, mountID = 1402, arena = "ACHIEVEMENT#14861" } -- TODO: arena
    )

    CFR.covenant_specific[KYRIAN] = kyrian
end

do-- Necrolord only
    local necrolord = {}

    -- Bonesewn Fleshroc
    CFR:AddReward(necrolord, REWARD_TYPE_MOUNT,
        { itemID = 182078, mountID = 1409 }
    )
    -- Mu'dud
    CFR:AddReward(necrolord, REWARD_TYPE_PET,
        { itemID = 181282, speciesID = 2963 }
    )

    CFR.covenant_specific[NECROLORD] = necrolord
end

do-- Nightfae only
    local nightfae = {}

    -- Enchanted Wakener's Runestag
    CFR:AddReward(nightfae, REWARD_TYPE_MOUNT,
        { itemID = 180723, mountID = 1358, garden = 4 }
    )
    -- Spirit Tender's Pack
    CFR:AddReward(nightfae, REWARD_TYPE_WARDROBE,
        { itemID = 181310, theme = true, garden = 4, }
    )
    -- Wakener's Runestag
    CFR:AddReward(nightfae, REWARD_TYPE_MOUNT,
        { itemID = 180414, mountID = 1355, garden = 2 }
    )
    -- Spirit Tender's Bulb
    CFR:AddReward(nightfae, REWARD_TYPE_WARDROBE,
        { itemID = 181306, garden = 2 }
    )
    -- Snapper Soul
    CFR:AddReward(nightfae, REWARD_TYPE_QUEST,
        { itemID = 181313, questID = 62420, garden = 1, }
    )
    -- Gulper Soul
    CFR:AddReward(nightfae, REWARD_TYPE_QUEST,
        { itemID = 181314, questID = 62421, garden = 1, }
    )
    -- Choofa's Call
    CFR:AddReward(nightfae, REWARD_TYPE_TOY,
        { itemID = 187705, garden = 2}
    )

    CFR.covenant_specific[NIGHTFAE] = nightfae
end

do-- Venthyr only
    local venthyr = {}

    -- Desire's Battle Gargon
    CFR:AddReward(venthyr, REWARD_TYPE_MOUNT,
        { itemID = 182209, mountID = 1387, visitors = { "The Countess" } } -- TODO: visitors
    )

    CFR.covenant_specific[VENTHYR] = venthyr
end


-- Rewards for all covenants
local shared_rewards = {}
do-- Kyrian themed
    -- Dauntless Duskrunner
    CFR:AddReward(shared_rewards, REWARD_TYPE_MOUNT, {
        itemID = 181317,
        mountID = 1413,
        theme = KYRIAN,

        arena = "ACHIEVEMENT#14861", -- "Azaruux-Wisdom", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Mikanikos",
            "Polemarch Adrestes",
        },
    })
    -- Bronze Ceremonial Targe
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181227,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Mikanikos",
        },
    })
    -- Broadbladed Severer
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181231,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO

        },
    })
    -- Final Arbiter's Gavel
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181235,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Mikanikos",
        },
    })
    -- Sable
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 180814,
        speciesID = 2933,
        theme = KYRIAN,

        arena = "ACHIEVEMENT#14856", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Kleia and Pelagos",
        },
    })
    -- Brightscale Hatchling
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 180815,
        speciesID = 2931,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO

        },
    })
    -- Temple Guard's Partisan
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181228,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Polemarch Adrestes",
        },
    })
    -- Tranquil's Censer
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181229,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Sika",
        },
    })
    -- Pugilist's Chakram
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181230,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Mikanikos",
            "Polemarch Adrestes",
            "Sika",
            "Kleia and Pelagos",
        },
    })
    -- Bellringer's Hammer
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181233,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Kleia and Pelagos",
        },
    })
    -- Crossbow of Contemplative Calm
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181225,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Kleia and Pelagos",
        },
    })
    -- Bronze Dual-Bladed Glaive
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181226,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Mikanikos",
            "Kleia and Pelagos",
            "Sika",
            "Polemarch Adrestes",
        },
    })
    -- Cupbearer's Claymore
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181232,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Mikanikos",
            "Kleia and Pelagos",
            "Sika",
            "Polemarch Adrestes",
        },
    })
    -- Dutybound Spellblade
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181234,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO

        },
    })
end

do-- Necrolord themed
    -- Gruesome Flayedwing
    CFR:AddReward(shared_rewards, REWARD_TYPE_MOUNT, {
        itemID = 181300,
        mountID = 1408,
        theme = NECROLORD,

        arena = "ACHIEVEMENT#14853", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Baroness Vashj",
            "Alexandros Mograine",
        },
    })
    -- Bonejowl Ballista
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181320,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO

        },
    })
    -- Bonebound Tome
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181322,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Baroness Vashj",
        },
    })
    -- Plaguelouse Larva
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 181264,
        speciesID = 2954,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Baroness Vashj",
        },
    })
    -- Corpulent Bonetusk
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 181168,
        speciesID = 2945,
        theme = NECROLORD,

        arena = "ACHIEVEMENT#14857", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Grandmaster Vole",
        },
    })
    -- Marrowfused Warglaive
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181330,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Alexandros Mograine",
            "Plague Deviser Marileth",
            "Baroness Vashj",
            "Grandmaster Vole",
        },
    })
    -- Marrowfused Dagger
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181325,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Alexandros Mograine",
        },
    })
    -- Marrowfused Sword
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181328,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Grandmaster Vole",
        },
    })
    -- Marrowfused Shield
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181331,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Alexandros Mograine",
        },
    })
    -- Bloodstained Hacksaw
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181326,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Plague Deviser Marileth",
        },
    })
    -- Blightclutched Greatstaff
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181323,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Plague Deviser Marileth",
        },
    })
    -- Marrowfused Claymore
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181329,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Grandmaster Vole",
        },
    })
    -- Gem-Crowned Wand
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181321,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Plague Deviser Marileth",
        },
    })
    -- Spineforged Tenderizer
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 181327,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Baroness Vashj",
            "Plague Deviser Marileth",
            "Alexandros Mograine",
            "Grandmaster Vole",
        },
    })
end

do-- Nightfae themed
    -- Pale Acidmaw
    CFR:AddReward(shared_rewards, REWARD_TYPE_MOUNT, {
        itemID = 180726,
        mountID = 1392,
        theme = NIGHTFAE,

        arena = "ACHIEVEMENT#14860", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
            "Lady Moonberry",
        },
    })
    -- Grove Warden's Edge
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179509,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
        },
    })
    -- Songwood Staff
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179516,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Lady Moonberry",
        },
    })
    -- Grove Warden's Harvester
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179533,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
        },
    })
    -- Pearlwing Heron
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 180628,
        speciesID = 2923,
        theme = NIGHTFAE,

        arena = "ACHIEVEMENT#14852", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Droman Aliothe",
        },
    })
    -- Dusty Sporeflutterer
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 180639,
        speciesID = 2912,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO

        },
    })
    -- Nightwillow Barb
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179499,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Choofa",
        },
    })
    -- Grove Warden's Maul
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179538,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Droman Aliothe",
        },
    })
    -- Elderwood Barrier
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179605,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
            "Choofa",
            "Droman Aliothe",
            "Lady Moonberry",
        },
    })
    -- Ripvine Saber
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179514,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Droman Aliothe",
        },
    })
    -- Nightwillow Shortbow
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179585,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
        },
    })
    --  Elderwood Gavel
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179548,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Choofa",
            "Droman Aliothe",
            "Hunt-Captain Korayn",
            "Lady Moonberry",
        },
    })
    -- Heartwood Stem
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 179563,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Choofa",
        },
    })
end

do-- Venthyr theme
    -- Silvertip Dredwing
    CFR:AddReward(shared_rewards, REWARD_TYPE_MOUNT, {
        itemID = 181316,
        mountID = 1376,
        theme = VENTHYR,

        arena = "ACHIEVEMENT#14858", -- TODO
        garden = 4,
        visitors = { -- TODO

        },
    })
    -- Redelev House Foil
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180958,
        theme = VENTHYR,

        arena = "ACHIEVEMENT#14851", -- TODO
        garden = 4,
        visitors = { -- TODO
            "The Countess",
        },
    })
    -- Silver-Bladed Ritual Dagger
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180961,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "The Countess",
        },
    })
    -- Sterling-Silver Cudgel
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180962,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Rendle and Cudgelface",
        },
    })
    -- Violet Dredwing Pup
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 180603,
        speciesID = 2904,
        theme = VENTHYR,

        arena = "achievement#14858", -- TODO
        garden = 2,
        visitors = { -- TODO

        },
    })
    -- Bloodfeaster Spiderling
    CFR:AddReward(shared_rewards, REWARD_TYPE_PET, {
        itemID = 181315,
        speciesID = 2965,
        theme = VENTHYR,

        arena = "ACHIEVEMENT#14857", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Rendle and Cudgelface",
        },
    })
    -- Crypt Watcher's Spire
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180954,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Cryptkeeper Kassir",
        },
    })
    -- Dredger Anklebiter
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180959,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Rendle and Cudgelface",
        },
    })
    -- Shiny-Metal Topped Basher
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180960,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Stonehead",
        },
    })
    -- Ember Court Barrier
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180964,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Cryptkeeper Kassir",
            "Rendle and Cudgelface",
            "The Countess",
            "Stonehead",
        },
    })
    -- Stonewing Halberd
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180955,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Stonehead",
        },
    })
    -- Axeblade Blunderbuss
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180956,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Stonehead",
            "Cryptkeeper Kassir",
            "Rendle and Cudgelface",
        },
    })
    -- Batwing Glaive
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180957,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "The Countess",
            "Stonehead",
            "Cryptkeeper Kassir",
            "Rendle and Cudgelface",
        },
    })
    -- Crypt Keeper's Vessel
    CFR:AddReward(shared_rewards, REWARD_TYPE_WARDROBE, {
        itemID = 180963,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Cryptkeeper Kassir",
        },
    })
end
CFR.shared_rewards = shared_rewards
