// https://leetcode.com/problems/magic-squares-in-grid/description/

class Solution {
    fun numMagicSquaresInside(grid: Array<IntArray>): Int {
        val rowCount = grid.size
        if (rowCount < 3) {
            return 0
        }
        val colCount = grid[0].size
        if (colCount < 3) {
            return 0
        }
        var result = 0
        for (y in 0 until rowCount - 2) {
            for (x in 0 until colCount - 2) {
                if (isMagicSquare(grid, y, x)) {
                    result++
                }
            }
        }
        return result
    }
    
    private fun isMagicSquare(grid: Array<IntArray>, y0: Int, x0: Int): Boolean {
        if (grid[y0 + 1][x0 + 1] != 5) {
            return false
        }
        val set = mutableSetOf<Int>()
        for (y in y0 .. y0 + 2) {
            var sum = 0
            for (x in x0 .. x0 + 2) {
                val num = grid[y][x]
                if (num < 1 || num > 9) {
                    return false
                }
                if (set.contains(num)) {
                    return false
                }
                set.add(num)
                sum += num
            }
            if (sum != 15) {
                return false
            }
        }
        for (x in x0 .. x0 + 2) {
            var sum = 0
            for (y in y0 .. y0 + 2) {
                sum += grid[y][x]
            }
            if (sum != 15) {
                return false
            }
        }
        if (grid[y0][x0] + grid[y0 + 1][x0 + 1] + grid[y0 + 2][x0 + 2] != 15) {
            return false
        }
        if (grid[y0][x0 + 2] + grid[y0 + 1][x0 + 1] + grid[y0 + 2][x0] != 15) {
            return false
        }
        return true
    }
}
