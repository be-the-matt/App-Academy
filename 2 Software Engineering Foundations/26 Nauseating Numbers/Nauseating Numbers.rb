require 'prime'

#phase 1

def strange_sums(arr)
    count = 0
    arr.each_with_index do |ele1, indx1|
        arr.each_with_index do |ele2, indx2|
            count += 1 if ( (ele1 + ele2) == 0 && indx2 > indx1 )
        end
    end
    count
end

#tests
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
print "\n"


def pair_product(numbers, product)
    numbers.each_with_index do |ele1, indx1|
        numbers.each_with_index do |ele2, indx2|
            return true if ( (ele1 * ele2) == product && indx2 > indx1 )
        end
    end
    false
end

#tests
p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false
print "\n"


def rampant_repeats(str, hash)
    new_str = ""

    str.each_char do |char|
        ( hash[char] ||= 1 ).times { new_str += char }
    end
    new_str
end

#tests
p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'
print "\n"


def perfect_square(num)
    (1..num).each { |n| return true if n*n == num }
    false
end

#tests
p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false
print "\n"


#phase 2

def anti_prime?(num)
    num_factors = find_factors(num).length
    (1...num).each { |number| return false if find_factors(number).length > num_factors }
    true
end

def find_factors(number)
    (1...number).select { |factor| number % factor == 0 }
end

#tests
p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
print "\n"


def matrix_addition(arr1, arr2)
    height = arr1.length
    width = arr1[0].length
    sum_matrix = Array.new(height) { Array.new(width) }

    (0...height).each do |y|
        (0...width).each do |x|
            sum_matrix[y][x] = arr1[y][x] + arr2[y][x]
        end
    end

    sum_matrix
end

# tests
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
print "\n"


def mutual_factors(*nums)
    factors_count_hash = Hash.new(0)
    nums.each do |num|
        (1..num).each do |factor|
            if num % factor == 0
                factors_count_hash[factor] += 1
            end
        end
    end
    mutual_facts = []
    factors_count_hash.each do |factor, count|
        mutual_facts << factor if count == nums.length
    end
    mutual_facts
end

#tests
p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]
print "\n"


def tribonacci_number(n)    
    sequence = [1, 1, 2]
    return sequence[0] if n == 1
    return sequence[1] if n == 2
    return sequence[2] if n == 3
    
    (n-3).times do
        sequence << sequence[-3..-1].sum
    end
    sequence[-1]
end

#tests
p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
print "\n"


#phase 3

def matrix_addition_reloaded(*matrices)
    matrix_dimensions_hash = Hash.new{0}
    height = 0
    width = 0
    
    matrices.each do |matrix|
        height = matrix.length
        width = matrix[0].length
        matrix_dimensions_hash["#{width}, #{height}"] += 1
    end
    return nil if matrix_dimensions_hash.values.length > 1

    sum_matrix = Array.new(height) { Array.new(width) {0} }#[0][0]
    matrices.each do |matrix|
        matrix.each_with_index do |row, row_indx|
            row.each_with_index do |ele, column_indx|
                sum_matrix[row_indx][column_indx] += matrix[row_indx][column_indx]
            end
        end
    end
    sum_matrix
end

#tests
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
print "\n"


def squarocol?(arr)
    t_arr = arr.transpose
    return true if has_sequence?(arr)
    return true if has_sequence?(t_arr)
    false
end

def has_sequence?(array)
    array.each_with_index do |row, row_indx|
        return true if row.all? { |ele| ele == array[row_indx][0] }
    end
    false
end

#tests
p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false
print "\n"


def squaragonal?(arr)
    row_indx = 0
    column_indx = 0
    diagonal1 = []

    while row_indx < arr.length && column_indx < arr[0].length
        diagonal1 << arr[row_indx][column_indx]
        row_indx += 1
        column_indx += 1
    end

    row_indx = arr.length-1
    column_indx = 0
    diagonal2 = []

    while row_indx >= 0 && column_indx < arr[0].length
        diagonal2 << arr[row_indx][column_indx]
        row_indx -= 1
        column_indx += 1
    end    

    return true if diagonal1.all? { |ele| ele == diagonal1[0] }
    return true if diagonal2.all? { |ele| ele == diagonal2[0] }
    false    
end

#tests
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
print "\n"


def pascals_triangle(n)
    arr = [[1]]
    return arr if n == 1

    until arr.length == n
        next_arr = []
        last_row = arr[-1]
        (last_row.length+1).times do |count|
            if count == 0 || count == (last_row.length)
                next_arr << 1
            else
               next_arr << (last_row[count] + last_row[count-1])
            end
        end
        arr << next_arr
    end
    arr
end

#tests
p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]
print "\n"


def mersenne_prime(n)
    arr = []
    i = 2
    while arr.length < n
        if Prime.prime?((2**i)-1)
            arr << ((2**i)-1)
        end
        i += 1
    end
    arr[-1]
end

#tests
p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
print "\n"


def triangular_word?(word)
    alpha = ("a".."z").to_a
    word_num = 0
    word.each_char do |letter|
        word_num += (alpha.index(letter)+1)
    end
    #i^2 + i - 2*word_num

    num = ( -1 + (1 + 4*2*word_num)**(0.5) ) / 2
    return true if num % 1 == 0
    false
end

#tests
p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false
print "\n"


def consecutive_collapse(arr)

    no_consecs = false

    until no_consecs
        no_consecs = true

        i = 0
        while i < arr.length-1
            if arr[i]+1 == arr[i+1] || arr[i]-1 == arr[i+1]
                no_consecs = false
                arr = arr[0...i] + arr[(i+2)..-1]
                i = 0
                break
            end
            i+=1
        end
    end
    arr
end

#tests
p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []
print "\n"


def pretentious_primes(arr, n)
    arr.each_with_index do |ele, i|
        if n > 0
            count = 0
            until count == n
                ele += 1
                if Prime.prime?(ele)
                    arr[i] = ele
                    count += 1
                end
            end
        else
            count = 0
            until count == -n
                ele -= 1
                if ele < 2
                    arr[i] = nil
                    break
                end

                if Prime.prime?(ele)
                    arr[i] = ele
                    count += 1
                end
            end
        end
    end
    arr
end

#tests
p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
print "\n"
