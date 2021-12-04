counts = []
gamma = 0
epsilon = 0

while (l = gets)
  bits = l.strip.split("")
  bits.each.with_index do |b, i|
    counts[i] ||= {"0" => 0, "1" => 0}
    counts[i][b] += 1
  end
end

counts.each do |count|
  gamma <<= 1
  epsilon <<= 1
  if count["1"] > count["0"]
    gamma += 1
  else
    epsilon += 1
  end
end

puts gamma * epsilon
