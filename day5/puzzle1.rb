count = 0
lines = {}

while (l = gets)
  x1, y1, x2, y2 = l.scan(/\d+/).map(&:to_i)
  next if x1 != x2 && y1 != y2

  if x1 == x2
    y1, y2 = [y2, y1] if y1 > y2
    (y1..y2).to_a.each do |y|
      lines[y] ||= {}
      lines[y][x1] ||= 0
      lines[y][x1] += 1
      count += 1 if lines[y][x1] == 2
    end
  end

  if y1 == y2
    x1, x2 = [x2, x1] if x1 > x2
    (x1..x2).to_a.each do |x|
      lines[y1] ||= {}
      lines[y1][x] ||= 0
      lines[y1][x] += 1
      count += 1 if lines[y1][x] == 2
    end
  end
end

puts count
