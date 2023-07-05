// https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/description/

import kotlin.math.max

class Solution {
    fun longestSubarray(nums: IntArray): Int {
        val n = nums.size
        var left = 0
        var right = 0
        var i = 0
        var result = 0
        // left part
        while (true) {
            if (i == n) {
                return left - 1
            }
            if (nums[i] == 0) {
                i++
                break
            } else {
                left++
                i++
            }
        }
        // right part
        while (true) {
            if (i == n) {
                result = max(result, left + right)
                break
            }
            if (nums[i] == 0) {
                result = max(result, left + right)
                left = right
                right = 0
                i++
            } else {
                right++
                i++
            }
        }
        return result
    }
}
