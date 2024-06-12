// https://leetcode.com/problems/sort-colors/description/

class Solution {
    fun sortColors(nums: IntArray): Unit {
        var count0 = 0
        var count1 = 0
        var count2 = 0
        for (num in nums) {
            when (num) {
                0 -> count0++
                1 -> count1++
                else -> count2++
            }
        }
        var currentIndex = 0
        for (i in 0 until count0) {
            nums[currentIndex] = 0
            currentIndex++
        }
        for (i in 0 until count1) {
            nums[currentIndex] = 1
            currentIndex++
        }
        for (i in 0 until count2) {
            nums[currentIndex] = 2
            currentIndex++
        }
    }
}
