require './maze.rb'

class Explorer

    attr_reader :game, :possible

    def initialize
        @symbol = '$'
        @game = Maze.new
        @game.maze[2][1] = "#{@symbol}"
        @current_position = [2,1]
    end

    def possible_moves                
        # @game.maze.each_index do |row_indx|
        #     col_indx = @game.maze[row_indx].index( "#{@symbol}" )
        #     @current_position = [row_indx, col_indx] if col_indx
        # end
        @current_row, @current_col = @current_position[0], @current_position[1]

        @possible = [
            [@current_row + 1, @current_col + 0],
            [@current_row - 1, @current_col - 0],
            [@current_row + 0, @current_col - 1],
            [@current_row - 0, @current_col + 1]
        ]        
    end

    def move
        @possible.each do |position|
            if @game.maze[position[0]][position[1]] == ' '
                #@game.maze[ @current_row ][ @current_col ] = ' '
                @game.maze[position[0]][position[1]] = "#{@symbol}"
                @current_position = [ position[0], position[1] ]
                return true
            elsif @game.maze[position[0]][position[1]] == 'E'
                @current_position = [ position[0], position[1] ]
                puts "you win!"
                return false
            end
        end
        puts "cannot move, game over"
        false        
    end

    def game_over?
        @end_position = [1, 8]
        
        return true if @current_position == @end_position
        false
    end

end

# m = Maze.new
# m.print_maze
# matt = Explorer.new
# p matt.possible_moves