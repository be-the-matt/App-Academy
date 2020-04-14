class HumanPlayer

    attr_reader :row, :col, :name

    def initialize(name)
        @name = name
    end

    def get_position
        #get player guess
        puts "\n #{@name}, enter a position in the form of 'row, column'"
        pos_guess = gets.chomp.split(',')

        @row = pos_guess[0].to_i
        @col = pos_guess[1].to_i

        if invalid_position?
            puts "\n invalid position, try again"
            self.get_position
        end

        [@row, @col]
    end

    def invalid_position?
        if @row > 3 || @row < 0 || @col > 3 || @col < 0
            return true
        end
        false
    end

end

#test
# matt = HumanPlayer.new('matt')
# matt.get_position