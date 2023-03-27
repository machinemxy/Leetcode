// https://leetcode.com/problems/minimum-path-sum/description/

import java.lang.Integer.min

class Solution {
    fun minPathSum(grid: Array<IntArray>): Int {
        for (y in grid.indices) {
            for (x in grid[0].indices) {
                if (x == 0 && y == 0) {
                    continue
                } else if (y == 0) {
                    grid[y][x] += grid[y][x - 1]
                } else if (x == 0) {
                    grid[y][x] += grid[y - 1][x]
                } else {
                    grid[y][x] += min(grid[y][x - 1], grid[y - 1][x])
                }
            }
        }
        return grid[grid.size - 1][grid[0].size - 1]
    }
}
