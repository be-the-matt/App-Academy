require "byebug"

def select_even_nums(num_arr)
    num_arr.select(&:even?)
end

def reject_puppies(dog_arr)
    dog_arr.reject { |hash| hash["age"] < 3 }
end

def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    aba_word = []
    word.each_char do |letter|
        aba_word << letter
        if vowels.include?(letter)
            aba_word << "b"
            aba_word << letter
        end
    end
    aba_word.join("")
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end