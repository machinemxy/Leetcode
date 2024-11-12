// https://leetcode.com/problems/most-beautiful-item-for-each-query/description/

import kotlin.math.max

class Solution {
    fun maximumBeauty(items: Array<IntArray>, queries: IntArray): IntArray {
        items.sortWith(
            compareBy<IntArray> { it[0] }
                .thenByDescending { it[1] }
        )
        val queryKeys = queries.toSet().sorted()
        val queryDic = mutableMapOf<Int, Int>()
        var currentBeauty = 0
        var i = 0
        for (key in queryKeys) {
            while (i < items.size && items[i][0] <= key) {
                currentBeauty = max(currentBeauty, items[i][1])
                i++
            }
            queryDic[key] = currentBeauty
        }
        return queries.map { queryDic.getValue(it) }.toIntArray()
    }
}
