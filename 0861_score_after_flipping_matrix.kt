// https://leetcode.com/problems/score-after-flipping-matrix/description/

import kotlin.math.max

class Solution {
    fun matrixScore(grid: Array<IntArray>): Int {
        val rowCount = grid.size
        val colCount = grid[0].size
        var multiplier = 1
        for (i in 1 until colCount) {
            multiplier *= 2
        }
        for (y in 0 until rowCount) {
            if (grid[y][0] == 0) {
                for (x in 0 until colCount) {
                    if (grid[y][x] == 0) {
                        grid[y][x] = 1
                    } else {
                        grid[y][x] = 0
                    }
                }
            }
        }
        var result = rowCount * multiplier
        multiplier /= 2
        for (x in 1 until colCount) {
            var count1 = 0
            var count0 = 0
            for (y in 0 until rowCount) {
                if (grid[y][x] == 0) {
                    count0++
                } else {
                    count1++
                }
            }
            result += multiplier * max(count0, count1)
            multiplier /= 2
        }
        return result
    }
}
