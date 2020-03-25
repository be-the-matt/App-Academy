def palindrome?(string)
    string_r = []
    string.each_char { |char| string_r.unshift(char)}

    string_r.join("") == string
end

def substrings(string)
    subs = []
    
    string.each_char.with_index do |char, i|
        sub_s = ""
        while i <= string.length-1
            sub_s += string[i]
            subs << sub_s
            i += 1
        end
    end
    subs
end

def palindrome_substrings(string)
    sub_s = substrings(string)
    pal_arr = [] 

    sub_s.each do |sub_str| 
        if sub_str.length > 1
            if palindrome?(sub_str)
                pal_arr << sub_str
            end
        end
    end
    pal_arr
end