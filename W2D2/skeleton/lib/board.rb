class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, id|
      next if  id == 13 || id == 6
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Wrong cup" if start_pos < 0 || start_pos > 12
    raise "Wrong cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    id = start_pos
    until stones.empty?
      id += 1
      id = 0 if id > 13
      if id == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif id == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[id] << stones.pop
      end
    end
    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
    player1_length = @cups[6].length
    player2_length = @cups[13].length

    if player1_length == player2_length
      :draw
    else
      player1_length > player2_length ? @name1 : @name2
    end
  end
end
