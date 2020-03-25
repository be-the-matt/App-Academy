require 'byebug'
require 'prime'

def no_dupes?(arr)
    no_repeat = []
    arr.each do |ele|
        if arr.count(ele) == 1
            no_repeat << ele
        end
    end
    no_repeat
end

#tests
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
puts "\n"

def no_consecutive_repeats?(arr)
    (0..arr.length-2).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end

#tests
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
puts "\n"


def char_indices(str)
    hash = Hash.new {|h,k| h[k] = Array.new }
    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end

#tests
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts "\n"


def longest_streak(str)
    longest_count = 0
    count = 1
    longest_char = ""
    (0..str.length-1).each do |i|
        count += 1 if str[i] == str[i+1]
        if str[i] != str[i+1]
            if count >= longest_count
                longest_count = count
                longest_char = str[i]
                count = 1
            end
        end
    end
    longest_char*longest_count
end

#tests
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
puts "\n"


def bi_prime?(num)
    factors = []
    (2...num).each { |val| factors << val if num % val == 0 }
    factors.each do |factor1|
        factors.each do |factor2|
            if factor1*factor2 == num && Prime.prime?(factor1) && Prime.prime?(factor2)
                return true
            end
        end
    end
    false
end

#tests
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
puts "\n"


def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    encrypted = ""
    message.each_char.with_index do |letter, i|
        keys_indx = (i+keys.length) % (keys.length)
        new_indx = ( alpha.index(letter) + keys[keys_indx] ) % alpha.length
        encrypted += alpha[new_indx]
    end
    encrypted
end

#tests
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
puts "\n"


def vowel_rotate(str)
    vowels = "aeiou"
    new_str = ""
    str.each_char.with_index do |char, i|
        new_str += char if !vowels.include?(char)
        if vowels.include?(char)
            (i-1).downto(i-str.length+1).each do |reverse_indx|
                if vowels.include?(str[reverse_indx])
                    new_str += str[reverse_indx]
                    break
                end
            end
        end
    end
    new_str
end

#tests
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
puts "\n"


class String

    def select(&prc)
        new_str = ""
        return new_str if prc == nil

        self.each_char do |char|
            if prc.call(char) == true
                new_str += char
            end
        end
        new_str
    end


    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
    end

end


#tests
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
puts "\n"

#tests
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
puts "\n"


def multiply(a, b)
    return 0 if b == 0

    if b > 0
        sum = a + multiply(a, b-1)
    else
        sum = -(a + multiply(a, -b-1))
    end
end

#tests
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
puts "\n"


def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2

    seq = lucas_sequence(num-1)
    seq << ( seq[-1] + seq[-2] )
end

#tests
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
puts "\n"


def prime_factorization(num)
    (2...num).each do |n|
        if num % n == 0
            return [ *prime_factorization(n), *prime_factorization(num/n) ]
        end
    end
    [num]
end

#tests
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
puts "\n"
