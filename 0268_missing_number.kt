// https://leetcode.com/problems/missing-number/description/

class Solution {
    fun missingNumber(nums: IntArray): Int {
        val set = nums.toSet()
        var i = 0
        while (true) {
            if (set.contains(i)) {
                i++
            } else {
                return i
            }
        }
    }
}
