// https://leetcode.com/problems/count-elements-with-maximum-frequency/description/

class Solution {
    fun maxFrequencyElements(nums: IntArray): Int {
        val map = mutableMapOf<Int, Int>()
        for (num in nums) {
            map[num] = map.getOrDefault(num, 0) + 1
        }
        var maxFrequency = 0
        var maxFrequencySum = 0
        for (pair in map) {
            if (pair.value == maxFrequency) {
                maxFrequencySum += maxFrequency
            } else if (pair.value > maxFrequency) {
                maxFrequency = pair.value
                maxFrequencySum = maxFrequency
            }
        }
        return maxFrequencySum
    }
}
