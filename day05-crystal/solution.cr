stacks = [
    ['P', 'F', 'M', 'Q', 'W', 'G', 'R', 'T'], 
    ['H', 'F', 'R'], 
    ['P', 'Z', 'R', 'V', 'G', 'H', 'S', 'D'],
    ['Q', 'H', 'P', 'B', 'F', 'W', 'G'],
    ['P', 'S', 'M', 'J', 'H'],
    ['M', 'Z', 'T', 'H', 'S', 'R', 'P', 'L'],
    ['P', 'T', 'H', 'N', 'M', 'L'],
    ['F', 'D', 'Q', 'R'],
    ['D', 'S', 'C', 'N', 'L', 'P', 'H'],
]

input = ARGF.gets_to_end
_, moves = input.split "\n\n"

moves.each_line do |line|
    /move (\d+) from (\d+) to (\d+)/.match line
    amount, from, to = $1.to_i, $2.to_i, $3.to_i
    stacks[to - 1] = stacks[to - 1] + (stacks[from - 1].pop amount).reverse
end

puts "Part 1: #{stacks.map { |stack| stack.last }.join}"

stacks = [
    ['P', 'F', 'M', 'Q', 'W', 'G', 'R', 'T'], 
    ['H', 'F', 'R'], 
    ['P', 'Z', 'R', 'V', 'G', 'H', 'S', 'D'],
    ['Q', 'H', 'P', 'B', 'F', 'W', 'G'],
    ['P', 'S', 'M', 'J', 'H'],
    ['M', 'Z', 'T', 'H', 'S', 'R', 'P', 'L'],
    ['P', 'T', 'H', 'N', 'M', 'L'],
    ['F', 'D', 'Q', 'R'],
    ['D', 'S', 'C', 'N', 'L', 'P', 'H'],
]

moves.each_line do |line|
    /move (\d+) from (\d+) to (\d+)/.match line
    amount, from, to = $1.to_i, $2.to_i, $3.to_i
    stacks[to - 1] = stacks[to - 1] + stacks[from - 1].pop amount
end

puts "Part 2: #{stacks.map { |stack| stack.last }.join}"