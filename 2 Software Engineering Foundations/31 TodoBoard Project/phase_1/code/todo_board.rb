require './item.rb'
require './list.rb'

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts
        puts "choose your action from these options:"
        puts "- mktodo <title> <deadline> <optional description>"
        puts "- up <index> <optional amount>"
        puts "- down <index> <optional amount>"
        puts "- swap <index_1> <index_2>"
        puts "- sort"
        puts "- priority"
        puts "- print <optional index>"
        puts "- quit"
        @cmd, *selection = gets.chomp.split(' ')
    
        case @cmd
        when 'mktodo'
            @list.add_item(selection[0], selection[1], selection[2])
            true
        when 'up'
            @list.up(selection[0].to_i) if selection[1] == nil
            @list.up(selection[0].to_i, selection[1].to_i) if selection[1] != nil
            true
        when 'down'
            @list.down(selection[0].to_i) if selection[1] == nil
            @list.down(selection[0].to_i, selection[1].to_i) if selection[1] != nil
            true
        when 'swap'
            @list.swap(selection[0].to_i, selection[1].to_i)
            true
        when 'sort'
            @list.sort_by_date!
            true
        when 'priority'
            @list.print_priority
            true
        when 'print'
            @list.print if selection[0] == nil
            @list.print_full_item(selection[0].to_i) if selection[0] != nil
            true
        when 'quit'
            false
        end   
    end

    def run
        continue = true
        until continue == false
            continue = self.get_command
        end
    end

end
my_list = TodoBoard.new("matts")
my_list.run