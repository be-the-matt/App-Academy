require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
        puts "number of misses allowed: #{@remaining_misses}"
        print "\n"
    end

    def start_game
        @board.place_random_ships
        puts "there are #{@board.num_ships} hidden ships on the board"
        @board.print
    end
    
    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
            false
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        end
            false
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else
            false
        end
    end

    def turn        
        @remaining_misses -= 1 if @board.attack(@player.get_move) == false
        puts "remanining misses: #{@remaining_misses}"
        @board.print
    end

end
