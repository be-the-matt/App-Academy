require_relative 'piece.rb'
require_relative 'NullPiece.rb'


class Board

    attr_accessor :rows

    def initialize
        #add default piece setup of NullPiece
        @sentinel = NullPiece.new
        @rows = Array.new(8) { Array.new(8, @sentinel) }

        col = 0
        8.times do
            @rows[0][col] = Piece.new
            @rows[7][col] = Piece.new
            col += 1
        end
    end

    def [](row, col)
        @rows[row][col]
    end

    def []=(row, col, val)
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos, color = nil)
        if self[start_pos[0], start_pos[1]] == @sentinel
            raise "No piece at start position! Try again."
        end

        if self[end_pos[0], end_pos[1]] != @sentinel
            raise "End position is occupied! Try again."
        end

        self[end_pos[0], end_pos[1]] = self[start_pos[0], start_pos[1]].dup
        self[start_pos[0], start_pos[1]] = @sentinel
    end

    


end



#test
board = Board.new

p board[0,0]
board[0,0] = 'pig'
board[7,7] = 'pig'
board.move_piece([0,0], [1,1])
p board