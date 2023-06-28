// https://leetcode.com/problems/path-with-maximum-probability/description/

import kotlin.math.max

class Solution {
    fun maxProbability(n: Int, edges: Array<IntArray>, succProb: DoubleArray, start: Int, end: Int): Double {
        val map = mutableMapOf<Int, MutableMap<Int, Double>>()
        for (i in edges.indices) {
            val edge = edges[i]
            val prob = succProb[i]
            if (prob == 0.0) { continue }
            map[edge[0]]?.let {
                it[edge[1]] = prob
            } ?: run {
                map[edge[0]] = mutableMapOf(edge[1] to prob)
            }
            map[edge[1]]?.let {
                it[edge[0]] = prob
            } ?: run {
                map[edge[1]] = mutableMapOf(edge[0] to prob)
            }
        }
        val visited = BooleanArray(n)
        val probs = DoubleArray(n)
        probs[start] = 1.0
        val waitingList = mutableSetOf<Int>(start)
        while (waitingList.isNotEmpty()) {
            var largestProb = 0.0
            var fromId = 0
            for (i in waitingList) {
                if (probs[i] > largestProb) {
                    largestProb = probs[i]
                    fromId = i
                }
            }
            if (fromId == end) {
                return probs[end]
            }
            waitingList.remove(fromId)
            visited[fromId] = true
            map[fromId]?.let {
                for (keyValue in it) {
                    val toId = keyValue.key
                    val prob = keyValue.value
                    if (visited[toId]) { continue }
                    waitingList.add(toId)
                    probs[toId] = max(probs[toId], probs[fromId] * prob)
                }
            }
        }
        return 0.0
    }
}
