@octo = []
@flashes = 0
@flashed = []

while (l = gets)
  @octo << l.strip.chars.map(&:to_i)
end

def handle_octo(i, j)
  return if i < 0 || i > 9 || j < 0 || j > 9
  return if @flashed[i][j]
  if @octo[i][j] < 9
    @octo[i][j] += 1
    return
  end

  @octo[i][j] = 0
  @flashed[i][j] = true
  @flashes += 1
  handle_octo(i - 1, j - 1)
  handle_octo(i - 1, j)
  handle_octo(i - 1, j + 1)
  handle_octo(i, j - 1)
  handle_octo(i, j + 1)
  handle_octo(i + 1, j - 1)
  handle_octo(i + 1, j)
  handle_octo(i + 1, j + 1)
end

100.times do
  @flashed = Array.new(10) { Array.new(10, false) }
  (0..9).each do |i|
    (0..9).each do |j|
      handle_octo(i, j)
    end
  end
end

puts @flashes
