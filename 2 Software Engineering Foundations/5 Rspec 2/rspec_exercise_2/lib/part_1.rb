def partition(arr, num)
    new_arr = Array.new(2) {Array.new}

    arr.each do |n|
        if n < num
            new_arr[0] << n
        else
            new_arr[1] << n
        end
    end
    return new_arr
end

def merge(hash1, hash2)
    new_hash = Hash.new(0)

    hash1.each do |key, value|
        new_hash[key] = value
    end

    hash2.each do |key, value|
        new_hash[key] = value
    end
    new_hash
end

def censor(sent, curse_w_array)
    vows = "aeiou"
    words = sent.split(" ")

    words.each do |word|
        if curse_w_array.include?(word.downcase)
            word.each_char.with_index do |letter, i|
                if vows.include?(letter.downcase)
                    word[i] = "*"
                end
            end
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    result = Math.log(num, 2)
    if result % 1 == 0
        true
    else
        false
    end
end