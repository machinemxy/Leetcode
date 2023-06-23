// https://leetcode.com/problems/longest-arithmetic-subsequence/description/

import kotlin.math.max

class Solution {
    fun longestArithSeqLength(nums: IntArray): Int {
        val n = nums.size
        val dp = Array(n) { mutableMapOf<Int, Int>() }
        var result = 2
        for (i in 1 until n) {
            val map = dp[i]
            for (j in 0 until i) {
                val gap = nums[i] - nums[j]
                if (dp[j].keys.contains(gap)) {
                    map[gap] = dp[j][gap]!! + 1
                    result = max(result, map[gap]!!)
                } else {
                    map[gap] = 2
                }
            }
        }
        return result
    }
}
