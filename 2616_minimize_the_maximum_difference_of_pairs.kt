// https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/description/

import kotlin.math.max
import kotlin.math.min

class Solution {
    fun minimizeMax(nums: IntArray, p: Int): Int {
        val n = nums.size
        if (n == 1) { return 0 }
        nums.sort()
        var l = Int.MAX_VALUE
        var r = 0
        for (i in 0 .. n - 2) {
            val diff = nums[i + 1] - nums[i]
            l = min(l, diff)
            r = max(r, diff)
        }
        var result = 0
        while (l <= r) {
            val mid = (l + r) / 2
            if (canAchieve(nums, p, mid)) {
                result = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return result
    }
    
    private fun canAchieve(nums: IntArray, p: Int, diff: Int): Boolean {
        val n = nums.size
        var i = 0
        var currentP = 0
        while (i < n - 1) {
            if (nums[i + 1] - nums[i] <= diff) {
                currentP++
                if (currentP == p) {
                    return true
                }
                i += 2
            } else {
                i++
            }
        }
        return false
    }
}
