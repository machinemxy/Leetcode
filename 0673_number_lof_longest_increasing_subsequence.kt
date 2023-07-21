// https://leetcode.com/problems/number-of-longest-increasing-subsequence/description/

class Solution {
    fun findNumberOfLIS(nums: IntArray): Int {
        val n = nums.size
        val dp = Array<Pair<Int, Int>>(n) { Pair(0, 0) }
        for (i in nums.indices) {
            val num = nums[i]
            var longest = 0
            var longestCount = 1
            for (j in i - 1 downTo 0) {
                if (nums[j] < num) {
                    if (dp[j].first > longest) {
                        longest = dp[j].first
                        longestCount = dp[j].second
                    } else if (dp[j].first == longest) {
                        longestCount += dp[j].second
                    }
                }
            }
            dp[i] = Pair(longest + 1, longestCount)
        }
        var longest = 1
        var longestCount = 0
        for (temp in dp) {
            if (temp.first > longest) {
                longest = temp.first
                longestCount = temp.second
            } else if (temp.first == longest) {
                longestCount += temp.second
            }
        }
        return longestCount
    }
}
