class Board

    def initialize
        @grid = Array.new(3) { Array.new(3) {'_'} }
    end

    def valid?(position)
        row = position[0]
        column = position[-1]

        if @grid.length > row && @grid[0].length > column && row >= 0 && column >= 0
            return true
        end
        false
    end

    def empty?(position)
        row = position[0]
        column = position[-1]
       
        if @grid[row][column] == "_"
            return true
        end
        false
    end

    def place_mark(position, mark)
        if !self.valid?(position)
            raise "invalid position"    
        elsif !self.empty?(position)
            raise "position already taken"
        else
            @grid[ position[0] ][ position[-1] ] = mark
        end
    end

    def print
        @grid.each do |row|
            p row
            p
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? { |ele| ele == mark }    #(&:mark)
        end
        false
    end

    def win_col?(mark)
        @t_grid = @grid.transpose
        
        @t_grid.each do |row|
            return true if row.all? { |ele| ele == mark }    #(&:mark)
        end
        false        
    end

    def win_diagonal?(mark)
        n = @grid.length

        #check 0,0 to last,last
        diag_vals = (0...n).map do |indx|
            @grid[indx][indx]
        end
        return true if diag_vals.all? { |ele| ele == mark }

        #check last,0 to 0,last
        diag_vals2 = []
        row_indx = @grid.length-1
        col_indx = 0
        while row_indx >= 0
            diag_vals2 << @grid[row_indx][col_indx]
            row_indx -= 1
            col_indx += 1
        end
        return true if diag_vals2.all? { |ele| ele == mark }
        false
    end

    def win?(mark)
        if self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        @grid.any? { |row| row.any? { |ele| ele == "_" }}
    end

end


#tests
m = Board.new

# m.place_mark([1,0] , :M)
# m.place_mark([1,1] , :M)
# m.place_mark([1,2] , :M)
# m.print
# p m.win_row?(:M)
# p m.win_col?(:M)
# p m.win_diagonal?(:M)
# p m.win?(:M)
# p m.empty_positions?

# m.place_mark([0,2] , :M)
# m.place_mark([1,2] , :M)
# m.place_mark([2,2] , :M)
# m.print
# p m.win_row?(:M)
# p m.win_col?(:M)
# p m.win_diagonal?(:M)
# p m.win?(:M)
# p m.empty_positions?

# m.place_mark([0,0] , :M)
# m.place_mark([1,1] , :M)
# m.place_mark([2,2] , :M)
# m.print
# p m.win_diagonal?(:M)

# m.place_mark([2,0] , :M)
# m.place_mark([1,1] , :M)
# m.place_mark([0,2] , :M)
# m.print
# p m.win_diagonal?(:M)
# p m.win?(:M)
# p m.empty_positions?

# m.place_mark([0,0] , :M)
# m.place_mark([0,1] , :M)
# m.place_mark([0,2] , :M)
# m.place_mark([1,0] , :M)
# m.place_mark([1,1] , :M)
# m.place_mark([1,2] , :M)
# m.place_mark([2,0] , :M)
# m.place_mark([2,1] , :M)
# m.place_mark([2,2] , :M)
# m.print
# p m.win?(:M)
# p m.empty_positions?
