previous = nil
increased = 0

while (l = gets)
  increased += 1 if previous && previous < l.to_i
  previous = l.to_i
end

puts increased
