use std::io;

#[derive(Debug, Clone, Copy)]
struct Sensor {
    pos: (isize, isize),
    close: (isize, isize),
    dist: isize,
}

impl Sensor {
    fn inside_p(&self, p: (isize, isize)) -> bool {
        self.close != p && self.dist as usize >= self.pos.0.abs_diff(p.0) + self.pos.1.abs_diff(p.1)
    }

    fn parse(line: &str) -> Self {
        let nums = line
            .split_whitespace()
            .into_iter()
            .filter(|x| x.contains(|a: char| a.is_digit(10)))
            .map(|x| x.chars().filter(|a| a == &'-' || a.is_digit(10)).collect())
            .filter_map(|x: String| x.parse::<isize>().ok())
            .collect::<Vec<_>>();

        Self {
            pos: (nums[0], nums[1]),
            close: (nums[2], nums[3]),
            dist: (nums[0].abs_diff(nums[2]) + nums[1].abs_diff(nums[3])) as isize,
        }
    }
}

fn main() {
    let input = io::stdin()
        .lines()
        .map(|line| Sensor::parse(&line.unwrap()))
        .collect::<Vec<_>>();

    let left_b = input.iter().map(|s| s.pos.0 - s.dist).min().unwrap();
    let right_b = input.iter().map(|s| s.pos.0 + s.dist).max().unwrap();

    let part1 = (left_b..=right_b)
        .filter(|&i| input.iter().any(|s| s.inside_p((i, 2_000_000))))
        .collect::<Vec<_>>()
        .len();

    println!("Part 1: {}", part1);

    let part2 = input
        .iter()
        .find_map(|s| {
            ((s.pos.0 - s.dist - 1).max(0)..=s.pos.0.min(4_000_000))
                .zip(s.pos.1..=4_000_000)
                .find_map(|p| {
                    input
                        .iter()
                        .all(|s| !s.inside_p(p))
                        .then(|| p.0 * 4_000_000 + p.1)
                })
        })
        .unwrap();

    println!("Part 2: {}", part2);
}