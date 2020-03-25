require 'byebug'

def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    words = string.split(" ")
    new_words = []
    words.each do |word|
        new_words << prc.call(word)
    end
    new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    end
    prc2.call(num)
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each do |num|
        if prc1.call(num) && prc2.call(num)
            new_arr << num
        end
    end
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |num, i|
        if i % 2 == 0
            new_arr << prc1.call(num)
        else
            new_arr << prc2.call(num)
        end
    end
    new_arr
end