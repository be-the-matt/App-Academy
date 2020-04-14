require_relative 'card.rb'

class Board

    def initialize
        @grid = Array.new(4) { Array.new(4) {''} }
    end

    def [](row, col)
        #converts grid coordinates into logical coordinates
        @grid[row][col]
    end

    def []=(row, col, value)
        #assigns value in grid position
        @grid[row][col] = value
    end    

    def populate
        #fill grid with shuffled card pairs
        [*0...@grid.length].each do |row_indx|
            [*0...@grid.length].each do |col_indx|
                @grid[row_indx][col_indx] = Card.new
            end
        end
    end

    def render
        #print representation of the board's current state
        puts "\n   0 1 2 3"
        @grid.each_with_index do |row, indx|
            print "#{indx}  #{row[0].display_card} #{row[1].display_card} #{row[2].display_card} #{row[3].display_card} "
            puts
        end
        puts
    end

    def game_over?
        #return true if all card have been revealed
        return true if @grid.all? { |row| row.all?{ |card| card.card_visibility == 'up' } }
        false
    end

    def reveal(row, col)
        #reveal a card at guessed_pos unless it's already face up, which would do nothing.
        #return true if card value is revealed
        if @grid[row][col].card_visibility == 'down'
            @grid[row][col].reveal
            return true
        end
        false
    end

end

#test
# board = Board.new
# p board[1,2] = 5
# p board[1,2]
# board.populate
# board.render
# p board.game_over?
# board.reveal(1,1)
# board.render
# board.reveal(0,3)
# board.render