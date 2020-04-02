#PHASE 1

def some?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele) }
    false
end

#tests
p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
p some?([8, 2]) { |n| n.even? }                                       # true
p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true
print "\n"


def exactly?(arr, n, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
    end
    count == n
end

#tests
p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
p exactly?([4, 5], 3) { |n| n > 0 }                             # false
p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true
print "\n"


def filter_out(arr, &prc)
    filtered_arr = []

    arr.each do |ele|
        if prc.call(ele) == false
            filtered_arr << ele
        end
    end
    filtered_arr
end

#tests
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]
print "\n"


def at_least?(arr, n, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
    end
    count >= n 
end

#tests
p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# false
p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# false
p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# true
p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# true
p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# true
p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# false
p at_least?([false, false, false], 3) { |bool| bool }
# false
p at_least?([false, true, true], 3) { |bool| bool }
# false
p at_least?([true, true, true], 3) { |bool| bool }
# true
p at_least?([true, true, true, true], 3) { |bool| bool }
# true
print "\n"


def every?(arr, &prc)
    arr.each do |ele|
        return false if prc.call(ele) == false
    end
    true
end

#tests
p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
p every?([8, 2]) { |n| n.even? }                                        # true
p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true
print "\n"


def at_most?(arr, n, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
    end
    count <= n     
end

#tests
p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false
print "\n"


def first_index(arr, &prc)
    arr.each_with_index do |ele, i|
        return i if prc.call(ele) == true
    end
    nil
end

#tests
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil
print "\n"



#PHASE 2

def xnor_select(arr, prc1, prc2)
    arr.select do |ele|
        prc1.call(ele) && prc2.call(ele) || prc1.call(ele) == false && prc2.call(ele) == false
    end
end

#tests
is_even = Proc.new { |n| n % 2 == 0 }
is_odd = Proc.new { |n| n % 2 != 0 }
is_positive = Proc.new { |n| n > 0 }
p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]
print "\n"


def filter_out!(arr, &prc)
    arr.each_with_index do |ele, i|
        if prc.call(ele) == true
            arr.delete_at(i)
        end
    end
    arr
end

#tests
arr_1 = [10, 6, 3, 2, 5 ]
filter_out!(arr_1) { |x| x.odd? }
p arr_1     # [10, 6, 2]

arr_2 = [1, 7, 3, 5 ]
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []

arr_3 = [10, 6, 3, 2, 5 ]
filter_out!(arr_3) { |x| x.even? }
p arr_3     # [3, 5]

arr_4 = [1, 7, 3, 5 ]
filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
p arr_4 # [1, 7, 3, 5]
print "\n"


def multi_map(arr, n = 1, &prc)
    new_arr = []
    arr.each do |ele|
        n.times { ele = prc.call(ele) }
        new_arr << ele
    end
    new_arr
end

#tests
p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]
p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]
print "\n"


def proctition(arr, &prc)
    true_arr = []
    false_arr = []
    arr.each do |ele|
         true_arr << ele if prc.call(ele)
        false_arr << ele if prc.call(ele) == false
    end
    final_arr = true_arr + false_arr
end

#tests
p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# [4, 7, 1, 3, -5, -10, -2]

p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# [8, 6, 10, 7, 3]

p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# ["boot", "bug", "boat", "cat", "dog"]
print "\n"


#PHASE 3

def selected_map!(arr, prc1, prc2)
    arr.each_with_index do |ele, i|
        if prc1.call(ele)
            arr[i] = prc2.call(ele)
        end
    end
    nil
end

#tests
is_even = Proc.new { |n| n.even? }
is_positive = Proc.new { |n| n > 0 }
square = Proc.new { |n| n * n }
flip_sign = Proc.new { |n| -n }

arr_1 = [8, 5, 10, 4]
p selected_map!(arr_1, is_even, square)     # nil
p arr_1                                     # [64, 5, 100, 16]

arr_2 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_2, is_even, flip_sign)  # nil
p arr_2                                     # [10, -4, 7, -6, 2, -9]

arr_3 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_3, is_positive, square) # nil
p arr_3                                     # [-10, 16, 49, 36, -2, -9]
print "\n"


def chain_map(num, prc_arr)
    prc_arr.each do |prc|
        num = prc.call(num)
    end
    num
end

#tests
add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

p chain_map(25, [add_5, half])          # 15.0
p chain_map(25, [half, add_5])          # 17.5
p chain_map(25, [add_5, half, square])  # 225
p chain_map(4, [square, half])          # 8
p chain_map(4, [half, square])          # 4
print "\n"


def proc_suffix(sent, hash)
    words = sent.split(" ")
    new_words = []

    words.each do |word|
        new_word = word

        hash.each do |prc, val|
            if prc.call(word)
                new_word += val
            end
        end
        new_words << new_word
    end
    new_words.join(" ")
end

#tests
contains_a = Proc.new { |w| w.include?('a') }
three_letters = Proc.new { |w| w.length == 3 }
four_letters = Proc.new { |w| w.length == 4 }

p proc_suffix('dog cat',
    contains_a => 'ly',
    three_letters => 'o'
)   # "dogo catlyo"

p proc_suffix('dog cat',
    three_letters => 'o',
    contains_a => 'ly'
)   # "dogo catoly"

p proc_suffix('wrong glad cat',
    contains_a => 'ly',
    three_letters => 'o',
    four_letters => 'ing'
)   # "wrong gladlying catlyo"

p proc_suffix('food glad rant dog cat',
    four_letters => 'ing',
    contains_a => 'ly',
    three_letters => 'o'
)   # "fooding gladingly rantingly dogo catlyo"
print "\n"


def proctition_platinum(arr, *prcs)
    hash = Hash.new { |h, k| h[k] = Array.new(0) }
    count = 0
    prcs.each do |prc|
        count +=1
        arr.each do |ele|
            if prc.call(ele) && hash.values.flatten.include?(ele) == false
                hash[count] << ele
            else
                hash[count]
            end
        end
    end
    hash
end

#tests
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# {1=>["when!", "WHERE!"], 2=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}
print "\n"


def procipher(sent, hash)
    words = sent.split(" ")
    new_words = []

    words.each do |word|
        new_word = word
        hash.each do |k_prc, v_prc|
            if k_prc.call(word)
                new_word = v_prc.call(new_word)
            end
        end
        new_words << new_word
    end
    new_words.join(" ")
end

#tests
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias ???!tahw"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw???"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw:)"

p procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p procipher('STOP that taxi now!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? taxi??? !won"
print "\n"


def picky_procipher(sent, hash)
    words = sent.split(" ")
    new_words = []

    words.each do |word|
        new_word = word
        count = 0

        hash.each do |k_prc, v_prc|
            if k_prc.call(word) && count < 1
                count += 1
                new_word = v_prc.call(new_word)
            end
        end
        new_words << new_word
    end
    new_words.join(" ")
end

#tests
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p picky_procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias what!???"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw"

p picky_procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p picky_procipher('STOP that taxi!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? !ixat"
print "\n"
