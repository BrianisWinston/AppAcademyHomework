class Card
  attr_accessor :face_value, :face_up

  def initialize(value = -1)
    @face_value = value
    @face_up = false
  end

  def hide
    @face_up = false if face_up == true
  end

  def reveal
    @face_up = true if face_up == false
  end

  def equal_to(card2)
    return true if face_value == card2.face_value
    false
  end
end


class Board
  attr_accessor :grid

  def initialize(board_size = 4)
    @grid = Array.new(board_size) {Array.new(board_size)}
  end

  def populate
    elements = ((0...grid.length**2 / 2).to_a) * 2
    elements.shuffle!
    (0...grid.length).to_a.each do |x|
      (0...grid.length).to_a.each do |y|
        @grid[x][y] = Card.new(elements.pop)
      end
    end
  end

  def render
    (0...grid.length).to_a.each do |row|
      str = "|"
      (0...grid.length).to_a.each do |el|
        if grid[row][el].face_up == true
          str << grid[row][el].face_value.to_s
        else
          str << "X"
        end
      end
      str << "|"
      puts str
    end
  end

  def won?
    won = true
    grid.map do |row|
      won = false if row.all? { |el| el.face_up == true } == false
    end
    won
  end

  def reveal(guessed_pos)
    grid[guessed_pos[0]][guessed_pos[1]].face_up = true if grid[guessed_pos[0]][guessed_pos[1]].face_up == false
  end
end

class Game
  attr_accessor :board, :player

  def initialize(player = "c", size=4)
    @player = player
    @board = Board.new(size)
    @board.populate
  end

  def play
    until board.won? == true
      system("clear")
      board.render
      if player != "c"
        move1 = make_guess
        board.reveal(move1)
        system("clear")
        board.render
        move2 = make_guess
        board.reveal(move2)
        if board.grid[move1[0]][move1[1]].face_value != board.grid[move2[0]][move2[1]].face_value
          system("clear")
          board.render
          sleep(3)
          board.grid[move1[0]][move1[1]].hide
          board.grid[move2[0]][move2[1]].hide
        end
      end
    end
    system("clear")
    puts "Congratulations!"
    board.render
  end

  def make_guess
    puts "Please make a guess : (row, col)"
    ans = gets.chomp.split(", ").map(&:to_i)
  end
end

# board = Board.new
# board.populate
# #board.render
# board.reveal([2,3])
# board.render
# board.play
