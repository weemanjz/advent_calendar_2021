positions = gets.strip.split(",").map(&:to_i)

grouped = positions.tally
min = grouped.keys.min
max = grouped.keys.max

min_fuel = nil

(min..max).each do |pos|
  fuel = 0
  (min..max).each do |i|
    diff = (pos - i).abs
    fuel_unit = diff * (diff + 1) / 2
    fuel += (grouped[i] || 0) * fuel_unit
  end
  min_fuel = fuel if min_fuel.nil? || fuel < min_fuel
end

puts min_fuel
