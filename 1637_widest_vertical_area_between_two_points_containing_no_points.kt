// https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/description/

import kotlin.math.max

class Solution {
    fun maxWidthOfVerticalArea(points: Array<IntArray>): Int {
        val set = mutableSetOf<Int>()
        for (point in points) {
            set.add(point[0])
        }
        val list = set.sorted()
        val n = list.size
        if (n == 1) {
            return 0
        }
        var result = 0
        for (i in 1 until n) {
            val gap = list[i] - list[i - 1]
            result = max(gap, result)
        }
        return result
    }
}
