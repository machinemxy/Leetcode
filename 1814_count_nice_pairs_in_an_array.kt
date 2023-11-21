// https://leetcode.com/problems/count-nice-pairs-in-an-array/description/

class Solution {
    fun countNicePairs(nums: IntArray): Int {
        var result = 0L
        val map = mutableMapOf<Int, Int>()
        for (num in nums) {
            val reversedNum = reverse(num)
            val sa = num - reversedNum
            map[sa] = map.getOrDefault(sa, 0) + 1
        }
        for (count in map.values) {
            if (count == 1) { continue }
            result += getPairs(count)
        }
        return (result % 1000000007L).toInt()
    }

    fun reverse(num: Int): Int {
        val str = num.toString()
        return str.reversed().toInt()
    }

    fun getPairs(count: Int): Long {
        var result = 0L
        for (i in count - 1 downTo 1) {
            result += i
        }
        return result
    }
}
