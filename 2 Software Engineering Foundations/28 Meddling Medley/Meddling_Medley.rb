#PHASE 1

def duos(str) 
    str_count = 0

    (1...str.length).each do |i|
        str_count += 1 if str[i] == str[i-1]
    end
    str_count
end

#tests
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0
print "\n"


def sentence_swap(sent, hash)
    words = sent.split(" ")

    new_words = words.map do |word|
        hash[word] || word
    end

    new_words.join(" ")
end

#tests
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
print "\n"


def hash_mapped(hash, prc1, &prc2)
    new_hash = {}

    hash.each do |k, v|
        new_hash[prc2.call(k)] = prc1.call(v)
    end
    new_hash
end

#tests
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
print "\n"


def counted_characters(str)
    arr = []
    chars = str.split("")
    chars.each do |char|
        if chars.count(char) > 2 && !arr.include?(char)
            arr << char
        end
    end
    arr
end

#tests
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
print "\n"


def triplet_true(str)
    count = 0

    (0...str.length).each do |i|
        count += 1 if str[i] == str[i+1]
        return true if count == 3
    end
    false
end

#tests
p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false
print "\n"


def energetic_encoding(str, hash)
    str.each_char.with_index do |char, i|
        if str[i] != " "
            str[i] = ( hash[char] || "?" )
        end
    end
    str
end

#tests
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
print "\n"


def uncompress(str)
    new_str = ""
    str.each_char.with_index do |char, i|
        if i % 2 == 0
            new_str += ( char * str[i+1].to_i )
        end
    end
    p new_str
end

#tests
uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'
print "\n"


#PHASE 2

def conjunct_select(arr, *prc)
    
    arr.select do |ele|
        prc.all? { |each_prc| each_prc.call(ele) }
    end
end

#tests
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]
print "\n"


def convert_pig_latin(sent)
    vowels = "aeiou"    
    pig_lat_words = []
    words = sent.split(" ")

    words.each do |word|
        if word.length < 3
            pig_lat_words << word
        elsif vowels.include?(word[0].downcase)
            pig_lat_words << ( word + "yay" )
        else
            word.each_char.with_index do |letter, i|
                if vowels.include?(letter.downcase)
                    pig_word = ( word[i..-1].downcase + word[0...i].downcase + "ay" )
                    pig_word.capitalize! if word[0] == word[0].upcase
                    pig_lat_words << pig_word
                    break
                end
            end
        end
    end
    pig_lat_words.join(" ")
end

#tests
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
print "\n"


def reverberate(sent)
    vowels = "aeiou"    
    new_words = []
    words = sent.split(" ")
    last_i = 0

    words.each do |word|
        if word.length < 3
            new_words << word
        elsif vowels.include?(word[-1].downcase)
            new_words << word + word.downcase
        else
            word.each_char.with_index do |letter, i|
                last_i = i if vowels.include?(letter.downcase)
            end
            new_word = ( word + word[last_i..-1].downcase )
            new_word.capitalize! if word[0] == word[0].upcase
            new_words << new_word
        end
    end
    new_words.join(" ")
end

#tests
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
print "\n"


def disjunct_select(arr, *prcs)
    selected = []
    arr.each do |ele|
        prcs.each do |prc|
            if prc.call(ele)
                selected << ele 
                break
            end
        end
    end
    selected
end

#tests
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]
print "\n"


def alternating_vowel(sent)
    vowels = "aeiou"
    words = sent.split(" ")
    new_sent_words = []

    words.each_with_index do |word, i|
        vowel_indxs = []
        word.each_char.with_index do |letter, j|
            vowel_indxs << j if vowels.include?(letter.downcase)     
        end
        first_vow = vowel_indxs[0]
        last_vow = vowel_indxs[-1]

        if i % 2 == 0 && !vowel_indxs.empty?
            word.slice!(first_vow)
        elsif !vowel_indxs.empty?
            word.slice!(last_vow)
        end
        new_sent_words << word

    end
    new_sent_words.join(" ")
end

#tests
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
print "\n"


def silly_talk(sent)
    words = sent.split(" ")
    new_words = []
    vowels = "aeiou"

    words.each_with_index do |word, i|
        new_word = ""

        if vowels.include?(word[-1])
            new_word = word + word[-1]
        else
            word.each_char do |letter|
                if vowels.include?(letter.downcase)
                    new_word += letter.downcase + "b" + letter.downcase
                else
                    new_word += letter.downcase
                end
            end 
        end
        new_word.capitalize! if word[0] == word[0].upcase
        new_words << new_word
    end
    new_words.join(" ")
end

#tests
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"
print "\n"


def compress(str)
    new_str = ""
    count = 1
    
    (0...str.length).each do |i|
        if str[i] == str[i+1]
            count +=1
        elsif count == 1
            new_str += str[i]
        else
            new_str += ( str[i] + count.to_s )
            count = 1
        end
    end
    new_str
end

#tests
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
print "\n"