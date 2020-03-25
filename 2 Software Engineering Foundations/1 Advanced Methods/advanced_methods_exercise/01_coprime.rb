# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    num1_factors = div_by(num_1)
    num2_factors = div_by(num_2)

    num1_factors.each do |ele|
        if num2_factors.include?(ele)
            return false
        end
    end
    return true
end

def div_by(num)
    factors = []
    [*2...num].each do |ele|
        if num % ele == 0
            factors << ele
        end
    end
    return factors
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
