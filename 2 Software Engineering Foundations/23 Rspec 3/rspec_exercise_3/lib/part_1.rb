def is_prime?(num)
    return false if num < 2
    (2...num).each do |n|
        return false if num % n == 0        
    end
    true
end

def nth_prime(n)
    prime_nums = []
    i = 2
    while prime_nums.length < n
        prime_nums << i if is_prime?(i)
        i += 1
    end
    prime_nums[-1]
end

def prime_range(min, max)
    prime_nums = []
    (min..max).each do |num|
        prime_nums << num if is_prime?(num)
    end
    prime_nums
end