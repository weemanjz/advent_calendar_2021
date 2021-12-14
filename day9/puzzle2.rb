sizes = []
@map = []

while (l = gets)
  @map << l.strip.chars.map(&:to_i)
end

@height = @map.size
@length = @map[0].size

@checked = Array.new(@height) { Array.new(@length, false) }

def check_point(x, y, size)
  return size if @checked[x][y] || @map[x][y] == 9

  @checked[x][y] = true

  size += 1
  size = check_point(x + 1, y, size) if x < @height - 1
  size = check_point(x - 1, y, size) if x > 0
  size = check_point(x, y + 1, size) if y < @length - 1
  size = check_point(x, y - 1, size) if y > 0

  size
end

(0...@height).each do |i|
  (0...@length).each do |j|
    next if @checked[i][j] || @map[i][j] == 9

    size = check_point(i, j, 0)

    sizes << size if size > 0
  end
end

sizes.sort! { |x, y| y <=> x }

puts sizes[0] * sizes[1] * sizes[2]
