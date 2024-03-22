// https://leetcode.com/problems/maximum-average-subarray-i/description/

import kotlin.math.max

class Solution {
    fun findMaxAverage(nums: IntArray, k: Int): Double {
        var sum = 0
        for (i in 0 until k) {
            sum += nums[i]
        }
        var maxSum = sum
        var i = k
        while (i < nums.size) {
            sum = sum + nums[i] - nums[i - k]
            maxSum = max(maxSum, sum)
            i++
        }
        return maxSum.toDouble() / k.toDouble()
    }
}
