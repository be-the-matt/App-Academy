require './player.rb'

class Game

    attr_reader :fragment

    def initialize(player1_name, player2_name)
        #@players = []
        @player1 = Player.new(player1_name)
        @player2 = Player.new(player2_name)
        @fragment = []
        @current_player = @player1

        dictionary_arr = File.open('dictionary.txt').readlines.map(&:chomp)
        @dictionary = Hash.new
        dictionary_arr.each do |word|
            @dictionary[word] = true
        end

    end

    def player_turn
        puts "#{@current_player.player_name}, enter a letter"
        letter = gets.chomp
        
        if valid_play?(letter)
            @fragment << letter
            # if !self.game_over?
            #     self.switch_player 
            #     self.player_turn
            # end
        else
            puts
            puts 'invalid entry, try again'
            puts
            puts "Current word: #{@fragment.join('')}"
            puts
            self.player_turn
        end

    end

    def switch_player
        @previous_player = @current_player            

        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def valid_play?(letter)
        alpha = [*'a'..'z']
        possible_word = @fragment.join('') + letter

        if alpha.include?(letter.downcase) && @dictionary.keys.any? { |word| word[0...possible_word.length] == possible_word }
            return true
        end
        false
    end

    def valid_word?(word)
        @dictionary.has_key?(word)
    end

    def game_over?
        if valid_word?(@fragment.join(''))
            puts
            puts "#{@previous_player.player_name}, you lose"
            puts
            return true
        end
        false
    end

    def play_round
        while !self.game_over?
            puts
            puts "Current word: #{@fragment.join('')}"
            puts
            self.player_turn
            self.switch_player 
        end      
    end

end


game = Game.new('matt', 'tammie')
game.play_round