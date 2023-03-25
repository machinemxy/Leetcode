// https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/description/

class Solution {
    fun countPairs(n: Int, edges: Array<IntArray>): Long {
        val visited = Array(n) { false }
        val map = mutableMapOf<Int, MutableList<Int>>()
        for (edge in edges) {
            map[edge[0]]?.add(edge[1]) ?: run {
                map[edge[0]] = mutableListOf(edge[1])
            }
            map[edge[1]]?.add(edge[0]) ?: run {
                map[edge[1]] = mutableListOf(edge[0])
            }
        }
        var currentNodeCount = 1
        var remainingNodeCount = n
        var result = 0L
        while (true) {
            val unvisited = visited.indexOfFirst { !it }
            if (unvisited == -1) {
                break
            }
            visited[unvisited] = true
            val deque = ArrayDeque<Int>()
            deque.add(unvisited)
            while (deque.isNotEmpty()) {
                val node = deque.removeFirst()
                map[node]?.let {
                    for (anotherNode in it) {
                        if (visited[anotherNode]) {
                            continue
                        }
                        visited[anotherNode] = true
                        deque.add(anotherNode)
                        currentNodeCount++
                    }
                }
            }
            remainingNodeCount -= currentNodeCount
            result += currentNodeCount.toLong() * remainingNodeCount.toLong()
            currentNodeCount = 1
        }
        return result
    }
}
