// https://leetcode.com/problems/majority-element-ii/description/

class Solution {
    fun majorityElement(nums: IntArray): List<Int> {
        nums.sort()
        val oneThird = nums.size / 3
        var prevNum = 0
        var count = 0
        val result = mutableListOf<Int>()
        for (num in nums) {
            if (num == prevNum) {
                count++
            } else {
                if (count > oneThird) {
                    result.add(prevNum)
                }
                prevNum = num
                count = 1
            }
        }
        if (count > oneThird) {
            result.add(prevNum)
        }
        return result.toList()
    }
}
