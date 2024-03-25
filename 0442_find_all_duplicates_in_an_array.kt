// https://leetcode.com/problems/find-all-duplicates-in-an-array/description/

class Solution {
    fun findDuplicates(nums: IntArray): List<Int> {
        val result = mutableSetOf<Int>()
        for (i in nums.indices) {
            while (nums[i] != i + 1 && !result.contains(nums[i])) {
                val valueAtI = nums[i]
                val swap = valueAtI - 1
                if (valueAtI == nums[swap]) {
                    result.add(valueAtI)
                    break
                }
                nums[i] = nums[swap]
                nums[swap] = valueAtI
            }
        }
        return result.toList()
    }
}
