count = 0

while (l = gets)
  input = l.split(" | ")[1].strip
  entries = input.split(" ")
  entries.each { |e| count += 1 if [2, 3, 4, 7].include?(e.size) }
end

puts count
