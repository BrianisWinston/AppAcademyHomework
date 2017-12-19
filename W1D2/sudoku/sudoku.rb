class Tile
  attr_accessor :value, :given

  def initialize(value = 0, given = true)
    @value = value
    @given = given
  end

end

class Board
  attr_accessor :grid

  def initialize(grid = Array.new(9) { Array.new(9) })
    @grid = grid
  end

  def position(row, col, val)
    grid[row][col].value = val if grid[row][col].given == false
  end

  def row_solved?(row)
    test_row = []
    (1..9).to_a.each do |val|
      test_row.push(board[row][val].value)
    end
    test_row.sort == (1..9).to_a
  end

  def col_solved?(col)
    test_row = []
    (1..9).to_a.each do |val|
      test_row.push(board[val][col].value)
    end
    test_row.sort == (1..9).to_a
  end

  def sub_solve?(row, col)
    test_arr = []
    [row, row+1, row+2].each do |row|
      [col, col+1, col+2].each do |col|
        test_arr.push(board[row][col].value)
      end
    end
    test_arr.sort = (1..9).to_a
  end

end
