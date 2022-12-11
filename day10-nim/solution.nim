import std/strutils
import std/sugar

type
    Clock = tuple
        cycle: int
        signalStrength: int
        crt: seq[char]

proc inc(clock: var Clock; x: int) = 
    if clock.cycle mod 40 in @[x - 1, x, x + 1]:
        clock.crt[clock.cycle] = '#'

    clock.cycle += 1

    if clock.cycle in @[20, 60, 100, 140, 180, 220]:
        clock.signalStrength += x * clock.cycle

proc display(clock: Clock) = 
    for row in 0 ..< 6:
        let s = row * 40
        let e = s + 40
        echo join(clock.crt[s ..< e])

let lines = readAll(io.stdin).strip().splitLines()

var x = 1

let initialCrt = collect(newSeq):
    for _ in 0 ..< 240: ' '
var clock: Clock = (cycle: 0, signalStrength: 0, crt: initialCrt)

for line in lines:
    if line == "noop":
        clock.inc(x)
    else:
        let n = line.split(' ')[1].parseInt()
        clock.inc(x)
        clock.inc(x)
        x += n

echo "Part 1: ", clock.signalStrength
echo "Part 2:"
clock.display()