// https://leetcode.com/problems/sum-of-square-numbers/description/

import kotlin.math.sqrt

class Solution {
    fun judgeSquareSum(c: Int): Boolean {
        val target = c.toLong()
        var a = 0L
        var b = sqrt(c.toFloat()).toLong()
        while (a <= b) {
            val result = (a * a) + (b * b)
            if (result == target) {
                return true
            } else if (result < target) {
                a++
            } else {
                b--
            }
        }
        return false
    }
}
