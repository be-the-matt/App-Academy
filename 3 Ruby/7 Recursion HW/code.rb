def sum_to(n)
    return 1 if n == 1
    return nil if n < 0
    n + sum_to(n-1)
end

# Test Cases
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil
puts


def add_numbers(nums_arr)
    return nums_arr.first if nums_arr.length == 1
    return nil if nums_arr.length == 0

    nums_arr.first + add_numbers(nums_arr[1..-1])
end

# Test Cases
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil
puts


def gamma_fnc(n)
    return 1 if n == 1
    return nil if n < 1

    (n-1) * gamma_fnc(n-1)
end

# Test Cases
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
puts


def ice_cream_shop(flavors, favorite)
    return true if flavors.first == favorite
    return false if flavors.length == 0
    
    ice_cream_shop(flavors[1..-1], favorite)
end

# Test Cases
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false
puts


def reverse(string)
    # return string[0] if string.length == 1
    return '' if string.length == 0

    string[-1] + reverse(string[0..-2])
end

# Test Cases
p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
puts