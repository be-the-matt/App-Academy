class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        prev_parent = @parent
        
        if prev_parent != nil
            indx = prev_parent.children.index(self)
            prev_parent.children.delete_at(indx)
        end
        
        @parent = parent_node

        if @parent != nil && !@parent.children.include?(self)
            @parent.children << self
        end

    end

    def add_child(child_node)
        @children << child_node
        child_node.parent = self
    end

    def remove_child(child_node)
        raise 'not a child' if !@children.include?(child_node)
        
        indx = @children.index(child_node)
        @children.delete_at(indx)

        child_node.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        p self.value
        self.children.each do |child|
            result = child.dfs(target)
            return result if result != nil
        end

        nil
    end

    def bfs(target)
        queue = []
        queue << self

        until queue.empty?
            first_node = queue.shift

            if first_node.value == target
                return first_node
            else
                first_node.children.each { |child_node| queue << child_node }
            end
        end
    end
end

# node1 = PolyTreeNode.new('root')
# node2 = PolyTreeNode.new('child1')
# node3 = PolyTreeNode.new('child2')

# node2.parent = node1
# node3.parent = node1
# p node1.children
# node3.parent = node2