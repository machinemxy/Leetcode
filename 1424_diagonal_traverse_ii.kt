// https://leetcode.com/problems/diagonal-traverse-ii/description/

import kotlin.math.max

class Solution {
    fun findDiagonalOrder(nums: List<List<Int>>): IntArray {
        val rowCount = nums.size
        var colCount = 1
        for (row in nums) {
            colCount = max(colCount, row.size)
        }
        val map = mutableMapOf<Int, ArrayDeque<Int>>()
        for (y in nums.indices) {
            val row = nums[y]
            for (x in row.indices) {
                map.getOrPut(y + x) { ArrayDeque() }.addFirst(row[x])
            }
        }
        val result = ArrayDeque<Int>()
        for (i in 0 .. rowCount + colCount - 2) {
            map[i]?.let {
                it.forEach { num ->
                    result.add(num)
                }
            }
        }
        return result.toIntArray()
    }
}
