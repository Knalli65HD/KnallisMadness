return {
	descriptions = {
		Joker = {
			j_km_thatcher = {
					name = 'Thatcher Effekt',
					text = {
						"Dieser Joker erhält",
						"{X:mult,C:white} X#1# {} Mult every time", -- [[0.1]]--
						"falls {C:attention} #2# {}is discarded",
						"Bildrang ändert sich jede Runde",
						"{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)",
					},
				},
				
			j_km_tax_collector_bones = {
					name = 'Tax-Collector Bones',
					text = {
						"Verhindert den Tod",
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
					name = 'Schmiedehammer',
					text = {
						"If a {C:attention}steel{} card is played",
						"{C:green}#1# in #2#{} chance to",
						"upgrade level of",
						"played {C:attention}poker hand{}",
					},
				},
			j_km_beetlejuice = {
					name = 'Beetle Juice',
					text = {
						"Adds {X:mult,C:white} X#1# {} Mult",
						"If played hand contains {C:attention}#2#{}",
						"{S:1.1,C:red,E:2}self destructs afterwards{}."
					},
				},
			j_km_free_fall = {
					name = 'Freier Fall',
					text = {
						"Dieser Joker erhält",
						"{C:red,s:1.1}+#1#{} Mult jedesmal", -- [[0.1]]--
						"wenn {C:attention} abgeworfene Hand {} die höchste Stufe hat",
						"{C:inactive}(Momentan {C:red,s:1.1}+#1#{} {C:inactive} Mult)",
					},
				},
			},
		},
	}