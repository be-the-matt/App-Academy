class Item
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)
        year = date_string[0..3].to_i
        month = date_string[5..6].to_i
        day = date_string[8..9].to_i

        #return false if year.split('').length != 4        
        return false if month < 1 || month > 12
        return false if day < 1 || day > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
    end

end

#tests
# p item = Item.new('laundry', '2020-01-01', 'wash laundry')
# p item.title
# p item.deadline
# p item.description
# p item = Item.new('laundry', '2020-1-01', 'wash laundry')