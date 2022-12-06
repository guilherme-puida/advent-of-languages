require 'set'

def calculate_priority(letter)
    if letter >= 'a' and letter <= 'z' 
        return letter.ord - 'a'.ord + 1
    end

    return letter.ord - 'A'.ord + 27
end

def part1(input)
    s = 0
    input.each do |line|
        h1, h2 = line.chars.each_slice(line.length / 2).map(&:join)
        a = Set.new(h1.chars)
        b = Set.new(h2.chars)

        common = a & b
        s += calculate_priority common.to_a[0]
    end

    puts "Part 1: #{s}"
end

def part2(input)
    s = 0
    input.each_slice(3) do |group|
        a, b, c = group.map { |g| Set.new(g.chomp.chars) }

        common = a & b & c
        s += calculate_priority common.to_a[0]
    end

    puts "Part 2: #{s}"
end

input = ARGF.readlines

part1 input
part2 input

