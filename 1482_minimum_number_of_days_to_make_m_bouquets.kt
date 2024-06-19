// https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/description/

import kotlin.math.max
import kotlin.math.min

class Solution {
    fun minDays(bloomDay: IntArray, m: Int, k: Int): Int {
        if (m.toLong() * k.toLong() > bloomDay.size.toLong()) {
            return -1
        }
        var l = Int.MAX_VALUE
        var r = Int.MIN_VALUE
        for (day in bloomDay) {
            l = min(l, day)
            r = max(r, day)
        }
        while (l <= r) {
            val mid = (l + r) / 2
            if (isPossible(bloomDay, m, k, mid)) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
    
    private fun isPossible(bloomDay: IntArray, m: Int, k: Int, day: Int): Boolean {
        var count = 0
        var i = 0
        var length = 0
        while (i < bloomDay.size) {
            if (bloomDay[i] > day) {
                length = 0
            } else {
                length++
                if (length == k) {
                    length = 0
                    count++
                    if (count == m) {
                        return true
                    }
                }
            }
            i++
        }
        return false
    }
}
