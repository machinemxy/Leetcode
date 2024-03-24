// https://leetcode.com/problems/find-pivot-index/description/

class Solution {
    fun pivotIndex(nums: IntArray): Int {
        var sumL = 0
        var sumR = 0
        for (i in 1 until nums.size) {
            sumR += nums[i]
        }
        if (sumL == sumR) {
            return 0
        }
        for (i in 1 until nums.size) {
            sumR -= nums[i]
            sumL += nums[i - 1]
            if (sumL == sumR) {
                return i
            }
        }
        return -1
    }
}
