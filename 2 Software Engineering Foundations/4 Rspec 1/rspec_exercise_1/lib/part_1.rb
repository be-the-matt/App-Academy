def average(num1, num2)
    ( num1 + num2 ) / 2.0
end

def average_array(arr1)
    sum = arr1.inject { |sum, ele| sum + ele }
    average = sum / ( arr1.length * 1.0 )
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase! + "!"
end

def alternating_case(str)
    str_arr = str.split(" ")
    new_str = []
    str_arr.each.with_index do |word, i|
        if i % 2 == 0
            new_str << word.upcase
        else
            new_str << word.downcase
        end
    end
    new_str.join(" ")
end