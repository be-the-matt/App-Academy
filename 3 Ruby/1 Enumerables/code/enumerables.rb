class Array

    def my_each(&block)

        arr_indx = 0
        arr_length = self.length

        while arr_indx < arr_length
            block.call(self[arr_indx])
            arr_indx += 1
        end

        self
    end

    def my_select(&block)
        new_arr = []

        self.my_each do |ele|
            new_arr << ele if block.call(ele)
        end
        p new_arr
    end

    def my_reject(&block)
        new_arr = []
        
        self.my_each do |ele|
            new_arr << ele if !block.call(ele)
        end
        p new_arr
    end

    def my_any?(&block)

        self.my_each do |ele|
            return true if block.call(ele)
        end
        false
    end

    def my_all?(&block)

        self.my_each do |ele|
            return false if !block.call(ele)
        end
        true
    end

    def my_flatten
        flat_arr = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flat_arr.concat(ele.my_flatten)
            else
                flat_arr << ele
            end
        end

        flat_arr
    end

    def my_zip(*args)
        zipped_array = []
        end_indx = self.length-1

        [*0..end_indx].my_each do |indx|
            sub_arr = []
            sub_arr << self[indx]

            args.my_each do |array|
                if array[indx] == nil
                    sub_arr << nil
                else
                    sub_arr << array[indx]
                end
            end
            zipped_array << sub_arr
        end

        zipped_array
    end

    def my_rotate(rotate_num=1)
        rotated_arr = Array.new(self.length) { 0 }

        self.each_with_index do |ele, indx|
            new_indx = (indx - rotate_num) % self.length
            rotated_arr[new_indx] = ele
        end
        rotated_arr
    end

    def my_join(separator='')
        new_str = ''
        
        self.my_each do |ele|
            new_str += ele
            new_str += separator if self.last != ele
        end

        new_str
    end

    def my_reverse
        rev_arr = Array.new(self.length)
        rev_indx = self.length-1

        self.my_each do |ele|
            rev_arr[rev_indx] = ele
            rev_indx -= 1
        end

        rev_arr
    end


end

#tests

#my_each
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# p return_value

#my_select
# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []

#my_reject
# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]

#my_any?
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

#my_all?
# a = [1, 2, 3]
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#my_flatten
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

#my_zip
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

#my_rotate
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

#my_join
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

#my_reverse
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]