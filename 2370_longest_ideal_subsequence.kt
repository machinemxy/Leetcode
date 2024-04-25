// https://leetcode.com/problems/longest-ideal-subsequence/description/

import kotlin.math.max
import kotlin.math.min

class Solution {
    fun longestIdealString(s: String, k: Int): Int {
        val array = IntArray(26)
        val newS = s.map { it - 'a' }
        for (i in newS) {
            var prev = 0
            val l = max(i - k, 0)
            val r = min(i + k, 25)
            for (j in l .. r) {
                prev = max(prev, array[j])
            }
            array[i] = prev + 1
        }
        var result = 0
        for (z in array) {
            result = max(result, z)
        }
        return result
    }
}
