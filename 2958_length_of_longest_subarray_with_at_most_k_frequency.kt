// https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency/description/

import kotlin.math.max

class Solution {
    fun maxSubarrayLength(nums: IntArray, k: Int): Int {
        val n = nums.size
        var result = 0
        var i = 0
        var j = 1
        val map = mutableMapOf<Int, Int>()
        map[nums[0]] = 1
        while (true) {
            if (j >= n) {
                return max(result, j - i)
            }
            val numJ = nums[j]
            if (map.getOrDefault(numJ, 0) == k) {
                result = max(result, j - i)
                val numI = nums[i]
                map[numI] = map.getOrDefault(numI, 0) - 1
                i++
            } else {
                map[numJ] = map.getOrDefault(numJ, 0) + 1
                j++
            }
        }
    }
}
