class Player

    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        pos_arr = gets.chomp.split(" ").map { |num| p num.to_i }
        pos_arr
    end

end