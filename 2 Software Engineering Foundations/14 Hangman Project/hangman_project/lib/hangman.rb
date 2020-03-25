class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_" )
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(letter)
    @attempted_chars.include?(letter)
  end

  def get_matching_indices(letter)
    idx_arr = []
    @secret_word.each_char.with_index do | char, i |
      idx_arr << i if letter == char
    end
    idx_arr
  end

  def fill_indices(char, arr)
    arr.each { |indx| @guess_word[indx] = char }
  end

  def try_guess(letter)
    if self.already_attempted?(letter)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << letter
      if get_matching_indices(letter) == []
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(letter, get_matching_indices(letter))
      end
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    return false
  end

end