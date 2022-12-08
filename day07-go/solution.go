package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	dirs := make(map[string]int64)
	var path []string

	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		line := scanner.Text()

		if strings.HasPrefix(line, "$ cd") {
			dir := strings.Split(line, " ")[2]

			if dir == "/" {
				path = append(path, "/")
			} else if dir == ".." {
				path = path[:len(path)-1]
			} else {
				path = append(path, path[len(path)-1]+dir+"/")
			}
		}

		if line[0] >= '0' && line[0] <= '9' {
			for _, p := range path {
				i, _ := strconv.ParseInt(strings.Split(line, " ")[0], 10, 64)
				dirs[p] += i
			}
		}
	}

	var s1 int64
	var s2 []int64
	for _, v := range dirs {
		if v <= 100_000 {
			s1 += v
		}

		if v >= 30_000_000-(70_000_000-dirs["/"]) {
			s2 = append(s2, v)
		}
	}

	min := s2[0]

	for _, v := range s2 {
		if v < min {
			min = v
		}
	}

	fmt.Println("Part 1:", s1)
	fmt.Println("Part 2:", min)
}
