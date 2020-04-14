require './maze.rb'
require './explorer.rb'

class Game

    def initialize 
        #@game_maze = Maze.new
        @explorer = Explorer.new
    end


    def run
        until @explorer.game_over?
            @explorer.game.print_maze
            @explorer.possible_moves
            @explorer.move            
        end
    end

end

new_game = Game.new
new_game.run