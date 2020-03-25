# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        if self.empty?
            return nil
        elsif self.length.even?
            ( self.sort[length/2] + self.sort[length/2 - 1] ) / 2.0
        else
            self.sort[length/2]
        end
    end

    def counts
        ele_hash = Hash.new(0)
        self.each { |ele| ele_hash[ele] += 1}
        ele_hash
    end

    #Part 2

    def my_count(ele)
        count = 0
        self.each do |el|
            count += 1 if el == ele
        end
        count
    end

    def my_index(ele)
        self.each_with_index do |el, i|
            return i if el == ele
        end
        nil
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if new_arr.include?(ele) == false
                new_arr << ele
            end
        end
        new_arr
    end

    def my_transpose
        rows = self.length
        columns = self[0].length
        new_arr = Array.new(rows) { Array.new(columns) }

        new_column = 0
        self.each do |row|
            new_row = 0
            row.each do |column|
                new_arr[new_row][new_column] = column
                new_row += 1
            end
            new_column += 1
        end

        new_arr
    end

end