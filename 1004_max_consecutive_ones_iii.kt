// https://leetcode.com/problems/max-consecutive-ones-iii/description/

import kotlin.math.max

class Solution {
    fun longestOnes(nums: IntArray, k: Int): Int {
        var restK = k
        var l = 0
        var r = 0
        var maxSum = 0
        val n = nums.size
        while (r < n && l < n) {
            if (nums[r] == 1) {
                r++
            } else if (restK == 0) {
                maxSum = max(maxSum, r - l)
                if (nums[l] == 0) {
                    restK++
                }
                l++
            } else {
                restK--
                r++
            }
        }
        return max(maxSum, r - l)
    }
}
