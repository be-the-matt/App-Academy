require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'humanplayer.rb'

class Game

    def initialize(*player_names)
        @players = player_names.map { |name| HumanPlayer.new(name) }
        @current_player = @players[0] #can make multiplayer
        @board = Board.new
        @board.populate
        @previous_guess = []
    end

    def check_guess(pos)
        #check matching logic
        #if not already checking another card, leave card at guessed_pos face up and update previous_guess
        #if checking another card, compare the guessed_pos card with previous_guess
        #if card match leave both face up
        #else, flip both face down
        #reset previous_guess after comparison
        if @board[pos[0], pos[1]].card_visibility == 'up'
            puts "\n card is already face up! try again"
            return
        end
        
        @board.reveal(pos[0], pos[1])
        system('clear')
        @board.render

        if @previous_guess.length != 2
            @previous_guess = pos
        else
            @card1 = @board[ @previous_guess[0], @previous_guess[1] ]
            @card2 = @board[ pos[0], pos[1] ]

            puts "\n match!" if @card1.card_value == @card2.card_value
            if @card1.card_value != @card2.card_value
                @card1.hide
                @card2.hide
                puts "\n no match! try again"
            end
            @previous_guess = []
        end
    end

    def play
        #run until game is over
        #run system("clear") to clear previous guesses in terminal
        #render board
        #sleep(n) to pause for n seconds to show board with incorrect guess before face_down
        #prompt for player guess position
        until @board.game_over?
            system('clear')
            @board.render
            @guess = @current_player.get_position
            check_guess(@guess)
            sleep(2)
        end
        puts "\n you win!"
        puts
    end

end

game = Game.new('user_name')
game.play