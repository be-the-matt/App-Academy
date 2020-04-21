#Problem 1: 

def sum_recur(array)
    return 0 if array.empty?

    array.pop + sum_recur(array)
end

#test
p sum_recur([1,2,3,4])
puts

#Problem 2: 

def includes?(array, target)
    return true if array[-1] == target
    return false if array.empty?

    includes?(array[0...-1], target)
end

#test
p includes?([*1..9], 8)
p includes?([*1..9], 18)
puts

# Problem 3: 
def num_occur(array, target)
    return 0 if array.empty?
    last_val = array.pop
    if last_val == target
        count = 1
    else
        count = 0
    end

    count += num_occur(array, target)
end

#test
p num_occur([1,3,2,7,4,6,8,6,3,4,5,6], 4)
p num_occur([1,3,2,4,6,8,6,3,4,5,6,3], 3)
p num_occur([1,3,2,7,4,6,8,6,3,4,5,6], 8)
puts

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length <= 1
    return true if array[-1] + array[-2] == 12

    add_to_twelve?(array[0...-1])
end

#test
p add_to_twelve?([1,3,2,7,4,8,6,3,4,5,6])
p add_to_twelve?([1,3,2,7,4,6,8,6,3,4,5,6])
p add_to_twelve?([1,3,2,6,6,7,4,6,8])
puts

# Problem 5: 

def sorted?(array)
    return true if array.length <= 1
    return false if array[-1] < array[-2]
    
    sorted?(array[0...-1])
end

#test
p sorted?([2,5,8,3,4,7])
p sorted?([*1..8])
puts


# Problem 6: 

def reverse(string)
    return string[0] if string.length == 1

    string[-1] += reverse(string[0...-1])
end

#test
p reverse('test')