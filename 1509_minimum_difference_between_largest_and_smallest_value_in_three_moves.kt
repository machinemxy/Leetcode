// https://leetcode.com/problems/minimum-difference-between-largest-and-smallest-value-in-three-moves/description/

import kotlin.math.min

class Solution {
    fun minDifference(nums: IntArray): Int {
        val n = nums.size
        if (n <= 4) {
            return 0
        }
        
        nums.sort()
        var result = Int.MAX_VALUE
        for (i in 0 .. 3) {
            val j = 3 - i
            val difference = nums[n - 1 - j] - nums[i]
            result = min(result, difference)
        }
        return result
    }
}
