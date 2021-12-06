fish = gets.strip.split(",").map(&:to_i)
count = fish.size

gruped_fish = fish.tally
timers = Array.new(9) { |i| gruped_fish[i] || 0 }

80.times do
  new_fish = timers[0]
  (0..7).each { |i| timers[i] = timers[i + 1] }
  timers[6] += new_fish
  timers[8] = new_fish
  count += new_fish
end

puts count
