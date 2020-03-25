class Code

  attr_accessor :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(char_guess)
    char_guess.all? { |letter| POSSIBLE_PEGS.keys.include?(letter.upcase) }
  end

  def initialize(char_guess)
    if !Code.valid_pegs?(char_guess)
      raise "no valid guesses!"
    else
      @pegs = char_guess.map(&:upcase)
    end
  end

  def self.random(length)
    rand_char_arr = []
    length.times { rand_char_arr << POSSIBLE_PEGS.keys.sample}
    Code.new(rand_char_arr)
  end

  def self.from_string(pegs_string)
    Code.new( pegs_string.split("") )
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_instance)
    count = 0
    code_instance.pegs.each_with_index do |letter, indx|
      count += 1 if @pegs[indx] == letter
    end
    return count
  end

  def num_near_matches(code_instance)
    count = 0
    code_instance.pegs.each_with_index do |letter, indx|
      count += 1 if @pegs[indx] != letter && @pegs.include?(letter)
    end
    return count
  end

  def ==(code_instance)
    @pegs == code_instance.pegs
  end

end

# code = Code.new(["R", "G", "R", "B"]
# Code.valid_pegs?(["B", "Y", "G", "G"]