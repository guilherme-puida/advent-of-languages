const fs = require("fs");

const input = fs.readFileSync(0, "utf8");

const elves = input.split("\n\n").map((elf) =>
  elf.split("\n").map(Number).reduce((a, b) => a + b)
).sort((a, b) => b - a);

console.log("Part 1:", elves[0]);
console.log("Part 2:", elves.slice(0, 3).reduce((a, b) => a + b, 0));
