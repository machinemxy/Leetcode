// https://leetcode.com/problems/island-perimeter/description/

class Solution {
    fun islandPerimeter(grid: Array<IntArray>): Int {
        val rowCount = grid.size
        val colCount = grid[0].size
        var result = 0
        for (y in 0 until rowCount) {
            for (x in 0 until colCount) {
                if (grid[y][x] == 0) {
                    continue
                }
                var perimeter = 4
                if (y > 0 && grid[y - 1][x] == 1) {
                    perimeter--
                }
                if (y < rowCount - 1 && grid[y + 1][x] == 1) {
                    perimeter--
                }
                if (x > 0 && grid[y][x - 1] == 1) {
                    perimeter--
                }
                if (x < colCount - 1 && grid[y][x + 1] == 1) {
                    perimeter--
                }
                result += perimeter
            }
        }
        return result
    }
}
