--[[	file meta info
	@file 		Paladin.lua
	@brief		Tables of spell IDs for class
--]]

--[[
	@brief		Accessing the addons private table

	@var 	_		addonName, thrown away
	@var	wt		Global addonTable
--]]
local _, wt = ...

--[[
	@brief		Check if the data should be loaded or not
	@return		If not "PALADIN", then return with nothing
--]]
if (wt.currentClass ~= "PALADIN") then
	return
end

local expac = GetExpansionLevel()

--[[
	@comment	Some spells when using IsSpellKnown() only return true for the max rank of the learned spells
				Solved by creating tables with the spell ids for each exclusive category and running them in wt:AddOverriddenSpells()
				These tables are ordered by rank

				Paladin Auras are special in that you never have multiple ranks in the spellbook, only the latest one is usable
--]]
local layonHands =				{633,2800,10310,27154,48788}
local devotionAura =			{465,10290,643,10291,1032,10292,10293,27149,48941,48942}
local retributionAura =			{7294,10298,10299,10300,10301,27150,54043}
local shadowResistanceAura =	{19876,19895,19896,27151,48943}
local frostResistanceAura =		{19888,19897,19898,27152,48945}
local fireResistanceAura =		{19891,19899,19900,27153,48947}
local spiritualAttunement = {31785,33776}

if expac == 0 then --vanilla
  wt:AddOverriddenSpells(devotionAura, retAura, fireResAura, frostResAura, shadowResAura, layOnHands)
elseif expac == 1 then --TBC
  wt:AddOverriddenSpells(devotionAura,layonHands,retributionAura,shadowResistanceAura,frostResistanceAura,fireResistanceAura,spiritualAttunement)
elseif expac == 2 then --Wrath
  wt:AddOverriddenSpells(layonHands,devotionAura,retributionAura,shadowResistanceAura,frostResistanceAura,fireResistanceAura)
else  --invalid return
  print("WhatsTraining: Server returned invalid Expansion Level. GetExpansionLevel: "..tostring(expac))
end

--[[
	@brief		Table for trainable spells for each level

	@table		[n]		Table containing spells available at level n

				@var		id					Spell id
				@var		cost				Cost in copper
				@table		requiredIds			Table containing prerequisite spell IDs
				@var		requiredTalentId	Spell ID of prerequisite talent
				@var		faction				"Alliance" or "Horde" for faction specific spells
--]]
local SpellsByLevel = {
[0] = { --Vanilla Spells
  [1] = {
    {id = 465, cost = 10}
  },
  [4] = {
    {id = 19740, cost = 100},
    {id = 20271, cost = 100}
  },
  [6] = {
    {id = 498, cost = 100},
    {id = 639, cost = 100, requiredIds = {635}},
    {id = 21082, cost = 100}
  },
  [8] = {
    {id = 853, cost = 100},
    {id = 3127, cost = 100},
    {id = 1152, cost = 100}
  },
  [10] = {
    {id = 1022, cost = 300},
    {id = 10290, cost = 300, requiredIds = {465}},
    {id = 633, cost = 300},
    {id = 20287, cost = 300, requiredIds = {21084}}
  },
  [12] = {
    {id = 19834, cost = 1000, requiredIds = {19740}},
    {id = 20162, cost = 1000, requiredIds = {21082}}
  },
  [14] = {
    {id = 19742, cost = 2000},
    {id = 647, cost = 2000, requiredIds = {639}}
  },
  [16] = {
    {id = 7294, cost = 3000},
    {id = 25780, cost = 3000}
  },
  [18] = {
    {id = 1044, cost = 3500},
    {id = 5573, cost = 3500, requiredIds = {498}},
    {id = 20288, cost = 3500, requiredIds = {20287}}
  },
  [20] = {
    {id = 643, cost = 4000, requiredIds = {10290}},
    {id = 879, cost = 4000},
    {id = 19750, cost = 4000}
  },
  [22] = {
    {id = 19835, cost = 4000, requiredIds = {19834}},
    {id = 19746, cost = 4000},
    {id = 1026, cost = 4000, requiredIds = {647}},
    {id = 20164, cost = 4000},
    {id = 20305, cost = 4000, requiredIds = {20162}}
  },
  [24] = {
    {id = 5599, cost = 5000, requiredIds = {1022}},
    {id = 19850, cost = 5000, requiredIds = {19742}},
    {id = 5588, cost = 5000, requiredIds = {853}},
    {id = 10322, cost = 5000},
    {id = 2878, cost = 5000}
  },
  [26] = {
    {id = 1038, cost = 6000},
    {id = 19939, cost = 6000, requiredIds = {19750}},
    {id = 10298, cost = 6000, requiredIds = {7294}},
    {id = 20289, cost = 6000, requiredIds = {20288}}
  },
  [28] = {
    {id = 5614, cost = 9000, requiredIds = {879}},
    {id = 19876, cost = 9000}
  },
  [30] = {
    {id = 20116, cost = 200, requiredTalentId = 26573},
    {id = 10291, cost = 11000, requiredIds = {643}},
    {id = 19752, cost = 11000},
    {id = 1042, cost = 11000, requiredIds = {1026}},
    {id = 2800, cost = 11000, requiredIds = {633}},
    {id = 20915, cost = 200, requiredTalentId = 20375},
    {id = 20165, cost = 11000}
  },
  [32] = {
    {id = 19836, cost = 12000, requiredIds = {19835}},
    {id = 19888, cost = 12000},
    {id = 20306, cost = 12000, requiredIds = {20305}}
  },
  [34] = {
    {id = 19852, cost = 13000, requiredIds = {19850}},
    {id = 642, cost = 13000},
    {id = 19940, cost = 13000, requiredIds = {19939}},
    {id = 20290, cost = 13000, requiredIds = {20289}}
  },
  [36] = {
    {id = 5615, cost = 14000, requiredIds = {5614}},
    {id = 19891, cost = 14000},
    {id = 10324, cost = 14000, requiredIds = {10322}},
    {id = 10299, cost = 14000, requiredIds = {10298}}
  },
  [38] = {
    {id = 10278, cost = 16000, requiredIds = {5599}},
    {id = 3472, cost = 16000, requiredIds = {1042}},
    {id = 20166, cost = 16000},
    {id = 5627, cost = 16000, requiredIds = {2878}}
  },
  [40] = {
    {id = 19977, cost = 20000},
    {id = 20912, cost = 900, requiredTalentId = 20911},
    {id = 20922, cost = 1000, requiredIds = {20116}, requiredTalentId = 26573},
    {id = 1032, cost = 20000, requiredIds = {10291}},
    {id = 5589, cost = 20000, requiredIds = {5588}},
    {id = 20918, cost = 1000, requiredIds = {20915}, requiredTalentId = 20375},
    {id = 20347, cost = 20000, requiredIds = {20165}},
    {id = 19895, cost = 20000, requiredIds = {19876}}
  },
  [42] = {
    {id = 19837, cost = 21000, requiredIds = {19836}},
    {id = 4987, cost = 21000},
    {id = 19941, cost = 21000, requiredIds = {19940}},
    {id = 20291, cost = 21000, requiredIds = {20290}},
    {id = 20307, cost = 21000, requiredIds = {20306}}
  },
  [44] = {
    {id = 19853, cost = 22000, requiredIds = {19852}},
    {id = 10312, cost = 22000, requiredIds = {5615}},
    {id = 19897, cost = 22000, requiredIds = {19888}},
    {id = 24275, cost = 22000}
  },
  [46] = {
    {id = 6940, cost = 24000},
    {id = 10328, cost = 24000, requiredIds = {3472}},
    {id = 10300, cost = 24000, requiredIds = {10299}}
  },
  [48] = {
    {id = 19899, cost = 26000, requiredIds = {19891}},
    {id = 20929, cost = 1170, requiredTalentId = 20473},
    {id = 20772, cost = 26000, requiredIds = {10324}},
    {id = 20356, cost = 26000, requiredIds = {20166}}
  },
  [50] = {
    {id = 19978, cost = 28000, requiredIds = {19977}},
    {id = 20913, cost = 1260, requiredIds = {20912}, requiredTalentId = 20911},
    {id = 20923, cost = 1400, requiredIds = {20922}, requiredTalentId = 26573},
    {id = 10292, cost = 28000, requiredIds = {1032}},
    {id = 1020, cost = 28000, requiredIds = {642}},
    {id = 19942, cost = 28000, requiredIds = {19941}},
    {id = 20927, cost = 1260, requiredTalentId = 20925},
    {id = 2812, cost = 28000},
    {id = 10310, cost = 28000, requiredIds = {2800}},
    {id = 20919, cost = 1260, requiredIds = {20918}, requiredTalentId = 20375},
    {id = 20348, cost = 28000, requiredIds = {20347}},
    {id = 20292, cost = 28000, requiredIds = {20291}}
  },
  [52] = {
    {id = 19838, cost = 34000, requiredIds = {19837}},
    {id = 10313, cost = 34000, requiredIds = {10312}},
    {id = 25782, cost = 46000, requiredIds = {19838}},
    {id = 24274, cost = 34000, requiredIds = {24275}},
    {id = 20308, cost = 34000, requiredIds = {20307}},
    {id = 19896, cost = 34000, requiredIds = {19895}},
    {id = 10326, cost = 34000, requiredIds = {5627}}
  },
  [54] = {
    {id = 20729, cost = 40000, requiredIds = {6940}},
    {id = 19854, cost = 40000, requiredIds = {19853}},
    {id = 25894, cost = 40000, requiredIds = {19854}},
    {id = 10308, cost = 40000, requiredIds = {5589}},
    {id = 10329, cost = 40000, requiredIds = {10328}}
  },
  [56] = {
    {id = 19898, cost = 42000, requiredIds = {19897}},
    {id = 20930, cost = 2100, requiredIds = {20929}, requiredTalentId = 20473},
    {id = 10301, cost = 42000, requiredIds = {10300}}
  },
  [58] = {
    {id = 19943, cost = 44000, requiredIds = {19942}},
    {id = 20293, cost = 44000, requiredIds = {20292}},
    {id = 20357, cost = 44000, requiredIds = {20356}}
  },
  [60] = {
    {id = 19979, cost = 46000, requiredIds = {19978}},
    {id = 20914, cost = 2070, requiredIds = {20913}, requiredTalentId = 20911},
    {id = 20924, cost = 2300, requiredIds = {20923}, requiredTalentId = 26573},
    {id = 10293, cost = 46000, requiredIds = {10292}},
    {id = 10314, cost = 46000, requiredIds = {10313}},
    {id = 19900, cost = 46000, requiredIds = {19899}},
    {id = 25898, cost = 2070, requiredTalentId = 20217},
    {id = 25890, cost = 46000, requiredIds = {19979}},
    {id = 25916, cost = 41400, requiredIds = {25291}},
    {id = 25895, cost = 46000, requiredIds = {1038}},
    {id = 25899, cost = 2070, requiredIds = {20914}, requiredTalentId = 20911},
    {id = 25918, cost = 46000, requiredIds = {25290}},
    {id = 24239, cost = 46000, requiredIds = {24274}},
    {id = 20928, cost = 2070, requiredIds = {20927}, requiredTalentId = 20925},
    {id = 10318, cost = 46000, requiredIds = {2812}},
    {id = 20773, cost = 46000, requiredIds = {20772}},
    {id = 20920, cost = 2070, requiredIds = {20919}, requiredTalentId = 20375},
    {id = 20349, cost = 46000, requiredIds = {20348}}
  },
},
[1] = { --TBC Spells
  [1] = {
    {id = 465, cost = 10},
  },
  [4] = {
    {id = 19740, cost = 100},
    {id = 20271, cost = 100},
  },
  [6] = {
    {id = 639, cost = 100, requiredIds = {635}},
    {id = 498, cost = 100},
    {id = 21082, cost = 100},
  },
  [8] = {
    {id = 3127, cost = 100},
    {id = 1152, cost = 100},
    {id = 853, cost = 100},
  },
  [10] = {
    {id = 633, cost = 300},
    {id = 20287, cost = 300, requiredIds = {21084}},
    {id = 1022, cost = 300},
    {id = 10290, cost = 300, requiredIds = {465}},
  },
  [12] = {
    {id = 19834, cost = 1000, requiredIds = {19740}},
    {id = 20162, cost = 1000, requiredIds = {21082}},
  },
  [14] = {
    {id = 19742, cost = 2000},
    {id = 647, cost = 2000, requiredIds = {639}},
    {id = 31789, cost = 4000},
  },
  [16] = {
    {id = 25780, cost = 3000},
    {id = 7294, cost = 3000},
  },
  [18] = {
    {id = 20288, cost = 3500, requiredIds = {20287}},
    {id = 1044, cost = 3500},
    {id = 5573, cost = 3500, requiredIds = {498}},
    {id = 31785, cost = 3500},
  },
  [20] = {
    {id = 26573, cost = 4000},
    {id = 879, cost = 4000},
    {id = 19750, cost = 4000},
    {id = 643, cost = 4000, requiredIds = {10290}},
  },
  [22] = {
    {id = 1026, cost = 4000, requiredIds = {647}},
    {id = 19746, cost = 4000},
    {id = 20164, cost = 4000},
    {id = 19835, cost = 4000, requiredIds = {19834}},
    {id = 20305, cost = 4000, requiredIds = {20162}},
  },
  [24] = {
    {id = 19850, cost = 5000, requiredIds = {19742}},
    {id = 10322, cost = 5000, requiredIds = {7328}},
    {id = 2878, cost = 5000},
    {id = 5599, cost = 5000, requiredIds = {1022}},
    {id = 5588, cost = 5000, requiredIds = {853}},
  },
  [26] = {
    {id = 19939, cost = 6000, requiredIds = {19750}},
    {id = 20289, cost = 6000, requiredIds = {20288}},
    {id = 1038, cost = 6000},
    {id = 10298, cost = 6000, requiredIds = {7294}},
  },
  [28] = {
    {id = 5614, cost = 9000, requiredIds = {879}},
    {id = 19876, cost = 9000},
  },
  [30] = {
    {id = 20116, cost = 11000, requiredIds = {26573}},
    {id = 1042, cost = 11000, requiredIds = {1026}},
    {id = 2800, cost = 11000, requiredIds = {633}},
    {id = 20165, cost = 11000},
    {id = 34769, cost = 10000, faction = "Horde"},
    {id = 10291, cost = 11000, requiredIds = {643}},
    {id = 19752, cost = 11000},
    {id = 20915, cost = 550, requiredIds = {20375}, requiredTalentId = 20375},
  },
  [32] = {
    {id = 19888, cost = 12000},
    {id = 19836, cost = 12000, requiredIds = {19835}},
    {id = 20306, cost = 12000, requiredIds = {20305}},
  },
  [34] = {
    {id = 19852, cost = 13000, requiredIds = {19850}},
    {id = 19940, cost = 13000, requiredIds = {19939}},
    {id = 20290, cost = 13000, requiredIds = {20289}},
    {id = 642, cost = 13000},
  },
  [36] = {
    {id = 5615, cost = 14000, requiredIds = {5614}},
    {id = 10324, cost = 14000, requiredIds = {10322}},
    {id = 19891, cost = 14000},
    {id = 10299, cost = 14000, requiredIds = {10298}},
  },
  [38] = {
    {id = 3472, cost = 16000, requiredIds = {1042}},
    {id = 20166, cost = 16000},
    {id = 5627, cost = 16000, requiredIds = {2878}},
    {id = 10278, cost = 16000, requiredIds = {5599}},
  },
  [40] = {
    {id = 19977, cost = 20000},
    {id = 20922, cost = 20000, requiredIds = {20116}},
    {id = 20347, cost = 20000, requiredIds = {20165}},
    {id = 20912, cost = 1000, requiredIds = {20911}, requiredTalentId = 20911},
    {id = 1032, cost = 20000, requiredIds = {10291}},
    {id = 5589, cost = 20000, requiredIds = {5588}},
    {id = 19895, cost = 20000, requiredIds = {19876}},
    {id = 20918, cost = 1000, requiredIds = {20915}, requiredTalentId = 20375},
  },
  [42] = {
    {id = 4987, cost = 21000},
    {id = 19941, cost = 21000, requiredIds = {19940}},
    {id = 20291, cost = 21000, requiredIds = {20290}},
    {id = 19837, cost = 21000, requiredIds = {19836}},
    {id = 20307, cost = 21000, requiredIds = {20306}},
  },
  [44] = {
    {id = 19853, cost = 22000, requiredIds = {19852}},
    {id = 10312, cost = 22000, requiredIds = {5615}},
    {id = 24275, cost = 22000},
    {id = 19897, cost = 22000, requiredIds = {19888}},
  },
  [46] = {
    {id = 10328, cost = 24000, requiredIds = {3472}},
    {id = 6940, cost = 24000},
    {id = 10300, cost = 24000, requiredIds = {10299}},
  },
  [48] = {
    {id = 20929, cost = 1300, requiredIds = {20473}, requiredTalentId = 20473},
    {id = 20772, cost = 26000, requiredIds = {10324}},
    {id = 20356, cost = 26000, requiredIds = {20166}},
    {id = 19899, cost = 26000, requiredIds = {19891}},
    {id = 31895, cost = 26000, requiredIds = {20164}},
  },
  [50] = {
    {id = 19978, cost = 28000, requiredIds = {19977}},
    {id = 20923, cost = 28000, requiredIds = {20922}},
    {id = 19942, cost = 28000, requiredIds = {19941}},
    {id = 2812, cost = 28000},
    {id = 10310, cost = 28000, requiredIds = {2800}},
    {id = 20348, cost = 28000, requiredIds = {20347}},
    {id = 20292, cost = 28000, requiredIds = {20291}},
    {id = 20913, cost = 1400, requiredIds = {20912}, requiredTalentId = 20911},
    {id = 10292, cost = 28000, requiredIds = {1032}},
    {id = 1020, cost = 28000, requiredIds = {642}},
    {id = 20927, cost = 1400, requiredIds = {20925}, requiredTalentId = 20925},
    {id = 20919, cost = 1400, requiredIds = {20918}, requiredTalentId = 20375},
  },
  [52] = {
    {id = 10313, cost = 34000, requiredIds = {10312}},
    {id = 24274, cost = 34000, requiredIds = {24275}},
    {id = 10326, cost = 34000, requiredIds = {5627}},
    {id = 19896, cost = 34000, requiredIds = {19895}},
    {id = 19838, cost = 34000, requiredIds = {19837}},
    {id = 25782, cost = 46000, requiredIds = {19838}},
    {id = 20308, cost = 34000, requiredIds = {20307}},
  },
  [54] = {
    {id = 19854, cost = 40000, requiredIds = {19853}},
    {id = 25894, cost = 46000, requiredIds = {19854}},
    {id = 10329, cost = 40000, requiredIds = {10328}},
    {id = 20729, cost = 40000, requiredIds = {6940}},
    {id = 10308, cost = 40000, requiredIds = {5589}},
  },
  [56] = {
    {id = 20930, cost = 2100, requiredIds = {20929}, requiredTalentId = 20473},
    {id = 19898, cost = 42000, requiredIds = {19897}},
    {id = 10301, cost = 42000, requiredIds = {10300}},
  },
  [58] = {
    {id = 19943, cost = 44000, requiredIds = {19942}},
    {id = 20293, cost = 44000, requiredIds = {20292}},
    {id = 20357, cost = 44000, requiredIds = {20356}},
  },
  [60] = {
    {id = 19979, cost = 46000, requiredIds = {19978}},
    {id = 25290, cost = 50000, requiredIds = {19854}},
    {id = 20924, cost = 46000, requiredIds = {20923}},
    {id = 10314, cost = 46000, requiredIds = {10313}},
    {id = 25890, cost = 46000, requiredIds = {19979}},
    {id = 25918, cost = 46000, requiredIds = {25290,25894}},
    {id = 24239, cost = 46000, requiredIds = {24274}},
    {id = 25292, cost = 46000, requiredIds = {10329}},
    {id = 10318, cost = 46000, requiredIds = {2812}},
    {id = 20773, cost = 46000, requiredIds = {20772}},
    {id = 20349, cost = 46000, requiredIds = {20348}},
    {id = 32699, cost = 2300, requiredIds = {31935}, requiredTalentId = 31935},
    {id = 20914, cost = 2300, requiredIds = {20913}, requiredTalentId = 20911},
    {id = 10293, cost = 46000, requiredIds = {10292}},
    {id = 19900, cost = 46000, requiredIds = {19899}},
    {id = 25898, cost = 2300, requiredIds = {20217}, requiredTalentId = 20217},
    {id = 25895, cost = 46000, requiredIds = {1038}},
    {id = 25899, cost = 2300, requiredIds = {20914}, requiredTalentId = 20911},
    {id = 20928, cost = 2300, requiredIds = {20927}, requiredTalentId = 20925},
    {id = 25291, cost = 50000, requiredIds = {19838}},
    {id = 25916, cost = 46000, requiredIds = {25291,25782}},
    {id = 20920, cost = 2300, requiredIds = {20919}, requiredTalentId = 20375},
  },
  [61] = {
    {id = 27158, cost = 50000, requiredIds = {20308}},
  },
  [62] = {
    {id = 27135, cost = 55000, requiredIds = {25292}},
    {id = 27147, cost = 55000, requiredIds = {20729}},
    {id = 32223, cost = 55000},
  },
  [63] = {
    {id = 27151, cost = 61000, requiredIds = {19896}},
  },
  [64] = {
    {id = 27174, cost = 3350, requiredIds = {20930}, requiredTalentId = 20473},
    {id = 31801, cost = 67000, faction = "Alliance"},
    {id = 31892, cost = 67000, faction = "Horde"},
  },
  [65] = {
    {id = 27142, cost = 75000, requiredIds = {25290}},
    {id = 27143, cost = 75000, requiredIds = {27142,25918}},
  },
  [66] = {
    {id = 27137, cost = 83000, requiredIds = {19943}},
    {id = 27155, cost = 83000, requiredIds = {20293}},
    {id = 33776, cost = 83000, requiredIds = {31785}},
    {id = 27150, cost = 83000, requiredIds = {10301}},
  },
  [67] = {
    {id = 27166, cost = 92000, requiredIds = {20357}},
  },
  [68] = {
    {id = 27138, cost = 100000, requiredIds = {10314}},
    {id = 27180, cost = 100000, requiredIds = {24239}},
    {id = 27152, cost = 100000, requiredIds = {19898}},
  },
  [69] = {
    {id = 27144, cost = 110000, requiredIds = {19979}},
    {id = 27145, cost = 110000, requiredIds = {27144,25890}},
    {id = 27139, cost = 110000, requiredIds = {10318}},
    {id = 27154, cost = 110000, requiredIds = {10310}},
    {id = 27160, cost = 110000, requiredIds = {20349}},
  },
  [70] = {
    {id = 27173, cost = 130000, requiredIds = {20924}},
    {id = 27136, cost = 130000, requiredIds = {27135}},
    {id = 33072, cost = 6500, requiredIds = {27174}, requiredTalentId = 20473},
    {id = 32700, cost = 2300, requiredIds = {32699}, requiredTalentId = 31935},
    {id = 27148, cost = 130000, requiredIds = {27147}},
    {id = 27168, cost = 2300, requiredIds = {20914}, requiredTalentId = 20911},
    {id = 27149, cost = 130000, requiredIds = {10293}},
    {id = 27153, cost = 130000, requiredIds = {19900}},
    {id = 27169, cost = 2300, requiredIds = {27168,25899}, requiredTalentId = 20911},
    {id = 27179, cost = 2300, requiredIds = {20928}, requiredTalentId = 20925},
    {id = 31884, cost = 130000},
    {id = 27140, cost = 50000, requiredIds = {25291}},
    {id = 27141, cost = 46000, requiredIds = {27140,25916}},
    {id = 27170, cost = 2300, requiredIds = {20920}, requiredTalentId = 20375},
    {id = 348700, cost = 67000, faction = "Alliance"},
    {id = 348704, cost = 67000, faction = "Horde"},
  },
},
[2] = { --Wrath Spells
  [1] = {
    {id = 465, cost = 10}, -- Devotion Aura (rank 1)
  },
  [4] = {
    {id = 19740, cost = 100}, -- Blessing of Might (rank 1)
    {id = 20271, cost = 100}, -- Judgement of Light
  },
  [6] = {
    {id = 498, cost = 100}, -- Divine Protection
    {id = 639, cost = 100, requiredIds = {635}}, -- Holy Light (rank 2)
  },
  [8] = {
    {id = 853, cost = 100}, -- Hammer of Justice (rank 1)
    {id = 3127, cost = 100}, -- Parry
    {id = 1152, cost = 100}, -- Purify
  },
  [10] = {
    {id = 10290, cost = 300, requiredIds = {465}}, -- Devotion Aura (rank 2)
    {id = 1022, cost = 300}, -- Hand of Protection
    {id = 633, cost = 300}, -- Lay on Hands (rank 1)
  },
  [12] = {
    {id = 19834, cost = 1000, requiredIds = {19740}}, -- Blessing of Might (rank 2)
    {id = 53408, cost = 1000}, -- Judgement of Wisdom
  },
  [14] = {
    {id = 19742, cost = 2000}, -- Blessing of Wisdom (rank 1)
    {id = 647, cost = 2000, requiredIds = {639}}, -- Holy Light (rank 3)
    {id = 31789, cost = 4000}, -- Righteous Defense
  },
  [16] = {
    {id = 62124, cost = 3000}, -- Hand of Reckoning
    {id = 7294, cost = 3000}, -- Retribution Aura (rank 1)
    {id = 25780, cost = 3000}, -- Righteous Fury
  },
  [18] = {
    {id = 1044, cost = 3500}, -- Hand of Freedom
  },
  [20] = {
    {id = 20217, cost = 4000}, -- Blessing of Kings
    {id = 26573, cost = 4000}, -- Consecration (rank 1)
    {id = 643, cost = 4000, requiredIds = {10290}}, -- Devotion Aura (rank 3)
    {id = 879, cost = 4000}, -- Exorcism (rank 1)
    {id = 19750, cost = 4000}, -- Flash of Light (rank 1)
    {id = 5502, cost = 4000}, -- Sense Undead
    {id = 13819, cost = 3500, faction = "Alliance"}, -- Warhorse
    {id = 34769, cost = 3500, faction = "Horde"}, -- Summon Warhorse
  },
  [22] = {
    {id = 19835, cost = 4000, requiredIds = {19834}}, -- Blessing of Might (rank 3)
    {id = 19746, cost = 4000}, -- Concentration Aura
    {id = 1026, cost = 4000, requiredIds = {647}}, -- Holy Light (rank 4)
    {id = 20164, cost = 4000}, -- Seal of Justice
  },
  [24] = {
    {id = 19850, cost = 5000, requiredIds = {19742}}, -- Blessing of Wisdom (rank 2)
    {id = 5588, cost = 5000, requiredIds = {853}}, -- Hammer of Justice (rank 2)
    {id = 5599, cost = 5000, requiredIds = {1022}}, -- Hand of Protection (rank 2)
    {id = 10322, cost = 5000, requiredIds = {7328}}, -- Redemption (rank 2)
    {id = 10326, cost = 5000}, -- Turn Evil
  },
  [26] = {
    {id = 19939, cost = 6000, requiredIds = {19750}}, -- Flash of Light (rank 2)
    {id = 1038, cost = 6000}, -- Hand of Salvation
    {id = 10298, cost = 6000, requiredIds = {7294}}, -- Retribution Aura (rank 2)
  },
  [28] = {
    {id = 5614, cost = 9000, requiredIds = {879}}, -- Exorcism (rank 2)
    {id = 53407, cost = 9000}, -- Judgement of Justice
    {id = 19876, cost = 9000}, -- Shadow Resistance Aura (rank 1)
  },
  [30] = {
    {id = 20116, cost = 11000, requiredIds = {26573}}, -- Consecration (rank 2)
    {id = 10291, cost = 11000, requiredIds = {643}}, -- Devotion Aura (rank 4)
    {id = 19752, cost = 11000}, -- Divine Intervention
    {id = 1042, cost = 11000, requiredIds = {1026}}, -- Holy Light (rank 5)
    {id = 2800, cost = 11000, requiredIds = {633}}, -- Lay on Hands (rank 2)
    {id = 20165, cost = 11000}, -- Seal of Light
  },
  [32] = {
    {id = 19836, cost = 12000, requiredIds = {19835}}, -- Blessing of Might (rank 4)
    {id = 19888, cost = 12000}, -- Frost Resistance Aura (rank 1)
  },
  [34] = {
    {id = 19852, cost = 13000, requiredIds = {19850}}, -- Blessing of Wisdom (rank 3)
    {id = 642, cost = 13000}, -- Divine Shield
    {id = 19940, cost = 13000, requiredIds = {19939}}, -- Flash of Light (rank 3)
  },
  [36] = {
    {id = 5615, cost = 14000, requiredIds = {5614}}, -- Exorcism (rank 3)
    {id = 19891, cost = 14000}, -- Fire Resistance Aura (rank 1)
    {id = 10324, cost = 14000, requiredIds = {10322}}, -- Redemption (rank 3)
    {id = 10299, cost = 14000, requiredIds = {10298}}, -- Retribution Aura (rank 3)
  },
  [38] = {
    {id = 10278, cost = 16000, requiredIds = {5599}}, -- Hand of Protection (rank 3)
    {id = 3472, cost = 16000, requiredIds = {1042}}, -- Holy Light (rank 6)
    {id = 20166, cost = 16000}, -- Seal of Wisdom
  },
  [40] = {
    {id = 20922, cost = 20000, requiredIds = {20116}}, -- Consecration (rank 3)
    {id = 1032, cost = 20000, requiredIds = {10291}}, -- Devotion Aura (rank 5)
    {id = 5589, cost = 20000, requiredIds = {5588}}, -- Hammer of Justice (rank 3)
    {id = 19895, cost = 20000, requiredIds = {19876}}, -- Shadow Resistance Aura (rank 2)
    {id = 23214, cost = 3500, faction = "Alliance"}, -- Charger
    {id = 34767, cost = 3500, faction = "Horde"}, -- Summon Charger
  },
  [42] = {
    {id = 19837, cost = 21000, requiredIds = {19836}}, -- Blessing of Might (rank 5)
    {id = 4987, cost = 21000}, -- Cleanse
    {id = 19941, cost = 21000, requiredIds = {19940}}, -- Flash of Light (rank 4)
  },
  [44] = {
    {id = 19853, cost = 22000, requiredIds = {19852}}, -- Blessing of Wisdom (rank 4)
    {id = 10312, cost = 22000, requiredIds = {5615}}, -- Exorcism (rank 4)
    {id = 19897, cost = 22000, requiredIds = {19888}}, -- Frost Resistance Aura (rank 2)
    {id = 24275, cost = 22000}, -- Hammer of Wrath (rank 1)
  },
  [46] = {
    {id = 6940, cost = 24000}, -- Hand of Sacrifice
    {id = 10328, cost = 24000, requiredIds = {3472}}, -- Holy Light (rank 7)
    {id = 10300, cost = 24000, requiredIds = {10299}}, -- Retribution Aura (rank 4)
  },
  [48] = {
    {id = 19899, cost = 26000, requiredIds = {19891}}, -- Fire Resistance Aura (rank 2)
    {id = 20929, cost = 1300, requiredIds = {20473}, requiredTalentId = 20473}, -- Holy Shock (rank 2)
    {id = 20772, cost = 26000, requiredIds = {10324}}, -- Redemption (rank 4)
  },
  [50] = {
    {id = 20923, cost = 28000, requiredIds = {20922}}, -- Consecration (rank 4)
    {id = 10292, cost = 28000, requiredIds = {1032}}, -- Devotion Aura (rank 6)
    {id = 19942, cost = 28000, requiredIds = {19941}}, -- Flash of Light (rank 5)
    {id = 20927, cost = 1400, requiredIds = {20925}, requiredTalentId = 20925}, -- Holy Shield (rank 2)
    {id = 2812, cost = 28000}, -- Holy Wrath (rank 1)
    {id = 10310, cost = 28000, requiredIds = {2800}}, -- Lay on Hands (rank 3)
    },
  [52] = {
    {id = 19838, cost = 34000, requiredIds = {19837}}, -- Blessing of Might (rank 6)
    {id = 10313, cost = 34000, requiredIds = {10312}}, -- Exorcism (rank 5)
    {id = 25782, cost = 46000, requiredIds = {19838}}, -- Greater Blessing of Might (rank 1)
    {id = 24274, cost = 34000, requiredIds = {24275}}, -- Hammer of Wrath (rank 2)
    {id = 19896, cost = 34000, requiredIds = {19895}}, -- Shadow Resistance Aura (rank 3)
  },
  [54] = {
    {id = 19854, cost = 40000, requiredIds = {19853}}, -- Blessing of Wisdom (rank 5)
    {id = 25894, cost = 46000, requiredIds = {19854}}, -- Greater Blessing of Wisdom (rank 1)
    {id = 10308, cost = 40000, requiredIds = {5589}}, -- Hammer of Justice (rank 4)
    {id = 10329, cost = 40000, requiredIds = {10328}}, -- Holy Light (rank 8)
  },
  [56] = {
    {id = 19898, cost = 42000, requiredIds = {19897}}, -- Frost Resistance Aura (rank 3)
    {id = 20930, cost = 2100, requiredIds = {20929}, requiredTalentId = 20473}, -- Holy Shock (rank 3)
    {id = 10301, cost = 42000, requiredIds = {10300}}, -- Retribution Aura (rank 5)
  },
  [58] = {
    {id = 19943, cost = 44000,  requiredIds = {19942}}, -- Flash of Light (rank 6)
  },
  [60] = {
    {id = 32699, cost = 2300, requiredIds = {31935}, requiredTalentId = 31935}, -- Avenger's Shield (rank 2)
    {id = 25291, cost = 50000, requiredIds = {19838}}, -- Blessing of Might (rank 7)
    {id = 25290, cost = 50000, requiredIds = {19854}}, -- Blessing of Wisdom (rank 6)
    {id = 20924, cost = 46000, requiredIds = {20923}}, -- Consecration (rank 5)
    {id = 10293, cost = 46000, requiredIds = {10292}}, -- Devotion Aura (rank 7)
    {id = 10314, cost = 46000, requiredIds = {10313}}, -- Exorcism (rank 6)
    {id = 19900, cost = 46000, requiredIds = {19899}}, -- Fire Resistance Aura (rank 3)
    {id = 25898, cost = 2300, requiredIds = {20217}}, -- Greater Blessing of Kings
    {id = 25916, cost = 46000, requiredIds = {25291,25782}}, -- Greater Blessing of Might (rank 2)
    {id = 25899, cost = 2300, requiredIds = {20911}}, -- Greater Blessing of Sanctuary
    {id = 25918, cost = 46000, requiredIds = {25290,25894}}, -- Greater Blessing of Wisdom (rank 2)
    {id = 24239, cost = 46000, requiredIds = {24274}}, -- Hammer of Wrath (rank 3)
    {id = 25292, cost = 46000, requiredIds = {10329}}, -- Holy Light (rank 9)
    {id = 20928, cost = 2300, requiredIds = {20927}, requiredTalentId = 20925}, -- Holy Shield (rank 3)
    {id = 10318, cost = 46000, requiredIds = {2812}}, -- Holy Wrath (rank 2)
    {id = 20773, cost = 46000, requiredIds = {20772}}, -- Redemption (rank 5)
  },
  [62] = {
    {id = 32223, cost = 55000}, -- Crusader Aura
    {id = 27135, cost = 55000, requiredIds = {25292}}, -- Holy Light (rank 10)
  },
  [63] = {
    {id = 27151, cost = 61000, requiredIds = {19896}}, -- Shadow Resistance Aura (rank 4)
  },
  [64] = {
    {id = 27174, cost = 3348, requiredIds = {20930}, requiredTalentId = 20473}, -- Holy Shock (rank 4)
    {id = 31801, cost = 67000, faction = "Alliance"}, -- Seal of Vengeance
  },
  [65] = {
    {id = 27142, cost = 75000, requiredIds = {25290}}, -- Blessing of Wisdom (rank 7)
    {id = 27143, cost = 75000, requiredIds = {27142,25918}}, -- Greater Blessing of Wisdom (rank 3)
  },
  [66] = {
    {id = 27137, cost = 83000, requiredIds = {19943}}, -- Flash of Light (rank 7)
    {id = 27150, cost = 83000, requiredIds = {10301}}, -- Retribution Aura (rank 6)
    {id = 53736, cost = 100000, faction = "Horde"}, -- Seal of Corruption
  },
  [68] = {
    {id = 27138, cost = 100000, requiredIds = {10314}}, -- Exorcism (rank 7)
    {id = 27152, cost = 100000, requiredIds = {19898}}, -- Frost Resistance Aura (rank 4)
    {id = 27180, cost = 100000, requiredIds = {24239}}, -- Hammer of Wrath (rank 4)
  },
  [69] = {
    {id = 27139, cost = 110000, requiredIds = {10318}}, -- Holy Wrath (rank 3)
    {id = 27154, cost = 110000, requiredIds = {10310}}, -- Lay on Hands (rank 4)
  },
  [70] = {
    {id = 32700, cost = 5000, requiredIds = {32699}, requiredTalentId = 31935}, -- Avenger's Shield (rank 3)
    {id = 31884, cost = 130000}, -- Avenging Wrath
    {id = 27140, cost = 200000, requiredIds = {25291}}, -- Blessing of Might (rank 8)
    {id = 27173, cost = 130000, requiredIds = {20924}}, -- Consecration (rank 6)
    {id = 27149, cost = 130000, requiredIds = {10293}}, -- Devotion Aura (rank 8)
    {id = 27153, cost = 130000, requiredIds = {19900}}, -- Fire Resistance Aura (rank 4)
    {id = 27141, cost = 100000, requiredIds = {27140,25916}}, -- Greater Blessing of Might (rank 3)
    {id = 27136, cost = 130000, requiredIds = {27135}}, -- Holy Light (rank 11)
    {id = 27179, cost = 6500, requiredIds = {20928}, requiredTalentId = 20925}, -- Holy Shield (rank 4)
    {id = 33072, cost = 6500, requiredIds = {27174}, requiredTalentId = 20473}, -- Holy Shock (rank 5)
  },
  [71] = {
    {id = 48935, cost = 200000, requiredIds = {27142}}, -- Blessing of Wisdom (rank 8)
    {id = 54428, cost = 100000}, -- Divine Plea
    {id = 48937, cost = 200000, requiredIds = {48935,27143}}, -- Greater Blessing of Wisdom (rank 4)
  },
  [72] = {
    {id = 48816, cost = 200000, requiredIds = {27139}}, -- Holy Wrath (rank 4)
    {id = 48949, cost = 200000, requiredIds = {20773}}, -- Redemption (rank 6)
  },
  [73] = {
    {id = 48931, cost = 200000, requiredIds = {27140}}, -- Blessing of Might (rank 9)
    {id = 48800, cost = 200000, requiredIds = {27138}}, -- Exorcism (rank 8)
    {id = 48933, cost = 200000, requiredIds = {48931,27141}}, -- Greater Blessing of Might (rank 4)
  },
  [74] = {
    {id = 48941, cost = 200000, requiredIds = {27149}}, -- Devotion Aura (rank 9)
    {id = 48784, cost = 200000, requiredIds = {27137}}, -- Flash of Light (rank 8)
    {id = 48805, cost = 200000, requiredIds = {27180}}, -- Hammer of Wrath (rank 5)
  },
  [75] = {
    {id = 48826, cost = 10000, requiredIds = {32700}, requiredTalentId = 31935}, -- Avenger's Shield (rank 4)
    {id = 48818, cost = 200000, requiredIds = {27173}}, -- Consecration (rank 7)
    {id = 48781, cost = 200000, requiredIds = {27136}}, -- Holy Light (rank 12)
    {id = 48951, cost = 10000, requiredIds = {27179}, requiredTalentId = 20925}, -- Holy Shield (rank 5)
    {id = 48824, cost = 10000, requiredIds = {33072}, requiredTalentId = 20473}, -- Holy Shock (rank 6)
    {id = 53600, cost = 200000}, -- Shield of Righteousness (rank 1)
  },
  [76] = {
    {id = 54043, cost = 200000, requiredIds = {27150}}, -- Retribution Aura (rank 7)
    {id = 48943, cost = 200000, requiredIds = {27151}}, -- Shadow Resistance Aura (rank 5)
  },
  [77] = {
    {id = 48936, cost = 200000, requiredIds = {48935}}, -- Blessing of Wisdom (rank 9)
    {id = 48945, cost = 200000, requiredIds = {27152}}, -- Frost Resistance Aura (rank 5)
    {id = 48938, cost = 200000, requiredIds = {48936,48937}}, -- Greater Blessing of Wisdom (rank 5)
  },
  [78] = {
    {id = 48947, cost = 200000, requiredIds = {27153}}, -- Fire Resistance Aura (rank 5)
    {id = 48817, cost = 200000, requiredIds = {48816}}, -- Holy Wrath (rank 5)
    {id = 48788, cost = 200000, requiredIds = {27154}}, -- Lay on Hands (rank 5)
  },
  [79] = {
    {id = 48932, cost = 200000, requiredIds = {48931}}, -- Blessing of Might (rank 10)
    {id = 48942, cost = 200000, requiredIds = {48941}}, -- Devotion Aura (rank 10)
    {id = 48801, cost = 200000, requiredIds = {48800}}, -- Exorcism (rank 9)
    {id = 48785, cost = 200000, requiredIds = {48784}}, -- Flash of Light (rank 9)
    {id = 48934, cost = 200000, requiredIds = {48932, 48933}}, -- Greater Blessing of Might (rank 5)
    {id = 48950, cost = 200000, requiredIds = {48949}}, -- Redemption (rank 7)
  },
  [80] = {
    {id = 48827, cost = 10000, requiredIds = {48826}, requiredTalentId = 31935}, -- Avenger's Shield (rank 5)
    {id = 48819, cost = 200000, requiredIds = {48818}}, -- Consecration (rank 8)
    {id = 48806, cost = 200000, requiredIds = {48805}}, -- Hammer of Wrath (rank 6)
    {id = 48782, cost = 200000, requiredIds = {48781}}, -- Holy Light (rank 13)
    {id = 48952, cost = 10000, requiredIds = {48951}, requiredTalentId = 20925}, -- Holy Shield (rank 6)
    {id = 48825, cost = 10000, requiredIds = {48824}, requiredTalentId = 20473}, -- Holy Shock (rank 7)
    {id = 53601, cost = 100000}, -- Sacred Shield (rank 1)
    {id = 61411, cost = 200000, requiredIds = {53600}}, -- Shield of Righteousness (rank 2)
  },
},
}

wt.SpellsByLevel = wt.FactionFilter(SpellsByLevel[expac])