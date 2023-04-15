// https://leetcode.com/problems/maximum-value-of-k-coins-from-piles/description/

import java.lang.Integer.min
import java.lang.Integer.max

class Solution {
    fun maxValueOfCoins(piles: List<List<Int>>, k: Int): Int {
        val n = piles.size
        val dp = Array(n + 1) { IntArray(k + 1) }
        for (i in 1..n) {
            for (j in 0..k) {
                var currentSum = 0
                dp[i][j] = dp[i - 1][j]
                for (l in 1..min(piles[i - 1].size, j)) {
                    currentSum += piles[i - 1][l - 1]
                    dp[i][j] = max(dp[i][j], dp[i - 1][j - l] + currentSum)
                }
            }
        }
        return dp[n][k]
    }
}
