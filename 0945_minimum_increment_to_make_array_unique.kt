// https://leetcode.com/problems/minimum-increment-to-make-array-unique/description/

class Solution {
    fun minIncrementForUnique(nums: IntArray): Int {
        nums.sort()
        var result = 0
        var currentMax = Int.MIN_VALUE
        for (num in nums) {
            if (num <= currentMax) {
                currentMax++
                result += currentMax - num
            } else {
                currentMax = num
            }
        }
        return result
    }
}
