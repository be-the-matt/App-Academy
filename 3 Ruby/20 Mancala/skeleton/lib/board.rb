class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { Array.new(4) {:stone} }
    @cups[6], @cups[13] = [], []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !start_pos.between?(0,13)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    next_pos = start_pos + 1

    num_stones.times do |i|
      @pos = next_pos % @cups.length
      @cups[@pos] << :stone unless (@pos == 6 && current_player_name == @name2) || (@pos == 13 && current_player_name == @name1)
      next_pos += 1 if (@pos == 6 && current_player_name == @name2) || (@pos == 13 && current_player_name == @name1)
      next_pos += 1 
    end

    self.render
    self.next_turn(@pos)
    return :prompt if (@pos == 6 && current_player_name == @name1) || (@pos == 13 && current_player_name == @name2)    
    return :switch if @cups[@pos].count == 1
    return @pos if @cups[@pos].count > 1
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if [*0..5].all? { |i| @cups[i].empty? } || [*7..12].all? { |i| @cups[i].empty? }
    false
  end

  def winner
    return :draw if @cups[13].count == @cups[6].count
    return @name1 if @cups[6].count > @cups[13].count
    @name2
  end
end
