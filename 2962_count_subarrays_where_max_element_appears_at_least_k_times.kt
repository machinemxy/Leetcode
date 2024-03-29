// https://leetcode.com/problems/count-subarrays-where-max-element-appears-at-least-k-times/description/

import kotlin.math.max

class Solution {
    fun countSubarrays(nums: IntArray, k: Int): Long {
        var result = 0L
        val n = nums.size
        var maxNum = 0
        for (num in nums) {
            maxNum = max(maxNum, num)
        }
        var maxNumCount = 0
        var i = 0
        var j = -1
        while (true) {
            if (maxNumCount < k) {
                j++
                if (j == n) {
                    break
                }
                if (nums[j] == maxNum) {
                    maxNumCount++
                    if (maxNumCount == k) {
                        result += (n - j)
                    }
                }
            } else {
                if (nums[i] == maxNum) {
                    maxNumCount--
                }
                i++
                if (i == n) {
                    break
                }
                if (maxNumCount == k) {
                    result += (n - j)
                }
            }
        }
        return result
    }
}
