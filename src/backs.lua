
SMODS.Atlas {
    key = 'Backs',
	path = 'Backs.png',
	px = 71,
	py = 95
}

SMODS.Back {
    key = "romme",
    pos = { x = 0, y = 0 },
    atlas = 'Backs',
    unlocked = true,
    config = { ante_scaling = 2.5 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.ante_scaling } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                return {
                SMODS.add_card{set = "Base",rank = "Ace",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "2",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "3",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "4",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "5",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "6",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "7",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "8",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "9",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "T",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Jack",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Queen",suit = "Clubs"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "King",suit = "Clubs"}:add_to_deck(), 
                SMODS.add_card{set = "Base",rank = "Ace",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "2",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "3",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "4",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "5",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "6",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "7",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "8",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "9",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "T",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Jack",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Queen",suit = "Hearts"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "King",suit = "Hearts"}:add_to_deck(), 
                SMODS.add_card{set = "Base",rank = "Ace",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "2",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "3",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "4",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "5",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "6",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "7",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "8",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "9",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "T",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Jack",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Queen",suit = "Spades"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "King",suit = "Spades"}:add_to_deck(), 
                SMODS.add_card{set = "Base",rank = "Ace",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "2",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "3",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "4",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "5",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "6",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "7",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "8",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "9",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "T",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Jack",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "Queen",suit = "Diamonds"}:add_to_deck(),
                SMODS.add_card{set = "Base",rank = "King",suit = "Diamonds"}:add_to_deck(), 
            }
        end
        }))
    end,
}