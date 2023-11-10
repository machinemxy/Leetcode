// https://leetcode.com/problems/restore-the-array-from-adjacent-pairs/description/

class Solution {
    fun restoreArray(adjacentPairs: Array<IntArray>): IntArray {
        val connection = mutableMapOf<Int, MutableSet<Int>>()
        for (pair in adjacentPairs) {
            val a = pair[0]
            val b = pair[1]
            connection.getOrPut(a) { mutableSetOf() }.add(b)
            connection.getOrPut(b) { mutableSetOf() }.add(a)
        }
        var node = Int.MIN_VALUE
        var prev = Int.MIN_VALUE
        for (pair in connection) {
            if (pair.value.size == 1) {
                node = pair.key
                break
            }
        }
        val result = ArrayDeque<Int>()
        result.add(node)
        while (true) {
            val set = connection[node]!!
            var foundNext = false
            for (next in set) {
                if (next == prev) {
                    continue
                }
                foundNext = true
                result.add(next)
                prev = node
                node = next
                break
            }
            if (!foundNext) {
                break
            }
        }
        return result.toIntArray()
    }
}
