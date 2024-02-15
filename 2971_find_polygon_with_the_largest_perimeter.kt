// https://leetcode.com/problems/find-polygon-with-the-largest-perimeter/description/

class Solution {
    fun largestPerimeter(nums: IntArray): Long {
        nums.sort()
        val n = nums.size
        var sum = 0L
        for (i in 0 until n) {
            sum += nums[i]
        }
        var longestSideId = nums.size - 1
        while (longestSideId >= 2) {
            val longestSide = nums[longestSideId]
            val restSum = sum - longestSide
            if (restSum > longestSide) {
                return sum
            } else {
                sum = restSum
                longestSideId -= 1
            }
        }
        return -1
    }
}
