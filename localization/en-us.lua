return {
	descriptions = {
		Back = {
			b_km_romme = {
				name = 'Rommé Deck',
				text = {"2 Decks in One",
					   "{C:red}X#1#{} base Blind size",
					   },
			}
		},
		Joker = {
			j_km_thatcher = {
					name = 'Thatcher Effect',
					text = {
						"This Joker gains",
						"{C:red,s:1.1}+#1#{} Mult every time", -- [[0.1]]--
						"when {C:attention} a face card {}is discarded",
						"{C:inactive}(Currently {C:red,s:1.1}+#2#{} {C:inactive} Mult)",
					},
				},
				
			j_km_tax_collector_bones = {
					name = 'Tax-Collector Bones',
					text = {
						"Prevents Death",
						"if Money in bank",
						"is at least {C:attention}Dollar per Percent", 
						"of the amount that is missing for the required chips",
						"{S:1.1,C:red,E:2}self destructs and taxes thy tried death{}.",
					},
				},
				
			j_km_fatal_curtain = {
					name = 'Fatal Curtain',
					text = {
						"Retrigger all",
						"played {C:attention}face{} cards",
						"and destroy them afterwards.",
					},
				},
				
			j_km_hammah = {
					name = 'Smithing Hammer',
					text = {
						"If a {C:attention,T:m_steel}Steel Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_cuttah = {
					name = 'Glass Cutter',
					text = {
						"If a {C:attention,T:m_steel}Glass Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_swiss = {
					name = 'Multitool',
					text = {
						"If a {C:attention,T:m_steel}Wild Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_chisel = {
					name = 'Chisel',
					text = {
						"If a {C:attention,T:m_steel}Stone Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_gilding_brush = {
					name = 'Gilding Brush',
					text = {
						"If a {C:attention,T:m_steel}Gold Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_buzzsaw = {
					name = 'Buzzsaw',
					text = {
						"If a {C:attention,T:m_steel}Mult Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_scissors = {
					name = 'Scissors',
					text = {
						"If a {C:attention,T:m_steel}Lucky Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_trowel = {
					name = 'Trowel',
					text = {
						"If a {C:attention,T:m_steel}Bonus Card{} is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_beetlejuice = {
					name = 'Beetlejuice',
					text = {
						"{C:red,s:1.1}+#1#{} Mult if played hand contains",
						"{C:attention}#2#{}",
						"{S:1.1,C:red,E:2}self destructs{}."
					},
				},
			j_km_free_fall = {
					name = 'Free Fall',
					text = {
						"This Joker gains",
						"{X:mult,C:white}X#1#{} Mult every time", -- [[0.1]]--
						"when{C:attention} discarded hand {}is the highest Level",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive} Mult)",
					},
				},
			j_km_desire = {
					name = 'H A N D',
					text = {
						"This Joker gains",
						"{X:mult,C:white}X#1#{} Mult every time", -- [[0.1]]--
						"when{C:attention} discarded hand {}is the most played",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive} Mult)",
					},
				},
			j_km_blindbuckler = {
					name = 'Blindbuckler',
					text = {
						"Adds a {C:attention}tenth{} of the sell value",
                 	  	"of all other owned {C:attention}Jokers{} to {X:mult,C:white} Xmult {}",
                  		"{C:inactive}(Currently {X:mult,C:white} X#1# {}{C:inactive} Mult)",
					},
				},
			j_km_lieutenant = {
					name = 'Lieutenant',
					text = {
						"Adds the sell value",
                 	  	"of all other owned",
                 	 	"{C:attention}Jokers{} to {C:chips}10 Chips{} each Dollar",
                  		"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Mult)",
					},
				},
			j_km_seawolf = {
					name = 'Sea Wolf',
					text = {
						"Adds a {C:attention}tenth{} of the sell value",
                 	  	"of all other owned {C:attention}Jokers{} to {X:chips,C:white} Xchips {}",
                  		"{C:inactive}(Currently {X:chips,C:white} X#1# {}{C:inactive} Chips)",
					},
				},
			j_km_pyromaniac = {
					name = 'Pyromaniac',
					text = {
						"This Joker gains",
						"{X:mult,C:white} X#1# {} Mult every time", -- [[0.1]]--
						"when scored hand is on fire",
						"{C:inactive}(Currently {X:mult,C:white} X#2# {} {C:inactive} Mult)",
					},
				},
			j_km_monialcere = {
                name = "Reggad Monailcerum",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the left",
                    "and permanently add {C:attention}double",
                    "its sell value to this {C:red}Mult",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
            },
			},
		},
	}