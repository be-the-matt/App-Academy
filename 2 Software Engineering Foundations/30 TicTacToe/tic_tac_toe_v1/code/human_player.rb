class HumanPlayer
    attr_reader :mark


    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position        
        p "Player #{@mark}, enter a position as 'row-number [space] column-number'"
        position = gets.chomp.split(" ").map(&:to_i)

        if !valid_chars(position) || position.length != 2
            raise "Entry must be in 'row-number [space] column-number' format"
        end
        
        @row = position[0] - 1
        @column = position[1] - 1
        
        return [@row, @column]
    end

    def valid_chars(arr)
        valid_chars = [*1..1000]
        arr.all? { |char| valid_chars.include?(char) }
    end

end

