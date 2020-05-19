require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    @node = TicTacToeNode.new(game.board, mark)   

    winning_node = nil

    @node.children.each do |child|
      return winning_node = child.prev_move_pos if child.winning_node?(mark)
    end

    if @winning_node == nil
      @node.children.each do |child|
        return winning_node = child.prev_move_pos if !child.losing_node?(mark)
      end
    end

    raise 'no non-losing move' if winning_node == nil  
  
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
