import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.HashSet;

record Tuple(int i, int j, int dist, char c) {}
record Visited(int a, int b) {}

public class solution {
    static String[] grid;
    static ArrayDeque<Tuple> queue;
    static HashSet<Visited> visited;
    
    static void push(int i, int j, int d, char a) {
        if (i < 0 || i >= grid.length || j < 0 || j >= grid[i].length()) return;
        if (visited.contains(new Visited(i, j))) return;

        var b = grid[i].charAt(j) == 'E' ? 'z' : grid[i].charAt(j);
        if (b > a + 1) return;

        visited.add(new Visited(i, j));
        queue.add(new Tuple(i, j, d+1, b));
    }
    
    static int solve(String[] grid, char start, char start2) {
        queue = new ArrayDeque<Tuple>();
        visited = new HashSet<Visited>();

        for (var i = 0; i < grid.length; i++) {
            for (var j = 0; j < grid[i].length(); j++) {
                if (grid[i].charAt(j) == start || grid[i].charAt(j) == start2) {
                    queue.add(new Tuple(i, j, 0, 'a'));
                    visited.add(new Visited(i, j));
                }
            }
        }

        while (!queue.isEmpty()) {
            var cur = queue.poll(); 
            if (grid[cur.i()].charAt(cur.j()) == 'E') return cur.dist();
            push(cur.i() + 1, cur.j(), cur.dist(), cur.c());
            push(cur.i() - 1, cur.j(), cur.dist(), cur.c());
            push(cur.i(), cur.j() + 1, cur.dist(), cur.c());
            push(cur.i(), cur.j() - 1, cur.dist(), cur.c());

        }

        return -1;
    }

    static int solve(String[] grid, char start) {
        return solve(grid, start, start);
    }
    
    static String[] getInput() {
        var reader = new BufferedReader(new InputStreamReader(System.in));
        return reader.lines().toArray(String[]::new);
    }
    
    public static void main(String[] args) {
        grid = getInput();
        System.out.println("Part 1: " + solve(grid, 'S'));
        System.out.println("Part 2: " + solve(grid, 'S', 'a'));
    }
}
