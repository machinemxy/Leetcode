// https://leetcode.com/problems/find-eventual-safe-states/description/

class Solution {
    private val safeNodes = mutableSetOf<Int>()
    private var fromGraph = arrayOf(mutableSetOf<Int>())
    private var graph = arrayOf(intArrayOf())

    fun eventualSafeNodes(graph: Array<IntArray>): List<Int> {
        this.graph = graph
        val n = graph.size
        fromGraph = Array(n) { mutableSetOf<Int>() }
        graph.forEachIndexed { i, toes ->
            for (to in toes) {
                fromGraph[to].add(i)
            }
        }
        for (i in graph.indices) {
            if (graph[i].isEmpty()) {
                safeNodes.add(i)
                for (j in fromGraph[i]) {
                    checkNode(j)
                }
            }
        }
        return safeNodes.sorted()
    }

    private fun checkNode(i: Int) {
        if (safeNodes.contains(i)) {
            return
        }
        for (to in graph[i]) {
            if (!safeNodes.contains(to)) {
                return
            }
        }
        safeNodes.add(i)
        for (j in fromGraph[i]) {
            checkNode(j)
        }
    }
}
