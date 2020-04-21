class HumanPlayer
    attr_reader :mark


    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position        
        p "Player #{@mark}, enter a position as 'row-number [space] column-number'"
        position = gets.chomp.split(" ").map(&:to_i)

        if !valid_chars(position) || position.length != 2
            raise "ERROR: Entry must be in 'row-number [space] column-number' format, from 1 to 3"
            # p "ERROR: Entry must be in 'row-number [space] column-number' format, from 1 to 3"
            # self.get_position
        end
        
        @row = position[0] - 1
        @column = position[1] - 1
        
        return [@row, @column]
    end

    def valid_chars(arr)
        valid_chars = [*1..3]
        arr.all? { |char| valid_chars.include?(char) }
    end

end

