class Board
  attr_reader :unmarked_numbers

  def initialize
    @rows = Array.new(5, 0)
    @columns = Array.new(5, 0)
    @unmarked_numbers = []
  end

  def <<(number)
    @unmarked_numbers << number
  end

  def mark(number, x, y)
    @unmarked_numbers.delete(number)
    @rows[x] += 1
    @columns[y] += 1
    @rows[x] == 5 || @columns[y] == 5
  end
end

boards = []
board_no = -1
numbers = {}
draws = gets.split(",").map(&:to_i)

row = 0

while (l = gets)
  if l.strip.empty?
    row = 0
    board_no += 1
    boards[board_no] = Board.new
    next
  end

  nos = l.strip.split(/\W+/).map(&:to_i)
  nos.each.with_index do |no, i|
    numbers[no] ||= {}
    numbers[no][board_no] = {x: row, y: i}
    boards[board_no] << no
  end
  row += 1
end

bingo = false

draws.each do |draw|
  numbers[draw].each do |b_no, position|
    board = boards[b_no]
    if board.mark(draw, position[:x], position[:y])
      bingo = true
      puts board.unmarked_numbers.reduce(:+) * draw
      break
    end
  end
  break if bingo
end
