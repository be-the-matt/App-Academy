class Maze

    attr_accessor :maze

    def initialize
        @maze = Array.new(10) { Array.new(10) {' '} }
        self.fill_maze
    end

    def fill_maze
        width = @maze[0].length
        height = @maze.length
        
        #top and bottom border fill
        [*1...width-1].each do |indx|
            @maze[0][indx] = '*'
            @maze[height-1][indx] = '*'
        end
        
        #left and right border fill
        @maze.each do |row|
            row[0] = '*'
            row[width-1] = '*'
        end

        #fill path columns
        [*1...height-2].each do |indx|
            @maze[indx][2] = '*'
            @maze[indx][6] = '*'
            @maze[-indx][4] = '*'
            @maze[2][8] = '*'
        end

        #fill start and end points
        @maze[1][1] = 'S'
        @maze[1][8] = 'E'

    end

    def print_maze
        puts
        @maze.each do |row|
            print row
            puts            
        end
        puts
    end

end

# m = Maze.new
# m.print_maze