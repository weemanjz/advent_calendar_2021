horizontal = 0
depth = 0

while (l = gets)
  command, unit = l.split(" ")
  unit = unit.to_i
  case command
  when "forward"
    horizontal += unit
  when "down"
    depth += unit
  when "up"
    depth -= unit
  end
end

puts horizontal * depth
