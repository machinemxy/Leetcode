// https://leetcode.com/problems/predict-the-winner/description/

import kotlin.math.max

class Solution {
    fun PredictTheWinner(nums: IntArray): Boolean {
        val n = nums.size
        if (n == 1) { return true }
        val dp = mutableMapOf<Pair<Int, Int>, Long>()
        for (i in nums.indices) {
            dp[Pair(i, i)] = nums[i].toLong()
        }
        for (window in 2..n) {
            for (i in 0..(n - window)) {
                val situation1 = nums[i] - dp[Pair(i + 1, i + window - 1)]!!
                val situation2 = nums[i + window - 1] - dp[Pair(i, i + window - 2)]!!
                dp[Pair(i, i + window - 1)] = max(situation1, situation2)
            }
        }
        return dp[Pair(0, n - 1)]!! >= 0
    }
}
