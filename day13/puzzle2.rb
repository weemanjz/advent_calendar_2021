points = []

loop do
  l = gets
  x, y = l.scan(/\d+/)
  break if x.nil?

  points << [x.to_i, y.to_i]
end

folds = []

while (l = gets)
  axis, val = l.scan(/(x|y)=(\d+)/)[0]
  folds << [axis, val.to_i]
end

folds.each do |axis, val|
  new_points = []
  i, j = axis == "x" ? [0, 1] : [1, 0]

  points.each do |p|
    if p[i] < val
      new_points << p
    else
      a = val - (p[i] - val)
      new_points << (axis == "x" ? [a, p[j]] : [p[j], a])
    end
  end

  points = new_points.uniq
end

max_x = 0
max_y = 0
points.each do |x, y|
  max_x = x if x > max_x
  max_y = y if y > max_y
end

map = Array.new(max_y + 1) { Array.new(max_x + 1, " ") }

points.each do |x, y|
  map[y][x] = "#"
end

map.each { |l| puts l.join }
