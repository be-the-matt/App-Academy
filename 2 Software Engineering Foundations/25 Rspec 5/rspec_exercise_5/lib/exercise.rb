def zip(*arrays)
    hash = Hash.new { |h, k| h[k] = Array.new }

    arrays.each do |array|
        array.each_with_index do |ele, i|
            hash[i] << ele
        end
    end

    indx_arr = []
    hash.each { |indx, val| indx_arr << val }
    indx_arr
end

def prizz_proc(arr, prc1, prc2)
    arr.select do |ele|
        ( !( prc1.call(ele) && prc2.call(ele) ) && ( prc1.call(ele) || prc2.call(ele) ) )
    end
end

def zany_zip(*arrays)
    hash = Hash.new { |h, k| h[k] = Array.new }
    max_length = 0
    
    arrays.each do |array|
        max_length = array.length if array.length > max_length
    end    

    arrays.each do |array|
            
        (0...max_length).each do |i|
                
            if array[i] != nil
                hash[i] << array[i]                
            else
                hash[i] << nil
            end
        end    
    end

    indx_arr = []
    hash.each { |indx, val| indx_arr << val }
    indx_arr
end

def maximum(arr, &prc)
    largest = 0
    winner = nil

    arr.each do |ele|        
        if prc.call(ele) >= largest
            largest = prc.call(ele)
            winner =  ele
        end
    end
    winner
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = Array.new }

    arr.each { |ele| hash[prc.call(ele)] << ele }
    hash
end

def max_tie_breaker(arr, prc1, &prc2)
    largest_ele = nil
    largest_result = 0

    arr.each do |ele|
        if prc2.call(ele) > largest_result
            largest_result = prc2.call(ele)
            largest_ele = ele
        elsif prc2.call(ele) == largest_result
            if prc1.call(ele) > largest_result
                largest_result = prc1.call(ele)
                largest_ele = ele
            end
        end
    end
    largest_ele
end

def silly_syllables(str)
    words = str.split(" ")
    new_words = []

    words.each do |word|
        vowel_indxs = vow_indx(word)
        if vowel_indxs.length > 1
            new_words << word[vowel_indxs[0]..vowel_indxs[-1]]
        else
            new_words << word
        end
    end
    new_words.join(" ")
end

def vow_indx(word)
    indx = []
    vowels = "aeiou"

    word.each_char.with_index do |char, i|
        indx << i if vowels.include?(char)
    end
    indx
end