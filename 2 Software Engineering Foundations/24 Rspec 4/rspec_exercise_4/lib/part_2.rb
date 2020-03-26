def proper_factors(num)
    (1...num).select { |n| num % n == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    ideal_nums = []
    i = 1
    while ideal_nums.length < n
        ideal_nums << i if perfect_number?(i)
        i += 1
    end
    ideal_nums
end