// https://leetcode.com/problems/find-the-duplicate-number/description/

class Solution {
    fun findDuplicate(nums: IntArray): Int {
        val n = nums.size
        for (i in 0 until n) {
            while (nums[i] != i + 1) {
                val valueAtI = nums[i]
                val swap = valueAtI - 1
                if (valueAtI == nums[swap]) {
                    return valueAtI
                }
                nums[i] = nums[swap]
                nums[swap] = valueAtI
            }
        }
        return 0
    }
}
