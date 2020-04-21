require 'byebug'

def range(start_num, end_num)
    return [] if end_num < start_num
    return [start_num] if start_num+1 == end_num

    [start_num] + range(start_num+1, end_num)
end

#test
p range(1,5)
p range(1,35)
p range(5,1)
puts


def arr_sum(arr)
    return arr.first if arr.length == 1

    arr.first + arr_sum(arr[1..-1])
end

def it_arr_sum(arr)
    arr.inject { |sum, ele| sum+ele}
end

#test
p arr_sum(range(1,6))
p it_arr_sum(range(1,6))
puts


#exponentiation

def expo1(base, n)
    return base if n == 1
    base * expo1(base, n-1)
end

def expo2(base, n)
    return 1 if n == 0
    return base if n == 1

    if n.even?
        dup = expo2(base, n/2)
        dup * dup
    else
        dup = expo2(base, (n-1)/2)
        base * dup * dup
    end
end

#if n == 256, will run 256 iterations for expo1
#if n == 256, will run 8 iterations for expo2

#test
p expo1(2, 2)
p expo2(2, 4)
p expo2(2, 5)
puts


#dep dup

def deep_dup(arr)
    return arr if !arr.is_a?(Array)

    # new_arr = arr.map { |ele| deep_dup(ele) }           
    
    new_arr = []    
    arr.each { |ele| new_arr << deep_dup(ele) }           
    
    new_arr
end

#test
arr = [1, [2], [3, [4]]]
copy = deep_dup(arr)
p copy
arr[2] << 5
p copy
puts


#fibonacci

def rec_fib(n)
    return [] if n == 0    
    return [0] if n == 1
    return [0, 1] if n == 2

    # second_to_last = rec_fib(n-2)
    # last = rec_fib(n-1)
    #sum = second_to_last[-1] + last[-1]
    #(second_to_last + last + [sum])[-n..-1]
    fib = rec_fib(n-1)
    fib << fib[-2] + fib[-1]
end

def it_fib(n)
    fib_arr = [0, 1]
    return [] if n == 0    
    return [0] if n == 1
    return fib_arr if n == 2

    (n-2).times do
        next_el = fib_arr[-1] + fib_arr[-2]
        fib_arr << next_el
    end
    fib_arr
end

#test
p rec_fib(0)
p rec_fib(1)
p rec_fib(2)
 p rec_fib(10)
puts
p it_fib(0)
p it_fib(1)
p it_fib(2)
p it_fib(10)
puts


#binary search

def bsearch(arr, target)
    mid_indx = (arr.length / 2).floor
    return mid_indx if arr[mid_indx] == target
    return nil if arr.length == 1

    if arr[mid_indx] > target
        left_half = arr[0...mid_indx]
        bsearch(left_half, target)
    
    elsif arr[mid_indx] < target
        right_half = arr[mid_indx+1..-1]
        relative_mid_indx = bsearch(right_half, target)
        orig_indx = mid_indx + relative_mid_indx + 1 if relative_mid_indx != nil
    end
end

#test

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
puts


#merge sort

def merge_sort(arr)
    mid_indx = (arr.length / 2).floor
    return arr if arr.length < 2
    
    
    left_half = arr[0...mid_indx]
    right_half = arr[mid_indx..-1]

    # [ merge_sort(left_half), merge_sort(right_half) ].flatten
    merge(merge_sort(left_half), merge_sort(right_half))
end

def merge(arr1, arr2)
    merged_arr = []

    until arr1.length < 1 && arr2.length < 1 do

        if arr2[0] != nil && arr1[0] != nil
            min_ele_arr = arr1 if arr1[0] < arr2[0]
            min_ele_arr = arr2 if arr2[0] < arr1[0]
        else
            min_ele_arr = arr1 if arr2[0] == nil
            min_ele_arr = arr2 if arr1[0] == nil            
        end
        
        merged_arr << min_ele_arr.shift
    end

    merged_arr
end

#test
arr = [38, 27, 43, 3, 9, 82, 10]
arr1= [3, 27, 38, 43]
arr2= [9, 10, 82]
arr3= [*0..20].shuffle
# arr1= [38]
# arr2= [27]
# p merge(arr1, arr2)
p merge_sort(arr3)
puts


#array subsets

def subsets(arr)
    return [[]] if arr.length == 0

    subs = subsets(arr[0...-1])
    subs + subs.map { |sub| (sub + [arr[-1]]) }
end

#test

class Array
  def subsets
    return [[]] if empty?
    subs = take(self.count - 1).subsets
    subs.concat(subs.map { |sub| sub + [self.last] })
  end
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# p [1, 2, 3].subsets
puts

#permutations

def permutations(arr)
    return [arr] if arr.length == 1

    perm_arr = []

    first = arr.shift
    # p 'perms'
    perms = permutations(arr)
    # puts
    perms.each do |perm|
        [*0..perm.length].each do |indx|
            # p perm[0...indx]
            # p 'perm'
            perm_arr << ( perm[0...indx] + [first] + perm[indx..-1] )
        end
    end

    perm_arr
end

p permutations([1,2,3])
puts


#make change

def make_change_greedy(amount, coins = [25, 10, 5, 1])
    remaining_amount = amount
    change = []
    indx = 0


    until remaining_amount == 0
        coin = coins[indx]
        
        until remaining_amount-coin < 0

            if remaining_amount - coin >= 0
                remaining_amount -= coin
                change << coin
            end
        end

        if indx < coins.length-1
            indx += 1
        end
    end

    change
end

def make_change_better(amount, coins = [25, 10, 5, 1])
    remaining_amount = amount
    change = []
    indx = 0

    until remaining_amount == 0

        coins.each do |coin|
            while remaining_amount % coin == 0 && (remaining_amount-coin) > 0
                remaining_amount -= coin
                change << coin
            end

            coins.each do |coin2|
                if remaining_amount - coin2 >= 0
                    remaining_amount -= coin2
                    change << coin2
                    break
                end
            end

        end
    end

    change
end

#test
# p make_change_greedy(37)
# p make_change_better(37)
# p make_change_greedy(69)
# p make_change_better(69)
# p make_change_greedy(50)
# p make_change_better(50)
# p make_change_greedy(80)
# p make_change_better(80)
# p make_change_greedy(24, [10,7,1])
# p make_change_better(24, [10,7,1])
puts