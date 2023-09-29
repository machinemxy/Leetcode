// https://leetcode.com/problems/monotonic-array/

class Solution {
    fun isMonotonic(nums: IntArray): Boolean {
        val n = nums.size
        if (n == 1) { return true }
        var isIncreasing: Boolean? = null
        var prevNum = nums[0]
        for (i in 1 until n) {
            val num = nums[i]
            if (isIncreasing == null) {
                if (num > prevNum) {
                    isIncreasing = true
                } else if (num < prevNum) {
                    isIncreasing = false
                }
            } else if (isIncreasing == true) {
                if (num < prevNum) {
                    return false
                }
            } else {
                if (num > prevNum) {
                    return false
                }
            }
            prevNum = num
        }
        return true
    }
}
