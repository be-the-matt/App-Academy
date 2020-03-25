def hipsterfy(str)
    vows = "aeiou"
    check = true
    i = str.length-1
    while check && i >= 0
        if vows.include?(str[i])
            str[i] = ""
            check = false
        end
        i -= 1
    end
    str
end

def vowel_counts(str)
    str.downcase!
    vows = "aeiou"
    str_hash = Hash.new(0)
    str.each_char do |char| 
        if vows.include?(char)
            str_hash[char] += 1
        end
    end
    str_hash
end

def caesar_cipher(str, num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    str.each_char do |char|
        if alpha.include?(char)
            new_str += alpha[ (alpha.index(char) + num) % alpha.length ]
        else
            new_str += char
        end
    end
    new_str
end