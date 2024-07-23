// https://leetcode.com/problems/sort-array-by-increasing-frequency/description/

class Solution {
    fun frequencySort(nums: IntArray): IntArray {
        val map = mutableMapOf<Int, Int>()
        for (num in nums) {
            map[num] = map.getOrDefault(num, 0) + 1
        }
        val sortedMap = map.toList().sortedWith(
            compareBy<Pair<Int, Int>> { it.second }
                .thenByDescending { it.first }
        )
        val result = IntArray(nums.size)
        var i = 0
        for (pair in sortedMap) {
            for (j in 0 until pair.second) {
                result[i] = pair.first
                i++
            }
        }
        return result
    }
}
