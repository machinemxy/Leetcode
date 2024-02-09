// https://leetcode.com/problems/largest-divisible-subset/description/

class Solution {
    fun largestDivisibleSubset(nums: IntArray): List<Int> {
        nums.sort()
        var resultLength = 0
        var result = listOf<Int>()
        val n = nums.size
        val listLengths = IntArray(n)
        val lists = Array<List<Int>>(n) { listOf() }
        for (i in 0 until n) {
            val num = nums[i]
            var longestLength = 0
            var longestList = mutableListOf<Int>()
            for (j in i - 1 downTo 0) {
                if (num % nums[j] != 0) {
                    continue
                }
                if (listLengths[j] > longestLength) {
                    longestLength = listLengths[j]
                    longestList = lists[j].toMutableList()
                }
            }
            longestLength++
            longestList.add(num)
            listLengths[i] = longestLength
            lists[i] = longestList.toList()
            if (longestLength > resultLength) {
                resultLength = longestLength
                result = lists[i]
            }
        }
        return result
    }
}
