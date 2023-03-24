// https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/description/

class Solution {
    fun minReorder(n: Int, connections: Array<IntArray>): Int {
        val visited = Array(n) { false }
        visited[0] = true
        val deque = ArrayDeque<Int>()
        deque.add(0)
        var result = 0
        val map = mutableMapOf<Int, MutableSet<Destination>>()
        for (connection in connections) {
            map[connection[0]]?.add(Destination(connection[1], true)) ?: run {
                map[connection[0]] = mutableSetOf(Destination(connection[1], true))
            }
            map[connection[1]]?.add(Destination(connection[0], false)) ?: run {
                map[connection[1]] = mutableSetOf(Destination(connection[0], false))
            }
        }
        while (deque.isNotEmpty()) {
            val city = deque.removeFirst()
            map[city]?.let {
                for (destination in it) {
                    if (visited[destination.city]) {
                        continue
                    }
                    visited[destination.city] = true
                    deque.add(destination.city)
                    if (destination.needReverse) {
                        result++
                    }
                }
            }
        }
        return result
    }
}

data class Destination(
    val city: Int,
    val needReverse: Boolean
)
