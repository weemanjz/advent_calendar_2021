class Board
  attr_reader :count

  def initialize
    @count = 0
    @board = {}
  end

  def increment_point(x, y)
    @board[y] ||= {}
    @board[y][x] ||= 0
    @board[y][x] += 1
    @count += 1 if @board[y][x] == 2
  end
end

board = Board.new

while (l = gets)
  x1, y1, x2, y2 = l.scan(/\d+/).map(&:to_i)

  if x1 == x2
    y1, y2 = [y2, y1] if y1 > y2
    (y1..y2).to_a.each do |y|
      board.increment_point(x1, y)
    end
  elsif y1 == y2
    x1, x2 = [x2, x1] if x1 > x2
    (x1..x2).to_a.each do |x|
      board.increment_point(x, y1)
    end
  else
    x = x1
    y = y1
    loop do
      board.increment_point(x, y)
      break if x == x2 && y == y2

      x < x2 ? x += 1 : x -= 1
      y < y2 ? y += 1 : y -= 1
    end
  end
end

puts board.count
