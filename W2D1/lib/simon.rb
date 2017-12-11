class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :length, :game_over, :seq

  def initialize
    @length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Try copying by typing the first letter of the color you think is next."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    "You did it! Here's the next sequence:"
  end

  def game_over_message
    puts "Nice try... You got to #{@length - 1} rounds."
  end

  def reset_game
    @length = 1
    @game_over = false
    @seq = []
  end
end
