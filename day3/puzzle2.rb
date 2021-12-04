groups = {"1" => [], "0" => []}

while (l = gets)
  bits = l.strip
  groups[bits[0]] << bits
end

oxygen_group, co2_group = groups["1"].size >= groups["0"].size ? ["1", "0"] : ["0", "1"]

def find_rating(group, position, most_common: true)
  return group[0] if group.size == 1

  x = group.group_by { |bits| bits[position] }
  new_group = if most_common
    x["1"].size >= x["0"].size ? x["1"] : x["0"]
  else
    x["1"].size < x["0"].size ? x["1"] : x["0"]
  end
  find_rating(new_group, position + 1, most_common: most_common)
end

oxigen = find_rating(groups[oxygen_group], 1)
co2 = find_rating(groups[co2_group], 1, most_common: false)

puts oxigen.to_i(2) * co2.to_i(2)
