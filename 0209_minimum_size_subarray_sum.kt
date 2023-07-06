// https://leetcode.com/problems/minimum-size-subarray-sum/description/

import kotlin.math.min

class Solution {
    fun minSubArrayLen(target: Int, nums: IntArray): Int {
        val n = nums.size
        var result = 0
        var r = 0
        var sum = 0
        while (true) {
            sum += nums[r]
            if (sum >= target) {
                result = r + 1
                break
            }
            r++
            if (r >= n) {
                return 0
            }
        }
        if (result == 1) {
            return result
        }
        for (l in 1 until n) {
            sum -= nums[l - 1]
            while (sum < target) {
                r++
                if (r >= n) {
                    return result
                }
                sum += nums[r]
            }
            result = min(result, r - l + 1)
        }
        return result
    }
}
