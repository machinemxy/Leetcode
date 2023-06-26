// https://leetcode.com/problems/total-cost-to-hire-k-workers/description/

import java.util.PriorityQueue

class Solution {
    fun totalCost(costs: IntArray, k: Int, candidates: Int): Long {
        val n = costs.size
        val queue = PriorityQueue<Candidate> { c1, c2 ->
            if (c1.cost == c2.cost) {
                c1.index - c2.index
            } else {
                c1.cost - c2.cost
            }
        }
        if (n <= candidates * 2) {
            for (i in 0 until n) {
                queue.add(Candidate(costs[i], i))
            }
            var result = 0L
            for (i in 1..k) {
                val c = queue.poll()
                result += c.cost
            }
            return result
        }

        var head = 0
        var tail = n - 1
        for (i in 1..candidates) {
            queue.add(Candidate(costs[head], head))
            head++
        }
        for (i in 1..candidates) {
            queue.add(Candidate(costs[tail], tail))
            tail--
        }
        var result = 0L
        for (i in 1..k) {
            val c = queue.poll()
            result += c.cost
            if (head <= tail) {
                if (c.index < head) {
                    queue.add(Candidate(costs[head], head))
                    head++
                } else {
                    queue.add(Candidate(costs[tail], tail))
                    tail--
                }
            }
        }
        return result
    }
}

data class Candidate(
    val cost: Int,
    val index: Int
)
