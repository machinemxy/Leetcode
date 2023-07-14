// https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/description/

import kotlin.math.max

class Solution {
    fun longestSubsequence(arr: IntArray, difference: Int): Int {
        val dp = mutableMapOf<Int, Int>()
        var result = 1
        for (i in arr) {
            val prev = i - difference
            val length = dp.getOrDefault(prev, 0) + 1
            dp[i] = length
            result = max(result, length)
        }
        return result
    }
}
