class Board
  
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](indx_arr)
        row = indx_arr[0]
        column = indx_arr[1]
        @grid[row][column]
    end

    def []=(position, val)
        row = position[0]
        column = position[1]
        @grid[row][column] = val
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "You sunk my battleship!"
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        until num_ships == @size / 4
            @grid[rand(0...@grid.length)][rand(0...@grid.length)] = :S
        end
    end

    def hidden_ships_grid
        @hidden_grid = Array.new(@grid.length) { Array.new(@grid.length) }
        @grid.each_with_index do |row, row_ind|
            row.each_with_index do |ele, column_ind| 
                if ele == :S
                    @hidden_grid[row_ind][column_ind] = :N
                else
                    @hidden_grid[row_ind][column_ind] = ele
                end
            end
        end
        return @hidden_grid
    end

    def self.print_grid(array)
        array.each_with_index { |row| puts row.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
