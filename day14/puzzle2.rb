template = gets.strip.chars
pairs = template.each_cons(2).tally

gets

rules = {}

while (l = gets)
  xx, y = l.strip.split(" -> ")
  rules[xx] = y
end

40.times do
  new_pairs = Hash.new(0)
  pairs.each do |(a, b), count|
    insertion = rules[a + b]
    new_pairs[[a, insertion]] += count
    new_pairs[[insertion, b]] += count
  end
  pairs = new_pairs
end

totals = Hash.new(0)
pairs.each { |(a, _), count| totals[a] += count }
totals[template.last] += 1

min, max = totals.values.minmax

puts max - min
