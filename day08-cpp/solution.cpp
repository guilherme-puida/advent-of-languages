#include <iostream>
#include <string>
#include <vector>

using grid = std::vector<std::string>;

bool see_right(const grid& g, int row, int col) {
    auto c = g[row][col];

    for (auto i = 0; i < col; ++i)
        if (g[row][i] >= c) return false;
    
    return true;
}

bool see_left(const grid& g, int row, int col) {
    auto c = g[row][col];

    for (auto i = col+1; i < g[row].size(); ++i)
        if (g[row][i] >= c) return false;

    return true;
}

bool see_up(const grid& g, int row, int col) { 
    auto c = g[row][col];

    for (auto i = 0; i < row; ++i)
        if (g[i][col] >= c) return false;

    return true; 
}

bool see_down(const grid& g, int row, int col) {
    auto c = g[row][col];

    for (auto i = row+1; i < g.size(); ++i)
        if (g[i][col] >= c) return false;

    return true;
}

int v_left(const grid& g, int row, int col) {
    auto c = g[row][col];
    auto d = 0;

    for (auto i = col-1; i >= 0; --i) {
        d++;
        if (g[row][i] >= c) break;
    }

    return d;
}

int v_right(const grid& g, int row, int col) {
    auto c = g[row][col];
    auto d = 0;

    for (auto i = col+1; i < g[row].size(); ++i) {
        d++;
        if (g[row][i] >= c) break;
    }

    return d;
}

int v_up(const grid& g, int row, int col) {
    auto c = g[row][col];
    auto d = 0;

    for (auto i = row-1; i >= 0; --i) {
        d++;
        if (g[i][col] >= c) break;
    }

    return d;
}

int v_down(const grid& g, int row, int col) {
    auto c = g[row][col];
    auto d = 0;

    for (auto i = row+1; i < g.size(); ++i) {
        d++;
        if (g[i][col] >= c) break;
    }

    return d;
}

int calc_v(const grid& g, int row, int col) {
    return v_up(g, row, col)
        * v_left(g, row, col)
        * v_down(g, row, col)
        * v_right(g, row, col);
}

int main() {
    std::string s;
    grid g;

    while (std::getline(std::cin, s))
        g.push_back(s);

    auto p1 = 0, p2 = 0;

    for (auto row = 0; row < g.size(); ++row) {
        for (auto col = 0; col < g[row].size(); ++col) {
            if (see_up(g, row, col) || see_left(g, row, col) || see_down(g, row, col) || see_right(g, row, col))
                p1++;
        }
    }


    for (auto row = 1; row < g.size(); ++row) {
        for (auto col = 1; col < g[row].size(); ++col) {
            auto v = calc_v(g, row, col);
            p2 = v > p2 ? v : p2;
        }
    }

    
    std::cout << "Part 1: " << p1 << '\n';
    std::cout << "Part 2: " << p2 << '\n';
    return 0;
}
