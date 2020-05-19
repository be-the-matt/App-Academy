require_relative 'PolyTreeNode.rb'

class KnightPathFinder

    def initialize(pos)
        @start_pos = pos
        @considered_positions = [pos]
        self.build_move_tree        
    end

    def self.valid_moves(pos)
        valid_moves = []

        x_deltas = [2, -2]
        y_deltas = [1, -1]

        x_deltas.each do |x_del|
            y_deltas.each do |y_del| 
                x_pos = pos[0] + x_del
                y_pos = pos[1] + y_del
                x2_pos = pos[0] + y_del
                y2_pos = pos[1] + x_del
                valid_moves << ([y_pos , x_pos]) if x_pos.between?(0,7) && y_pos.between?(0,7) #&& !@considered_positions.include?([x_pos , y_pos])
                valid_moves << ([y2_pos , x2_pos]) if x2_pos.between?(0,7) && y2_pos.between?(0,7) #&& !@considered_positions.include?([x2_pos , y2_pos])
            end
        end
        valid_moves
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
            .reject { |new_pos| @considered_positions.include?(new_pos) }
            .each { |new_pos| @considered_positions << new_pos }
    end


    def build_move_tree
        @root_node = PolyTreeNode.new(@start_pos)
        nodes = [ @root_node ]

        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.pos

            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end
        @root_node
    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
        path = [end_node]

        until path[0].parent == nil
            current_node = path[0]
            next_node = current_node.parent
            path.unshift(next_node)
        end
        path.map { |node| node.pos }
    end

end

# kpf = KnightPathFinder.new([0,0])
# p KnightPathFinder.valid_moves([7,5])
# p kpf.considered_positions
# p kpf.new_move_positions([3,3])
# p kpf.build_move_tree
# p kpf.find_path([2,1])
# p kpf.find_path([6,2])
# p kpf.find_path([7,6])
# p kpf.find_path([7,7])