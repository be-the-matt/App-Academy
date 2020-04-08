# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  factors = []

  [*1..num].each do |fact|
    factors << fact if num % fact == 0
  end
  
  factors
end

#tests
p factors(12)
puts

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    indx = 0

    while indx < self.length-1
      
      #if self[indx+1] < self[indx]
      if prc.call(self[indx], self[indx+1]) == 1
        self[indx], self[indx+1] = self[indx+1], self[indx]
        indx = 0
      else
        indx += 1
      end
    end
    self
  end

  def bubble_sort(&prc)
    p orig = self.dup
    self.bubble_sort!(&prc)
  end
end

#tests
arr = [2,4,4,2,4,232,7,0,7,5,4,4,3,6,7,7,3,12,45,2,8]
p arr.bubble_sort { |num1, num2| num1 <=> num2 }
puts
p arr.bubble_sort! { |num1, num2| num1 <=> num2 }
puts


# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  substr_arr = []

  string.each_char.with_index do |char, indx|
    [*indx...string.length].each do |next_indx|
      substr_arr << string[indx..next_indx]
    end
  end
  substr_arr
end

def subwords(word, dictionary)
  real_strs = []
  substrings(word).each do |str|
    real_strs << str if dictionary.any? { |word| word == str }
  end
  real_strs
end

#tests
p substrings('cat')
puts
p subwords('cat', ['at', 'cat', 'a'])
puts

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
  array.each_with_index do |num, indx|
    array[indx] *= 2
  end
  array
end

#tests
arr = [34, 2, 64, 7, 32, 0, 2, 1, 4]
p doubler(arr)
puts

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array

  def my_each(&prc)
    arr_indx = 0
    arr_length = self.length

    while arr_indx < arr_length
        prc.call(self[arr_indx])
        arr_indx += 1
    end

    self
  end

end

#tests
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
p return_value
puts

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
    new_arr = []

    self.my_each do |ele|
      new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  def my_select(&prc)
    new_arr = []

    self.my_each do |ele|
        new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  def my_inject(&blk)
  end
end

#tests
a = [*1..20]

p a.my_map { |num| num % 2 == 0 }
puts
p a.my_select { |num| num > 1 }
p a.my_select { |num| num == 4 }
puts

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
  sent = ''
  strings.inject { |sent, word| sent += word }
end

#tests
p concatenate(["Yay ", "for ", "strings!"])
puts