horizontal = 0
depth = 0
aim = 0

while (l = gets)
  command, unit = l.split(" ")
  unit = unit.to_i
  case command
  when "forward"
    horizontal += unit
    depth += aim * unit
  when "down"
    aim += unit
  when "up"
    aim -= unit
  end
end

puts horizontal * depth
