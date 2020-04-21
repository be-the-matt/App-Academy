require 'set'

class WordChainer

    def initialize(dict = 'dictionary.txt')
        @dictionary = Set.new
        read_dictionary(dict)

    end

    def read_dictionary(file_name)
        File.readlines(file_name).each do |line|
           @dictionary << line.chomp
        end
    end

    def adjacent_words(word)
        alpha = [*'a'..'z']
        @adjacent_words = []

        word.each_char.with_index do |char, char_indx|
            alpha.each do |letter|
                new_word = word[0...char_indx] + letter + word[char_indx+1..-1]
                @adjacent_words << new_word if @dictionary.include?(new_word)
            end
        end

        @adjacent_words
    end
    
    def explore_current_words
            new_current_words = []

            @current_words.each do |current_word|
                adjacent_words(current_word)
                @adjacent_words.each do |adj_word|
                    
                    if !@all_seen_words.include?(adj_word)
                        new_current_words << adj_word
                        @all_seen_words[adj_word] = current_word
                    end
                end
            end

            new_current_words.each do |word|
                # p "word '#{word}' came from #{@all_seen_words[word]}"
            end

            @current_words = new_current_words
    end

    def build_path(target)
        path = []
        previous_word = target
        
        while previous_word != nil
            path.unshift( @all_seen_words[previous_word] ) if @all_seen_words[previous_word] != nil
            previous_word = @all_seen_words[previous_word]
        end

        path << target
    end

    def run(source, target)

        return "Both words must be of equal length. Try again." if source.length != target.length

        @current_words = [source]
        @all_seen_words = { source => nil }

        while !@current_words.empty?
            self.explore_current_words
        end

        path = build_path(target)
        return "No path from '#{source}' to '#{target}'" if path.length == 1
        
        path
    end

end


#test
chainer = WordChainer.new
p chainer.run('casket', 'basketball')
puts
p chainer.run('casket', 'basket')
puts
p chainer.run('lake', 'time')
puts
p chainer.run('caesar', 'basket')