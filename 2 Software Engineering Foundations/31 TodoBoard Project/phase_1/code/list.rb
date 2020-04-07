require './item.rb'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description= '')
       if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description) 
            return true
       end
       false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >=0 && index < @items.length
    end

    def swap(index_1, index_2)
        return false if @items[index_1] == nil || @items[index_2] == nil
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "____________________________________________________________"
        puts "                  #{@label} List"
        puts
        puts 'Index   |         Item         |      Due Date'
        puts "____________________________________________________________"
        @items.each do |item|
            puts "#{@items.index(item)}              #{item.title}                #{item.deadline}"
        end
        puts
    end

    def print_full_item(index)
        puts "____________________________________________________________"
        puts "#{@items[index].title}                                 #{@items[index].deadline}"
        puts "#{@items[index].description}"
        puts "____________________________________________________________"
        puts
    end

    def print_priority
        self.print_full_item(0)
        puts
    end

    def up(index, amount=1)
        return false if  @items[index] == nil
        amount.times do
            return true if index == 0
            self.swap(index, index-1) if @items[index-1] != nil
            index -= 1
        end
        true
    end

    def down(index, amount=1)
        return false if  @items[index] == nil
        amount.times do
            return true if index == @items.length-1
            self.swap(index, index+1) if @items[index+1] != nil
            index += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

end

#tests

# list = List.new('matts')
# list.add_item('laundry', '2020-01-01', 'wash laundry')
# list.add_item('towel', '2021-11-01', 'buy')
# list.add_item('ball', '2071-06-01', 'dog')
# list.add_item('ralph', '2071-06-02')
# list.add_item('sock', '2011-12-07', 'cat')
# list.add_item('peas', '2071-06-01', 'can')
# p list.size
# p list
# p list.swap(1,3)
# p list
# p list.priority
# p list.swap(1,13)
# list.print
# list.print_full_item(2)
# list.print_priority
# list.up(2, 4)
# list.print
# list.down(0, 9)
# list.print
# list.sort_by_date!
# list.print