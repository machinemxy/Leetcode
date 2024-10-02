// https://leetcode.com/problems/rank-transform-of-an-array/description/

class Solution {
    fun arrayRankTransform(arr: IntArray): IntArray {
        val orderArray = arr.toSet().toIntArray().sorted()
        val orderMap = mutableMapOf<Int, Int>()
        orderArray.forEachIndexed { index, score ->
            orderMap[score] = index + 1
        }
        return arr.map { orderMap.getValue(it) }.toIntArray()
    }
}
