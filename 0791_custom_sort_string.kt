// https://leetcode.com/problems/custom-sort-string/description/

class Solution {
    fun customSortString(order: String, s: String): String {
        val orderMap = mutableMapOf<Char, Int>()
        order.forEachIndexed { index, c ->
            orderMap[c] = index
        }
        return s
            .toCharArray()
            .sortedBy { orderMap.getOrDefault(it, Int.MAX_VALUE) }
            .joinToString("")
    }
}
