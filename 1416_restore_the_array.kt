// https://leetcode.com/problems/restore-the-array/description/

import java.lang.Integer.min

class Solution {
    fun numberOfArrays(s: String, k: Int): Int {
        val kLength = k.toString().length
        val kLong = k.toLong()
        val n = s.length
        val dp = IntArray(n + 1)
        dp[n] = 1
        for (i in n - 1 downTo 0) {
            val c = s[i]
            if (c == '0') {
                dp[i] = 0
                continue
            }
            for (j in i + 1..min(i + kLength, n)) {
                val longVal = s.substring(i, j).toLong()
                if (longVal <= kLong) {
                    dp[i] += dp[j]
                    if (dp[i] >= 1000000007) {
                        dp[i] -= 1000000007
                    }
                }
            }
        }
        return dp[0]
    }
}
