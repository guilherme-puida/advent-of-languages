pattern = "(%d+)-(%d+),(%d+)-(%d+)"

function is_subrange(a, b, c, d)
  return (a <= c and b >= d) or (c <= a and d >= b)
end

function overlaps(a, b, c, d)
  return (a >= c and a <= d) or (b >= c and b <= d) or (c >= a and c <= b) or (d >= a and d <= b)
end

p1_sum = 0
p2_sum = 0

for line in io.lines() do
  local _, _, a, b, c, d = string.find(line, pattern)
  
  if is_subrange(tonumber(a), tonumber(b), tonumber(c), tonumber(d)) then 
    p1_sum = p1_sum + 1 
  end
  
  if overlaps(tonumber(a), tonumber(b), tonumber(c), tonumber(d)) then
    p2_sum = p2_sum + 1
  end
end

print("Part 1:", p1_sum)
print("Part 2:", p2_sum)
