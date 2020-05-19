#exercise 1

class Stack
    def initialize
        # create ivar to store stack here!
        @ivar = []
    end

    def push(el)
        # adds an element to the stack
        @ivar << el
    end

    def pop
        # removes one element from the stack
        @ivar.delete_at(-1)
        @ivar
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @ivar[-1]
    end
end

data = Stack.new
p data.push(5)
p data.push(6)
p data.push(9)
p data.pop
p data.peek
puts


#exercise 2

class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

queue = Queue.new
p queue.enqueue(1)
p queue.enqueue(2)
p queue.enqueue(3)
p queue.dequeue
p queue.peek
puts


#exercise 3

class Map

    def initialize
        @map = Array.new #(n) { Array.new(n)}
    end

    def set(key, value)
        @keys = []
        @map.each { |arr| @keys << arr[0] }

        if !@keys.include?(key)
            @map << [key, value]
        else
            indx = @keys.index(key)
            @map[indx][1] = value
        end
        
        @map
    end

    def get(key)
        indx = @keys.index(key)
        return nil if indx == nil
        @map[indx][1]
    end

    def delete(key)
        indx = @keys.index(key)
        @map.delete_at(indx)        
        @map
    end

    def show
        @map
    end

end

map = Map.new
p map.set('m', 5)
p map.set('k', 18)
p map.set('m', 8)
p map.get('m')
p map.get('i')
p map.delete('m')
p map.show
puts