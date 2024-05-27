// https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/description/

class Solution {
    fun specialArray(nums: IntArray): Int {
        var l = 0
        var r = nums.size
        while (l <= r) {
            val mid = (l + r) / 2
            val result = check(nums, mid)
            if (result == 0) {
                return mid
            } else if (result > 0) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return -1
    }
    
    private fun check(nums: IntArray, x: Int): Int {
        var n = 0
        for (num in nums) {
            if (num >= x) {
                n++
                if (n > x) {
                    return 1
                }
            }
        }
        return if (n == x) {
            0
        } else {
            -1
        }
    }
}
