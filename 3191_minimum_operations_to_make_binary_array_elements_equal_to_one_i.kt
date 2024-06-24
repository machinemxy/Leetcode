// https://leetcode.com/problems/minimum-operations-to-make-binary-array-elements-equal-to-one-i/description/

class Solution {
    fun minOperations(nums: IntArray): Int {
        var flipCount = 0
        for (i in 0 .. nums.count() - 3) {
            if (nums[i] == 1) {
                continue
            }
            // flip
            flipCount++
            for (j in 0 until 3) {
                val i2 = i + j
                nums[i2] = 1 - nums[i2]
            }
        }
        for (i in nums.count() - 2 .. nums.lastIndex) {
            if (nums[i] == 0) {
                return -1
            }
        }
        return flipCount
    }
}
