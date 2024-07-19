// https://leetcode.com/problems/lucky-numbers-in-a-matrix/description/

import kotlin.math.max
import kotlin.math.min

class Solution {
    fun luckyNumbers (matrix: Array<IntArray>): List<Int> {
        val minElements = mutableSetOf<Int>()
        val maxElements = mutableSetOf<Int>()
        for (row in matrix) {
            var minValue = Int.MAX_VALUE
            for (i in row) {
                minValue = min(minValue, i)
            }
            minElements.add(minValue)
        }
        for (x in matrix[0].indices) {
            var maxValue = Int.MIN_VALUE
            for (y in matrix.indices) {
                maxValue = max(maxValue, matrix[y][x])
            }
            maxElements.add(maxValue)
        }
        val result = mutableListOf<Int>()
        for (e in minElements) {
            if (maxElements.contains(e)) {
                result.add(e)
            }
        }
        return result
    }
}
