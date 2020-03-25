# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"
require "prime"

def largest_prime_factor(num)
    prime_factors = []
    (2..num).each do |i|
        if num % i == 0 && Prime.prime?(i)
            prime_factors << i
        end
    end
    prime_factors.max
end

def unique_chars?(word)
    letter_hash = Hash.new(0)
    
    word.each_char do |letter|
        letter_hash[letter] += 1
    end

    letter_hash.each_value do |v_count|
        if v_count > 1
            return false
        end
    end
    true
end

def dupe_indices(letter_arr)
    letter_hash = Hash.new {|h,k| h[k] = [] } 
    letter_arr.each_with_index do |letter, i|
        letter_hash[letter] << i
    end
    letter_hash.each do |k, v|
        if v.length < 2
            letter_hash.delete(k)
        end
    end
    letter_hash
end

def ana_array(arr1, arr2)
    arr1_hash = Hash.new(0)
    arr2_hash = Hash.new(0)

    arr1.each do |ele|
        arr1_hash[ele] +=1
    end

    arr2.each do |ele|
        arr2_hash[ele] +=1
    end

    arr1_hash == arr2_hash
end