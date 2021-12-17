template = gets.strip.chars

gets

rules = {}

while (l = gets)
  xx, y = l.strip.split(" -> ")
  rules[xx] = y
end

10.times do
  new_template = ""
  (0...template.size - 1).each do |i|
    new_template << template[i]
    insertion = rules[template[i] + template[i + 1]]
    new_template << insertion if insertion
  end
  new_template << template[-1]
  template = new_template.chars
end

quantity = template.tally.values

puts quantity.max - quantity.min
