# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    larger_num = [num_1, num_2].max
    smaller_num = [num_1, num_2].min
    i = 1
    done = false
    until done
        if (i * larger_num) % smaller_num == 0
            answer = i * larger_num
            done = true
        end
        i += 1
    end
    answer
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    pairs = Hash.new(0)
    str.each_char.with_index do |letter, indx|
        if indx != str.length-1
            pair = letter + str[indx+1]
        end
        pairs[pair] += 1
    end
    pairs.key(pairs.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inv = Hash.new(0)
        new_values = self.keys
        new_keys = self.values
        new_keys.each_with_index do |key, indx|
            inv[key] = new_values[indx]
        end
        inv
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |num1, indx1|            
            self.each_with_index do |num2, indx2|
                if ( num1+num2 == num ) && ( indx1 < indx2 )
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false
        until sorted
            sorted = true
            self.each_with_index do |num, indx|
                if indx+1 < self.length && prc == nil
                    if num > self[indx+1] #|| prc.call(num, self[indx+1]) == 1
                        self[indx], self[indx+1] = self[indx+1], self[indx]
                        sorted = false
                    end
                elsif indx+1 < self.length
                    if prc.call(num, self[indx+1]) == 1
                        self[indx], self[indx+1] = self[indx+1], self[indx]
                        sorted = false
                    end                
                end

                # if indx+1 < self.length && num > self[indx+1]
                #     self[indx], self[indx+1] = self[indx+1], self[indx]
                #     sorted = false
                # end
            end
        end
        self
    end
end
