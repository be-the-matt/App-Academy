def element_count(arr)
    elements = Hash.new(0)
    arr.each { |ele| elements[ele] += 1 }
    elements
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.keys.include?(char)
            str[i] = hash[char]
        end
    end
    str
end

def product_inject(arr)
    arr.inject { |final, n| final * n }
end