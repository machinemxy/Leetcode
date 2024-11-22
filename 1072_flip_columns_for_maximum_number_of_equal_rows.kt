// https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows/description/

import kotlin.math.max

class Solution {
    fun maxEqualRowsAfterFlips(matrix: Array<IntArray>): Int {
        val map = mutableMapOf<String, Int>()
        for (row in matrix) {
            val sb = StringBuilder()
            val num0 = row[0]
            for (num in row) {
                if (num == num0) {
                    sb.append('T')
                } else {
                    sb.append('F')
                }
            }
            val pattern = sb.toString()
            map[pattern] = map.getOrDefault(pattern, 0) + 1
        }
        var result = 0
        for (pattern in map) {
            result = max(result, pattern.value)
        }
        return result
    }
}
