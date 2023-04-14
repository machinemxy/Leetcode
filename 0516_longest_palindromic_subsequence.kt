// https://leetcode.com/problems/longest-palindromic-subsequence/description/

import java.lang.Integer.max

class Solution {
    fun longestPalindromeSubseq(s: String): Int {
        val n = s.length
        if (n == 1) { return 1 }
        val dp = Array(n) { IntArray(n) { 1 } }
        for (i in 0 until n - 1) {
            val j = i + 1
            if (s[i] == s[j]) {
                dp[i][j] = 2
            }
        }
        if (n >= 3) {
            for (k in 2 until n) {
                for (i in 0 until n - k) {
                    val j = i + k
                    if (s[i] == s[j]) {
                        dp[i][j] = 2 + dp[i + 1][j - 1]
                    } else {
                        dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                    }
                }
            }
        }
        return dp[0][n - 1]
    }
}
