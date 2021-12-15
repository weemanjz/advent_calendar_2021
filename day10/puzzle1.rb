PAIRS = {
  "[" => "]",
  "(" => ")",
  "{" => "}",
  "<" => ">"
}
ERROR_SCORES = {
  ")" => 3,
  "]" => 57,
  "}" => 1197,
  ">" => 25137
}
wrong_characters = []

while (l = gets)
  opens_stack = []
  l.strip.chars.each do |c|
    if PAIRS.key?(c)
      opens_stack << c
      next
    end
    last_open = opens_stack.pop
    next if PAIRS[last_open] == c

    wrong_characters << c
    break
  end
end

error_score = wrong_characters.tally.reduce(0) do |score, (c, count)|
  score + count * ERROR_SCORES[c]
end

puts error_score
