local ADDONNAME, CFR = ...


local KYRIAN    = CFR.COVENANTS.KYRIAN
local NECROLORD = CFR.COVENANTS.NECROLORD
local NIGHTFAE  = CFR.COVENANTS.NIGHTFAE
local VENTHYR   = CFR.COVENANTS.VENTHYR

local REWARD_TYPE_MOUNT     = CFR.REWARD_TYPES.MOUNT
local REWARD_TYPE_PET       = CFR.REWARD_TYPES.PET
local REWARD_TYPE_WARDROBE  = CFR.REWARD_TYPES.WARDROBE
local REWARD_TYPE_QUEST     = CFR.REWARD_TYPES.QUEST


-- Tooltip items
CFR.kyrian_items = {
    -- [itemID] = covenant theme,
}
CFR.necrolord_items = {
    -- [itemID] = covenant theme,
}
CFR.nightfae_items = {
    -- [itemID] = covenant theme,
    [177698] = NIGHTFAE,    -- Spirit (Uncommon)
    [177699] = NIGHTFAE,    -- Great Spirit (Rare)
    [177700] = NIGHTFAE,    -- Divine Spirit (Epic)
    [178874] = NECROLORD,   -- Spirit (Uncommon)
    [178877] = NECROLORD,   -- Great Spirit (Uncommon)
    [178878] = NECROLORD,   -- Divine Spirit (Epic)
    [178879] = KYRIAN,      -- Divine Spirit (Epic)
    [178880] = KYRIAN,      -- Great Spirit (Rare)
    [178881] = KYRIAN,      -- Spirit (Uncommon)
    [178882] = VENTHYR,     -- Spirit (Uncommon)
    [178883] = VENTHYR,     -- Great Spirit (Rare)
    [178884] = VENTHYR,     -- Divine Spirit (Epic)
}
CFR.venthyr_items = {
    -- [itemID] = covenant theme,
}


-- LOOKUP: speciesID: https://wowpedia.fandom.com/wiki/BattlePetSpeciesID

-- Reward for specific covenants only
CFR.covenant_specific = {
    [KYRIAN] = {
        -- Eternal Phalynx of Loyalty
        CFR:CreateReward(REWARD_TYPE_MOUNT, { itemID = 180767, mountID = 1401, arena = "ACHIEVEMENT#14863" }), -- TODO: arena
        -- Eternal Phalynx of Humility
        CFR:CreateReward(REWARD_TYPE_MOUNT, { itemID = 180768, mountID = 1402, arena = "ACHIEVEMENT#14861" }), -- TODO: arena
    },
    [NECROLORD] = {
        --
        CFR:CreateReward(REWARD_TYPE_MOUNT, { itemID = 182078, mountID = 1409 }),
        --
        CFR:CreateReward(REWARD_TYPE_PET,   { itemID = 181282, speciesID = 2963 }),
    },
    [NIGHTFAE] = {
        --
        CFR:CreateReward(REWARD_TYPE_MOUNT,    { itemID = 180723, mountID = 1358, garden = 4 }),
        -- Spirit Tender's Pack
        CFR:CreateReward(REWARD_TYPE_WARDROBE, { itemID = 181310, theme = true, garden = 4, }),
        --
        CFR:CreateReward(REWARD_TYPE_MOUNT,    { itemID = 180414, mountID = 1355, garden = 2 }),
        -- Spirit Tender's Bulb
        CFR:CreateReward(REWARD_TYPE_WARDROBE, { itemID = 181306, garden = 2 }),
        -- Snapper Soul
        CFR:CreateReward(REWARD_TYPE_QUEST,    { itemID = 181313, questID = 62420, garden = 1, }),
        -- Gulper Soul
        CFR:CreateReward(REWARD_TYPE_QUEST,    { itemID = 181314, questID = 62421, garden = 1, }),
    },
    [VENTHYR] = {
        -- Desire's Battle Gargon
        CFR:CreateReward(REWARD_TYPE_MOUNT, { itemID = 182209, mountID = 1387, visitors = { "The Countess" } }), -- TODO: visitors
    },
}

-- Rewards for all covenants
CFR.shared_rewards = {
    -- Kyrian themed
    CFR:CreateReward(REWARD_TYPE_MOUNT, { -- Dauntless Duskrunner
        itemID = 181317,
        mountID = 1413,
        theme = KYRIAN,

        arena = "ACHIEVEMENT#14861", -- "Azaruux-Wisdom", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Mikanikos",
            "Polemarch Adrestes",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Bronze Ceremonial Targe
        itemID = 181227,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Mikanikos",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Broadbladed Severer
        itemID = 181231,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO

        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Final Arbiter's Gavel
        itemID = 181235,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Mikanikos",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Temple Guard's Partisan
        itemID = 181228,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Polemarch Adrestes",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Tranquil's Censer
        itemID = 181229,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Sika",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Pugilist's Chakram
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Bellringer's Hammer
        itemID = 181233,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Kleia and Pelagos",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Crossbow of Contemplative Calm
        itemID = 181225,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Kleia and Pelagos",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Bronze Dual-Bladed Glaive
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Cupbearer's Claymore
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Dutybound Spellblade
        itemID = 181234,
        theme = KYRIAN,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO

        },
    }),

    -- Necrolord themed
    CFR:CreateReward(REWARD_TYPE_MOUNT, { -- Gruesome Flayedwing
        itemID = 181300,
        mountID = 1408,
        theme = NECROLORD,

        arena = "ACHIEVEMENT#14853", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Baroness Vashj",
            "Alexandros Mograine",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Bonejowl Ballista
        itemID = 181320,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO

        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Bonebound Tome
        itemID = 181322,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Baroness Vashj",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Plaguelouse Larva
        itemID = 181264,
        speciesID = 2954,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Baroness Vashj",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Corpulent Bonetusk
        itemID = 181168,
        speciesID = 2945,
        theme = NECROLORD,

        arena = "ACHIEVEMENT#14857", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Grandmaster Vole",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Marrowfused Warglaive
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Marrowfused Dagger
        itemID = 181325,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Alexandros Mograine",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Marrowfused Sword
        itemID = 181328,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Grandmaster Vole",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Marrowfused Shield
        itemID = 181331,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Alexandros Mograine",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Bloodstained Hacksaw
        itemID = 181326,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Plague Deviser Marileth",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Blightclutched Greatstaff
        itemID = 181323,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Plague Deviser Marileth",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Marrowfused Claymore
        itemID = 181329,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Grandmaster Vole",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Gem-Crowned Wand
        itemID = 181321,
        theme = NECROLORD,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Plague Deviser Marileth",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Spineforged Tenderizer
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
    }),

    -- Nightfae themed
    CFR:CreateReward(REWARD_TYPE_MOUNT, { -- Pale Acidmaw
        itemID = 180726,
        mountID = 1392,
        theme = NIGHTFAE,

        arena = "ACHIEVEMENT#14860", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
            "Lady Moonberry",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Grove Warden's Edge
        itemID = 179509,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Songwood Staff
        itemID = 179516,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Lady Moonberry",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Grove Warden's Harvester
        itemID = 179533,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Pearlwing Heron
        itemID = 180628,
        speciesID = 2923,
        theme = NIGHTFAE,

        arena = "ACHIEVEMENT#14852", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Droman Aliothe",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Sable
        itemID = 180814,
        speciesID = 2933,
        theme = NIGHTFAE,

        arena = "ACHIEVEMENT#14856", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Kleia and Pelagos",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Brightscale Hatchling
        itemID = 180815,
        speciesID = 2931,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO

        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Dusty Sporeflutterer
        itemID = 180639,
        speciesID = 2912,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO

        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Nightwillow Barb
        itemID = 179499,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Choofa",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Grove Warden's Maul
        itemID = 179538,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Droman Aliothe",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Elderwood Barrier
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Ripvine Saber
        itemID = 179514,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Droman Aliothe",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Nightwillow Shortbow
        itemID = 179585,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Hunt-Captain Korayn",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { --  Elderwood Gavel
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Heartwood Stem
        itemID = 179563,
        theme = NIGHTFAE,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Choofa",
        },
    }),

    -- Venthyr themed
    CFR:CreateReward(REWARD_TYPE_MOUNT, { -- Silvertip Dredwing
        itemID = 181316,
        mountID = 1376,
        theme = VENTHYR,

        arena = "ACHIEVEMENT#14858", -- TODO
        garden = 4,
        visitors = { -- TODO

        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Redelev House Foil
        itemID = 180958,
        theme = VENTHYR,

        arena = "ACHIEVEMENT#14851", -- TODO
        garden = 4,
        visitors = { -- TODO
            "The Countess",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Silver-Bladed Ritual Dagger
        itemID = 180961,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "The Countess",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Sterling-Silver Cudgel
        itemID = 180962,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 4,
        visitors = { -- TODO
            "Rendle and Cudgelface",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Violet Dredwing Pup
        itemID = 180603,
        speciesID = 2904,
        theme = VENTHYR,

        arena = "achievement#14858", -- TODO
        garden = 2,
        visitors = { -- TODO

        },
    }),
    CFR:CreateReward(REWARD_TYPE_PET, { -- Bloodfeaster Spiderling
        itemID = 181315,
        speciesID = 2965,
        theme = VENTHYR,

        arena = "ACHIEVEMENT#14857", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Rendle and Cudgelface",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Crypt Watcher's Spire
        itemID = 180954,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Cryptkeeper Kassir",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Dredger Anklebiter
        itemID = 180959,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Rendle and Cudgelface",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Shiny-Metal Topped Basher
        itemID = 180960,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 2,
        visitors = { -- TODO
            "Stonehead",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Ember Court Barrier
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Stonewing Halberd
        itemID = 180955,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Stonehead",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Axeblade Blunderbuss
        itemID = 180956,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Stonehead",
            "Cryptkeeper Kassir",
            "Rendle and Cudgelface",
        },
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Batwing Glaive
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
    }),
    CFR:CreateReward(REWARD_TYPE_WARDROBE, { -- Crypt Keeper's Vessel
        itemID = 180963,
        theme = VENTHYR,

        arena = "", -- TODO
        garden = 1,
        visitors = { -- TODO
            "Cryptkeeper Kassir",
        },
    }),
}
