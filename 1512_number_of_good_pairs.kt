// https://leetcode.com/problems/number-of-good-pairs/

class Solution {
    fun numIdenticalPairs(nums: IntArray): Int {
        val map = mutableMapOf<Int, Int>()
        for (num in nums) {
            map[num]?.let {
                map[num] = it + 1
            } ?: run {
                map[num] = 1
            }
        }
        var result = 0
        for (v in map.values) {
            if (v <= 1) {
                continue
            }
            for (i in (v - 1) downTo 1) {
                result += i
            }
        }
        return result
    }
}
