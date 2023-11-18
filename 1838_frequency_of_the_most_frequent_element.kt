// https://leetcode.com/problems/frequency-of-the-most-frequent-element/description/

import kotlin.math.max

class Solution {
    fun maxFrequency(nums: IntArray, k: Int): Int {
        nums.sort()
        val n = nums.size
        if (n == 1) { return 1 }
        var result = 1
        for (l in 0 until n - 1) {
            if (n - l <= result) {
                break
            }
            var usage = 0
            for (r in l + 1 until n) {
                val currentNum = nums[r]
                val prevNum = nums[r - 1]
                usage += (currentNum - prevNum) * (r - l)
                if (usage > k) {
                    result = max(result, r - l)
                    break
                }
            }
            if (usage <= k) {
                result = max(result, n - l)
            }
        }
        return result
    }
}
