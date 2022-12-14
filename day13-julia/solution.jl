using JSON

less(a::Int, b::Int) = a < b
less(a::Vector, b::Int) = less(a, [b])
less(a::Int, b::Vector) = less([a], b)
less(a::Vector, b::Vector) = 
    !isempty(b) && (isempty(a)
    || less(a[1], b[1]) 
    || (!less(b[1], a[1]) && less(a[2:end], b[2:end])))

function read_input()::Vector{Tuple{Vector, Vector}}
    pairs = []

    while true
        p1 = readline()
        p2 = readline()

        if p1 == "" || p2 == "" break end

        push!(pairs, (JSON.parse(p1), JSON.parse(p2)))
        readline()
    end
    
    pairs
end

input = read_input()

function part1() 
    sum([i for (i, (p1, p2)) in enumerate(input) if less(p1, p2)])
end

function part2()
    v = collect(Iterators.flatten([[a, b] for (a, b) in input]))
    push!(v, [[2]], [[6]])
    sort!(v, lt=less)

    findfirst(x -> x == [[2]], v) * findfirst(x -> x == [[6]], v)
end


println("Part 1: ", part1())
println("Part 2: ", part2())
