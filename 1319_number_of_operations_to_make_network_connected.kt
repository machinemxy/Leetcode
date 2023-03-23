// https://leetcode.com/problems/number-of-operations-to-make-network-connected/description/

class Solution {
    fun makeConnected(n: Int, connections: Array<IntArray>): Int {
        if (connections.size < (n - 1)) {
            return -1
        }

        val map = mutableMapOf<Int, MutableSet<Int>>()
        for (connection in connections) {
            map[connection[0]]?.add(connection[1]) ?: run {
                map[connection[0]] = mutableSetOf(connection[1])
            }
            map[connection[1]]?.add(connection[0]) ?: run {
                map[connection[1]] = mutableSetOf(connection[0])
            }
        }

        val visited = Array(n) { false }
        var groupCount = 0
        while (true) {
            val firstUnvisited = visited.indexOfFirst { !it }
            if (firstUnvisited == -1) {
                return groupCount - 1
            }
            groupCount++
            visited[firstUnvisited] = true
            val deque = ArrayDeque<Int>()
            deque.add(firstUnvisited)
            while (deque.isNotEmpty()) {
                val computer = deque.removeFirst()
                map[computer]?.let {
                    for (anotherComputer in it) {
                        if (!visited[anotherComputer]) {
                            deque.add(anotherComputer)
                            visited[anotherComputer] = true
                        }
                    }
                }
            }
        }
    }
}
