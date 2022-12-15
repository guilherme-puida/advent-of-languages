import 'dart:io';
import 'dart:math';

Set<Point<int>> parse(String input) {
  final grid = <Point<int>>{};

  for (var line in input.split("\n")) {
    final coords = line.split(" -> ");
    for (var i = 1; i < coords.length; i++) {
      final o = coords[i - 1].split(",").map(int.parse);
      final d = coords[i].split(",").map(int.parse);

      final p1 = Point(o.first, o.last);
      final p2 = Point(d.first, d.last);

      final v = Point((p2.x - p1.x).sign, (p2.y - p1.y).sign);

      for (var p = p1; p != p2; p += v) {
        grid.add(p);
      }
      grid.add(p2);
    }
  }

  return grid;
}

void main() async {
  final input = (await stdin.first).map(String.fromCharCode).join().trim();
  final grid = parse(input);

  final maxY = grid
      .reduce((value, element) => (value.y > element.y) ? value : element)
      .y;

  for (int i = -2000; i < 2000; i++) {
    grid.add(Point(i, maxY + 2));
  }

  final source = Point(500, 0);
  final path = [source];

  final order = [Point(0, 1), Point(-1, 1), Point(1, 1)];

  var count = 0;
  int part1 = 0;

  while (path.isNotEmpty) {
    final current = path.last;

    if (grid.contains(source)) {
      break;
    }

    if (current.y > maxY && part1 == 0) {
      part1 = count;
    }

    var couldPlace = false;
    for (var p in order) {
      if (!grid.contains(current + p)) {
        path.add(current + p);
        couldPlace = true;
        break;
      }
    }

    if (!couldPlace) {
      grid.add(current);
      path.removeLast();
      count++;
    }
  }

  print("Part 1: $part1");
  print("Part 2: $count");
}
