require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return false if @board.tied?
    return false if board.over? && @board.winner == (evaluator || nil)
    return true if board.over? && @board.winner != evaluator
    
    if evaluator == @next_mover_mark
      self.children.all? do |child|
        child.losing_node?(evaluator)
      end
    elsif evaluator != @next_mover_mark
      self.children.any? do |child|
        child.losing_node?(evaluator)
      end      
    end  

  end

  def winning_node?(evaluator)
    return false if @board.tied?
    return true if board.over? && @board.winner == (evaluator || nil)
    return false if board.over? && @board.winner != evaluator
    
    if evaluator == @next_mover_mark
      self.children.any? do |child|
        child.winning_node?(evaluator)
      end
    elsif evaluator != @next_mover_mark
      self.children.all? do |child|
        child.winning_node?(evaluator)
      end      
    end    
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_nodes = []

    @board.rows.each_with_index do |row, row_indx|
      row.each_with_index do |ele, col_indx|
        if ele == nil
          board_copy = @board.dup
          pos = [row_indx, col_indx]
          board_copy[pos] = @next_mover_mark
          prev_move_pos = pos

          if @next_mover_mark == :o
            next_mover_mark = :x
          elsif @next_mover_mark == :x
            next_mover_mark = :o
          end

          child_nodes << TicTacToeNode.new(board_copy, next_mover_mark, prev_move_pos)
        end
      end
    end
    child_nodes
  end

end

# p empty_board_node = TicTacToeNode.new(Board.new, :x)
# p empty_board_node.children