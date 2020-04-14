class Card

    attr_reader :card_visibility, :card_value

    @@symbols = ['X','X', 'O', 'O', '$', '$', '&', '&', '%', '%', '{', '{', 'H', 'H', '>', '>']
    
    def initialize
        @card_visibility = 'down'
        @card_value = @@symbols.shuffle!.shift
    end

    def display_card
        #display card value if face up
        if @card_visibility == 'up'
            return @card_value
        end
        #nothing if face down
        ' '
    end

    def hide
        #hides card value
        @card_visibility = 'down'
    end

    def reveal
        #reveals card value
        @card_visibility = 'up'
    end

end

#test
# first = Card.new
# second = Card.new

# p first.reveal
# p first.hide