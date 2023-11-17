// https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/description/

import kotlin.math.max

class Solution {
    fun minPairSum(nums: IntArray): Int {
        nums.sort()
        var l = 0
        var r = nums.size - 1
        var maxSum = Int.MIN_VALUE
        while (l < r) {
            maxSum = max(maxSum, nums[l] + nums[r])
            l++
            r--
        }
        return maxSum
    }
}
