// https://leetcode.com/problems/uncrossed-lines/description/

import java.lang.Integer.max

class Solution {
    fun maxUncrossedLines(nums1: IntArray, nums2: IntArray): Int {
        val n1 = nums1.size
        val n2 = nums2.size
        val dp = Array(n1) { IntArray(n2) }
        if (nums1[0] == nums2[0]) {
            dp[0][0] = 1
        }
        
        if (n2 > 1) {
            for (j in 1 until n2) {
                if (dp[0][j - 1] == 1 || nums1[0] == nums2[j]) {
                    dp[0][j] = 1
                }
            }
        }
        
        if (n1 > 1) {
            for (i in 1 until n1) {
                if (dp[i- 1][0] == 1 || nums1[i] == nums2[0]) {
                    dp[i][0] = 1
                }
            }
        }
        
        if (n1 == 1 || n2 == 1) {
            return dp[n1 - 1][n2 - 1]
        }
        
        for (i in 1 until n1) {
            for (j in 1 until n2) {
                if (nums1[i] == nums2[j]) {
                    val tempMax = max(dp[i - 1][j], dp[i][j - 1])
                    dp[i][j] = max(tempMax, 1 + dp[i - 1][j - 1])
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        return dp[n1 - 1][n2 - 1]
    }
}
