// https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k/description/

import kotlin.math.max

class Solution {
    fun maximumSubarraySum(nums: IntArray, k: Int): Long {
        var result = 0L
        var sum = 0L
        var map = mutableMapOf<Int, Int>()
        for (i in 0 ..< k) {
            val num = nums[i]
            sum += num
            map[num] = map.getOrDefault(num, 0) + 1
            if (map.keys.size == k) {
                result = sum
            }
        }
        var l = 0
        var r = k
        while (r < nums.size) {
            val lNum = nums[l]
            val rNum = nums[r]
            sum = sum - lNum + rNum
            map[rNum] = map.getOrDefault(rNum, 0) + 1
            val lValue = map.getValue(lNum)
            if (lValue == 1) {
                map.remove(lNum)
            } else {
                map[lNum] = lValue - 1
            }
            if (map.keys.size == k) {
                result = max(result, sum)
            }
            l++
            r++
        }
        return result
    }
}
