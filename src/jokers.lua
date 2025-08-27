SMODS.Atlas{
	key = 'Jokers',
	path = 'Jokers.png',
	px = 71,
	py = 95
	}

SMODS.Joker{
	key = 'thatcher',
	config = { extra = { mult_gain = 0.1, mult = 4 } },
	rarity = 1,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 0,y = 0},
	cost = 7,
	unlocked = true,
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.other_card.debuff and
            context.other_card:is_face() then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
				}
		end
		if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
	}
	
	
SMODS.Joker{
	key = 'tax_collector_bones',
	rarity = 2,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 1,y = 0},
	cost = 10,
	unlocked = true,
	calculate = function(self, card, context)
         if context.end_of_round and context.game_over and context.main_eval then
            if (1 - (G.GAME.chips / G.GAME.blind.chips)) * 100 <= G.GAME.dollars then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
						ease_dollars(-((1 - (G.GAME.chips / G.GAME.blind.chips)) * 100))
                        play_sound('tarot1')
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    saved = 'ph_mr_bones',
                    colour = G.C.RED
                }
            end
        end
    end,
	}

SMODS.Joker{
	key = 'fatal_curtain',
	config = { extra = { repetitions = 1 } },
	rarity = 2,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 2,y = 0},
	cost = 6,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if context.other_card:is_face() then
				return {
					message = 'Again!',
					repetitions = card.ability.extra.repetitions,
					card = context.other_card,
				}
			end
		end
		if context.destroy_card then
  		  if context.cardarea == G.play and context.destroy_card:is_face()then
       		 return { remove = true }
  		  end
		end
	end,
	unlocked = true,
	}

SMODS.Joker{
	key = 'beetlejuice',
	rarity = 2,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = false,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 4,y = 0},
	unlocked = true,
	config = { extra = { type = 'Three of a Kind', mult = 666 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize('Three of a Kind', 'poker_hands') } }
    end,
	calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
			return {
                    mult = card.ability.extra.mult,
					play_sound('tarot1'),
					card:start_dissolve()
                    }
        end
    end,
	}

SMODS.Joker{
	key = 'free_fall',
	rarity = 2,
	cost = 5,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,
	atlas = 'Jokers',
	pos = {x = 5,y = 0},
	unlocked = true,
	config = { extra = { Xmult_gain = 0.1, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain , card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
		if context.pre_discard then
   		 local get_max = 1
   		 local max_key
   			 for key, v in pairs(G.GAME.hands) do
     		   if v.level > get_max then
      		      get_max = v.level
      		      max_key = key
      		  end
   			 end
  		  local scoring_name, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
   		 if scoring_name == max_key then
    	    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.Xmult } },
				}
    		end
		end
		if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
	end
	}

	SMODS.Joker{
	key = 'desire',
	rarity = 2,
	cost = 5,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,
	atlas = 'Jokers',
	pos = {x = 6,y = 0},
	soul_pos = {x = 6, y = 1},
	unlocked = true,
	config = { extra = { Xmult_gain = 0.2, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain , card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
		if context.pre_discard then
   		 local get_max = 1
   		 local max_key
   			 for key, v in pairs(G.GAME.hands) do
     		   if v.played > get_max then
      		      get_max = v.played
      		      max_key = key
      		  end
   			 end
  		  local scoring_name, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
   		 if scoring_name == max_key then
    	    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.Xmult_gain } },
				}
    		end
		end
		if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
	end
	}

SMODS.Joker{
	key = 'hammah',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 3,y = 0},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_hammah')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_steel') and 
			SMODS.pseudorandom_probability(card, 'km_hammah', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker{
	key = 'cuttah',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 7,y = 0},
	unlocked = true,
	config = { extra = { odds = 2 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_cuttah')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_glass') and 
			SMODS.pseudorandom_probability(card, 'km_cuttah', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_glass') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker{
	key = 'swiss',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 8,y = 0},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_swiss')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_wild') and 
			SMODS.pseudorandom_probability(card, 'km_swiss', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_wild') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker{
	key = 'chisel',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 9,y = 0},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_chisel')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_stone') and 
			SMODS.pseudorandom_probability(card, 'km_chisel', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker{
	key = 'gilding_brush',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 0,y = 1},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_brush')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_gold') and 
			SMODS.pseudorandom_probability(card, 'km_brush', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_gold') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker{
	key = 'buzzsaw',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 1,y = 1},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_buzzsaw')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_mult') and 
			SMODS.pseudorandom_probability(card, 'km_buzzsaw', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_mult') then
                return true
            end
        end
        return false
    end,
	}
SMODS.Joker{
	key = 'trowel',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 3,y = 1},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_trowel')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_bonus') and 
			SMODS.pseudorandom_probability(card, 'km_trowel', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_bonus') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker{
	key = 'scissors',
	rarity = 2,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 2,y = 1},
	unlocked = true,
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'km_scissors')
        return { vars = { numerator, denominator, } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_lucky') and 
			SMODS.pseudorandom_probability(card, 'km_scissors', 1, card.ability.extra.odds) then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,
	in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end,
	}

SMODS.Joker {
    key = "blindbuckler",
    unlocked = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 12,
	atlas = 'Jokers',
    pos = { x = 4, y = 1 },
    config = { extra = { Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
            if joker ~= card then
                sell_cost = sell_cost + joker.sell_cost
            end
        end
        return { vars = { (card.ability.extra.Xmult * sell_cost) / 10 + 1 } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local sell_cost = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card then
                    sell_cost = sell_cost + joker.sell_cost
                end
            end
            return {
                xmult = (card.ability.extra.Xmult * sell_cost) / 10 + 1
            }
        end
    end,
}

SMODS.Joker{
		key = 'lieutenant',
		rarity = 1,
		cost = 4,
		eternal_compat = false,
		perishable_compat = false,
		atlas = 'Jokers',
		pos = {x = 5,y = 1},
		unlocked = true,
		config = { extra = { chips = 10 } },
		loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
            if joker ~= card then
                sell_cost = sell_cost + joker.sell_cost
            end
        end
        return { vars = { card.ability.extra.chips * sell_cost } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local sell_cost = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card then
                    sell_cost = sell_cost + joker.sell_cost
                end
            end
            return {
                chips = card.ability.extra.chips * sell_cost
            }
        end
    end,
	}
SMODS.Joker {
    key = "seawolf",
    unlocked = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 12,
	atlas = 'Jokers',
    pos = { x = 9, y = 1 },
    config = { extra = { Xchips = 1 } },
    loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
            if joker ~= card then
                sell_cost = sell_cost + joker.sell_cost
            end
        end
        return { vars = { (card.ability.extra.Xchips * sell_cost) / 10 + 1 } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local sell_cost = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card then
                    sell_cost = sell_cost + joker.sell_cost
                end
            end
            return {
                xchips = (card.ability.extra.Xchips * sell_cost) / 10 + 1
            }
        end
    end,
}

SMODS.Joker{
	key = 'pyromaniac',
	rarity = 1,
	cost = 6,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,
	atlas = 'Jokers',
	pos = {x = 7,y = 1},
	unlocked = true,
	config = { extra = { Xmult_gain = 0.1, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain , card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and hand_chips * mult > G.GAME.blind.chips then
    	    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.Xmult_gain } },
				}
    		end
		if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
	end
	}	

	SMODS.Joker {
    key = "monialcere",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
	atlas = 'Jokers',
	pos = {x = 8,y = 1},
    config = { extra = { mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos - 1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.mult = card.ability.extra.mult + sliced_card.sell_cost * 2
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult + 2 * sliced_card.sell_cost } },
                    colour = G.C.RED,
                    no_juice = true
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}