// https://leetcode.com/problems/first-missing-positive/description/

class Solution {
    fun firstMissingPositive(nums: IntArray): Int {
        val n = nums.size
        for (i in 0 until n) {
            while (nums[i] in 1 until n && nums[nums[i] - 1] != nums[i]) {
                val temp = nums[nums[i] - 1]
                nums[nums[i] - 1] = nums[i]
                nums[i] = temp
            }
        }
        for (i in 0 until n) {
            if (nums[i] != i + 1) {
                return i + 1
            }
        }
        return n + 1
    }
}
