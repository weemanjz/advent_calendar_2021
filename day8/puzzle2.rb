count = 0

def find_and_remove(patterns, &block)
  number = patterns.find(&block)
  patterns.delete(number)
  number
end

while (l = gets)
  patterns, output = l.split(" | ").map(&:strip)
  patterns = patterns.split(" ").map { |v| v.split("").sort }.group_by(&:size)
  numbers = {}
  numbers[1] = patterns[2][0]
  numbers[4] = patterns[4][0]
  numbers[7] = patterns[3][0]
  numbers[8] = patterns[7][0]
  numbers[9] = find_and_remove(patterns[6]) { |p| numbers[4] - p == [] }
  numbers[0] = find_and_remove(patterns[6]) { |p| numbers[1] - p == [] }
  numbers[6] = patterns[6][0]
  numbers[5] = find_and_remove(patterns[5]) { |p| p - numbers[6] == [] }
  numbers[3] = find_and_remove(patterns[5]) { |p| numbers[1] - p == [] }
  numbers[2] = patterns[5][0]

  entries = output.split(" ").map(&:strip).map { |v| v.split("").sort }
  number = 0
  entries.each do |e|
    numbers.each do |k, v|
      next unless v == e

      number = number * 10 + k
      break
    end
  end
  count += number
end

puts count
