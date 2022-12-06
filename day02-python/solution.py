import sys

text = sys.stdin.read().splitlines()

p_map = {"X": 1, "Y": 2, "Z": 3}

d_map = {"A": "X", "B": "Y", "C": "Z"}
w_map = {"A": "Y", "B": "Z", "C": "X"}
l_map = {"A": "Z", "B": "X", "C": "Y"}


def part1():
    points = 0
    for line in text:
        o, m = line.split()
        if w_map[o] == m:
            points += 6

        if d_map[o] == m:
            points += 3

        points += p_map[m]

    print("Part 1:", points)


def part2():
    points = 0
    for line in text:
        o, m = line.split()
        if m == "X":
            points += p_map[l_map[o]]
        if m == "Y":
            points += 3 + p_map[d_map[o]]
        if m == "Z":
            points += 6 + p_map[w_map[o]]

    print("Part 2:", points)


if __name__ == "__main__":
    part1()
    part2()
