// https://leetcode.com/problems/number-of-closed-islands/description/

class Solution {
    fun closedIsland(grid: Array<IntArray>): Int {
        if (grid.size <=2 || grid[0].size <= 2) {
            return 0
        }

        for (x in 0 until grid[0].size) {
            if (grid[0][x] == 0) {
                fillLand(grid, 0, x)
            }
            if (grid[grid.size - 1][x] == 0) {
                fillLand(grid, grid.size - 1, x)
            }
        }
        for(y in 1 until grid.size - 1) {
            if (grid[y][0] == 0) {
                fillLand(grid, y, 0)
            }
            if (grid[y][grid[0].size - 1] == 0) {
                fillLand(grid, y, grid[0].size - 1)
            }
        }
        
        var result = 0
        for (y in 1 until grid.size - 1) {
            for (x in 1 until grid[0].size - 1) {
                if (grid[y][x] == 0) {
                    result++
                    fillLand(grid, y, x)
                }
            }
        }
        return result
    }

    private fun fillLand(grid: Array<IntArray>, y: Int, x: Int) {
        grid[y][x] = 1
        if (y > 0 && grid[y - 1][x] == 0) {
            fillLand(grid, y - 1, x)
        }
        if (y < grid.size - 1 && grid[y + 1][x] == 0) {
            fillLand(grid, y + 1, x)
        }
        if (x > 0 && grid[y][x - 1] == 0) {
            fillLand(grid, y, x - 1)
        }
        if (x < grid[0].size - 1 && grid[y][x + 1] == 0) {
            fillLand(grid, y, x + 1)
        }
    }
}
