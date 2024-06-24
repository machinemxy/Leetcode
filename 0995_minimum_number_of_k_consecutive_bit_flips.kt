// https://leetcode.com/problems/minimum-number-of-k-consecutive-bit-flips/description/

class Solution {
    fun minKBitFlips(nums: IntArray, k: Int): Int {
        var flipCount = 0
        for (i in 0 .. nums.count() - k) {
            if (nums[i] == 1) {
                continue
            }
            // flip
            flipCount++
            for (j in 0 until k) {
                val i2 = i + j
                nums[i2] = 1 - nums[i2]
            }
        }
        for (i in nums.count() - k + 1 .. nums.lastIndex) {
            if (nums[i] == 0) {
                return -1
            }
        }
        return flipCount
    }
}
