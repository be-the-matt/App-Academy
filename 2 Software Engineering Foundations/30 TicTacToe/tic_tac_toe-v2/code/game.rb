require_relative './board.rb'
require_relative './human_player.rb'

class Game
 
    def initialize(n, *player_marks)
        @players = player_marks.map { |player| HumanPlayer.new(player, n) }
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players[ (@players.index(@current_player) + 1) % (@players.length) ]
    end

    def play
        while @board.empty_positions?
            @board.print
            @position = @current_player.get_position
            @board.place_mark(@position, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "goaaaaalllll!!! I mean.. winner!"
                return
            else
                self.switch_turn
            end
        end
        p "stalemate. BOOOOOOOORINGGGG"
    end

end


#tests

# game = Game.new(5, :X, :O, :M)
# game.play