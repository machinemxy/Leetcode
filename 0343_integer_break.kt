// https://leetcode.com/problems/integer-break/description/

import kotlin.math.max

class Solution {
    fun integerBreak(n: Int): Int {
        if (n == 2) {
            return 1
        } else if (n == 3) {
            return 2
        }

        val dp = IntArray(59)
        for (i in 1..3) {
            dp[i] = i
        }
        for (i in 4..n) {
            var optimal = i
            for (j in 1..(i / 2)) {
                val k = i - j
                val result = dp[j] * dp[k]
                optimal = max(result, optimal)
            }
            dp[i] = optimal
        }
        return dp[n]
    }
}
