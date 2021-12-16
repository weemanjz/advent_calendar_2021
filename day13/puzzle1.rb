points = []

loop do
  l = gets
  x, y = l.scan(/\d+/)
  break if x.nil?

  points << [x.to_i, y.to_i]
end

l = gets
axis, val = l.scan(/(x|y)=(\d+)/)[0]

val = val.to_i

h = {}

i, j = axis == "x" ? [0, 1] : [1, 0]

points.each do |p|
  if p[i] < val
    h[p[i]] ||= []
    h[p[i]] << p[j]
  else
    a = val - (p[i] - val)
    h[a] ||= []
    h[a] << p[j]
  end
end

count = h.values.reduce(0) { |s, v| s + v.uniq.size }

puts count
