// https://leetcode.com/problems/determine-if-a-cell-is-reachable-at-a-given-time/description/

import kotlin.math.abs
import kotlin.math.max

class Solution {
    fun isReachableAtTime(sx: Int, sy: Int, fx: Int, fy: Int, t: Int): Boolean {
        val width = abs(fx - sx)
        val height = abs(fy - sy)
        if (width == 0 && height == 0 && t == 1) {
            return false
        } else {
            return t >= max(width, height)
        }
    }
}
