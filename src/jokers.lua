SMODS.Atlas{
	key = 'Jokers',
	path = 'Jokers.png',
	px = 71,
	py = 95
	}

SMODS.Joker{
	key = 'thatcher',
	config = { extra = { mult_gain = 0.1, mult = 4 } },
	rarity = 2,
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
	rarity = 3,
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
	rarity = 3,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = false,
	cost = 9,
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
	rarity = 1,
	cost = 5,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,
	atlas = 'Jokers',
	pos = {x = 5,y = 0},
	unlocked = true,
	config = { extra = { mult_gain = 2.5, mult = 2.5 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain , card.ability.extra.mult } }
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
    	    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
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

	SMODS.Joker{
	key = 'desire',
	rarity = 1,
	cost = 5,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,
	atlas = 'Jokers',
	pos = {x = 6,y = 0},
	soul_pos = {x = 6, y = 1},
	unlocked = true,
	config = { extra = { mult_gain = 5, mult = 0 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain , card.ability.extra.mult } }
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
    	    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
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