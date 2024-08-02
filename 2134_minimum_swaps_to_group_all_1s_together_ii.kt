// https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii/description/

import kotlin.math.min

class Solution {
    fun minSwaps(nums: IntArray): Int {
        var oneCount = 0
        for (num in nums) {
            if (num == 1) {
                oneCount++
            }
        }
        var minSwaps = 0
        for (i in 0 until oneCount) {
            if (nums[i] == 0) {
                minSwaps++
            }
        }
        val n = nums.size
        var currentSwaps = minSwaps
        for (l in 0 until n) {
            val r = (l + oneCount) % n
            if (nums[l] == 0) {
                currentSwaps--
            }
            if (nums[r] == 0) {
                currentSwaps++
            }
            minSwaps = min(minSwaps, currentSwaps)
        }
        return minSwaps
    }
}
