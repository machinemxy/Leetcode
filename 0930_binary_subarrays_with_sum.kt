// https://leetcode.com/problems/binary-subarrays-with-sum/description/

class Solution {
    fun numSubarraysWithSum(nums: IntArray, goal: Int): Int {
        val map = mutableMapOf<Int, Int>(0 to 1)
        var result = 0
        var currentSum = 0
        for (num in nums) {
            currentSum += num
            val sa = currentSum - goal
            map.get(sa)?.let {
                result+= it
            }
            map[currentSum] = map.getOrDefault(currentSum, 0) + 1
        }
        return result
    }
}
