window = [] # current sliding window (3 last measurements)
sum1 = 0 # sum of meaurements of previous sliding window
sum2 = 0 # sum of meaurements of current sliding window
increased = 0

# take first measurement and add to sum1. Don't add it to window, we don't need to keep it
i = gets.to_i
sum1 += i

while (l = gets)
  measurement = l.to_i
  # add new measurement to sliding window and increase sum2
  window << measurement
  sum2 += measurement
  if window.size < 3
    # we still don't have 3 first measurements, so increase sum1 as well
    sum1 += measurement
  else
    # compare sums of sliding windows
    increased += 1 if sum2 > sum1
    # overwrite sum of previous sliding window
    sum1 = sum2
    # remove first measurement from window and decrease current sum
    sum2 -= window.shift
  end
end

puts increased
