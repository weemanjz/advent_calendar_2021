risk_level = 0
map = []

while (l = gets)
  map << l.strip.chars.map(&:to_i)
end

height = map.size
length = map[0].size

map.each.with_index do |line, i|
  line.each.with_index do |point, j|
    next if i > 0 && point >= map[i - 1][j]
    next if i < height - 1 && point >= map[i + 1][j]
    next if j > 0 && point >= map[i][j - 1]
    next if j < length - 1 && point >= map[i][j + 1]

    risk_level += point + 1
  end
end

puts risk_level
