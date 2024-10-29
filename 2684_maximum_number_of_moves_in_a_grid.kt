// https://leetcode.com/problems/maximum-number-of-moves-in-a-grid/description/

import kotlin.math.max

class Solution {
    fun maxMoves(grid: Array<IntArray>): Int {
        val rowCount = grid.size
        val colCount = grid[0].size
        val dp = Array(rowCount) { IntArray(colCount) }
        for (x in colCount - 2 downTo 0) {
            for (y in 0 until rowCount) {
                var maxStreak = 0
                if (y > 0 && grid[y][x] < grid[y - 1][x + 1]) {
                    maxStreak = max(maxStreak, dp[y - 1][x + 1] + 1) 
                }
                if (grid[y][x] < grid[y][x + 1]) {
                    maxStreak = max(maxStreak, dp[y][x + 1] + 1)
                }
                if (y < rowCount - 1 && grid[y][x] < grid[y + 1][x + 1]) {
                    maxStreak = max(maxStreak, dp[y + 1][x + 1] + 1)
                }
                dp[y][x] = maxStreak
            }
        }
        var result = 0
        for (y in 0 until rowCount) {
            result = max(result, dp[y][0])
        }
        return result
    }
}
