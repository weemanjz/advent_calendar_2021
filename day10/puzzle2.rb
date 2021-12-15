PAIRS = {
  "[" => "]",
  "(" => ")",
  "{" => "}",
  "<" => ">"
}
POINTS = {
  ")" => 1,
  "]" => 2,
  "}" => 3,
  ">" => 4
}
scores = []

while (l = gets)
  opens_stack = []
  corrupted = false
  score = 0
  l.strip.chars.each do |c|
    if PAIRS.key?(c)
      opens_stack << c
      next
    end
    last_open = opens_stack.pop
    if PAIRS[last_open] != c
      corrupted = true
      break
    end
  end
  next if corrupted || opens_stack.empty?

  while (last_open = opens_stack.pop)
    score = score * 5 + POINTS[PAIRS[last_open]]
  end
  scores << score
end

puts scores.sort[scores.size / 2]
